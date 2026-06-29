<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="pt">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Dashboard - Sistema Académico OJJ</title>
            <link href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="<%= request.getContextPath() %>/assets/css/all.min.css" rel="stylesheet">
            <link href="<%= request.getContextPath() %>/assets/css/main.css" rel="stylesheet">
            <style>
                :root {
                    --primary-color: #1e3a5f;
                    --secondary-color: #2c5282;
                    --accent-color: #3182ce;
                    --success-color: #2f855a;
                    --danger-color: #c53030;
                    --warning-color: #d69e2e;
                }

                body {
                    background: linear-gradient(135deg, #1e3a5f 0%, #2c5282 100%);
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }

                .sidebar {
                    min-height: 100vh;
                    background: rgba(255, 255, 255, 0.1);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
                }

                .sidebar .nav-link {
                    color: rgba(255, 255, 255, 0.9);
                    padding: 12px 20px;
                    margin: 5px 0;
                    border-radius: 10px;
                    transition: all 0.3s;
                }

                .sidebar .nav-link:hover {
                    background: rgba(255, 255, 255, 0.1);
                    transform: translateX(5px);
                }

                .sidebar .nav-link.active {
                    background: var(--accent-color);
                    color: white;
                }

                .sidebar .nav-link i {
                    margin-right: 10px;
                    width: 20px;
                }

                .main-content {
                    padding: 20px;
                }

                .navbar-top {
                    background: rgba(255, 255, 255, 0.95);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    padding: 15px 20px;
                    border-radius: 10px;
                    margin-bottom: 20px;
                }

                .card-stats {
                    border: none;
                    border-radius: 15px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                    transition: transform 0.3s;
                }

                .card-stats:hover {
                    transform: translateY(-5px);
                }

                .stats-icon {
                    width: 60px;
                    height: 60px;
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 24px;
                }

                .welcome-banner {
                    background: linear-gradient(135deg, var(--accent-color) 0%, var(--secondary-color) 100%);
                    border-radius: 15px;
                    padding: 30px;
                    color: white;
                    margin-bottom: 30px;
                }

                .table-card {
                    background: rgba(255, 255, 255, 0.95);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    border-radius: 15px;
                    padding: 20px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                }

                @media (max-width: 768px) {
                    .sidebar {
                        min-height: auto;
                        margin-bottom: 20px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container-fluid">
                <div class="row">
                    <!-- Sidebar -->
                    <div class="col-md-2 col-sm-12 sidebar p-0">
                        <div class="text-center py-4">
                            <i class="fas fa-university fa-3x text-white mb-2"></i>
                            <h5 class="text-white">OJJ Académico</h5>
                            <small class="text-white-50">Sistema de Gestão</small>
                        </div>
                        <hr class="bg-light">
                        <nav class="nav flex-column px-3">
                            <c:forEach items="${menuItens}" var="menu">
                                <a class="nav-link ${menu.url == pageContext.request.servletPath ? 'active' : ''}"
                                    href="${pageContext.request.contextPath}${menu.url}">
                                    <i class="fas fa-${menu.icone}"></i> ${menu.nome}
                                </a>
                            </c:forEach>
                        </nav>
                    </div>

                    <!-- Main Content -->
                    <div class="col-md-10 col-sm-12 main-content">
                        <!-- Top Bar -->
                        <div class="navbar-top d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="mb-0">Bem-vindo, ${usuario.username}!</h5>
                                <small class="text-muted">${perfil}</small>
                            </div>
                            <div>
                                <span class="badge bg-primary p-2">
                                    <i class="fas fa-calendar-alt"></i>
                                    <span id="currentDate"></span>
                                </span>
                            </div>
                        </div>

                        <!-- Welcome Banner -->
                        <div class="welcome-banner">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h2 class="mb-2">Sistema de Gestão Académica OJJ</h2>
                                    <p class="mb-0">Gerencie todos os aspectos da sua instituição de forma eficiente e
                                        integrada.</p>
                                </div>
                                <div class="col-md-4 text-center">
                                    <i class="fas fa-chalkboard-user fa-4x"></i>
                                </div>
                            </div>
                        </div>

                        <!-- Stats Cards (apenas para Admin/Funcionario) -->
                        <c:if test="${perfil == 'Administrador' or perfil == 'Funcionario'}">
                            <div class="row mb-4">
                                <div class="col-md-3 mb-3">
                                    <div class="card card-stats">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h6 class="text-muted mb-2">Total Estudantes</h6>
                                                    <h3 class="mb-0" id="totalEstudantes">-</h3>
                                                </div>
                                                <div class="stats-icon bg-primary bg-opacity-10">
                                                    <i class="fas fa-users text-primary"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="card card-stats">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h6 class="text-muted mb-2">Total Funcionários</h6>
                                                    <h3 class="mb-0" id="totalFuncionarios">-</h3>
                                                </div>
                                                <div class="stats-icon bg-success bg-opacity-10">
                                                    <i class="fas fa-user-tie text-success"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="card card-stats">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h6 class="text-muted mb-2">Total Cursos</h6>
                                                    <h3 class="mb-0" id="totalCursos">-</h3>
                                                </div>
                                                <div class="stats-icon bg-info bg-opacity-10">
                                                    <i class="fas fa-book text-info"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="card card-stats">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h6 class="text-muted mb-2">Pagamentos Hoje</h6>
                                                    <h3 class="mb-0" id="pagamentosHoje">-</h3>
                                                </div>
                                                <div class="stats-icon bg-warning bg-opacity-10">
                                                    <i class="fas fa-credit-card text-warning"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <!-- Content Area for dynamic content -->
                        <div class="table-card" id="dynamicContent">
                            <h5 class="mb-3">Bem-vindo ao Sistema</h5>
                            <p>Selecione uma opção no menu lateral para começar.</p>

                            <!-- Quick Actions -->
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-plus-circle fa-3x text-primary mb-2"></i>
                                            <h6>Cadastrar Novo</h6>
                                            <small class="text-muted">Adicione estudantes ou funcionários</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-file-alt fa-3x text-success mb-2"></i>
                                            <h6>Relatórios</h6>
                                            <small class="text-muted">Gere relatórios do sistema</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-chart-line fa-3x text-info mb-2"></i>
                                            <h6>Estatísticas</h6>
                                            <small class="text-muted">Veja métricas do sistema</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-cog fa-3x text-warning mb-2"></i>
                                            <h6>Configurações</h6>
                                            <small class="text-muted">Configure o sistema</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
            <script src="<%= request.getContextPath() %>/assets/js/jquery-3.6.0.min.js"></script>
            <script>
                // Mostrar data atual
                function displayCurrentDate() {
                    const now = new Date();
                    const options = { year: 'numeric', month: 'long', day: 'numeric' };
                    document.getElementById('currentDate').textContent = now.toLocaleDateString('pt-PT', options);
                }

             
                

                displayCurrentDate();
            </script>
        </body>

        </html>