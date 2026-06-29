<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Dashboard Secretário</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/secretario/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/secretario/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-user-plus"></i> Matrículas
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/estudante/list">Listar Estudantes</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/secretario/matricular">Nova Matrícula</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/secretario/confirmacao-matricula">Confirmação</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/secretario/trancamento">Trancamento</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-file-alt"></i> Documentos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/secretario/declaracao">Declarações</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/secretario/cartao-estudante">Cartão Estudante</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/secretario/historico">
                            <i class="fas fa-history"></i> Meu Histórico
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                            <i class="fas fa-sign-out-alt"></i> Sair
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 style="color: white;"><i class="fas fa-desktop"></i> Painel da Secretaria</h2>
                <p style="color: rgba(255, 255, 255, 0.8);">Bem-vindo, gestor escolar.</p>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("totalEstudantes") != null ? request.getAttribute("totalEstudantes") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-users"></i> Total de Estudantes</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("matriculasAtivas") != null ? request.getAttribute("matriculasAtivas") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-check-circle"></i> Matrículas Activas</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number">2026</div>
                    <div class="stat-label"><i class="fas fa-calendar-alt"></i> Ano Académico</div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card-custom text-center p-4">
                    <i class="fas fa-user-plus fa-3x mb-3 text-primary"></i>
                    <h4>Matrícula</h4>
                    <p>Registrar novo aluno no sistema</p>
                    <a href="<%= request.getContextPath() %>/secretario/matricular" class="btn btn-primary w-100">Aceder</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom text-center p-4">
                    <i class="fas fa-file-invoice fa-3x mb-3 text-primary"></i>
                    <h4>Declarações</h4>
                    <p>Emitir comprovativos de frequência</p>
                    <a href="<%= request.getContextPath() %>/secretario/declaracao" class="btn btn-primary w-100">Aceder</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom text-center p-4">
                    <i class="fas fa-id-card fa-3x mb-3 text-primary"></i>
                    <h4>Cartão</h4>
                    <p>Gerar cartão de identificação</p>
                    <a href="<%= request.getContextPath() %>/secretario/cartao-estudante" class="btn btn-primary w-100">Aceder</a>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
