package com.ojj.academico.controller;

import com.ojj.academico.model.Disciplina;
import com.ojj.academico.model.Funcionario;
import com.ojj.academico.model.Professor;
import com.ojj.academico.model.ProfessorDisciplina;
import com.ojj.academico.service.DisciplinaService;
import com.ojj.academico.service.FuncionarioService;
import com.ojj.academico.service.ProfessorDisciplinaService;
import com.ojj.academico.service.ProfessorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ProfessorDisciplinaServlet extends HttpServlet {

    private final ProfessorService professorService = new ProfessorService();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    private final ProfessorDisciplinaService pdService = new ProfessorDisciplinaService();
    private final FuncionarioService funcionarioService = new FuncionarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Professor> professores = professorService.findAll();
            List<Disciplina> disciplinas = disciplinaService.findAll();

            Map<Integer, List<Integer>> disciplinasPorProfessor = new HashMap<>();
            Map<Integer, String> nomesProfessores = new HashMap<>();
            for (Professor p : professores) {
                disciplinasPorProfessor.put(p.getIdProfessor(),
                        pdService.findDisciplinaIdsByProfessorId(p.getIdProfessor()));
                try {
                    Funcionario f = funcionarioService.findById(p.getIdFuncionario());
                    nomesProfessores.put(p.getIdProfessor(), f != null ? f.getNomeCompleto() : "Professor #" + p.getIdProfessor());
                } catch (Exception e) {
                    nomesProfessores.put(p.getIdProfessor(), "Professor #" + p.getIdProfessor());
                }
            }

            request.setAttribute("professores", professores);
            request.setAttribute("disciplinas", disciplinas);
            request.setAttribute("nomesProfessores", nomesProfessores);
            request.setAttribute("disciplinasPorProfessor", disciplinasPorProfessor);
            request.getRequestDispatcher("/view/admin/academico/professor_disciplina.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/academico/professor_disciplina.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int idProfessor = Integer.parseInt(request.getParameter("idProfessor"));

        try {
            if ("add".equals(action)) {
                int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));
                ProfessorDisciplina pd = new ProfessorDisciplina(idProfessor, idDisciplina);
                pdService.save(pd);
            } else if ("remove".equals(action)) {
                int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));
                pdService.deleteByProfessorEDisciplina(idProfessor, idDisciplina);
            }
            response.sendRedirect(request.getContextPath() + "/admin/professor-disciplina");
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao processar: " + e.getMessage());
            doGet(request, response);
        }
    }
}
