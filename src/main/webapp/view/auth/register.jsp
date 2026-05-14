<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Acadêmico • Cadastro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/register.css">
</head>
<body>
    <div class="card">
        <h1>Cadastro de Usuário</h1>
        <% if(request.getAttribute("erro") != null) { %>
            <div class="message error"><%= request.getAttribute("erro") %></div>
        <% } else if(request.getAttribute("mensagem") != null) { %>
            <div class="message success"><%= request.getAttribute("mensagem") %></div>
        <% } %>
        <form action="<%= request.getContextPath() %>/register" method="post">
            <div class="input-group">
                <label for="username">Usuário</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Senha</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <label for="tipoPerfil">Perfil</label>
                <select id="tipoPerfil" name="tipoPerfil" required>
                    <option value="">Selecione</option>
                    <option value="Estudante">Estudante</option>
                    <option value="Funcionario">Funcionário</option>
                    <option value="Administrador">Administrador</option>
                </select>
            </div>
            <div class="input-group">
                <label for="idRef">Referência (id)</label>
                <input type="number" id="idRef" name="idRef" min="0" value="0">
            </div>
            <button class="btn" type="submit">Cadastrar</button>
        </form>
        <a class="link" href="<%= request.getContextPath() %>/login">Já tem conta? Faça login</a>
    </div>
</body>
</html>
