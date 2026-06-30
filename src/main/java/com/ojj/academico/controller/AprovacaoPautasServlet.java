package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pela aprovacao de pautas de avaliacao.
 * Rota: /coordenador/aprovacao-pautas
 * Metodos: doGet (exibe formulario de aprovacao), doPost (processa a decisao de aprovacao)
 * Acesso: Coordenador
 * Encaminha para: /view/shared/module.jsp via AbstractPageServlet
 */
public class AprovacaoPautasServlet extends AbstractPageServlet {
    /**
     * Apresenta o formulario de aprovacao de pautas ao coordenador.
     * Atributos: pageTitle, moduleName, pageDescription.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Aprovacao de Pautas", "Coordenacao", "Validacao das pautas enviadas pelos professores.");
    }

    /**
     * Processa a decisao do coordenador sobre uma pauta (aprovar/rejeitar).
     * Atribui mensagem de confirmacao e redireciona para a pagina modular.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Aprovacao de Pautas", "Coordenacao", "Decisao registada para a pauta selecionada.");
    }
}
