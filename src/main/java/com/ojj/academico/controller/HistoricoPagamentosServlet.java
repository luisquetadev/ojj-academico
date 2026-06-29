package com.ojj.academico.controller;

import com.ojj.academico.service.PagamentoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pelo fluxo de HistoricoPagamentos.
 * Rotas atendidas: /tesouraria/historico. Encaminha para: /view/tesouraria/historico.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class HistoricoPagamentosServlet extends AbstractPageServlet {

    private final PagamentoService pagamentoService = new PagamentoService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("pagamentos", pagamentoService.findAll());
        } catch (SQLException e) {
            request.setAttribute("erro", "Nao foi possivel carregar pagamentos: " + e.getMessage());
        }
        request.getRequestDispatcher("/view/tesouraria/historico.jsp").forward(request, response);
    }
}
