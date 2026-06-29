<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ojj.academico.model.OperacaoLog" %>
<%@ page import="com.ojj.academico.util.OperacaoLogFormatter" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Histórico de Operações</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .log-item {
            border-left: 4px solid var(--primary-color);
            background: rgba(255, 255, 255, 0.05);
            margin-bottom: 10px;
            padding: 15px;
            border-radius: 0 8px 8px 0;
            transition: 0.3s;
        }
        .log-item:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }
        .log-date {
            font-size: 0.8rem;
            color: #aaa;
        }
        .log-type {
            font-weight: bold;
            color: var(--primary-color);
            font-size: 0.9rem;
        }
        .log-desc {
            margin-top: 5px;
            color: white;
        }
        .badge-sucesso { background-color: #28a745; }
        .badge-erro { background-color: #dc3545; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/dashboard/secretario">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/dashboard/secretario">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h3 style="color: white;"><i class="fas fa-history"></i> Meu Histórico de Atendimento</h3>
                <p style="color: #ccc;">Registro de todas as operações realizadas por si no sistema.</p>
                <hr style="border-color: rgba(255,255,255,0.2);">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <% 
                List<OperacaoLog> logs = (List<OperacaoLog>) request.getAttribute("logs");
                if (logs != null && !logs.isEmpty()) {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                    for (OperacaoLog log : logs) {
                %>
                    <div class="log-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <span class="log-type"><%= OperacaoLogFormatter.formatarOperacao(log.getTipoOperacao()) %></span>
                                <span class="badge <%= "SUCESSO".equals(log.getResultado()) ? "badge-sucesso" : "badge-erro" %> ms-2">
                                    <%= log.getResultado() %>
                                </span>
                            </div>
                            <span class="log-date"><i class="far fa-clock"></i> <%= log.getDataHora().format(formatter) %></span>
                        </div>
                        <div class="log-desc"><%= log.getDescricao() %></div>
                    </div>
                <% 
                    }
                } else { 
                %>
                    <div class="alert alert-info">
                        Nenhuma operação registrada no seu histórico até o momento.
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
