package com.ojj.academico.controller;

import com.ojj.academico.model.Curso;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Matricula;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.service.EstudanteService;
import com.ojj.academico.service.MatriculaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class RelatorioAcademicoServlet extends HttpServlet {

    private final MatriculaService matriculaService = new MatriculaService();
    private final EstudanteService estudanteService = new EstudanteService();
    private final CursoService cursoService = new CursoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Matricula> matriculas = matriculaService.findAll();
            List<Estudante> estudantes = estudanteService.findAll();
            List<Curso> cursos = cursoService.findAll();

            Map<Integer, Curso> cursoMap = cursos.stream()
                    .collect(Collectors.toMap(Curso::getIdCurso, c -> c));

            Map<Integer, Estudante> estudanteMap = estudantes.stream()
                    .collect(Collectors.toMap(Estudante::getIdEstudante, e -> e));

            long totalMatriculasConfirmadas = matriculas.stream()
                    .filter(m -> "CONFIRMADA".equalsIgnoreCase(m.getStatus()))
                    .count();
            long totalMatriculasPendentes = matriculas.stream()
                    .filter(m -> "PENDENTE".equalsIgnoreCase(m.getStatus()))
                    .count();
            long totalMatriculasCanceladas = matriculas.stream()
                    .filter(m -> "CANCELADA".equalsIgnoreCase(m.getStatus()))
                    .count();

            Map<String, Long> matriculasPorCurso = new HashMap<>();
            for (Matricula m : matriculas) {
                Curso curso = cursoMap.get(m.getIdCurso());
                String nomeCurso = curso != null ? curso.getNomeCurso() : "Curso #" + m.getIdCurso();
                matriculasPorCurso.merge(nomeCurso, 1L, Long::sum);
            }

            request.setAttribute("matriculas", matriculas);
            request.setAttribute("cursoMap", cursoMap);
            request.setAttribute("estudanteMap", estudanteMap);
            request.setAttribute("totalEstudantes", estudantes.size());
            request.setAttribute("totalMatriculas", matriculas.size());
            request.setAttribute("totalMatriculasConfirmadas", totalMatriculasConfirmadas);
            request.setAttribute("totalMatriculasPendentes", totalMatriculasPendentes);
            request.setAttribute("totalMatriculasCanceladas", totalMatriculasCanceladas);
            request.setAttribute("matriculasPorCurso", matriculasPorCurso);

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados academicos: " + e.getMessage());
        }

        request.getRequestDispatcher("/view/relatorios/academico/index.jsp").forward(request, response);
    }
}
