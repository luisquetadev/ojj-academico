package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.conf.PerfilConstants;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.EstudanteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pela visualizacao do perfil do estudante.
 * Rotas: /estudante/profile (auto-visualizacao), /admin/estudante/profile (admin/secretaria)
 * Metodos: doGet (exibe perfil do estudante)
 * Acesso: Estudante (proprio perfil), Admin, Secretaria (qualquer estudante)
 * Encaminha para: /view/admin/estudante/profile.jsp
 */
public class EstudantePerfilServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();

    /**
     * Exibe o perfil do estudante.
     * Se o utilizador logado for estudante, carrega o seu proprio perfil.
     * Se for admin/secretaria, carrega o perfil do estudante pelo parametro id.
     * Atributos: estudante.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utilizador utilizador = (Utilizador) (session != null ? session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE) : null);

        if (utilizador == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            Estudante estudante;

            if (utilizador.isEstudante()) {
                estudante = estudanteService.findByIdUtilizador(utilizador.getIdUtilizador());
                if (estudante == null) {
                    request.setAttribute("erro", "Perfil de estudante não encontrado");
                    response.sendRedirect(request.getContextPath() + "/estudante/dashboard");
                    return;
                }
            } else if (utilizador.isAdmin() || utilizador.isSecretaria()) {
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
                    return;
                }
                int id = Integer.parseInt(idStr);
                estudante = estudanteService.findById(id);
                if (estudante == null) {
                    request.setAttribute("erro", "Estudante não encontrado");
                    response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
                    return;
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }

            request.setAttribute("estudante", estudante);
            request.getRequestDispatcher("/view/admin/estudante/profile.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar estudante: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
    }
}
