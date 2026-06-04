<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Relatório de Estudantes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        @media print {
            .navbar, .btn-primary-custom, .no-print {
                display: none !important;
            }
            .card-custom {
                border: none;
                box-shadow: none;
            }
            body {
                background-color: white !important;
                color: black !important;
            }
            .table-custom {
                color: black !important;
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

    <div class="container mt-4">
        <div class="text-center mb-4">
            <h2 style="color: white;" class="no-print"><i class="fas fa-file-alt"></i> Relatório de Estudantes</h2>
            <h2 style="color: black;" class="d-none d-print-block">Relatório de Estudantes Geral</h2>
            <p style="color: rgba(255, 255, 255, 0.8);" class="no-print">Data de geração: <%= new java.util.Date() %></p>
        </div>

        <div class="card-custom">
            <div class="card-body">
                <table class="table table-custom table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Número</th>
                            <th>Nome Completo</th>
                            <th>BI</th>
                            <th>Sexo</th>
                            <th>Telefone</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Estudante> estudantes = (List<Estudante>) request.getAttribute("estudantes");
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
                            <td colspan="7" class="text-center">Nenhum estudante encontrado</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
