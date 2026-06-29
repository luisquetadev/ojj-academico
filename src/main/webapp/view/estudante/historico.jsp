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
    <title>OJJ Académico • Histórico Académico</title>
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
        .badge-mac { background: #2196F3; }
        .badge-npp { background: #9C27B0; }
        .badge-exame { background: #FF9800; }
        .badge-recurso { background: #f44336; }
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
                <i class="fas fa-history"></i> Histórico Académico
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
            List<Map<String, Object>> historicoInfo = (List<Map<String, Object>>) request.getAttribute("historicoInfo");
            if (historicoInfo != null && !historicoInfo.isEmpty()) {
        %>
        <div class="card-custom mb-4">
            <h4 style="color: var(--primary-color);">
                <i class="fas fa-id-card"></i> Matrículas Realizadas
            </h4>
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Ano Académico</th>
                            <th>Semestre</th>
                            <th>Curso</th>
                            <th>Turma</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Map<String, Object> info : historicoInfo) {
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
            <h4 style="color: var(--primary-color);">Nenhum registo encontrado</h4>
            <p>Não existem registos de matrícula para o seu perfil.</p>
        </div>
        <% } %>

        <%
            List<Map<String, Object>> notas = (List<Map<String, Object>>) request.getAttribute("notas");
            if (notas != null && !notas.isEmpty()) {
        %>
        <div class="card-custom">
            <h4 style="color: var(--primary-color);">
                <i class="fas fa-chart-line"></i> Desempenho Académico por Disciplina
            </h4>
            <%
                Map<Integer, Map<String, Object>> disciplinasMap = new java.util.LinkedHashMap<>();
                for (Map<String, Object> n : notas) {
                    int idDisciplina = (int) n.get("idDisciplina");
                    String nomeDisciplina = (String) n.get("nomeDisciplina");
                    Map<String, Object> disc = disciplinasMap.get(idDisciplina);
                    if (disc == null) {
                        disc = new java.util.HashMap<>();
                        disc.put("idDisciplina", idDisciplina);
                        disc.put("nomeDisciplina", nomeDisciplina);
                        disc.put("avaliacoes", new java.util.ArrayList<Map<String, Object> >());
                        disciplinasMap.put(idDisciplina, disc);
                    }
                    ((List<Map<String, Object>>) disc.get("avaliacoes")).add(n);
                }
            %>
            <%
                for (Map<String, Object> disc : disciplinasMap.values()) {
                    String nomeDisc = (String) disc.get("nomeDisciplina");
                    List<Map<String, Object>> avaliacoes = (List<Map<String, Object>>) disc.get("avaliacoes");
            %>
            <div class="table-responsive mt-3">
                <h6 style="color: var(--primary-color);"><i class="fas fa-book"></i> <%= nomeDisc %></h6>
                <table class="table table-custom table-sm">
                    <thead>
                        <tr>
                            <th>Tipo</th>
                            <th>Descrição</th>
                            <th>Nota</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double soma = 0;
                            int count = 0;
                            for (Map<String, Object> a : avaliacoes) {
                                String tipo = (String) a.get("tipo");
                                String desc = (String) a.get("avaliacaoDescricao");
                                java.math.BigDecimal nota = (java.math.BigDecimal) a.get("nota");
                                if (nota != null) { soma += nota.doubleValue(); count++; }
                                String badgeClass = "badge badge-custom";
                                if ("MAC".equals(tipo)) badgeClass += " badge-mac";
                                else if ("NPP".equals(tipo)) badgeClass += " badge-npp";
                                else if ("EXAME".equals(tipo)) badgeClass += " badge-exame";
                                else if ("RECURSO".equals(tipo)) badgeClass += " badge-recurso";
                                else badgeClass += " badge-secondary";
                        %>
                        <tr>
                            <td><span class="<%= badgeClass %>"><%= tipo %></span></td>
                            <td><%= desc != null ? desc : "-" %></td>
                            <td style="font-weight: 700;"><%= nota != null ? nota : "<span style='color:#999;'>-</span>" %></td>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr style="background: #e8f5e9; font-weight: 700;">
                            <td colspan="2" class="text-end">Média</td>
                            <td><%= count > 0 ? String.format("%.2f", soma / count) : "-" %></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <% } %>
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
