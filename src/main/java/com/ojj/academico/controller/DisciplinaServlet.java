package com.ojj.academico.controller;

import com.ojj.academico.service.DisciplinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pelo fluxo de Disciplina.
 * Rotas atendidas: /admin/disciplina. Encaminha para: /view/admin/academico/catalogo.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class DisciplinaServlet extends AbstractPageServlet {

    private final DisciplinaService disciplinaService = new DisciplinaService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("disciplinas", disciplinaService.findAll());
            request.setAttribute("entityType", "disciplina");
            request.getRequestDispatcher("/view/admin/academico/catalogo.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar disciplinas: " + e.getMessage());
        }
    }
}
