package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ojj.academico.dao.PagamentoDAO;
import java.sql.SQLException;

public class TesourariaDashboardServlet extends HttpServlet {

    private final PagamentoDAO pagamentoDAO = new PagamentoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ... (previous checks)
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("receitaHoje", pagamentoDAO.calcularReceitaHoje());
            request.setAttribute("pagamentosPendentes", pagamentoDAO.contarPagamentosPendentes());
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar estatísticas: " + e.getMessage());
        }

        request.getRequestDispatcher("/view/tesouraria/dashboard.jsp").forward(request, response);
    }
}
