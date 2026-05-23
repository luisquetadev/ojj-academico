<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Dashboard Administrador</title>
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/dashboard/admin">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-users"></i> Funcionários
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/list">Listar</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/new">Cadastrar</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-user-graduate"></i> Estudantes
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/estudante/list">Listar</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/estudante/new">Cadastrar</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-book"></i> Cursos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/curso">Gestão Cursos</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/disciplina">Gestão Disciplinas</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/turma">Gestão Turmas</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-chart-bar"></i> Relatórios
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/estudantes">Estudantes</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/financeiro">Financeiro</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/academico">Académico</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-cogs"></i> Sistema
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/sistema/utilizadores">Gestão Utilizadores</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/sistema/logs">Logs/Auditoria</a></li>
                        </ul>
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
                <h2 style="color: white;"><i class="fas fa-tachometer-alt"></i> Dashboard Administrador</h2>
                <p style="color: rgba(255, 255, 255, 0.8);">Bem-vindo ao painel de controle administrativo</p>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number">0</div>
                    <div class="stat-label"><i class="fas fa-user-graduate"></i> Estudantes</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number">0</div>
                    <div class="stat-label"><i class="fas fa-users"></i> Funcionários</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number">0</div>
                    <div class="stat-label"><i class="fas fa-book"></i> Cursos</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number">0</div>
                    <div class="stat-label"><i class="fas fa-chalkboard-teacher"></i> Turmas</div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card-custom">
                    <div class="card-body">
                        <h5 style="color: var(--primary-color);"><i class="fas fa-clock"></i> Ações Recentes</h5>
                        <p style="color: var(--dark-color); opacity: 0.7;">Nenhuma ação recente registrada.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card-custom">
                    <div class="card-body">
                        <h5 style="color: var(--primary-color);"><i class="fas fa-bell"></i> Notificações</h5>
                        <p style="color: var(--dark-color); opacity: 0.7;">Nenhuma notificação pendente.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
