package com.ojj.academico.controller;

import com.ojj.academico.service.DisciplinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class DisciplinaServlet extends AbstractPageServlet {

    private final DisciplinaService disciplinaService = new DisciplinaService();

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
