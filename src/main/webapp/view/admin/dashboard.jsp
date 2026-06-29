<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="com.ojj.academico.model.OperacaoLog" %>
<%@ page import="com.ojj.academico.util.OperacaoLogFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Administrador</title>
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/admin/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-users"></i> Funcionários
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/list"><i class="fas fa-list"></i> Listar</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/new"><i class="fas fa-plus-circle"></i> Cadastrar</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/registrar"><i class="fas fa-key"></i> Registo Rápido</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-user-graduate"></i> Estudantes
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/estudante/list"><i class="fas fa-list"></i> Listar</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/estudante/new"><i class="fas fa-plus-circle"></i> Cadastrar</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-book"></i> Cursos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/curso"><i class="fas fa-graduation-cap"></i> Gestão Cursos</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/disciplina"><i class="fas fa-book-open"></i> Gestão Disciplinas</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/plano-curricular"><i class="fas fa-layer-group"></i> Plano Curricular</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/turma"><i class="fas fa-chalkboard"></i> Gestão Turmas</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/professor-disciplina"><i class="fas fa-chalkboard-teacher"></i> Professor x Disciplina</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-chart-bar"></i> Relatórios
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/estudantes"><i class="fas fa-users"></i> Estudantes</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/financeiro"><i class="fas fa-coins"></i> Financeiro</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/relatorios/academico"><i class="fas fa-school"></i> Académico</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="fas fa-cogs"></i> Sistema
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/sistema/utilizadores"><i class="fas fa-user-lock"></i> Gestão Utilizadores</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/sistema/logs"><i class="fas fa-clipboard-list"></i> Logs/Auditoria</a></li>
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
        <div class="page-header d-flex justify-content-between align-items-center flex-wrap gap-3">
            <div>
                <h2><i class="fas fa-tachometer-alt"></i> Bem-vindo(a), ${sessionScope.nomeUsuario}</h2>
                <p>Dashboard Administrativo — Gestão Completa do Sistema</p>
            </div>
            <a href="<%= request.getContextPath() %>/login" class="btn btn-secondary-custom btn-sm">
                <i class="fas fa-chevron-left"></i> Voltar
            </a>
        </div>

        <div class="row g-4">
            <div class="col-md-3">
                <div class="stat-card stat-card-primary">
                    <div class="stat-icon"><i class="fas fa-user-graduate"></i></div>
                    <div class="stat-number"><%= request.getAttribute("totalEstudantes") != null ? request.getAttribute("totalEstudantes") : 0 %></div>
                    <div class="stat-label">Estudantes</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card stat-card-success">
                    <div class="stat-icon"><i class="fas fa-users"></i></div>
                    <div class="stat-number"><%= request.getAttribute("totalFuncionarios") != null ? request.getAttribute("totalFuncionarios") : 0 %></div>
                    <div class="stat-label">Funcionários</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card stat-card-warning">
                    <div class="stat-icon"><i class="fas fa-book"></i></div>
                    <div class="stat-number"><%= request.getAttribute("totalCursos") != null ? request.getAttribute("totalCursos") : 0 %></div>
                    <div class="stat-label">Cursos</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card stat-card-purple">
                    <div class="stat-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="stat-number"><%= request.getAttribute("totalTurmas") != null ? request.getAttribute("totalTurmas") : 0 %></div>
                    <div class="stat-label">Turmas</div>
                </div>
            </div>
        </div>

        <div class="row g-4 mt-2">
            <div class="col-md-8">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h4><i class="fas fa-history"></i> Atividade em Tempo Real</h4>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-custom">
                            <thead>
                                <tr>
                                    <th><i class="fas fa-clock"></i> Data/Hora</th>
                                    <th><i class="fas fa-hashtag"></i> User</th>
                                    <th><i class="fas fa-code-branch"></i> Operação</th>
                                    <th><i class="fas fa-align-left"></i> Descrição</th>
                                    <th><i class="fas fa-check-circle"></i> Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                List<OperacaoLog> logs = (List<OperacaoLog>) request.getAttribute("logsRecentes");
                                if (logs != null && !logs.isEmpty()) {
                                    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM HH:mm");
                                    for (OperacaoLog log : logs) {
                                %>
                                    <tr>
                                        <td class="small"><%= log.getDataHora().format(fmt) %></td>
                                        <td><span class="badge badge-custom badge-secondary">#<%= log.getIdUtilizador() %></span></td>
                                        <td><strong><%= OperacaoLogFormatter.formatarOperacao(log.getTipoOperacao()) %></strong></td>
                                        <td class="small"><%= log.getDescricao() %></td>
                                        <td>
                                            <span class="badge badge-custom <%= "SUCESSO".equals(log.getResultado()) ? "badge-success" : "badge-danger" %>">
                                                <%= log.getResultado() %>
                                            </span>
                                        </td>
                                    </tr>
                                <% 
                                    }
                                } else { 
                                %>
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">Nenhuma atividade recente.</td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h4><i class="fas fa-bell"></i> Alertas</h4>
                    </div>
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle"></i>
                        <span class="alert-content">O sistema está a operar normalmente.</span>
                    </div>
                    <% if (logs != null && logs.stream().anyMatch(l -> "ERRO".equals(l.getResultado()))) { %>
                        <div class="alert alert-warning">
                            <i class="fas fa-exclamation-triangle"></i>
                            <span class="alert-content">Foram detetados erros nas operações recentes.</span>
                        </div>
                    <% } %>
                    <div class="mt-4">
                        <a href="<%= request.getContextPath() %>/sistema/logs" class="btn btn-info-custom w-100">
                            <i class="fas fa-clipboard-list"></i> Ver Log Completo
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
