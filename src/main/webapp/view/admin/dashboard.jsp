<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="com.ojj.academico.model.OperacaoLog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/list">Listar</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/new">Cadastrar</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/funcionario/registrar"><i class="fas fa-key"></i> Registo Rápido (com Credenciais)</a></li>
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
                    <div class="stat-number"><%= request.getAttribute("totalEstudantes") != null ? request.getAttribute("totalEstudantes") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-user-graduate"></i> Estudantes</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("totalFuncionarios") != null ? request.getAttribute("totalFuncionarios") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-users"></i> Funcionários</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("totalCursos") != null ? request.getAttribute("totalCursos") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-book"></i> Cursos</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-number"><%= request.getAttribute("totalTurmas") != null ? request.getAttribute("totalTurmas") : 0 %></div>
                    <div class="stat-label"><i class="fas fa-chalkboard-teacher"></i> Turmas</div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8">
                <div class="card-custom">
                    <div class="card-body">
                        <h5 style="color: var(--primary-color);"><i class="fas fa-history"></i> Atividade em Tempo Real (Monitorização)</h5>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Data/Hora</th>
                                        <th>User ID</th>
                                        <th>Operação</th>
                                        <th>Descrição</th>
                                        <th>Status</th>
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
                                            <td><span class="badge bg-secondary">#<%= log.getIdUtilizador() %></span></td>
                                            <td><strong><%= log.getTipoOperacao() %></strong></td>
                                            <td class="small"><%= log.getDescricao() %></td>
                                            <td>
                                                <span class="badge <%= "SUCESSO".equals(log.getResultado()) ? "bg-success" : "bg-danger" %>">
                                                    <%= log.getResultado() %>
                                                </span>
                                            </td>
                                        </tr>
                                    <% 
                                        }
                                    } else { 
                                    %>
                                        <tr>
                                            <td colspan="5" class="text-center text-muted">Nenhuma atividade recente capturada.</td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom">
                    <div class="card-body">
                        <h5 style="color: var(--primary-color);"><i class="fas fa-bell"></i> Alertas do Sistema</h5>
                        <hr>
                        <div class="alert alert-info py-2" style="font-size: 0.9rem;">
                            <i class="fas fa-info-circle"></i> O sistema está a operar normalmente.
                        </div>
                        <% if (logs != null && logs.stream().anyMatch(l -> "ERRO".equals(l.getResultado()))) { %>
                            <div class="alert alert-warning py-2" style="font-size: 0.9rem;">
                                <i class="fas fa-exclamation-triangle"></i> Foram detetados erros nas operações recentes.
                            </div>
                        <% } %>
                        <div class="mt-3">
                            <a href="<%= request.getContextPath() %>/sistema/logs" class="btn btn-sm btn-outline-primary w-100">
                                Ver Log de Auditoria Completo
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
