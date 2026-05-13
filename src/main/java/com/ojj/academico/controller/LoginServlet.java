package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import com.ojj.academico.dao.UsuarioDAO;
import com.ojj.academico.model.Usuario;

public class LoginServlet extends HttpServlet {
    
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String senha = request.getParameter("password");
        
        try {
            Usuario usuario = usuarioDAO.buscarPorUsername(username);
            
          if (usuario != null && senha.equals("admin123") || senha.equals("estudante123") || senha.equals("funcionario123")) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                
                if ("Estudante".equals(usuario.getTipoPerfil())) {
                    response.sendRedirect("view/estudante/dashboard_estudante.jsp");
                } else {
                    response.sendRedirect("view/funcionario/dashboard_funcionario.jsp");
                }
            } else {
                request.setAttribute("erro", "Usuário ou senha inválidos");
                request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro no sistema. Tente novamente.");
            request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("view/auth/login.jsp");
    }
}