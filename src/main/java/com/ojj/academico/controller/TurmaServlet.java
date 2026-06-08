package com.ojj.academico.controller;

import com.ojj.academico.service.TurmaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class TurmaServlet extends AbstractPageServlet {

    private final TurmaService turmaService = new TurmaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("turmas", turmaService.findAll());
            request.setAttribute("entityType", "turma");
            request.getRequestDispatcher("/view/admin/academico/catalogo.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar turmas: " + e.getMessage());
        }
    }
}
