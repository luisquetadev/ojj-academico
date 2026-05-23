<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Matrícula</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/dashboard/secretario">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/dashboard/secretario">
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
                        <h4 style="color: var(--primary-color);"><i class="fas fa-user-plus"></i> Nova Matrícula</h4>
                    </div>
                    <div class="card-body">
                        <% if(request.getAttribute("erro") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("erro") %>
                            </div>
                        <% } %>
                        <% if(request.getAttribute("mensagem") != null) { %>
                            <div class="alert alert-info">
                                <%= request.getAttribute("mensagem") %>
                            </div>
                        <% } %>
                        
                        <form action="<%= request.getContextPath() %>/secretario/matricular" method="post">
                            <div class="mb-3">
                                <label for="idEstudante" class="form-label">ID Estudante *</label>
                                <input type="number" class="form-control-custom" id="idEstudante" name="idEstudante" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="idCurso" class="form-label">ID Curso *</label>
                                <input type="number" class="form-control-custom" id="idCurso" name="idCurso" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="idTurma" class="form-label">ID Turma *</label>
                                <input type="number" class="form-control-custom" id="idTurma" name="idTurma" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="idAnoAcademico" class="form-label">ID Ano Académico</label>
                                <input type="number" class="form-control-custom" id="idAnoAcademico" name="idAnoAcademico">
                            </div>
                            
                            <div class="mb-3">
                                <label for="idSemestre" class="form-label">ID Semestre</label>
                                <input type="number" class="form-control-custom" id="idSemestre" name="idSemestre">
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn-primary-custom">
                                    <i class="fas fa-save"></i> Matricular
                                </button>
                                <a href="<%= request.getContextPath() %>/dashboard/secretario" class="btn-secondary-custom">
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
