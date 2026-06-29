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
 * Servlet responsavel pelo fluxo de Dashboard.
 * Rotas atendidas: sem rota propria; usado como base interna.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class DashboardServlet extends HttpServlet {
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
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

        // Extrair o caminho específico do dashboard
        String pathInfo = request.getPathInfo();
        String dashboardPath = (pathInfo != null && !pathInfo.equals("/")) ? pathInfo : "";

        // Redirecionar para o dashboard apropriado baseado no perfil
        String redirectUrl = getDashboardUrl(utilizador.getIdPerfil(), dashboardPath);
        
        if (redirectUrl.startsWith("/view/")) {
            request.getRequestDispatcher(redirectUrl).forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + redirectUrl);
        }
    }

    private String getDashboardUrl(int idPerfil, String pathInfo) {
        // Se o pathInfo já especifica um dashboard específico, usar ele
        if (pathInfo != null && !pathInfo.isEmpty() && !pathInfo.equals("/")) {
            switch (pathInfo) {
                case "/admin":
                    return "/view/admin/dashboard.jsp";
                case "/secretario":
                    return "/view/secretario/dashboard.jsp";
                case "/tesouraria":
                    return "/view/tesouraria/dashboard.jsp";
                case "/professor":
                    return "/view/professor/dashboard.jsp";
                case "/coordenador":
                    return "/view/coordenador/dashboard.jsp";
                case "/director":
                    return "/view/director/dashboard.jsp";
                case "/estudante":
                    return "/view/estudante/dashboard_estudante.jsp";
                default:
                    return "/view/dashboard/dashboard_principal.jsp";
            }
        }

        // Caso contrário, redirecionar baseado no perfil
        switch (idPerfil) {
            case 1: // ADMIN
                return "/view/admin/dashboard.jsp";
            case 2: // SECRETARIA
                return "/view/secretario/dashboard.jsp";
            case 3: // TESOURARIA
                return "/view/tesouraria/dashboard.jsp";
            case 4: // DOCENTE/PROFESSOR
                return "/view/professor/dashboard.jsp";
            case 5: // COORDENADOR
                return "/view/coordenador/dashboard.jsp";
            case 6: // DIRECTOR
                return "/view/director/dashboard.jsp";
            case 7: // ESTUDANTE
                return "/view/estudante/dashboard_estudante.jsp";
            default:
                return "/view/dashboard/dashboard_principal.jsp";
        }
    }
}
