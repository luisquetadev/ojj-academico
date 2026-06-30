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
 * Servlet responsavel pela visualizacao das notas e avaliacoes do estudante logado.
 * Rota: /estudante/notas
 * Metodos: doGet (exibe notas agrupadas por disciplina)
 * Acesso: Estudante (autenticado por sessao)
 * Encaminha para: /view/estudante/notas.jsp
 */
public class EstudanteNotasServlet extends HttpServlet {

    private final NotaService notaService = new NotaService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final DisciplinaService disciplinaService = new DisciplinaService();

    /**
     * Carrega todas as notas do estudante autenticado e agrupa por disciplina.
     * Atributos: estudante, disciplinas (List<Map> com nome, codigo e avaliacoes).
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

            // Agrupa as notas por disciplina para facilitar a exibicao no JSP
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
                @SuppressWarnings("unchecked")
                List<Map<String, Object>> avaliacoes = (List<Map<String, Object>>) disc.get("avaliacoes");
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
}
