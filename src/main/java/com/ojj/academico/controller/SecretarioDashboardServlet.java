package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.MatriculaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet responsavel pelo fluxo de SecretarioDashboard.
 * Rotas atendidas: /secretario/dashboard. Encaminha para: /view/secretario/dashboard.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class SecretarioDashboardServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(SecretarioDashboardServlet.class);

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final MatriculaDAO matriculaDAO = new MatriculaDAO();
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

        try {
            int totalEstudantes = estudanteDAO.contarTodos();
            int matriculasAtivas = matriculaDAO.contarAtivas();
            
            request.setAttribute("totalEstudantes", totalEstudantes);
            request.setAttribute("matriculasAtivas", matriculasAtivas);
            
        } catch (SQLException e) {
            log.error("Erro ao carregar estatisticas do dashboard secretario", e);
        }

        request.getRequestDispatcher("/view/secretario/dashboard.jsp").forward(request, response);
    }
}
