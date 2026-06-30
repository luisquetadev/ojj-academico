package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pela gestao do calendario academico.
 * Rota: /coordenador/calendario
 * Metodos: doGet (exibe o calendario), doPost (registra novo evento academico)
 * Acesso: Coordenador
 * Encaminha para: /view/shared/module.jsp via AbstractPageServlet
 */
public class CalendarioAcademicoServlet extends AbstractPageServlet {
    /**
     * Apresenta a pagina de gestao do calendario academico.
     * Atributos: pageTitle, moduleName, pageDescription.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Calendario Academico", "Coordenacao", "Gestao de periodos letivos, avaliacoes e prazos administrativos.");
    }

    /**
     * Processa o registo de um novo evento academico (periodo letivo, avaliacao, prazo).
     * Atribui mensagem de confirmacao e redireciona para a pagina modular.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Calendario Academico", "Coordenacao", "Evento academico registado.");
    }
}
