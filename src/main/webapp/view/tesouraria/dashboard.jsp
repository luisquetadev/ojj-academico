<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Dashboard Tesouraria</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/tesouraria/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/tesouraria/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/estudante/list">
                            <i class="fas fa-user-graduate"></i> Listar Estudantes
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-money-bill-wave"></i> Pagamentos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/tesouraria/propina">Propinas</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/tesouraria/servicos">Outros Serviços</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/tesouraria/historico">Histórico Geral</a></li>
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
                <h2 style="color: white;"><i class="fas fa-coins"></i> Painel Financeiro</h2>
                <p style="color: rgba(255, 255, 255, 0.8);">Controlo de propinas e serviços institucionais.</p>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number">Kz ${not empty receitaHoje ? receitaHoje : '0,00'}</div>
                    <div class="stat-label"><i class="fas fa-wallet"></i> Receita Hoje</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number">${not empty pagamentosPendentes ? pagamentosPendentes : '0'}</div>
                    <div class="stat-label"><i class="fas fa-exclamation-circle"></i> Pagamentos em Atraso</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-number">2026</div>
                    <div class="stat-label"><i class="fas fa-calendar-check"></i> Exercício</div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card-custom p-4">
                    <h5><i class="fas fa-search"></i> Consulta Rápida de Aluno</h5>
                    <p class="small text-muted">Verifique o estado das propinas antes de qualquer serviço.</p>
                    <a href="<%= request.getContextPath() %>/admin/estudante/list" class="btn btn-primary w-100">
                        Ir para Lista de Estudantes
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card-custom p-4 text-center">
                    <i class="fas fa-receipt fa-2x mb-2 text-primary"></i>
                    <h5>Receber Pagamento</h5>
                    <p class="small text-muted">Emitir recibo de propina ou taxa.</p>
                    <div class="d-flex gap-2">
                        <a href="<%= request.getContextPath() %>/tesouraria/propina" class="btn btn-outline-primary flex-fill">Propina</a>
                        <a href="<%= request.getContextPath() %>/tesouraria/servicos" class="btn btn-outline-primary flex-fill">Serviço</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
