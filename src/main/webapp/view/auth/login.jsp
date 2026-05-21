<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Acadêmico • Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css">
</head>
<body>
    <div class="login-card">
        <div class="logo">
            <h1> OJJ Acadêmico</h1>
            <p>Sistema de Gestão Acadêmica</p>
        </div>
        
        <div style="text-align: center; margin-bottom: 25px;">
            <span style="background: #f0ecff; padding: 5px 15px; border-radius: 20px; font-size: 12px; color: #4a3580;">ACESSO AO SISTEMA</span>
        </div>
        
        <% if(request.getAttribute("erro") != null) { %>
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>
        
        <form action="<%= request.getContextPath() %>/login" method="post">
            <div class="input-group">
                <label><i class="fas fa-user"></i> USUÁRIO</label>
                <div class="input-icon">
                    <i class="fas fa-envelope"></i>
                    <input type="text" name="username" placeholder="Digite seu usuário" required>
                </div>
            </div>
            
            <div class="input-group">
                <label><i class="fas fa-lock"></i> SENHA</label>
                <div class="input-icon">
                    <i class="fas fa-key"></i>
                    <input type="password" name="password" placeholder="Digite sua senha" required>
                </div>
            </div>
            
            <button type="submit" class="btn-login">
                <i class="fas fa-sign-in-alt"></i> ENTRAR
            </button>
        </form>
        <div style="text-align: center; margin-top: 18px;">
            <a href="<%= request.getContextPath() %>/register" style="color: #4a3580; text-decoration: none; font-size: 14px;">Não tem conta? Cadastre-se</a>
        </div>
        
        <div class="footer">
            <p>© 2026 Universidade OJJ — Todos os direitos reservados</p>
            <p style="margin-top: 5px;">Desenvolvido com para excelência académica</p>
        </div>
    </div>
</body>
</html>