package com.ojj.academico.controller;

import com.ojj.academico.model.Curso;
import com.ojj.academico.model.Disciplina;
import com.ojj.academico.model.PlanoCurricular;
import com.ojj.academico.model.PlanoCurricularDisciplina;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.service.DisciplinaService;
import com.ojj.academico.service.PlanoCurricularDisciplinaService;
import com.ojj.academico.service.PlanoCurricularService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class PlanoCurricularServlet extends AbstractPageServlet {

    private final PlanoCurricularService planoCurricularService = new PlanoCurricularService();
    private final PlanoCurricularDisciplinaService pcdService = new PlanoCurricularDisciplinaService();
    private final CursoService cursoService = new CursoService();
    private final DisciplinaService disciplinaService = new DisciplinaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cursoIdParam = request.getParameter("cursoId");

        try {
            List<Curso> cursos = cursoService.findAll();

            if (cursoIdParam != null && !cursoIdParam.isEmpty()) {
                int cursoId = Integer.parseInt(cursoIdParam);
                Curso curso = cursoService.findById(cursoId);
                if (curso == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Curso nao encontrado");
                    return;
                }

                List<PlanoCurricular> planos = planoCurricularService.findByCursoId(cursoId);
                List<Disciplina> todasDisciplinas = disciplinaService.findAll();

                Map<Integer, List<Disciplina>> disciplinasPorPlano = new HashMap<>();
                for (PlanoCurricular plano : planos) {
                    List<PlanoCurricularDisciplina> vinculos = pcdService.findByPlanoCurricularId(plano.getIdPlanoCurricular());
                    List<Disciplina> disciplinasDoPlano = new ArrayList<>();
                    for (PlanoCurricularDisciplina v : vinculos) {
                        for (Disciplina d : todasDisciplinas) {
                            if (d.getIdDisciplina() == v.getIdDisciplina()) {
                                disciplinasDoPlano.add(d);
                            }
                        }
                    }
                    disciplinasPorPlano.put(plano.getIdPlanoCurricular(), disciplinasDoPlano);
                }

                request.setAttribute("curso", curso);
                request.setAttribute("planos", planos);
                request.setAttribute("disciplinasPorPlano", disciplinasPorPlano);
                request.setAttribute("todasDisciplinas", todasDisciplinas);
            }

            request.setAttribute("cursos", cursos);
            request.getRequestDispatcher("/view/admin/academico/plano_curricular.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar dados: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String cursoIdParam = request.getParameter("cursoId");

        if (cursoIdParam == null || cursoIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "cursoId obrigatorio");
            return;
        }

        int cursoId = Integer.parseInt(cursoIdParam);

        try {
            if ("addPlano".equals(action)) {
                int anoCurricular = Integer.parseInt(request.getParameter("anoCurricular"));
                int semestre = Integer.parseInt(request.getParameter("semestre"));
                String cargaStr = request.getParameter("cargaHoraria");

                PlanoCurricular plano = new PlanoCurricular(cursoId, anoCurricular, semestre);
                if (cargaStr != null && !cargaStr.isEmpty()) {
                    plano.setCargaHoraria(Integer.parseInt(cargaStr));
                }
                planoCurricularService.save(plano);
            } else if ("addDisciplina".equals(action)) {
                int idPlanoCurricular = Integer.parseInt(request.getParameter("idPlanoCurricular"));
                int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));

                PlanoCurricularDisciplina vinculo = new PlanoCurricularDisciplina(idPlanoCurricular, idDisciplina);
                pcdService.save(vinculo);
            } else if ("removeDisciplina".equals(action)) {
                int idPlanoCurricular = Integer.parseInt(request.getParameter("idPlanoCurricular"));
                int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));

                pcdService.deleteByPlanoCurricularEDisciplina(idPlanoCurricular, idDisciplina);
            } else if ("deletePlano".equals(action)) {
                int idPlanoCurricular = Integer.parseInt(request.getParameter("idPlanoCurricular"));
                planoCurricularService.delete(idPlanoCurricular);
            }

            response.sendRedirect(request.getContextPath() + "/admin/plano-curricular?cursoId=" + cursoId);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao processar operacao: " + e.getMessage());
            doGet(request, response);
        }
    }
}
