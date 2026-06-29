<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.ojj.academico.model.*, com.ojj.academico.conf.AppConfig" %>
<%
    Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
    if (utilizador == null || !utilizador.isEstudante()) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Minhas Propinas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .topbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }
        .topbar .logo h2 { color: var(--primary-color); font-size: 1.5rem; margin: 0; }
        .user-info { display: flex; align-items: center; gap: 20px; }
        .user-info span { color: var(--primary-color); font-weight: 600; }
        .logout-btn { padding: 8px 20px; background: var(--accent-color); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s ease; }
        .logout-btn:hover { background: var(--secondary-color); transform: translateY(-2px); }
        .container { max-width: 900px; margin: 0 auto; padding: 40px 20px; }
        .status-badge { padding: 6px 14px; border-radius: 20px; font-weight: 600; font-size: 0.85rem; }
        .status-PAGO { background: #c8e6c9; color: #2e7d32; }
        .status-PENDENTE { background: #fff9c4; color: #f57f17; }
        .status-ATRASADO { background: #ffcdd2; color: #c62828; }
        .status-NENHUM { background: #e0e0e0; color: #616161; }
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            text-align: center;
        }
        .stat-card .valor { font-size: 1.8rem; font-weight: 700; margin: 10px 0; }
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2><i class="fas fa-university"></i> OJJ Académico</h2>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user"></i> <%= utilizador.getEmail() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>

    <div class="container">
        <div class="card-custom mb-4">
            <h3 class="mb-0" style="color: var(--primary-color);">
                <i class="fas fa-money-bill-wave"></i> Minhas Propinas
            </h3>
        </div>

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger alert-custom">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <%
            Estudante estudante = (Estudante) request.getAttribute("estudante");
            if (estudante != null) {
        %>
        <div class="card-custom mb-4">
            <p style="margin:0; color: var(--dark-color);">
                <strong><i class="fas fa-user-graduate"></i> <%= estudante.getNomeCompleto() %></strong>
                &nbsp;|&nbsp; <span class="badge badge-custom badge-success"><%= estudante.getNumeroEstudante() %></span>
            </p>
        </div>
        <% } %>

        <%
            String statusAtual = (String) request.getAttribute("statusAtual");
            Double totalPendente = (Double) request.getAttribute("totalPendente");
            Double totalPago = (Double) request.getAttribute("totalPago");
        %>
        <div class="row g-3 mb-4">
            <div class="col-md-4">
                <div class="stat-card">
                    <i class="fas fa-info-circle" style="color: var(--primary-color); font-size: 1.5rem;"></i>
                    <div class="valor" style="color: var(--primary-color);">Status</div>
                    <span class="status-badge status-<%= statusAtual != null ? statusAtual : "NENHUM" %>">
                        <%= statusAtual != null ? statusAtual : "Sem registo" %>
                    </span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <i class="fas fa-exclamation-triangle" style="color: #f57f17; font-size: 1.5rem;"></i>
                    <div class="valor" style="color: #f57f17;"><%= String.format("%.2f", totalPendente != null ? totalPendente : 0) %> Kz</div>
                    <div>Total Pendente</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <i class="fas fa-check-circle" style="color: #2e7d32; font-size: 1.5rem;"></i>
                    <div class="valor" style="color: #2e7d32;"><%= String.format("%.2f", totalPago != null ? totalPago : 0) %> Kz</div>
                    <div>Total Pago</div>
                </div>
            </div>
        </div>

        <%
            List<Propina> propinas = (List<Propina>) request.getAttribute("propinas");
            if (propinas != null && !propinas.isEmpty()) {
        %>
        <div class="card-custom">
            <h4 style="color: var(--primary-color);">
                <i class="fas fa-history"></i> Histórico de Propinas
            </h4>
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Mês</th>
                            <th>Ano</th>
                            <th>Valor</th>
                            <th>Multa</th>
                            <th>Vencimento</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String[] meses = {"JANEIRO","FEVEREIRO","MARÇO","ABRIL","MAIO","JUNHO","JULHO","AGOSTO","SETEMBRO","OUTUBRO","NOVEMBRO","DEZEMBRO"};
                            for (Propina p : propinas) {
                                String status = p.getStatus() != null ? p.getStatus() : "PENDENTE";
                                String statusClass = "status-badge status-" + status;
                        %>
                        <tr>
                            <td><strong><%= p.getMesReferencia() %></strong></td>
                            <td><%= p.getAnoReferencia() %></td>
                            <td><%= String.format("%.2f", p.getValor()) %> Kz</td>
                            <td><%= p.getMulta() != null && p.getMulta().doubleValue() > 0 ? String.format("%.2f", p.getMulta()) + " Kz" : "-" %></td>
                            <td><%= p.getDataVencimento() %></td>
                            <td><span class="<%= statusClass %>"><%= status %></span></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <% } else if (estudante != null) { %>
        <div class="card-custom text-center">
            <i class="fas fa-info-circle" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
            <h4 style="color: var(--primary-color);">Nenhuma propina encontrada</h4>
            <p>Não existem registos de propinas para o seu perfil.</p>
        </div>
        <% } %>

        <div class="text-center mt-3">
            <a href="<%= request.getContextPath() %>/estudante/dashboard" class="btn btn-primary-custom">
                <i class="fas fa-arrow-left"></i> Voltar ao Dashboard
            </a>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
