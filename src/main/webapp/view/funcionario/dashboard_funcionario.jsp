<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Usuario" %>
<%@ page import="com.ojj.academico.service.EstudanteService" %>
<%@ page import="com.ojj.academico.service.FuncionarioService" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    EstudanteService service = new EstudanteService();
    FuncionarioService funcionarioService = new FuncionarioService();
    if (usuario == null || !"Funcionario".equals(usuario.getTipoPerfil())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Funcionario - OJJ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/dashboard.css">
    <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2>OJJ Academico</h2>
        </div>
        <div class="user-info">
            <span>Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="stats">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3><%= service.contarEstudantes() %></h3>
                <p>Total de Estudantes</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-chalkboard-user"></i>
                <h3><%= funcionarioService.contarFuncionarios() %></h3>
                <p>Total de Funcionarios</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-headset"></i>
                <h3>10</h3>
                <p>Atendimentos Hoje</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>0</h3>
                <p>Concluidos</p>
            </div>
        </div>
        
        <h3 class="menu-title">Modulos do Sistema</h3>
        <div class="menu-grid">
            <a href="#" class="menu-card">
                <i class="fas fa-user-graduate"></i>
                <h4>Gestao de Estudantes</h4>
                <p>Cadastrar, editar e listar</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-user-tie"></i>
                <h4>Gestao de Funcionarios</h4>
                <p>Gerenciar funcionarios</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-calendar-alt"></i>
                <h4>Registro de Atendimentos</h4>
                <p>Registrar novos atendimentos</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-history"></i>
                <h4>Historico</h4>
                <p>Consultar historico</p>
            </a>
        </div>
    </div>
</body>
</html>