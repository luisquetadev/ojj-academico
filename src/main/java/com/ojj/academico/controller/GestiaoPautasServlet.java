package com.ojj.academico.controller;

import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.model.*;
import com.ojj.academico.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de GestiaoPautas.
 * Rotas atendidas: /professor/pautas. Encaminha para: /view/professor/pautas.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class GestiaoPautasServlet extends HttpServlet {

    private final TurmaService turmaService = new TurmaService();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final AvaliacaoService avaliacaoService = new AvaliacaoService();
    private final NotaService notaService = new NotaService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Turma> turmas = turmaService.findAll();
            List<Disciplina> disciplinas = disciplinaService.findAll();
            request.setAttribute("turmas", turmas);
            request.setAttribute("disciplinas", disciplinas);
            request.getRequestDispatcher("/view/professor/pautas.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados: " + e.getMessage());
            request.getRequestDispatcher("/view/professor/pautas.jsp").forward(request, response);
        }
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("carregar".equals(action)) {
                handleCarregar(request, response);
            } else if ("editar".equals(action)) {
                handleCarregar(request, response);
                request.setAttribute("modoEdicao", true);
                request.getRequestDispatcher("/view/professor/pautas.jsp").forward(request, response);
            } else if ("salvar".equals(action)) {
                handleSalvar(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/professor/pautas");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro no processamento: " + e.getMessage());
            doGet(request, response);
        }
    }

    private void handleCarregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int idTurma = Integer.parseInt(request.getParameter("idTurma"));
        int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));

        Turma turma = turmaService.findById(idTurma);
        Disciplina disciplina = disciplinaService.findById(idDisciplina);
        List<Avaliacao> avaliacoes = avaliacaoService.findByDisciplina(idDisciplina);
        List<Matricula> matriculas = matriculaService.findByIdTurma(idTurma);

        List<Map<String, Object>> alunos = new ArrayList<>();
        for (Matricula m : matriculas) {
            Estudante e = estudanteDAO.buscarPorId(m.getIdEstudante());
            if (e != null) {
                Map<String, Object> aluno = new HashMap<>();
                aluno.put("idEstudante", e.getIdEstudante());
                aluno.put("nomeCompleto", e.getNomeCompleto());
                aluno.put("numeroEstudante", e.getNumeroEstudante());

                Map<Integer, Map<String, Object>> notasMap = new HashMap<>();
                for (Avaliacao a : avaliacoes) {
                    Nota n = notaService.findByAvaliacaoEEstudante(a.getIdAvaliacao(), e.getIdEstudante());
                    Map<String, Object> notaInfo = new HashMap<>();
                    if (n != null) {
                        notaInfo.put("idNota", n.getIdNota());
                        notaInfo.put("nota", n.getNota());
                        notaInfo.put("observacao", n.getObservacao());
                    }
                    notasMap.put(a.getIdAvaliacao(), notaInfo);
                }
                aluno.put("notas", notasMap);
                alunos.add(aluno);
            }
        }

        List<Turma> turmas = turmaService.findAll();
        List<Disciplina> disciplinas = disciplinaService.findAll();
        request.setAttribute("turmas", turmas);
        request.setAttribute("disciplinas", disciplinas);
        request.setAttribute("turmaSelecionada", turma);
        request.setAttribute("disciplinaSelecionada", disciplina);
        request.setAttribute("avaliacoes", avaliacoes);
        request.setAttribute("alunos", alunos);
    }

    private void handleSalvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String[] idNotas = request.getParameterValues("idNota");
        String[] idAvaliacoes = request.getParameterValues("idAvaliacao");
        String[] idEstudantes = request.getParameterValues("idEstudante");
        String[] notas = request.getParameterValues("nota");
        String[] observacoes = request.getParameterValues("observacao");

        if (idAvaliacoes == null || idEstudantes == null || notas == null) {
            request.setAttribute("erro", "Nenhum dado foi submetido.");
            handleCarregar(request, response);
            request.getRequestDispatcher("/view/professor/pautas.jsp").forward(request, response);
            return;
        }

        int salvos = 0;
        for (int i = 0; i < idAvaliacoes.length; i++) {
            String notaStr = notas[i];
            if (notaStr == null || notaStr.trim().isEmpty()) continue;

            int idAvaliacao = Integer.parseInt(idAvaliacoes[i]);
            int idEstudante = Integer.parseInt(idEstudantes[i]);

            Nota nota = null;
            if (idNotas != null && i < idNotas.length && idNotas[i] != null && !idNotas[i].isEmpty()) {
                nota = notaService.findById(Integer.parseInt(idNotas[i]));
            }
            if (nota == null) {
                nota = new Nota();
                nota.setIdAvaliacao(idAvaliacao);
                nota.setIdEstudante(idEstudante);
            }
            nota.setNota(new BigDecimal(notaStr));
            nota.setObservacao(observacoes != null && i < observacoes.length ? observacoes[i] : null);
            if (notaService.save(nota)) salvos++;
        }

        request.setAttribute("sucesso", salvos + " nota(s) atualizada(s) com sucesso!");
        handleCarregar(request, response);
        request.getRequestDispatcher("/view/professor/pautas.jsp").forward(request, response);
    }
}
