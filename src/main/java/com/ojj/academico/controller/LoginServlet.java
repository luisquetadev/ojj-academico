package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dto.LoginDTO;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;

public class LoginServlet extends HttpServlet {
    private final UtilizadorService utilizadorService;

    public LoginServlet() {
        this.utilizadorService = new UtilizadorService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            LoginDTO loginDTO = new LoginDTO(email, password);
            Utilizador utilizador = utilizadorService.login(loginDTO.getEmail(), loginDTO.getPassword());

            if (utilizador != null) {
                HttpSession session = request.getSession();
                session.setAttribute(AppConfig.SESSION_USER_ATTRIBUTE, utilizador);
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                request.setAttribute("error", "Credenciais inválidas.");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Ocorreu um erro durante o login.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
}



}
