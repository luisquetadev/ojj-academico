package com.ojj.academico.controller;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
import com.ojj.academico.utils.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class RegisterServlet extends HttpServlet {

    private final UtilizadorService utilizadorService = new UtilizadorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String tipoPerfil = request.getParameter("tipoPerfil");
        String idRefStr = request.getParameter("idRef");

        try {
            // Verificar se o email já existe
            Utilizador existente = utilizadorService.findByEmail(username);
            if (existente != null) {
                request.setAttribute("erro", "Email já cadastrado no sistema");
                request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
                return;
            }

            // Mapear tipo de perfil para ID do banco
            int idPerfil = mapPerfilToId(tipoPerfil);
            if (idPerfil == 0) {
                request.setAttribute("erro", "Perfil inválido");
                request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
                return;
            }

            // Criar novo utilizador
            Utilizador novoUtilizador = new Utilizador();
            novoUtilizador.setIdPerfil(idPerfil);
            novoUtilizador.setEmail(username);
            novoUtilizador.setPasswordHash(PasswordUtils.hashPassword(password)); // Criptografar senha com BCrypt
            novoUtilizador.setStatus("ATIVO");
            novoUtilizador.setTentativasLogin(0);
            novoUtilizador.setDataCriacao(LocalDateTime.now());
            novoUtilizador.setDataUltimoAcesso(null);

            boolean salvo = utilizadorService.save(novoUtilizador);

            if (salvo) {
                request.setAttribute("mensagem", "Usuário cadastrado com sucesso! Faça login para continuar.");
                request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
            } else {
                request.setAttribute("erro", "Erro ao cadastrar usuário");
                request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao processar cadastro: " + e.getMessage());
            request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
        }
    }

    private int mapPerfilToId(String tipoPerfil) {
        if (tipoPerfil == null) return 0;
        
        switch (tipoPerfil) {
            case "Administrador":
                return 1; // ADMIN
            case "Secretaria":
                return 2; // SECRETARIA
            case "Tesouraria":
                return 3; // TESOURARIA
            case "Docente":
            case "Professor":
                return 4; // DOCENTE
            case "Coordenador":
                return 5; // COORDENADOR
            case "Director":
                return 6; // DIRECTOR
            case "Estudante":
                return 7; // ESTUDANTE
            default:
                return 0;
        }
    }
}
