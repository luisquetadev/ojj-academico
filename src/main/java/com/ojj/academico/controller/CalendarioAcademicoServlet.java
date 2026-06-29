package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pelo fluxo de CalendarioAcademico.
 * Rotas atendidas: /coordenador/calendario.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class CalendarioAcademicoServlet extends AbstractPageServlet {
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Calendario Academico", "Coordenacao", "Gestao de periodos letivos, avaliacoes e prazos administrativos.");
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Calendario Academico", "Coordenacao", "Evento academico registado.");
    }
}
