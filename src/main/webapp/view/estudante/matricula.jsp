<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, com.ojj.academico.model.*, com.ojj.academico.conf.AppConfig" %>
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
    <title>OJJ Académico • Matrícula</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .topbar { background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid rgba(0, 0, 0, 0.1); box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1); }
        .topbar .logo h2 { color: var(--primary-color); font-size: 1.5rem; margin: 0; }
        .user-info { display: flex; align-items: center; gap: 20px; }
        .user-info span { color: var(--primary-color); font-weight: 600; }
        .logout-btn { padding: 8px 20px; background: var(--accent-color); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s ease; }
        .logout-btn:hover { background: var(--secondary-color); transform: translateY(-2px); }
        .container { max-width: 1000px; margin: 0 auto; padding: 40px 20px; }
        .status-CONFIRMADA { color: #2e7d32; }
        .status-PENDENTE { color: #f57f17; }
        .status-CANCELADA { color: #c62828; }
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2><i class="fas fa-university"></i> OJJ Académico</h2>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user"></i> <%= utilizador.getEmail() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>

    <div class="container">
        <div class="card-custom mb-4">
            <h3 class="mb-0" style="color: var(--primary-color);">
                <i class="fas fa-id-card"></i> Matrícula
            </h3>
        </div>

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger alert-custom">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <%
            Estudante estudante = (Estudante) request.getAttribute("estudante");
            if (estudante != null) {
        %>
        <div class="card-custom mb-4">
            <p style="margin:0; color: var(--dark-color);">
                <strong><i class="fas fa-user-graduate"></i> <%= estudante.getNomeCompleto() %></strong>
                &nbsp;|&nbsp; <span class="badge badge-custom badge-success"><%= estudante.getNumeroEstudante() %></span>
            </p>
        </div>
        <% } %>

        <%
            List<Map<String, Object>> matriculasInfo = (List<Map<String, Object>>) request.getAttribute("matriculasInfo");
            if (matriculasInfo != null && !matriculasInfo.isEmpty()) {
        %>
        <div class="card-custom">
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Ano Académico</th>
                            <th>Semestre</th>
                            <th>Curso</th>
                            <th>Turma</th>
                            <th>Data Matrícula</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Map<String, Object> info : matriculasInfo) {
                                Matricula m = (Matricula) info.get("matricula");
                                String nomeCurso = (String) info.get("nomeCurso");
                                String codigoTurma = (String) info.get("codigoTurma");
                                String descricaoAno = (String) info.get("descricaoAno");
                                String nomeSemestre = (String) info.get("nomeSemestre");
                                String status = m.getStatus() != null ? m.getStatus() : "---";
                        %>
                        <tr>
                            <td><%= descricaoAno %></td>
                            <td><%= nomeSemestre %></td>
                            <td><%= nomeCurso %></td>
                            <td><strong><%= codigoTurma %></strong></td>
                            <td><%= m.getDataMatricula() != null ? m.getDataMatricula().toLocalDate().toString() : "-" %></td>
                            <td><span class="badge badge-custom badge-<%= "CONFIRMADA".equals(status) ? "success" : "PENDENTE".equals(status) ? "warning" : "secondary" %>"><%= status %></span></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <% } else if (estudante != null) { %>
        <div class="card-custom text-center">
            <i class="fas fa-info-circle" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
            <h4 style="color: var(--primary-color);">Nenhuma matrícula encontrada</h4>
            <p>Não existem registos de matrícula para o seu perfil.</p>
        </div>
        <% } %>

        <div class="text-center mt-3">
            <a href="<%= request.getContextPath() %>/estudante/dashboard" class="btn btn-primary-custom">
                <i class="fas fa-arrow-left"></i> Voltar ao Dashboard
            </a>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
