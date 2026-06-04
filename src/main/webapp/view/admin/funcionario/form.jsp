<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Novo Funcionário</title>
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
                        <h4 style="color: var(--primary-color);"><i class="fas fa-user-plus"></i> Cadastrar Novo Funcionário</h4>
                    </div>
                    <div class="card-body">
                        <% if(request.getAttribute("erro") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("erro") %>
                            </div>
                        <% } %>
                        
                        <form action="<%= request.getContextPath() %>/admin/funcionario/new" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="nomeCompleto" class="form-label">Nome Completo *</label>
                                    <input type="text" class="form-control-custom" id="nomeCompleto" name="nomeCompleto" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="numeroBi" class="form-label">Número BI *</label>
                                    <input type="text" class="form-control-custom" id="numeroBi" name="numeroBi" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="telefone" class="form-label">Telefone</label>
                                    <input type="text" class="form-control-custom" id="telefone" name="telefone">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <select class="form-select form-control-custom" id="sexo" name="sexo">
                                        <option value="">Selecione</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Feminino</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="dataNascimento" class="form-label">Data Nascimento</label>
                                    <input type="date" class="form-control-custom" id="dataNascimento" name="dataNascimento">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="dataAdmissao" class="form-label">Data Admissão</label>
                                    <input type="date" class="form-control-custom" id="dataAdmissao" name="dataAdmissao">
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="morada" class="form-label">Morada</label>
                                <textarea class="form-control-custom" id="morada" name="morada" rows="2"></textarea>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="salario" class="form-label">Salário</label>
                                    <input type="number" class="form-control-custom" id="salario" name="salario" step="0.01">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="idDepartamento" class="form-label">Departamento</label>
                                    <input type="number" class="form-control-custom" id="idDepartamento" name="idDepartamento">
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="idUtilizador" class="form-label">ID Utilizador</label>
                                <input type="number" class="form-control-custom" id="idUtilizador" name="idUtilizador">
                                <small class="text-muted">Deixe em branco se não tiver utilizador associado</small>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn-primary-custom">
                                    <i class="fas fa-save"></i> Salvar
                                </button>
                                <a href="<%= request.getContextPath() %>/admin/funcionario/list" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
