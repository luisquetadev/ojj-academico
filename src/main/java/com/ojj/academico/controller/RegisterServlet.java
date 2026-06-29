package com.ojj.academico.controller;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
import com.ojj.academico.utils.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * Servlet responsavel pelo fluxo de Register.
 * Rotas atendidas: /register.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class RegisterServlet extends HttpServlet {

    private final UtilizadorService utilizadorService = new UtilizadorService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
}
