package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {

    private final UtilizadorService utilizadorService = new UtilizadorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Utilizador utilizador = utilizadorService.login(username, password);

            if (utilizador != null && "ATIVO".equals(utilizador.getStatus())) {
                HttpSession session = request.getSession();
                session.setAttribute(AppConfig.SESSION_USER_ATTRIBUTE, utilizador);
                
                // Redirecionar para o dashboard apropriado baseado no perfil
                String redirectUrl = getDashboardUrl(utilizador.getIdPerfil());
                response.sendRedirect(request.getContextPath() + redirectUrl);
                
            } else {
                request.setAttribute("erro", "Credenciais inválidas ou utilizador inativo/bloqueado");
                request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao processar login: " + e.getMessage());
            request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
        }
    }

    private String getDashboardUrl(int idPerfil) {
        // Mapeamento de perfis para dashboards (baseado nos IDs do banco)
        // 1=ADMIN, 2=SECRETARIA, 3=TESOURARIA, 4=DOCENTE, 5=COORDENADOR, 6=DIRECTOR, 7=ESTUDANTE
        switch (idPerfil) {
            case 1: // ADMIN
                return "/admin/dashboard";
            case 2: // SECRETARIA
                return "/secretario/dashboard";
            case 3: // TESOURARIA
                return "/tesouraria/dashboard";
            case 4: // DOCENTE/PROFESSOR
                return "/professor/dashboard";
            case 5: // COORDENADOR
                return "/coordenador/dashboard";
            case 6: // DIRECTOR
                return "/director/dashboard";
            case 7: // ESTUDANTE
                return "/estudante/dashboard";
            default:
                return "/admin/dashboard";
        }
    }
}
