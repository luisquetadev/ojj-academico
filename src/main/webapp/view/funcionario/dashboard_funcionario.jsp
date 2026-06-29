<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="com.ojj.academico.conf.AppConfig" %>
<%
    Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
    if (utilizador == null || (utilizador.getIdPerfil() != 1 && utilizador.getIdPerfil() != 2)) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Funcionário • OJJ Académico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card-custom p-5 text-center">
            <h1><i class="fas fa-user-tie"></i> Olá, <%= utilizador.getEmail() %></h1>
            <p class="lead">Este é o painel geral de funcionários.</p>
            <hr>
            <div class="d-flex justify-content-center gap-3">
                <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-primary">Ir para Área da Secretaria</a>
                <a href="<%= request.getContextPath() %>/logout" class="btn btn-danger">Sair</a>
            </div>
        </div>
    </div>
</body>
</html>