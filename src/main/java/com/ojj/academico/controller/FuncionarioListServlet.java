package com.ojj.academico.controller;

import com.ojj.academico.model.Funcionario;
import com.ojj.academico.service.FuncionarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class FuncionarioListServlet extends HttpServlet {

    private final FuncionarioService funcionarioService = new FuncionarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Funcionario> funcionarios = funcionarioService.findAll();
            request.setAttribute("funcionarios", funcionarios);
            request.getRequestDispatcher("/view/admin/funcionario/list.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar funcionários: " + e.getMessage());
            request.getRequestDispatcher("/view/error.jsp").forward(request, response);
        }
    }
}
