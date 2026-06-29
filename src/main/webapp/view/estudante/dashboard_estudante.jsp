<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="com.ojj.academico.conf.AppConfig" %>
<%
    Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
    if (utilizador == null || !utilizador.isEstudante()) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard • Estudante OJJ</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2><i class="fas fa-university"></i> OJJ Académico</h2>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user-circle"></i> <%= utilizador.getEmail() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>

    <div class="container" style="max-width:1200px; margin:0 auto; padding:40px 20px;">
        <div class="welcome-card">
            <h1><i class="fas fa-graduation-cap"></i> Olá, Estudante!</h1>
            <p>Acompanhe suas informações académicas e financeiras num só lugar.</p>
        </div>

        <div class="menu-grid">
            <a href="<%= request.getContextPath() %>/estudante/profile?id=${sessionScope.usuario.idUtilizador}" class="menu-card icon-primary">
                <i class="fas fa-user-circle"></i>
                <h3>Meus Dados</h3>
                <p>Consultar e atualizar informações pessoais</p>
            </a>
            <a href="<%= request.getContextPath() %>/estudante/matricula" class="menu-card icon-teal">
                <i class="fas fa-book"></i>
                <h3>Matrícula</h3>
                <p>Informações sobre sua matrícula e disciplinas</p>
            </a>
            <a href="<%= request.getContextPath() %>/estudante/notas" class="menu-card icon-success">
                <i class="fas fa-chart-line"></i>
                <h3>Notas e Pautas</h3>
                <p>Consultar suas notas e histórico académico</p>
            </a>
            <a href="<%= request.getContextPath() %>/estudante/propina" class="menu-card icon-warning">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Propinas</h3>
                <p>Estado das propinas e pagamentos</p>
            </a>
            <a href="<%= request.getContextPath() %>/estudante/historico" class="menu-card icon-purple">
                <i class="fas fa-history"></i>
                <h3>Histórico</h3>
                <p>Visualizar todo o histórico académico</p>
            </a>
            <a href="<%= request.getContextPath() %>/secretario/declaracao" class="menu-card icon-pink">
                <i class="fas fa-file-pdf"></i>
                <h3>Declaração</h3>
                <p>Solicitar declaração de matrícula</p>
            </a>
        </div>
    </div>
</body>
</html>
