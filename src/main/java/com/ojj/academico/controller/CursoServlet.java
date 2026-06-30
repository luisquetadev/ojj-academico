package com.ojj.academico.controller;

import com.ojj.academico.service.CursoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsavel pela listagem e gestao de cursos.
 * Rota: /admin/curso
 * Metodos: doGet (lista todos os cursos)
 * Acesso: Admin
 * Atribui e encaminha para: /view/admin/academico/catalogo.jsp com cursos e entityType
 */
public class CursoServlet extends AbstractPageServlet {

    private final CursoService cursoService = new CursoService();

    /**
     * Lista todos os cursos registados no sistema.
     * Atributos: cursos (List<Curso>), entityType ("curso").
     * Redireciona para o catalogo de cursos.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("cursos", cursoService.findAll());
            request.setAttribute("entityType", "curso");
            request.getRequestDispatcher("/view/admin/academico/catalogo.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar cursos: " + e.getMessage());
        }
    }
}
