package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.dao.ProfessorDAO;
import com.ojj.academico.dao.TurmaDAO;
import com.ojj.academico.model.*;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.service.DisciplinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de ProfessorTurmas.
 * Rotas atendidas: /professor/turmas. Encaminha para: /view/professor/turmas.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class ProfessorTurmasServlet extends HttpServlet {

    private final TurmaDAO turmaDAO = new TurmaDAO();
    private final CursoService cursoService = new CursoService();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    private final ProfessorDAO professorDAO = new ProfessorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get logged-in professor
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

            Funcionario funcionario = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            Professor professor = professorDAO.buscarPorIdFuncionario(funcionario.getIdFuncionario());

            // Load turmas filtered by professor
            List<Turma> turmas = turmaDAO.listarPorProfessor(professor.getIdProfessor());
            List<Map<String, Object>> turmasInfo = new ArrayList<>();
            for (Turma t : turmas) {
                Map<String, Object> info = new HashMap<>();
                info.put("turma", t);
                String nomeCurso = "---";
                try {
                    nomeCurso = cursoService.findById(t.getIdCurso()).getNomeCurso();
                } catch (Exception ignored) {}
                info.put("nomeCurso", nomeCurso);
                turmasInfo.add(info);
            }
            request.setAttribute("turmasInfo", turmasInfo);
            request.setAttribute("disciplinas", disciplinaService.findAll());
            request.getRequestDispatcher("/view/professor/turmas.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar turmas: " + e.getMessage());
            request.getRequestDispatcher("/view/professor/turmas.jsp").forward(request, response);
        }
    }
}
