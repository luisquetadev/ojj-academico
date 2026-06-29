package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet responsavel pelo fluxo de RelatorioEstudantes.
 * Rotas atendidas: /relatorios/estudantes. Encaminha para: /view/relatorios/estudantes/lista.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class RelatorioEstudantesServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(RelatorioEstudantesServlet.class);

    private final EstudanteService estudanteService = new EstudanteService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Estudante> estudantes = estudanteService.findAll();
            request.setAttribute("estudantes", estudantes);
            request.getRequestDispatcher("/view/relatorios/estudantes/lista.jsp").forward(request, response);
        } catch (SQLException e) {
            log.error("Erro ao gerar relatorio de estudantes", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao gerar relatório: " + e.getMessage());
        }
    }
}
