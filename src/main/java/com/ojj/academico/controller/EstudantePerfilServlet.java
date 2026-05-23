package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class EstudantePerfilServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Estudante estudante = estudanteService.findById(id);
            
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado");
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }
            
            request.setAttribute("estudante", estudante);
            
            // Redirecionar para o perfil apropriado baseado no caminho
            String path = request.getServletPath();
            if (path.equals("/estudante/profile")) {
                request.getRequestDispatcher("/view/estudante/profile.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/view/admin/estudante/profile.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar estudante: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
    }
}
