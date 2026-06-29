<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Professor" %>
<%@ page import="com.ojj.academico.model.Disciplina" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Professor x Disciplina</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .pd-card { border-radius: 12px; padding: 20px; background: rgba(255,255,255,0.95); box-shadow: 0 8px 24px rgba(0,0,0,0.08); margin-bottom: 20px; }
        .professor-header { background: #1e3a5f; color: white; padding: 12px 16px; border-radius: 8px 8px 0 0; font-weight: 700; }
        .disciplina-badge { display: inline-block; padding: 4px 12px; margin: 3px; background: #ebf4ff; color: #2b6cb0; border-radius: 20px; font-size: 0.85rem; }
        .disciplina-badge .remove-btn { margin-left: 6px; color: #c53030; cursor: pointer; text-decoration: none; font-weight: 700; }
        .disciplina-badge .remove-btn:hover { color: #9b2c2c; }
        select.form-control-custom { max-width: 300px; }
        @media print { .navbar, .no-print { display: none !important; } }
    </style>
</head>
<body>
<%
    List<Professor> professores = (List<Professor>) request.getAttribute("professores");
    List<Disciplina> disciplinas = (List<Disciplina>) request.getAttribute("disciplinas");
    Map<Integer, List<Integer>> disciplinasPorProfessor = (Map<Integer, List<Integer>>) request.getAttribute("disciplinasPorProfessor");
    Map<Integer, String> nomesProfessores = (Map<Integer, String>) request.getAttribute("nomesProfessores");
%>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-university"></i> OJJ Académico</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-arrow-left"></i> Voltar</a>
            </div>
        </div>
    </nav>
    <div class="container my-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-white"><i class="fas fa-chalkboard-teacher"></i> Professor x Disciplina</h2>
                <p class="text-white-50">Associe disciplinas aos professores. Cada professor pode leccionar várias disciplinas.</p>
            </div>
        </div>

        <% 
        String erro = (String) request.getAttribute("erro");
        if (erro != null) { %>
            <div class="alert alert-danger"><%= erro %></div>
        <% } %>

        <% if (professores != null) {
            for (Professor p : professores) {
                List<Integer> ids = disciplinasPorProfessor != null ? disciplinasPorProfessor.get(p.getIdProfessor()) : null;
                Set<Integer> disciplinasSet = ids != null ? new java.util.HashSet<>(ids) : new java.util.HashSet<>();
        %>
        <div class="pd-card">
            <div class="professor-header">
                <i class="fas fa-user-tie"></i> <%= nomesProfessores != null ? nomesProfessores.get(p.getIdProfessor()) : "Professor #" + p.getIdProfessor() %>
                <span class="badge bg-light text-dark ms-2"><%= disciplinasSet.size() %> disciplina(s)</span>
            </div>
            <div class="p-3">
                <div class="mb-3">
                    <% if (!disciplinasSet.isEmpty()) {
                        for (Integer idDisc : disciplinasSet) {
                            String nomeDisc = "";
                            for (Disciplina d : disciplinas) {
                                if (d.getIdDisciplina() == idDisc) { nomeDisc = d.getNomeDisciplina(); break; }
                            }
                    %>
                        <span class="disciplina-badge">
                            <%= nomeDisc.isEmpty() ? "ID " + idDisc : nomeDisc %>
                            <form method="post" action="<%= request.getContextPath() %>/admin/professor-disciplina" style="display:inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="idProfessor" value="<%= p.getIdProfessor() %>">
                                <input type="hidden" name="idDisciplina" value="<%= idDisc %>">
                                <button type="submit" class="remove-btn" style="background:none;border:none;padding:0;">&times;</button>
                            </form>
                        </span>
                    <% }
                    } else { %>
                        <span class="text-muted">Nenhuma disciplina associada.</span>
                    <% } %>
                </div>
                <form method="post" action="<%= request.getContextPath() %>/admin/professor-disciplina" class="row g-2 no-print">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="idProfessor" value="<%= p.getIdProfessor() %>">
                    <div class="col-auto">
                        <select name="idDisciplina" class="form-select form-control-custom" required>
                            <option value="">Seleccionar disciplina...</option>
                            <% for (Disciplina d : disciplinas) { %>
                                <option value="<%= d.getIdDisciplina() %>" <%= disciplinasSet.contains(d.getIdDisciplina()) ? "disabled" : "" %>>
                                    <%= d.getCodigoDisciplina() != null ? d.getCodigoDisciplina() + " - " : "" %><%= d.getNomeDisciplina() %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Adicionar</button>
                    </div>
                </form>
            </div>
        </div>
        <% }
        } else { %>
            <div class="alert alert-info">Nenhum professor encontrado.</div>
        <% } %>
    </div>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
