package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pelo fluxo de Trancamento.
 * Rotas atendidas: /secretario/trancamento. Encaminha para: /view/secretaria/trancamento/form.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class TrancamentoServlet extends HttpServlet {
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/trancamento/form.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

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
