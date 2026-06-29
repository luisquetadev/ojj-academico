<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Relatório de Estudantes</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .report-header {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.08);
        }
        .report-summary {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
            color: #1a202c;
        }
        .report-summary .badge {
            background: rgba(49, 130, 206, 0.1);
            color: #1e3a5f;
            font-weight: 700;
        }
        .report-table {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
        }
        .report-table thead {
            background: #1e3a5f;
            color: white;
        }
        .report-table tbody tr:hover {
            background: rgba(49, 130, 206, 0.08);
        }
        @page {
            size: A4 portrait;
            margin: 20mm;
        }
        @media print {
            body {
                background: white !important;
                color: black !important;
            }
            .navbar, .btn-primary-custom, .no-print {
                display: none !important;
            }
            .report-header, .report-table {
                box-shadow: none !important;
                border: none !important;
                background: transparent !important;
            }
            table {
                font-size: 11px !important;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                <a class="nav-link" href="#" onclick="window.print()">
                    <i class="fas fa-print"></i> Imprimir
                </a>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="report-header mb-4">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div>
                    <h1 class="h3 mb-2">Relatório de Estudantes</h1>
                    <p class="mb-1 text-secondary">Gera uma visão completa dos estudantes e seus dados pessoais.</p>
                    <small class="text-muted">Data de geração: <%= new java.util.Date() %></small>
                </div>
                <div class="text-end">
                    <%
                        List<Estudante> estudantes = (List<Estudante>) request.getAttribute("estudantes");
                        int totalEstudantes = estudantes != null ? estudantes.size() : 0;
                    %>
                    <span class="badge rounded-pill">Total de estudantes: <%= totalEstudantes %></span>
                </div>
            </div>
        </div>

        <div class="report-table table-responsive">
            <table class="table table-striped mb-0">
                <thead>
                    <tr>
                        <th class="py-3">ID</th>
                        <th class="py-3">Número</th>
                        <th class="py-3">Nome Completo</th>
                        <th class="py-3">BI</th>
                        <th class="py-3">Sexo</th>
                        <th class="py-3">Telefone</th>
                        <th class="py-3">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (estudantes != null && !estudantes.isEmpty()) {
                            for (Estudante e : estudantes) {
                    %>
                    <tr>
                        <td><%= e.getIdEstudante() %></td>
                        <td><%= e.getNumeroEstudante() %></td>
                        <td><%= e.getNomeCompleto() %></td>
                        <td><%= e.getNumeroBi() %></td>
                        <td><%= e.getSexo() %></td>
                        <td><%= e.getTelefone() != null ? e.getTelefone() : "-" %></td>
                        <td><%= e.getEmailPessoal() != null ? e.getEmailPessoal() : "-" %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center py-4">Nenhum estudante encontrado</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
