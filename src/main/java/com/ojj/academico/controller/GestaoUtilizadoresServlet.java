package com.ojj.academico.controller;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
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
 * Servlet responsavel pelo fluxo de GestaoUtilizadores.
 * Rotas atendidas: /sistema/utilizadores. Encaminha para: /view/sistema/utilizadores/lista.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class GestaoUtilizadoresServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(GestaoUtilizadoresServlet.class);

    private final UtilizadorService utilizadorService = new UtilizadorService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Utilizador> utilizadores = utilizadorService.findAll();
            request.setAttribute("utilizadores", utilizadores);
            request.getRequestDispatcher("/view/sistema/utilizadores/lista.jsp").forward(request, response);
        } catch (SQLException e) {
            log.error("Erro ao listar utilizadores", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao listar utilizadores: " + e.getMessage());
        }
    }
}
