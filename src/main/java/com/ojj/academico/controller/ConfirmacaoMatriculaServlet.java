package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ConfirmacaoMatriculaServlet extends AbstractPageServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Confirmacao de Matricula", "Secretaria", "Consulta e emissao de comprovativo de matricula.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Confirmacao de Matricula", "Secretaria", "Confirmacao gerada para o estudante informado.");
    }
}
