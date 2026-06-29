package com.ojj.academico.controller;

import com.ojj.academico.model.Disciplina;
import com.ojj.academico.model.Turma;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.service.DisciplinaService;
import com.ojj.academico.service.TurmaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de ProfessorTurmas.
 * Rotas atendidas: /professor/turmas. Encaminha para: /view/professor/turmas.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class ProfessorTurmasServlet extends HttpServlet {

    private final TurmaService turmaService = new TurmaService();
    private final CursoService cursoService = new CursoService();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Turma> turmas = turmaService.findAll();
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
