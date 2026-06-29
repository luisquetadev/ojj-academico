package com.ojj.academico.controller;

import com.ojj.academico.model.Funcionario;
import com.ojj.academico.service.FuncionarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pelo fluxo de FuncionarioPerfil.
 * Rotas atendidas: /admin/funcionario/profile. Encaminha para: /view/admin/funcionario/profile.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class FuncionarioPerfilServlet extends HttpServlet {

    private final FuncionarioService funcionarioService = new FuncionarioService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Funcionario funcionario = funcionarioService.findById(id);
            
            if (funcionario == null) {
                request.setAttribute("erro", "Funcionário não encontrado");
                response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
                return;
            }
            
            request.setAttribute("funcionario", funcionario);
            request.getRequestDispatcher("/view/admin/funcionario/profile.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar funcionário: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        }
    }
}
