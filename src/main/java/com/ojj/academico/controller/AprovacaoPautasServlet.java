package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pelo fluxo de AprovacaoPautas.
 * Rotas atendidas: /coordenador/aprovacao-pautas.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class AprovacaoPautasServlet extends AbstractPageServlet {
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Aprovacao de Pautas", "Coordenacao", "Validacao das pautas enviadas pelos professores.");
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Aprovacao de Pautas", "Coordenacao", "Decisao registada para a pauta selecionada.");
    }
}
