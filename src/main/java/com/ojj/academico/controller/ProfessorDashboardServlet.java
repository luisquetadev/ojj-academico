package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.AvaliacaoDAO;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.dao.ProfessorDAO;
import com.ojj.academico.dao.TurmaDAO;
import com.ojj.academico.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pelo fluxo de ProfessorDashboard.
 * Rotas atendidas: /professor/dashboard. Encaminha para: /view/professor/dashboard.jsp.
 */
public class ProfessorDashboardServlet extends HttpServlet {

    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    private final ProfessorDAO professorDAO = new ProfessorDAO();
    private final TurmaDAO turmaDAO = new TurmaDAO();
    private final AvaliacaoDAO avaliacaoDAO = new AvaliacaoDAO();

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
            Funcionario funcionario = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            if (funcionario != null) {
                Professor professor = professorDAO.buscarPorIdFuncionario(funcionario.getIdFuncionario());
                if (professor != null) {
                    // Count assigned turmas
                    int totalTurmas = turmaDAO.listarPorProfessor(professor.getIdProfessor()).size();
                    request.setAttribute("totalTurmas", totalTurmas);

                    // Count evaluations created by this professor
                    int totalAvaliacoes = avaliacaoDAO.listarPorProfessor(professor.getIdProfessor()).size();
                    request.setAttribute("totalAvaliacoes", totalAvaliacoes);
                } else {
                    request.setAttribute("totalTurmas", 0);
                    request.setAttribute("totalAvaliacoes", 0);
                }
            } else {
                request.setAttribute("totalTurmas", 0);
                request.setAttribute("totalAvaliacoes", 0);
            }
        } catch (SQLException e) {
            request.setAttribute("totalTurmas", 0);
            request.setAttribute("totalAvaliacoes", 0);
            request.setAttribute("erro", "Erro ao carregar dados do dashboard: " + e.getMessage());
        }

        request.getRequestDispatcher("/view/professor/dashboard.jsp").forward(request, response);
    }
}
