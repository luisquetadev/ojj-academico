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
 * Servlet responsavel pela visualizacao do historico academico do estudante.
 * Rota: /estudante/historico
 * Metodos: doGet (exibe historico de matriculas e notas)
 * Acesso: Estudante (autenticado por sessao)
 * Encaminha para: /view/estudante/historico.jsp
 */
public class EstudanteHistoricoServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final CursoService cursoService = new CursoService();
    private final TurmaService turmaService = new TurmaService();
    private final AnoAcademicoService anoAcademicoService = new AnoAcademicoService();
    private final SemestreService semestreService = new SemestreService();
    private final NotaService notaService = new NotaService();

    /**
     * Carrega o historico completo do estudante logado.
     * 1. Obtem o estudante a partir do utilizador da sessao.
     * 2. Lista todas as matriculas com informacoes de curso, turma, ano e semestre.
     * 3. Obtem todas as notas do estudante com avaliacoes.
     * Atributos: estudante, historicoInfo (List<Map>), notas (List<Map>).
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
                request.getRequestDispatcher("/view/estudante/historico.jsp").forward(request, response);
                return;
            }

            List<Matricula> matriculas = matriculaService.findByEstudante(estudante.getIdEstudante());
            List<Map<String, Object>> historicoInfo = new ArrayList<>();

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

                historicoInfo.add(info);
            }

            List<Map<String, Object>> notas = notaService.findByEstudanteComAvaliacao(estudante.getIdEstudante());

            request.setAttribute("estudante", estudante);
            request.setAttribute("historicoInfo", historicoInfo);
            request.setAttribute("notas", notas);
            request.getRequestDispatcher("/view/estudante/historico.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar histórico: " + e.getMessage());
            request.getRequestDispatcher("/view/estudante/historico.jsp").forward(request, response);
        }
    }
}
