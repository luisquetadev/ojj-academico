package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsavel pela confirmacao de matricula e emissao de comprovativos.
 * Rota: /secretario/confirmacao-matricula
 * Metodos: doGet (exibe formulario de consulta), doPost (processa a confirmacao)
 * Acesso: Secretaria
 * Encaminha para: /view/shared/module.jsp via AbstractPageServlet
 */
public class ConfirmacaoMatriculaServlet extends AbstractPageServlet {
    /**
     * Apresenta o formulario de consulta e emissao de comprovativo de matricula.
     * Atributos: pageTitle, moduleName, pageDescription.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Confirmacao de Matricula", "Secretaria", "Consulta e emissao de comprovativo de matricula.");
    }

    /**
     * Processa a geracao da confirmacao de matricula para o estudante informado.
     * Atribui mensagem de confirmacao e redireciona para a pagina modular.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Confirmacao de Matricula", "Secretaria", "Confirmacao gerada para o estudante informado.");
    }
}
