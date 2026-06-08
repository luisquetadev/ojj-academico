package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class PagamentoServicosServlet extends AbstractPageServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "Pagamento de Servicos", "Tesouraria", "Registo de pagamentos de declaracoes, cartoes e outros servicos academicos.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Pagamento de Servicos", "Tesouraria", "Pagamento de servico registado.");
    }
}
