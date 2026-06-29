<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.OperacaoLog" %>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Logs/Auditoria</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .filter-card {
            border-radius: 16px;
            padding: 24px;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 18px 40px rgba(0, 0, 0, 0.08);
        }
        .log-table thead {
            background-color: #1e3a5f;
            color: white;
        }
        .log-table tbody tr:hover {
            background: rgba(49, 130, 206, 0.1);
        }
        .log-status-success {
            color: #2f855a;
            font-weight: 700;
        }
        .log-status-error {
            color: #c53030;
            font-weight: 700;
        }
        @media print {
            .navbar, .btn-primary-custom, .no-print, .filter-card {
                display: none !important;
            }
            body {
                background: white !important;
                color: black !important;
            }
            .log-table {
                color: black !important;
            }
            .container {
                max-width: 100% !important;
                padding: 0 !important;
            }
        }
    </style>
</head>
<body>
<%
    List<OperacaoLog> logs = (List<OperacaoLog>) request.getAttribute("logs");
    List<Utilizador> users = (List<Utilizador>) request.getAttribute("users");
    Map<Integer, String> userEmailById = (Map<Integer, String>) request.getAttribute("userEmailById");
    Integer filterUserId = (Integer) request.getAttribute("filterUserId");
    String filterTipoOperacao = (String) request.getAttribute("filterTipoOperacao");
    String filterResultado = (String) request.getAttribute("filterResultado");
    String filterDataInicio = (String) request.getAttribute("filterDataInicio");
    String filterDataFim = (String) request.getAttribute("filterDataFim");
%>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </nav>
    <div class="container my-5">
        <div class="row mb-4 align-items-center">
            <div class="col-md-8">
                <h2 class="text-white"><i class="fas fa-history"></i> Histórico de Operações</h2>
                <p class="text-white-50">Registo completo das atividades do utilizador. Utilize os filtros para pesquisar por usuário, tipo de operação, resultado e intervalo de datas.</p>
            </div>
            <div class="col-md-4 text-md-end no-print">
                <a href="#" onclick="window.print(); return false;" class="btn btn-primary btn-primary-custom"><i class="fas fa-print"></i> Exportar / Imprimir</a>
            </div>
        </div>

        <div class="filter-card mb-4 no-print">
            <form method="get" action="<%= request.getContextPath() %>/sistema/logs">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">Utilizador</label>
                        <select name="userId" class="form-select form-control-custom">
                            <option value="">Todos</option>
                            <%
                                if (users != null) {
                                    for (Utilizador user : users) {
                                        String selected = filterUserId != null && filterUserId == user.getIdUtilizador() ? "selected" : "";
                            %>
                                <option value="<%= user.getIdUtilizador() %>" <%= selected %>><%= user.getEmail() %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Tipo de Operação</label>
                        <input type="text" class="form-control form-control-custom" name="tipoOperacao" value="<%= filterTipoOperacao != null ? filterTipoOperacao : "" %>" placeholder="Ex: POST /admin/estudante/new">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Resultado</label>
                        <select name="resultado" class="form-select form-control-custom">
                            <option value="">Todos</option>
                            <option value="SUCESSO" <%= "SUCESSO".equals(filterResultado) ? "selected" : "" %>>Sucesso</option>
                            <option value="ERRO" <%= "ERRO".equals(filterResultado) ? "selected" : "" %>>Erro</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Data Início</label>
                        <input type="date" class="form-control form-control-custom" name="dataInicio" value="<%= filterDataInicio != null ? filterDataInicio : "" %>">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Data Fim</label>
                        <input type="date" class="form-control form-control-custom" name="dataFim" value="<%= filterDataFim != null ? filterDataFim : "" %>">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12 text-end">
                        <button type="submit" class="btn btn-primary btn-primary-custom">Filtrar</button>
                        <a href="<%= request.getContextPath() %>/sistema/logs" class="btn btn-secondary btn-secondary-custom">Limpar</a>
                    </div>
                </div>
            </form>
        </div>

        <div class="card-custom p-0">
            <div class="table-responsive">
                <table class="table table-hover log-table mb-0">
                    <thead>
                        <tr>
                            <th>Data / Hora</th>
                            <th>Utilizador</th>
                            <th>Operação</th>
                            <th>Meta</th>
                            <th>Resultado</th>
                            <th>IP</th>
                            <th>Dados Alterados</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if (logs != null && !logs.isEmpty()) {
                            for (OperacaoLog log : logs) {
                                String userEmail = userEmailById != null && userEmailById.containsKey(log.getIdUtilizador()) ? userEmailById.get(log.getIdUtilizador()) : String.valueOf(log.getIdUtilizador());
                                String statusClass = "SUCESSO".equals(log.getResultado()) ? "log-status-success" : "log-status-error";
                                String alvo = log.getIdEstudanteAlvo() != null ? "Estudante ID " + log.getIdEstudanteAlvo() : "-";
                                String dadosAlterados = log.getDadosAlterados() != null ? log.getDadosAlterados() : "-";
                                if (dadosAlterados.length() > 90) {
                                    dadosAlterados = dadosAlterados.substring(0, 87) + "...";
                                }
                    %>
                        <tr>
                            <td><%= log.getDataHora() != null ? log.getDataHora().toString().replace('T',' ') : "-" %></td>
                            <td><%= userEmail %></td>
                            <td><%= log.getTipoOperacao() %></td>
                            <td><%= alvo %></td>
                            <td class="<%= statusClass %>"><%= log.getResultado() %></td>
                            <td><%= log.getEnderecoIp() != null ? log.getEnderecoIp() : "-" %></td>
                            <td><%= dadosAlterados %></td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7" class="text-center p-4">Nenhum log encontrado para os filtros selecionados.</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
