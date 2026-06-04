<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Perfil do Estudante</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/estudante/list">
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
                        <h4 style="color: var(--primary-color);"><i class="fas fa-user"></i> Perfil do Estudante</h4>
                    </div>
                    <div class="card-body">
                        <% 
                            Estudante estudante = (Estudante) request.getAttribute("estudante");
                            if (estudante == null) {
                        %>
                            <div class="alert alert-danger">Estudante não encontrado</div>
                            <a href="<%= request.getContextPath() %>/admin/estudante/list" class="btn btn-secondary">Voltar</a>
                        <%
                            } else {
                        %>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>ID:</strong>
                                <p><%= estudante.getIdEstudante() %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Número Estudante:</strong>
                                <p><%= estudante.getNumeroEstudante() != null ? estudante.getNumeroEstudante() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Nome Completo:</strong>
                                <p><%= estudante.getNomeCompleto() %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Sexo:</strong>
                                <p><%= estudante.getSexo() != null ? ("M".equals(estudante.getSexo()) ? "Masculino" : "Feminino") : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Data Nascimento:</strong>
                                <p><%= estudante.getDataNascimento() != null ? estudante.getDataNascimento() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Número BI:</strong>
                                <p><%= estudante.getNumeroBi() %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Telefone:</strong>
                                <p><%= estudante.getTelefone() != null ? estudante.getTelefone() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Email Pessoal:</strong>
                                <p><%= estudante.getEmailPessoal() != null ? estudante.getEmailPessoal() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <strong>Morada:</strong>
                            <p><%= estudante.getMorada() != null ? estudante.getMorada() : "-" %></p>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Província:</strong>
                                <p><%= estudante.getProvincia() != null ? estudante.getProvincia() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Nacionalidade:</strong>
                                <p><%= estudante.getNacionalidade() != null ? estudante.getNacionalidade() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong>Nome Encarregado:</strong>
                                <p><%= estudante.getNomeEncarregado() != null ? estudante.getNomeEncarregado() : "-" %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong>Telefone Encarregado:</strong>
                                <p><%= estudante.getTelefoneEncarregado() != null ? estudante.getTelefoneEncarregado() : "-" %></p>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <strong>Data Inscrição:</strong>
                            <p><%= estudante.getDataInscricao() %></p>
                        </div>
                        
                        <div class="d-grid gap-2 mt-4">
                            <a href="<%= request.getContextPath() %>/admin/estudante/edit?id=<%= estudante.getIdEstudante() %>" class="btn-primary-custom">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/estudante/list" class="btn-secondary-custom">
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
