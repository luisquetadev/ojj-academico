package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.DisciplinaService;
import com.ojj.academico.service.NotaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet responsavel pelo fluxo de EstudanteNotas.
 * Rotas atendidas: /estudante/notas. Encaminha para: /view/estudante/notas.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class EstudanteNotasServlet extends HttpServlet {

    private final NotaService notaService = new NotaService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final DisciplinaService disciplinaService = new DisciplinaService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        try {
            Estudante estudante = estudanteDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado.");
                request.getRequestDispatcher("/view/estudante/notas.jsp").forward(request, response);
                return;
            }

            List<Map<String, Object>> notas = notaService.findByEstudanteComAvaliacao(estudante.getIdEstudante());

            Map<Integer, Map<String, Object>> disciplinasMap = new LinkedHashMap<>();
            for (Map<String, Object> n : notas) {
                int idDisciplina = (int) n.get("idDisciplina");
                String nomeDisciplina = (String) n.get("nomeDisciplina");
                String codigoDisciplina = (String) n.get("codigoDisciplina");

                Map<String, Object> disc = disciplinasMap.get(idDisciplina);
                if (disc == null) {
                    disc = new HashMap<>();
                    disc.put("idDisciplina", idDisciplina);
                    disc.put("nomeDisciplina", nomeDisciplina);
                    disc.put("codigoDisciplina", codigoDisciplina);
                    disc.put("avaliacoes", new ArrayList<Map<String, Object>>());
                    disciplinasMap.put(idDisciplina, disc);
                }
                List<Map<String, Object>> avaliacoes = getAvaliacoes(disc);
                avaliacoes.add(n);
            }

            request.setAttribute("estudante", estudante);
            request.setAttribute("disciplinas", new ArrayList<>(disciplinasMap.values()));
            request.getRequestDispatcher("/view/estudante/notas.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar notas: " + e.getMessage());
            request.getRequestDispatcher("/view/estudante/notas.jsp").forward(request, response);
        }
    }

    private List<Map<String, Object>> getAvaliacoes(Map<String, Object> disciplina) {
        Object avaliacoes = disciplina.get("avaliacoes");
        if (avaliacoes instanceof List<?>) {
            List<?> lista = (List<?>) avaliacoes;
            List<Map<String, Object>> resultado = new ArrayList<>();
            for (Object item : lista) {
                if (item instanceof Map<?, ?>) {
                    Map<?, ?> mapa = (Map<?, ?>) item;
                    Map<String, Object> convertido = new HashMap<>();
                    for (Map.Entry<?, ?> entry : mapa.entrySet()) {
                        if (entry.getKey() instanceof String) {
                            convertido.put((String) entry.getKey(), entry.getValue());
                        }
                    }
                    resultado.add(convertido);
                }
            }
            disciplina.put("avaliacoes", resultado);
            return resultado;
        }

        List<Map<String, Object>> resultado = new ArrayList<>();
        disciplina.put("avaliacoes", resultado);
        return resultado;
    }
}
