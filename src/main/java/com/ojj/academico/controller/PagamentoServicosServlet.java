package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Funcionario;
import com.ojj.academico.model.Pagamento;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.PagamentoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet responsavel pelo fluxo de PagamentoServicos.
 * Rotas atendidas: /tesouraria/servicos. Encaminha para: /view/tesouraria/servicos.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class PagamentoServicosServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(PagamentoServicosServlet.class);

    private final PagamentoService pagamentoService = new PagamentoService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
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
            } catch (Exception e) {
                request.setAttribute("erro", "Estudante inválido.");
            }
        }

        request.getRequestDispatcher("/view/tesouraria/servicos.jsp").forward(request, response);
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
            String tipo = request.getParameter("tipoPagamento");
            BigDecimal valor = new BigDecimal(request.getParameter("valor"));
            String metodo = request.getParameter("metodoPagamento");
            String obs = request.getParameter("observacao");
            String ref = request.getParameter("referencia");

            // Buscar ID do funcionário (tesoureiro)
            Funcionario tesoureiro = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            if (tesoureiro == null) {
                throw new Exception("Tesoureiro não identificado no sistema.");
            }

            Pagamento p = new Pagamento();
            p.setIdEstudante(idEstudante);
            p.setIdTesoureiro(tesoureiro.getIdFuncionario());
            p.setTipoPagamento(tipo);
            p.setValorDevido(valor);
            p.setValorPago(valor);
            p.setMulta(BigDecimal.ZERO);
            p.setDataPagamento(LocalDateTime.now());
            p.setMetodoPagamento(metodo);
            p.setStatus("PAGO");
            p.setObservacao(obs);
            p.setReferencia(ref);
            p.setNumeroRecibo("REC-" + System.currentTimeMillis() / 1000);

            if (pagamentoService.save(p)) {
                request.setAttribute("sucesso", "Pagamento de " + tipo + " registrado com sucesso! Recibo: " + p.getNumeroRecibo());
            } else {
                request.setAttribute("erro", "Falha ao salvar o pagamento.");
            }

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao processar pagamento: " + e.getMessage());
            log.error("Erro ao processar pagamento de servico", e);
        }

        doGet(request, response);
    }
}
