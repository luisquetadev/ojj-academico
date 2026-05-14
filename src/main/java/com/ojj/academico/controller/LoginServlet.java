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
import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Usuario;
import com.ojj.academico.service.UsuarioService;

public class LoginServlet extends HttpServlet {

    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String senha = request.getParameter("password");
        LoginDTO loginDTO = new LoginDTO(username, senha);

        try {
            Usuario usuario = usuarioService.autenticar(loginDTO);
            HttpSession session = request.getSession();
            session.setAttribute(AppConfig.SESSION_USER_ATTRIBUTE, usuario);

            if (AppConfig.ROLE_ESTUDANTE.equals(usuario.getTipoPerfil())) {
                response.sendRedirect(request.getContextPath() + "/" + AppConfig.STUDENT_DASHBOARD);
            } else {
                response.sendRedirect(request.getContextPath() + "/" + AppConfig.STAFF_DASHBOARD);
            }
        } catch (ValidationException e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("/" + AppConfig.LOGIN_PAGE).forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro no sistema. Tente novamente.");
            request.getRequestDispatcher("/" + AppConfig.LOGIN_PAGE).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/" + AppConfig.LOGIN_PAGE);
    }
}