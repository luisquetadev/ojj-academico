package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.*;
import com.ojj.academico.service.AvaliacaoService;
import com.ojj.academico.service.FuncionarioService;
import com.ojj.academico.service.ProfessorService;
import com.ojj.academico.service.TurmaService;
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

    private final FuncionarioService funcionarioService = new FuncionarioService();
    private final ProfessorService professorService = new ProfessorService();
    private final TurmaService turmaService = new TurmaService();
    private final AvaliacaoService avaliacaoService = new AvaliacaoService();

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
            Funcionario funcionario = funcionarioService.findByIdUtilizador(utilizador.getIdUtilizador());
            if (funcionario != null) {
                Professor professor = professorService.findByFuncionarioId(funcionario.getIdFuncionario());
                if (professor != null) {
                    int totalTurmas = turmaService.findByProfessor(professor.getIdProfessor()).size();
                    int totalAvaliacoes = avaliacaoService.findByProfessor(professor.getIdProfessor()).size();

                    request.setAttribute("totalTurmas", totalTurmas);
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
