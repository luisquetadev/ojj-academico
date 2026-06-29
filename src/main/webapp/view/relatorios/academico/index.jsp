<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Matricula" %>
<%@ page import="com.ojj.academico.model.Curso" %>
<%@ page import="com.ojj.academico.model.Estudante" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Relatório Académico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .report-card { border-radius: 16px; padding: 24px; background: rgba(255,255,255,0.95); box-shadow: 0 18px 40px rgba(0,0,0,0.08); }
        .summary-card { border-radius: 12px; padding: 20px; text-align: center; color: white; }
        .summary-card h3 { font-size: 2rem; margin: 0; }
        .summary-card p { margin: 0; opacity: 0.9; }
        .bg-alunos { background: linear-gradient(135deg, #2b6cb0, #4299e1); }
        .bg-matriculas { background: linear-gradient(135deg, #553c9a, #805ad5); }
        .bg-confirmadas { background: linear-gradient(135deg, #2f855a, #48bb78); }
        .bg-pendentes { background: linear-gradient(135deg, #c05621, #ed8936); }
        .status-confirmada { color: #2f855a; font-weight: 700; }
        .status-pendente { color: #c05621; font-weight: 700; }
        .status-cancelada { color: #c53030; font-weight: 700; }
        .report-table thead { background-color: #1e3a5f; color: white; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px 14px; text-align: left; border-bottom: 1px solid #e2e8f0; }
        .curso-section { margin-top: 20px; }
        .curso-section h5 { color: #1e3a5f; border-bottom: 2px solid #1e3a5f; padding-bottom: 8px; }
        @media print { .navbar, .no-print { display: none !important; } body { background: white !important; } }
    </style>
</head>
<body>
<%
    List<Matricula> matriculas = (List<Matricula>) request.getAttribute("matriculas");
    Map<Integer, Curso> cursoMap = (Map<Integer, Curso>) request.getAttribute("cursoMap");
    Map<Integer, Estudante> estudanteMap = (Map<Integer, Estudante>) request.getAttribute("estudanteMap");
    Map<String, Long> matriculasPorCurso = (Map<String, Long>) request.getAttribute("matriculasPorCurso");
    Integer totalEstudantes = (Integer) request.getAttribute("totalEstudantes");
    Integer totalMatriculas = (Integer) request.getAttribute("totalMatriculas");
    Long totalMatriculasConfirmadas = (Long) request.getAttribute("totalMatriculasConfirmadas");
    Long totalMatriculasPendentes = (Long) request.getAttribute("totalMatriculasPendentes");
    Long totalMatriculasCanceladas = (Long) request.getAttribute("totalMatriculasCanceladas");
    String erro = (String) request.getAttribute("erro");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
%>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-university"></i> OJJ Académico</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-arrow-left"></i> Voltar</a>
                <a class="nav-link" href="#" onclick="window.print(); return false;"><i class="fas fa-print"></i> Imprimir</a>
            </div>
        </div>
    </nav>
    <div class="container my-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-white"><i class="fas fa-graduation-cap"></i> Relatório Académico</h2>
                <p class="text-white-50">Visão geral das matrículas, estudantes e distribuição por curso.</p>
            </div>
        </div>

        <% if (erro != null) { %>
            <div class="alert alert-danger"><%= erro %></div>
        <% } %>

        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-alunos">
                    <p>Total de Estudantes</p>
                    <h3><%= totalEstudantes != null ? totalEstudantes : 0 %></h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-matriculas">
                    <p>Total de Matrículas</p>
                    <h3><%= totalMatriculas != null ? totalMatriculas : 0 %></h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-confirmadas">
                    <p>Matrículas Confirmadas</p>
                    <h3><%= totalMatriculasConfirmadas != null ? totalMatriculasConfirmadas : 0 %></h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-pendentes">
                    <p>Matrículas Pendentes</p>
                    <h3><%= totalMatriculasPendentes != null ? totalMatriculasPendentes : 0 %></h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="report-card curso-section">
                    <h5><i class="fas fa-chart-pie"></i> Matrículas por Curso</h5>
                    <table>
                        <thead><tr><th>Curso</th><th>Matrículas</th></tr></thead>
                        <tbody>
                        <% if (matriculasPorCurso != null && !matriculasPorCurso.isEmpty()) {
                            for (Map.Entry<String, Long> entry : matriculasPorCurso.entrySet()) { %>
                            <tr><td><%= entry.getKey() %></td><td><strong><%= entry.getValue() %></strong></td></tr>
                        <% }
                        } else { %>
                            <tr><td colspan="2" class="text-center">Nenhum dado disponível.</td></tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="report-card curso-section">
                    <h5><i class="fas fa-info-circle"></i> Resumo de Status</h5>
                    <table>
                        <thead><tr><th>Status</th><th>Quantidade</th></tr></thead>
                        <tbody>
                            <tr><td class="status-confirmada">Confirmadas</td><td><strong><%= totalMatriculasConfirmadas != null ? totalMatriculasConfirmadas : 0 %></strong></td></tr>
                            <tr><td class="status-pendente">Pendentes</td><td><strong><%= totalMatriculasPendentes != null ? totalMatriculasPendentes : 0 %></strong></td></tr>
                            <tr><td class="status-cancelada">Canceladas</td><td><strong><%= totalMatriculasCanceladas != null ? totalMatriculasCanceladas : 0 %></strong></td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="report-card p-0">
            <div class="table-responsive">
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Estudante</th>
                            <th>Curso</th>
                            <th>Status</th>
                            <th>Observações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% if (matriculas != null && !matriculas.isEmpty()) {
                        for (Matricula m : matriculas) {
                            Estudante est = estudanteMap != null ? estudanteMap.get(m.getIdEstudante()) : null;
                            Curso curso = cursoMap != null ? cursoMap.get(m.getIdCurso()) : null;
                            String statusClass = "CONFIRMADA".equalsIgnoreCase(m.getStatus()) ? "status-confirmada" :
                                                "PENDENTE".equalsIgnoreCase(m.getStatus()) ? "status-pendente" : "status-cancelada";
                    %>
                        <tr>
                            <td><%= m.getDataMatricula() != null ? m.getDataMatricula().format(dtf) : "-" %></td>
                            <td><%= est != null ? est.getNomeCompleto() : "ID " + m.getIdEstudante() %></td>
                            <td><%= curso != null ? curso.getNomeCurso() : "ID " + m.getIdCurso() %></td>
                            <td class="<%= statusClass %>"><%= m.getStatus() %></td>
                            <td><%= m.getObservacoes() != null ? m.getObservacoes() : "-" %></td>
                        </tr>
                    <% }
                    } else { %>
                        <tr><td colspan="5" class="text-center p-4">Nenhuma matrícula encontrada.</td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
