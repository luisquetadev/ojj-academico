<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Pagamento" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Relatório Financeiro</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .report-card { border-radius: 16px; padding: 24px; background: rgba(255,255,255,0.95); box-shadow: 0 18px 40px rgba(0,0,0,0.08); }
        .summary-card { border-radius: 12px; padding: 20px; text-align: center; color: white; }
        .summary-card h3 { font-size: 2rem; margin: 0; }
        .summary-card p { margin: 0; opacity: 0.9; }
        .bg-receita { background: linear-gradient(135deg, #2f855a, #48bb78); }
        .bg-pendente { background: linear-gradient(135deg, #c05621, #ed8936); }
        .bg-pagos { background: linear-gradient(135deg, #2b6cb0, #4299e1); }
        .bg-total { background: linear-gradient(135deg, #553c9a, #805ad5); }
        .report-table thead { background-color: #1e3a5f; color: white; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px 14px; text-align: left; border-bottom: 1px solid #e2e8f0; }
        .status-pago { color: #2f855a; font-weight: 700; }
        .status-pendente { color: #c05621; font-weight: 700; }
        .status-atrasado { color: #c53030; font-weight: 700; }
        .status-parcial { color: #d69e2e; font-weight: 700; }
        @media print { .navbar, .no-print, .filter-card { display: none !important; } body { background: white !important; } }
    </style>
</head>
<body>
<%
    List<Pagamento> pagamentos = (List<Pagamento>) request.getAttribute("pagamentos");
    BigDecimal totalReceita = (BigDecimal) request.getAttribute("totalReceita");
    BigDecimal totalPendente = (BigDecimal) request.getAttribute("totalPendente");
    Integer totalPagamentos = (Integer) request.getAttribute("totalPagamentos");
    Integer countPago = (Integer) request.getAttribute("countPago");
    Integer countPendente = (Integer) request.getAttribute("countPendente");
    String filterDataInicio = (String) request.getAttribute("filterDataInicio");
    String filterDataFim = (String) request.getAttribute("filterDataFim");
    String erro = (String) request.getAttribute("erro");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
%>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-university"></i> OJJ Académico</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fas fa-arrow-left"></i> Voltar</a>
                <a class="nav-link" href="#" onclick="window.print(); return false;"><i class="fas fa-print"></i> Imprimir</a>
            </div>
        </div>
    </nav>
    <div class="container my-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-white"><i class="fas fa-file-invoice-dollar"></i> Relatório Financeiro</h2>
                <p class="text-white-50">Visão geral dos pagamentos, receitas e valores pendentes.</p>
            </div>
        </div>

        <div class="report-card filter-card no-print mb-4">
            <form method="get" action="<%= request.getContextPath() %>/relatorios/financeiro">
                <div class="row g-3 align-items-end">
                    <div class="col-md-3">
                        <label class="form-label">Data Início</label>
                        <input type="date" class="form-control" name="dataInicio" value="<%= filterDataInicio != null ? filterDataInicio : "" %>">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Data Fim</label>
                        <input type="date" class="form-control" name="dataFim" value="<%= filterDataFim != null ? filterDataFim : "" %>">
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-filter"></i> Filtrar</button>
                        <a href="<%= request.getContextPath() %>/relatorios/financeiro" class="btn btn-secondary">Limpar</a>
                    </div>
                </div>
            </form>
        </div>

        <% if (erro != null) { %>
            <div class="alert alert-danger"><%= erro %></div>
        <% } %>

        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-receita">
                    <p>Receita Total</p>
                    <h3><%= totalReceita != null ? String.format("%,.2f", totalReceita) : "0.00" %> Kz</h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-pendente">
                    <p>Valor Pendente</p>
                    <h3><%= totalPendente != null ? String.format("%,.2f", totalPendente) : "0.00" %> Kz</h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-pagos">
                    <p>Pagamentos Efectuados</p>
                    <h3><%= countPago != null ? countPago : 0 %></h3>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="summary-card bg-total">
                    <p>Total de Operações</p>
                    <h3><%= totalPagamentos != null ? totalPagamentos : 0 %></h3>
                </div>
            </div>
        </div>

        <div class="report-card p-0">
            <div class="table-responsive">
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Data / Hora</th>
                            <th>Estudante</th>
                            <th>Tipo</th>
                            <th>Período</th>
                            <th>Valor Devido</th>
                            <th>Valor Pago</th>
                            <th>Multa</th>
                            <th>Método</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% if (pagamentos != null && !pagamentos.isEmpty()) {
                        for (Pagamento p : pagamentos) {
                            String statusClass = "PAGO".equalsIgnoreCase(p.getStatus()) ? "status-pago" :
                                                "PENDENTE".equalsIgnoreCase(p.getStatus()) ? "status-pendente" :
                                                "ATRASADO".equalsIgnoreCase(p.getStatus()) ? "status-atrasado" : "status-parcial";
                    %>
                        <tr>
                            <td><%= p.getDataPagamento() != null ? p.getDataPagamento().format(dtf) : "-" %></td>
                            <td><%= p.getNomeEstudante() != null ? p.getNomeEstudante() : "ID " + p.getIdEstudante() %></td>
                            <td><%= p.getTipoPagamento() != null ? p.getTipoPagamento() : "-" %></td>
                            <td><%= p.getPeriodoReferencia() != null ? p.getPeriodoReferencia() : "-" %></td>
                            <td><%= p.getValorDevido() != null ? String.format("%,.2f", p.getValorDevido()) : "-" %></td>
                            <td><%= p.getValorPago() != null ? String.format("%,.2f", p.getValorPago()) : "-" %></td>
                            <td><%= p.getMulta() != null && p.getMulta().compareTo(BigDecimal.ZERO) > 0 ? String.format("%,.2f", p.getMulta()) : "-" %></td>
                            <td><%= p.getMetodoPagamento() != null ? p.getMetodoPagamento() : "-" %></td>
                            <td class="<%= statusClass %>"><%= p.getStatus() %></td>
                        </tr>
                    <% }
                    } else { %>
                        <tr><td colspan="9" class="text-center p-4">Nenhum pagamento encontrado.</td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
