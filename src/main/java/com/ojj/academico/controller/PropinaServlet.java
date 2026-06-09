package com.ojj.academico.controller;

import com.ojj.academico.service.PropinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Funcionario;
import com.ojj.academico.model.Pagamento;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.PagamentoService;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class PropinaServlet extends AbstractPageServlet {

    private final PropinaService propinaService = new PropinaService();
    private final PagamentoService pagamentoService = new PagamentoService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

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
            } catch (Exception e) {
                request.setAttribute("erro", "Estudante inválido.");
            }
        }

        request.getRequestDispatcher("/view/tesouraria/propina.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        try {
            int idEstudante = Integer.parseInt(request.getParameter("idEstudante"));
            String mes = request.getParameter("mes");
            int ano = Integer.parseInt(request.getParameter("ano"));
            BigDecimal valor = new BigDecimal(request.getParameter("valor"));
            String metodo = request.getParameter("metodoPagamento");

            Funcionario tesoureiro = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());

            Pagamento p = new Pagamento();
            p.setIdEstudante(idEstudante);
            p.setIdTesoureiro(tesoureiro.getIdFuncionario());
            p.setTipoPagamento("PROPINA");
            p.setPeriodoReferencia(mes + "/" + ano);
            p.setValorDevido(valor);
            p.setValorPago(valor);
            p.setMulta(BigDecimal.ZERO);
            p.setDataPagamento(LocalDateTime.now());
            p.setMetodoPagamento(metodo);
            p.setStatus("PAGO");
            p.setNumeroRecibo("PRP-" + System.currentTimeMillis() / 1000);

            if (pagamentoService.save(p)) {
                request.setAttribute("sucesso", "Propina de " + mes + "/" + ano + " paga com sucesso! Recibo: " + p.getNumeroRecibo());
            } else {
                request.setAttribute("erro", "Falha ao registrar pagamento.");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro no processamento: " + e.getMessage());
        }
        doGet(request, response);
    }
}
