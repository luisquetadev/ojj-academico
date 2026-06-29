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

/**
 * Servlet responsavel pelo fluxo de FuncionarioList.
 * Rotas atendidas: /admin/funcionario/list. Encaminha para: /view/admin/funcionario/list.jsp, /view/error.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class FuncionarioListServlet extends HttpServlet {

    private final FuncionarioService funcionarioService = new FuncionarioService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

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
