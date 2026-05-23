package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class TrancamentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/trancamento/form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idMatriculaStr = request.getParameter("idMatricula");
            String motivo = request.getParameter("motivo");

            if (idMatriculaStr == null || idMatriculaStr.isEmpty()) {
                request.setAttribute("erro", "Matrícula é obrigatória");
                request.getRequestDispatcher("/view/secretaria/trancamento/form.jsp").forward(request, response);
                return;
            }

            // Implementação simplificada - em produção, usar o service completo
            request.setAttribute("mensagem", "Funcionalidade de trancamento em desenvolvimento");
            request.getRequestDispatcher("/view/secretaria/trancamento/form.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao processar trancamento: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/trancamento/form.jsp").forward(request, response);
        }
    }
}
