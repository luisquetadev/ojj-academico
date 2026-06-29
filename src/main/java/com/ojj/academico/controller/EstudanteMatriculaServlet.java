package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.*;
import com.ojj.academico.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de EstudanteMatricula.
 * Rotas atendidas: /estudante/matricula. Encaminha para: /view/estudante/matricula.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class EstudanteMatriculaServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final CursoService cursoService = new CursoService();
    private final TurmaService turmaService = new TurmaService();
    private final AnoAcademicoService anoAcademicoService = new AnoAcademicoService();
    private final SemestreService semestreService = new SemestreService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        try {
            Estudante estudante = estudanteService.findByIdUtilizador(utilizador.getIdUtilizador());
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado.");
                request.getRequestDispatcher("/view/estudante/matricula.jsp").forward(request, response);
                return;
            }

            List<Matricula> matriculas = matriculaService.findByEstudante(estudante.getIdEstudante());
            List<Map<String, Object>> matriculasInfo = new ArrayList<>();

            for (Matricula m : matriculas) {
                Map<String, Object> info = new HashMap<>();
                info.put("matricula", m);

                try {
                    Curso c = cursoService.findById(m.getIdCurso());
                    info.put("nomeCurso", c != null ? c.getNomeCurso() : "---");
                } catch (Exception e) {
                    info.put("nomeCurso", "---");
                }

                try {
                    Turma t = turmaService.findById(m.getIdTurma());
                    info.put("codigoTurma", t != null ? t.getCodigoTurma() : "---");
                } catch (Exception e) {
                    info.put("codigoTurma", "---");
                }

                try {
                    AnoAcademico aa = anoAcademicoService.findById(m.getIdAnoAcademico());
                    info.put("descricaoAno", aa != null ? aa.getDescricao() : "---");
                } catch (Exception e) {
                    info.put("descricaoAno", "---");
                }

                try {
                    Semestre s = semestreService.findById(m.getIdSemestre());
                    info.put("nomeSemestre", s != null ? s.getNomeSemestre() : "---");
                } catch (Exception e) {
                    info.put("nomeSemestre", "---");
                }

                matriculasInfo.add(info);
            }

            request.setAttribute("estudante", estudante);
            request.setAttribute("matriculasInfo", matriculasInfo);
            request.getRequestDispatcher("/view/estudante/matricula.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar matrícula: " + e.getMessage());
            request.getRequestDispatcher("/view/estudante/matricula.jsp").forward(request, response);
        }
    }
}
