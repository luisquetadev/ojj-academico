<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Funcionario" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Lista de Funcionários</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard">
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
            <h2 style="color: white;"><i class="fas fa-users"></i> Lista de Funcionários</h2>
            <a href="<%= request.getContextPath() %>/admin/funcionario/new" class="btn-primary-custom">
                <i class="fas fa-plus"></i> Novo Funcionário
            </a>
        </div>

        <div class="card-custom">
            <div class="card-body">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Telefone</th>
                            <th>BI</th>
                            <th>Data Admissão</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Funcionario> funcionarios = (List<Funcionario>) request.getAttribute("funcionarios");
                            if (funcionarios != null && !funcionarios.isEmpty()) {
                                for (Funcionario f : funcionarios) {
                        %>
                        <tr>
                            <td><%= f.getIdFuncionario() %></td>
                            <td><%= f.getNomeCompleto() %></td>
                            <td><%= f.getTelefone() != null ? f.getTelefone() : "-" %></td>
                            <td><%= f.getNumeroBi() %></td>
                            <td><%= f.getDataAdmissao() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/admin/funcionario/profile?id=<%= f.getIdFuncionario() %>" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/funcionario/edit?id=<%= f.getIdFuncionario() %>" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center">Nenhum funcionário cadastrado</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
