package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class EstudanteListServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Estudante> estudantes = estudanteService.findAll();
            request.setAttribute("estudantes", estudantes);
            request.getRequestDispatcher("/view/admin/estudante/list.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar estudantes: " + e.getMessage());
            request.getRequestDispatcher("/view/error.jsp").forward(request, response);
        }
    }
}
