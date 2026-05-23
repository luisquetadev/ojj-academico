package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MatriculaEstudanteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idEstudanteStr = request.getParameter("idEstudante");
            String idCursoStr = request.getParameter("idCurso");
            String idTurmaStr = request.getParameter("idTurma");
            String idAnoAcademicoStr = request.getParameter("idAnoAcademico");
            String idSemestreStr = request.getParameter("idSemestre");

            if (idEstudanteStr == null || idCursoStr == null || idTurmaStr == null) {
                request.setAttribute("erro", "Estudante, Curso e Turma são obrigatórios");
                request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);
                return;
            }

            // Implementação simplificada - em produção, usar o service completo
            request.setAttribute("mensagem", "Funcionalidade de matrícula em desenvolvimento");
            request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao processar matrícula: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);
        }
    }
}
