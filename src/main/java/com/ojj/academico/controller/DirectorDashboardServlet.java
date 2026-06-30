package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet responsavel pelo dashboard do Director.
 * Rota: /director/dashboard
 * Metodos: doGet (exibe o painel principal)
 * Acesso: Director (validado por sessao)
 * Encaminha para: /view/director/dashboard.jsp
 */
public class DirectorDashboardServlet extends HttpServlet {

    /**
     * Exibe o dashboard do director.
     * Verifica a existencia de sessao activa e do utilizador autenticado
     * antes de encaminhar para o JSP do painel.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/view/director/dashboard.jsp").forward(request, response);
    }
}
