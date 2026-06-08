package com.ojj.academico.controller;

import com.ojj.academico.service.PropinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class PropinaServlet extends AbstractPageServlet {

    private final PropinaService propinaService = new PropinaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("propinas", propinaService.findAll());
        } catch (SQLException e) {
            request.setAttribute("erro", "Nao foi possivel carregar propinas: " + e.getMessage());
        }
        forward(request, response, "Pagamento de Propina", "Tesouraria", "Registo e acompanhamento de propinas mensais.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        confirmAndForward(request, response, "Pagamento de Propina", "Tesouraria", "Pagamento submetido para processamento.");
    }
}
