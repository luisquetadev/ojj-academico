<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, com.ojj.academico.model.*" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Minhas Turmas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/professor/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/professor/turmas">
                            <i class="fas fa-chalkboard-teacher"></i> Minhas Turmas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/lancar-notas">
                            <i class="fas fa-edit"></i> Lançar Notas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/pautas">
                            <i class="fas fa-list-alt"></i> Gestão Pautas
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                            <i class="fas fa-sign-out-alt"></i> Sair
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card-custom mb-4">
            <h3 class="mb-0" style="color: var(--primary-color);">
                <i class="fas fa-chalkboard-teacher"></i> Minhas Turmas
            </h3>
        </div>

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger alert-custom">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <%
            List<Map<String, Object>> turmasInfo = (List<Map<String, Object>>) request.getAttribute("turmasInfo");
            if (turmasInfo != null && !turmasInfo.isEmpty()) {
        %>
        <div class="card-custom">
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Curso</th>
                            <th>Turno</th>
                            <th>Ano Curricular</th>
                            <th>Capacidade</th>
                            <th style="width: 200px;">Acções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Map<String, Object> info : turmasInfo) {
                                Turma t = (Turma) info.get("turma");
                                String nomeCurso = (String) info.get("nomeCurso");
                        %>
                        <tr>
                            <td><strong><%= t.getCodigoTurma() %></strong></td>
                            <td><%= nomeCurso %></td>
                            <td><%= t.getTurno() %></td>
                            <td><%= t.getAnoCurricular() %>º Ano</td>
                            <td><%= t.getCapacidadeMaxima() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/professor/lancar-notas?idTurma=<%= t.getIdTurma() %>" class="btn btn-primary-custom btn-sm">
                                    <i class="fas fa-edit"></i> Notas
                                </a>
                                <a href="<%= request.getContextPath() %>/professor/pautas?idTurma=<%= t.getIdTurma() %>" class="btn btn-secondary-custom btn-sm">
                                    <i class="fas fa-list-alt"></i> Pauta
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <% } else { %>
        <div class="card-custom text-center">
            <i class="fas fa-info-circle" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
            <h4 style="color: var(--primary-color);">Nenhuma turma encontrada</h4>
            <p>Não existem turmas registadas no sistema.</p>
        </div>
        <% } %>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
