package com.ojj.academico.controller;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class GestaoUtilizadoresServlet extends HttpServlet {

    private final UtilizadorService utilizadorService = new UtilizadorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Utilizador> utilizadores = utilizadorService.findAll();
            request.setAttribute("utilizadores", utilizadores);
            request.getRequestDispatcher("/view/sistema/utilizadores/lista.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao listar utilizadores: " + e.getMessage());
        }
    }
}
