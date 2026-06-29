package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.dao.PropinaDAO;
import com.ojj.academico.model.*;
import com.ojj.academico.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Servlet responsavel pelo fluxo de Propina.
 * Rotas atendidas: /tesouraria/propina. Encaminha para: /view/tesouraria/propina.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class PropinaServlet extends HttpServlet {

    private final PropinaService propinaService = new PropinaService();
    private final PagamentoService pagamentoService = new PagamentoService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    private final PropinaDAO propinaDAO = new PropinaDAO();
    private final MatriculaService matriculaService = new MatriculaService();
    private final TurmaService turmaService = new TurmaService();
    private final CursoService cursoService = new CursoService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        if (search != null && !search.trim().isEmpty()) {
            try {
                List<Estudante> estudantes = estudanteDAO.buscarComFiltro(search);
                request.setAttribute("estudantes", estudantes);
            } catch (SQLException e) {
                request.setAttribute("erro", "Erro ao buscar estudante: " + e.getMessage());
            }
        }

        String idEstudanteStr = request.getParameter("idEstudante");
        if (idEstudanteStr != null) {
            try {
                int idEstudante = Integer.parseInt(idEstudanteStr);
                Estudante e = estudanteDAO.buscarPorId(idEstudante);
                request.setAttribute("estudanteSelecionado", e);

                List<Propina> propinas = propinaDAO.listarPorEstudante(idEstudante);
                request.setAttribute("propinas", propinas);

                BigDecimal propinaMensal = getPropinaMensal(idEstudante);
                request.setAttribute("propinaMensal", propinaMensal);
                if (propinaMensal != null) {
                    boolean emDia = LocalDate.now().getDayOfMonth() <= 10;
                    request.setAttribute("multaCalculada", emDia ? BigDecimal.ZERO : propinaMensal.multiply(new BigDecimal("0.10")));
                    request.setAttribute("emDia", emDia);
                }
            } catch (Exception e) {
                request.setAttribute("erro", "Estudante inválido.");
            }
        }

        request.getRequestDispatcher("/view/tesouraria/propina.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        try {
            int idEstudante = Integer.parseInt(request.getParameter("idEstudante"));
            String mes = request.getParameter("mes");
            int ano = Integer.parseInt(request.getParameter("ano"));
            String metodo = request.getParameter("metodoPagamento");

            BigDecimal propinaMensal = getPropinaMensal(idEstudante);
            if (propinaMensal == null) {
                throw new Exception("Estudante sem matrícula ou curso não encontrado.");
            }

            int diaPagamento = LocalDate.now().getDayOfMonth();
            BigDecimal multa = diaPagamento > 10 ? propinaMensal.multiply(new BigDecimal("0.10")) : BigDecimal.ZERO;
            BigDecimal valorPago = propinaMensal.add(multa);

            Funcionario tesoureiro = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            if (tesoureiro == null) {
                throw new Exception("Tesoureiro nao identificado no sistema.");
            }

            Pagamento p = new Pagamento();
            p.setIdEstudante(idEstudante);
            p.setIdTesoureiro(tesoureiro.getIdFuncionario());
            p.setTipoPagamento("PROPINA");
            p.setPeriodoReferencia(mes + "/" + ano);
            p.setValorDevido(propinaMensal);
            p.setValorPago(valorPago);
            p.setMulta(multa);
            p.setDataPagamento(LocalDateTime.now());
            p.setMetodoPagamento(metodo);
            p.setStatus("PAGO");
            p.setNumeroRecibo("PRP-" + System.currentTimeMillis() / 1000);

            if (pagamentoService.save(p)) {
                Propina propina = new Propina();
                propina.setIdEstudante(idEstudante);
                propina.setMesReferencia(mes);
                propina.setAnoReferencia(ano);
                propina.setValor(propinaMensal);
                propina.setMulta(multa);
                propina.setDataVencimento(LocalDate.of(ano, LocalDate.now().getMonthValue(), 10));
                propina.setStatus("PAGO");
                propinaService.save(propina);

                String msgMulta = multa.compareTo(BigDecimal.ZERO) > 0 ? " (multa de 10%: Kz " + multa + ")" : "";
                request.setAttribute("sucesso", "Propina de " + mes + "/" + ano + " paga com sucesso! Recibo: " + p.getNumeroRecibo() + msgMulta);
            } else {
                request.setAttribute("erro", "Falha ao registrar pagamento.");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro no processamento: " + e.getMessage());
        }
        doGet(request, response);
    }

    private BigDecimal getPropinaMensal(int idEstudante) throws SQLException {
        List<Matricula> matriculas = matriculaService.findByEstudante(idEstudante);
        if (matriculas == null || matriculas.isEmpty()) return null;
        Matricula matricula = matriculas.get(0);
        Turma turma = turmaService.findById(matricula.getIdTurma());
        if (turma == null) return null;
        Curso curso = cursoService.findById(turma.getIdCurso());
        return curso != null ? curso.getPropinaMensal() : null;
    }
}
