<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Editar Estudante</title>
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
                        <h4 style="color: var(--primary-color);"><i class="fas fa-edit"></i> Editar Estudante</h4>
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
                        
                        <% if(request.getAttribute("erro") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("erro") %>
                            </div>
                        <% } %>
                        
                        <form action="<%= request.getContextPath() %>/admin/estudante/edit" method="post">
                            <input type="hidden" name="id" value="<%= estudante.getIdEstudante() %>">
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="numeroEstudante" class="form-label">Número Estudante</label>
                                    <input type="text" class="form-control-custom" id="numeroEstudante" name="numeroEstudante" 
                                           value="<%= estudante.getNumeroEstudante() != null ? estudante.getNumeroEstudante() : "" %>">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="nomeCompleto" class="form-label">Nome Completo *</label>
                                    <input type="text" class="form-control-custom" id="nomeCompleto" name="nomeCompleto" 
                                           value="<%= estudante.getNomeCompleto() %>" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="numeroBi" class="form-label">Número BI *</label>
                                    <input type="text" class="form-control-custom" id="numeroBi" name="numeroBi" 
                                           value="<%= estudante.getNumeroBi() %>" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <select class="form-select form-control-custom" id="sexo" name="sexo">
                                        <option value="">Selecione</option>
                                        <option value="M" <%= "M".equals(estudante.getSexo()) ? "selected" : "" %>>Masculino</option>
                                        <option value="F" <%= "F".equals(estudante.getSexo()) ? "selected" : "" %>>Feminino</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="dataNascimento" class="form-label">Data Nascimento</label>
                                    <input type="date" class="form-control-custom" id="dataNascimento" name="dataNascimento" 
                                           value="<%= estudante.getDataNascimento() != null ? estudante.getDataNascimento() : "" %>">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="telefone" class="form-label">Telefone</label>
                                    <input type="text" class="form-control-custom" id="telefone" name="telefone" 
                                           value="<%= estudante.getTelefone() != null ? estudante.getTelefone() : "" %>">
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="emailPessoal" class="form-label">Email Pessoal</label>
                                <input type="email" class="form-control-custom" id="emailPessoal" name="emailPessoal" 
                                       value="<%= estudante.getEmailPessoal() != null ? estudante.getEmailPessoal() : "" %>">
                            </div>
                            
                            <div class="mb-3">
                                <label for="morada" class="form-label">Morada</label>
                                <textarea class="form-control-custom" id="morada" name="morada" rows="2"><%= estudante.getMorada() != null ? estudante.getMorada() : "" %></textarea>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="provincia" class="form-label">Província</label>
                                    <input type="text" class="form-control-custom" id="provincia" name="provincia" 
                                           value="<%= estudante.getProvincia() != null ? estudante.getProvincia() : "" %>">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="nacionalidade" class="form-label">Nacionalidade</label>
                                    <input type="text" class="form-control-custom" id="nacionalidade" name="nacionalidade" 
                                           value="<%= estudante.getNacionalidade() != null ? estudante.getNacionalidade() : "" %>">
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="nomeEncarregado" class="form-label">Nome Encarregado</label>
                                    <input type="text" class="form-control-custom" id="nomeEncarregado" name="nomeEncarregado" 
                                           value="<%= estudante.getNomeEncarregado() != null ? estudante.getNomeEncarregado() : "" %>">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="telefoneEncarregado" class="form-label">Telefone Encarregado</label>
                                    <input type="text" class="form-control-custom" id="telefoneEncarregado" name="telefoneEncarregado" 
                                           value="<%= estudante.getTelefoneEncarregado() != null ? estudante.getTelefoneEncarregado() : "" %>">
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn-primary-custom">
                                    <i class="fas fa-save"></i> Atualizar
                                </button>
                                <a href="<%= request.getContextPath() %>/admin/estudante/list" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                            </div>
                        </form>
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
