package com.ojj.academico.controller;

import com.ojj.academico.service.DisciplinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pela listagem e gestao de disciplinas.
 * Rota: /admin/disciplina
 * Metodos: doGet (lista todas as disciplinas)
 * Acesso: Admin
 * Atribui e encaminha para: /view/admin/academico/catalogo.jsp com disciplinas e entityType
 */
public class DisciplinaServlet extends AbstractPageServlet {

    private final DisciplinaService disciplinaService = new DisciplinaService();

    /**
     * Lista todas as disciplinas registadas no sistema.
     * Atributos: disciplinas (List<Disciplina>), entityType ("disciplina").
     * Redireciona para o catalogo de disciplinas.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("disciplinas", disciplinaService.findAll());
            request.setAttribute("entityType", "disciplina");
            request.getRequestDispatcher("/view/admin/academico/catalogo.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar disciplinas: " + e.getMessage());
        }
    }
}
