package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AprovacaoPautasServlet extends AbstractPageServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Aprovacao de Pautas", "Coordenacao", "Validacao das pautas enviadas pelos professores.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Aprovacao de Pautas", "Coordenacao", "Decisao registada para a pauta selecionada.");
    }
}
