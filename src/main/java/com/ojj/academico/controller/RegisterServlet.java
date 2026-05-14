package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Usuario;
import com.ojj.academico.service.UsuarioService;

public class RegisterServlet extends HttpServlet {

    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/" + AppConfig.REGISTER_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String tipoPerfil = request.getParameter("tipoPerfil");
        String idRefString = request.getParameter("idRef");
        int idRef = 0;

        if (idRefString != null && !idRefString.isBlank()) {
            try {
                idRef = Integer.parseInt(idRefString);
            } catch (NumberFormatException e) {
                idRef = 0;
            }
        }

        Usuario usuario = new Usuario();
        usuario.setUsername(username);
        usuario.setSenhaHash(password);
        usuario.setTipoPerfil(tipoPerfil);
        usuario.setIdRef(idRef);

        try {
            boolean sucesso = usuarioService.registrar(usuario);
            if (sucesso) {
                request.setAttribute("mensagem", "Cadastro efetuado com sucesso. Faça login.");
                request.getRequestDispatcher("/" + AppConfig.LOGIN_PAGE).forward(request, response);
                return;
            }
            request.setAttribute("erro", "Não foi possível concluir o cadastro.");
        } catch (ValidationException e) {
            request.setAttribute("erro", e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro no sistema. Tente novamente.");
        }

        request.getRequestDispatcher("/" + AppConfig.REGISTER_PAGE).forward(request, response);
    }
}
