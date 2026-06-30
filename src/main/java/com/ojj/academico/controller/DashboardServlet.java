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
 * Servlet responsavel pelo encaminhamento do dashboard principal.
 * Rota: /dashboard (com pathInfo opcional para perfil especifico)
 * Metodos: doGet (redirecciona para o dashboard do perfil do utilizador)
 * Acesso: qualquer utilizador autenticado
 * Encaminha para: JSP especifico do perfil ou redirecciona para URL interna
 */
public class DashboardServlet extends HttpServlet {

    /**
     * Verifica a sessao e redirecciona para o dashboard apropriado.
     * Se o pathInfo especificar um perfil (/admin, /secretario, etc.), usa esse.
     * Caso contrario, determina pelo idPerfil do utilizador autenticado.
     * Se a URL retornada comecar com /view/, faz forward interno;
     * caso contrario, faz redirect HTTP.
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

        String pathInfo = request.getPathInfo();
        String dashboardPath = (pathInfo != null && !pathInfo.equals("/")) ? pathInfo : "";

        String redirectUrl = getDashboardUrl(utilizador.getIdPerfil(), dashboardPath);
        
        if (redirectUrl.startsWith("/view/")) {
            request.getRequestDispatcher(redirectUrl).forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + redirectUrl);
        }
    }

    /**
     * Determina a URL do dashboard com base no perfil e no pathInfo opcional.
     * Se pathInfo for fornecido e valido, usa-o; senao, mapeia o idPerfil numerico para a URL.
     *
     * @param idPerfil ID do perfil do utilizador (1-ADMIN, 2-SECRETARIA, 3-TESOURARIA, 4-DOCENTE, 5-COORDENADOR, 6-DIRECTOR, 7-ESTUDANTE)
     * @param pathInfo caminho opcional especificando o perfil desejado
     * @return caminho para o JSP do dashboard ou URL de redirect
     */
    private String getDashboardUrl(int idPerfil, String pathInfo) {
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

        switch (idPerfil) {
            case 1:
                return "/view/admin/dashboard.jsp";
            case 2:
                return "/view/secretario/dashboard.jsp";
            case 3:
                return "/view/tesouraria/dashboard.jsp";
            case 4:
                return "/view/professor/dashboard.jsp";
            case 5:
                return "/view/coordenador/dashboard.jsp";
            case 6:
                return "/view/director/dashboard.jsp";
            case 7:
                return "/view/estudante/dashboard_estudante.jsp";
            default:
                return "/view/dashboard/dashboard_principal.jsp";
        }
    }
}
