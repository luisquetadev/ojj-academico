<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card animate-slide-up">
            <div class="login-logo">
                <div class="logo-icon">
                    <i class="fas fa-university"></i>
                </div>
                <h1>OJJ Académico</h1>
                <p>Sistema de Gestão Académica</p>
            </div>

            <% if (request.getAttribute("erro") != null) { %>
                <div class="login-error">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= request.getAttribute("erro") %>
                </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="login-input-group">
                    <label><i class="fas fa-envelope me-2"></i>Email</label>
                    <div class="login-input-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="username" placeholder="Digite seu email" required>
                    </div>
                </div>

                <div class="login-input-group">
                    <label><i class="fas fa-lock me-2"></i>Senha</label>
                    <div class="login-input-icon">
                        <i class="fas fa-key"></i>
                        <input type="password" name="password" placeholder="Digite sua senha" required>
                    </div>
                </div>

                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i> Entrar
                </button>
            </form>

            <div class="login-footer">
                &copy; 2026 OJJ Académico
            </div>
        </div>
    </div>
</body>
</html>
