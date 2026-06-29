<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Dashboard Professor</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/professor/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/turmas">
                            <i class="fas fa-chalkboard-teacher"></i> Minhas Turmas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/lancar-notas">
                            <i class="fas fa-edit"></i> Lançar Notas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/pautas">
                            <i class="fas fa-list-alt"></i> Gestão Pautas
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
        <div class="page-header">
            <h2><i class="fas fa-chalkboard-teacher"></i> Dashboard Professor</h2>
            <p>Bem-vindo ao painel de controlo do professor</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="stat-card stat-card-primary">
                    <div class="stat-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="stat-number">0</div>
                    <div class="stat-label">Minhas Turmas</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card stat-card-success">
                    <div class="stat-icon"><i class="fas fa-edit"></i></div>
                    <div class="stat-number">0</div>
                    <div class="stat-label">Notas Pendentes</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card stat-card-warning">
                    <div class="stat-icon"><i class="fas fa-list-alt"></i></div>
                    <div class="stat-number">0</div>
                    <div class="stat-label">Pautas Ativas</div>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
