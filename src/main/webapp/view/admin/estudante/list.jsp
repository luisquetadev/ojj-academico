<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Lista de Estudantes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/dashboard/admin">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/dashboard/admin">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 style="color: white;"><i class="fas fa-user-graduate"></i> Lista de Estudantes</h2>
            <a href="<%= request.getContextPath() %>/admin/estudante/new" class="btn-primary-custom">
                <i class="fas fa-plus"></i> Novo Estudante
            </a>
        </div>

        <div class="card-custom">
            <div class="card-body">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Número</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Telefone</th>
                            <th>Ações</th>
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
                            <td><%= e.getEmailPessoal() != null ? e.getEmailPessoal() : "-" %></td>
                            <td><%= e.getTelefone() != null ? e.getTelefone() : "-" %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/admin/estudante/profile?id=<%= e.getIdEstudante() %>" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/estudante/edit?id=<%= e.getIdEstudante() %>" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center">Nenhum estudante cadastrado</td>
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
