<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Estudante".equals(usuario.getTipoPerfil())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard • Estudante OJJ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/dashboard.css">
    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2>🏛️ OJJ Acadêmico</h2>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user"></i> Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="welcome-card">
            <h1><i class="fas fa-graduation-cap"></i> Olá, Estudante!</h1>
            <p>Bem-vindo ao Sistema Acadêmico da Universidade OJJ. Aqui você pode acompanhar seus atendimentos e solicitações.</p>
        </div>
        
        <div class="menu-grid">
            <a href="#" class="menu-card">
                <i class="fas fa-user-circle"></i>
                <div>
                    <h3>Meus Dados</h3>
                    <p>Consultar e atualizar informações pessoais</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-headset"></i>
                <div>
                    <h3>Solicitar Atendimento</h3>
                    <p>Abrir novo atendimento ou solicitação</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-history"></i>
                <div>
                    <h3>Meu Histórico</h3>
                    <p>Visualizar todos os seus atendimentos</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-book"></i>
                <div>
                    <h3>Matrícula</h3>
                    <p>Informações sobre sua matrícula</p>
                </div>
            </a>
        </div>
    </div>
</body>
</html>