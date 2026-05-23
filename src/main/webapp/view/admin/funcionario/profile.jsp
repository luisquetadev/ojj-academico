<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Funcionario" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Perfil do Funcionário</title>
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
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/funcionario/list">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card-custom">
                    <div class="card-header">
                        <h4 style="color: var(--primary-color);"><i class="fas fa-user"></i> Perfil do Funcionário</h4>
                    </div>
                    <div class="card-body">
                        <% 
                            Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
                            if (funcionario == null) {
                        %>
                            <div class="alert alert-danger">Funcionário não encontrado</div>
                            <a href="<%= request.getContextPath() %>/admin/funcionario/list" class="btn btn-secondary">Voltar</a>
                        <%
                            } else {
                        %>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>ID:</strong>
                                <p><%= funcionario.getIdFuncionario() %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Nome Completo:</strong>
                                <p><%= funcionario.getNomeCompleto() %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Telefone:</strong>
                                <p><%= funcionario.getTelefone() != null ? funcionario.getTelefone() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Número BI:</strong>
                                <p><%= funcionario.getNumeroBi() %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Sexo:</strong>
                                <p><%= funcionario.getSexo() != null ? ("M".equals(funcionario.getSexo()) ? "Masculino" : "Feminino") : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Data Nascimento:</strong>
                                <p><%= funcionario.getDataNascimento() != null ? funcionario.getDataNascimento() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Data Admissão:</strong>
                                <p><%= funcionario.getDataAdmissao() %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Salário:</strong>
                                <p><%= funcionario.getSalario() != null ? funcionario.getSalario() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <strong>Morada:</strong>
                            <p><%= funcionario.getMorada() != null ? funcionario.getMorada() : "-" %></p>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>ID Departamento:</strong>
                                <p><%= funcionario.getIdDepartamento() != null ? funcionario.getIdDepartamento() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>ID Utilizador:</strong>
                                <p><%= funcionario.getIdUtilizador() %></p>
                            </div>
                        </div>
                        
                        <div class="d-grid gap-2 mt-4">
                            <a href="<%= request.getContextPath() %>/admin/funcionario/edit?id=<%= funcionario.getIdFuncionario() %>" class="btn-primary-custom">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/funcionario/list" class="btn-secondary-custom">
                                <i class="fas fa-arrow-left"></i> Voltar
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
