package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.dao.ProfessorDAO;
import com.ojj.academico.dao.TurmaDAO;
import com.ojj.academico.dao.DisciplinaDAO;
import com.ojj.academico.model.*;
import com.ojj.academico.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de LancamentoNotas.
 * Rotas atendidas: /professor/lancar-notas. Encaminha para: /view/professor/lancar_notas.jsp.
 */
public class LancamentoNotasServlet extends HttpServlet {

    private final TurmaService turmaService = new TurmaService();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final AvaliacaoService avaliacaoService = new AvaliacaoService();
    private final NotaService notaService = new NotaService();
    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    private final ProfessorDAO professorDAO = new ProfessorDAO();
    private final TurmaDAO turmaDAO = new TurmaDAO();
    private final DisciplinaDAO disciplinaDAO = new DisciplinaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            Utilizador utilizador = getUtilizador(session, response);
            if (utilizador == null) return;

            Funcionario funcionario = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            Professor professor = professorDAO.buscarPorIdFuncionario(funcionario.getIdFuncionario());

            List<Turma> turmas = turmaDAO.listarPorProfessor(professor.getIdProfessor());
            List<Disciplina> disciplinas = disciplinaDAO.listarPorProfessor(professor.getIdProfessor());

            request.setAttribute("turmas", turmas);
            request.setAttribute("disciplinas", disciplinas);
            request.getRequestDispatcher("/view/professor/lancar_notas.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados: " + e.getMessage());
            request.getRequestDispatcher("/view/professor/lancar_notas.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("carregar".equals(action)) {
                handleCarregarTurma(request, response);
            } else if ("salvar".equals(action)) {
                handleSalvarNotas(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/professor/lancar-notas");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro no processamento: " + e.getMessage());
            doGet(request, response);
        }
    }

    private void handleCarregarTurma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        Utilizador utilizador = getUtilizador(session, response);
        if (utilizador == null) return;

        Funcionario funcionario = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
        Professor professor = professorDAO.buscarPorIdFuncionario(funcionario.getIdFuncionario());

        int idTurma = Integer.parseInt(request.getParameter("idTurma"));
        int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));
        String tipoAvaliacao = request.getParameter("tipoAvaliacao");
        String descricao = request.getParameter("descricao");
        String dataStr = request.getParameter("dataAvaliacao");

        Turma turma = turmaService.findById(idTurma);
        Disciplina disciplina = disciplinaService.findById(idDisciplina);
        List<Matricula> matriculas = matriculaService.findByIdTurma(idTurma);

        List<Map<String, Object>> alunos = new ArrayList<>();
        for (Matricula m : matriculas) {
            Estudante e = estudanteDAO.buscarPorId(m.getIdEstudante());
            if (e != null) {
                Map<String, Object> aluno = new HashMap<>();
                aluno.put("idEstudante", e.getIdEstudante());
                aluno.put("nomeCompleto", e.getNomeCompleto());
                aluno.put("numeroEstudante", e.getNumeroEstudante());
                alunos.add(aluno);
            }
        }

        // Reload filtered lists
        List<Turma> turmas = turmaDAO.listarPorProfessor(professor.getIdProfessor());
        List<Disciplina> disciplinas = disciplinaDAO.listarPorProfessor(professor.getIdProfessor());

        request.setAttribute("turmas", turmas);
        request.setAttribute("disciplinas", disciplinas);
        request.setAttribute("turmaSelecionada", turma);
        request.setAttribute("disciplinaSelecionada", disciplina);
        request.setAttribute("alunos", alunos);
        request.setAttribute("tipoAvaliacao", tipoAvaliacao);
        request.setAttribute("idDisciplina", idDisciplina);
        request.setAttribute("descricao", descricao);
        request.setAttribute("dataAvaliacao", dataStr);
        request.getRequestDispatcher("/view/professor/lancar_notas.jsp").forward(request, response);
    }

    private void handleSalvarNotas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        int idTurma = Integer.parseInt(request.getParameter("idTurma"));
        int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));
        String tipoAvaliacao = request.getParameter("tipoAvaliacao");
        String descricao = request.getParameter("descricao");
        String dataStr = request.getParameter("dataAvaliacao");

        Funcionario funcionario = funcionarioDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
        Professor professor = professorDAO.buscarPorIdFuncionario(funcionario.getIdFuncionario());

        String[] idEstudantes = request.getParameterValues("idEstudante");
        String[] notas = request.getParameterValues("nota");
        String[] observacoes = request.getParameterValues("observacao");

        if (idEstudantes == null || notas == null) {
            request.setAttribute("erro", "Nenhuma nota foi submetida.");
            handleCarregarTurma(request, response);
            return;
        }

        Avaliacao avaliacao = new Avaliacao();
        avaliacao.setIdDisciplina(idDisciplina);
        avaliacao.setIdProfessor(professor.getIdProfessor());
        avaliacao.setTipo(tipoAvaliacao);
        avaliacao.setDescricao(descricao);
        if (dataStr != null && !dataStr.isEmpty()) {
            avaliacao.setDataAvaliacao(LocalDate.parse(dataStr));
        }
        avaliacao.setPeso(new BigDecimal("10.00"));
        avaliacaoService.save(avaliacao);

        int salvos = 0;
        for (int i = 0; i < idEstudantes.length; i++) {
            String notaStr = notas[i];
            if (notaStr == null || notaStr.trim().isEmpty()) continue;

            Nota nota = new Nota();
            nota.setIdAvaliacao(avaliacao.getIdAvaliacao());
            nota.setIdEstudante(Integer.parseInt(idEstudantes[i]));
            nota.setNota(new BigDecimal(notaStr));
            nota.setObservacao(observacoes != null && i < observacoes.length ? observacoes[i] : null);
            if (notaService.save(nota)) salvos++;
        }

        request.setAttribute("sucesso", salvos + " nota(s) lancada(s) com sucesso (" + tipoAvaliacao + ")!");
        doGet(request, response);
    }

    private Utilizador getUtilizador(HttpSession session, HttpServletResponse response) throws IOException {
        if (session == null) return null;
        Utilizador u = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        if (u == null) return null;
        return u;
    }
}


