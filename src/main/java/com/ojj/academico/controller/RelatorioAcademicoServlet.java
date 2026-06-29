package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pelo fluxo de RelatorioAcademico.
 * Rotas atendidas: /relatorios/academico. Encaminha para: /view/relatorios/academico/index.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class RelatorioAcademicoServlet extends HttpServlet {
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/relatorios/academico/index.jsp").forward(request, response);
    }
}
