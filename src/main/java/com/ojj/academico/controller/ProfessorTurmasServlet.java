package com.ojj.academico.controller;

import com.ojj.academico.service.TurmaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class ProfessorTurmasServlet extends AbstractPageServlet {

    private final TurmaService turmaService = new TurmaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("turmas", turmaService.findAll());
        } catch (SQLException e) {
            request.setAttribute("erro", "Nao foi possivel carregar turmas: " + e.getMessage());
        }
        forward(request, response, "Minhas Turmas", "Professor", "Turmas associadas para consulta academica e lancamento de resultados.");
    }
}
