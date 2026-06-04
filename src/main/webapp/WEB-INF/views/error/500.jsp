<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Erro Interno</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="container text-center">
        <div class="card-custom mx-auto" style="max-width: 600px;">
            <i class="fas fa-bug fa-5x text-danger mb-4"></i>
            <h1 class="display-4 fw-bold mb-3" style="color: var(--primary-color);">500</h1>
            <h3 class="mb-4" style="color: var(--secondary-color);">Erro Interno do Servidor</h3>
            <p class="text-muted mb-4">Ocorreu um erro inesperado. Nossa equipa técnica já foi notificada.</p>
            
            <% if (exception != null) { %>
                <div class="alert alert-danger text-start mb-4" style="font-size: 0.85rem; overflow-x: auto;">
                    <strong>Detalhes do erro:</strong><br>
                    <%= exception.getMessage() %>
                </div>
            <% } %>

            <a href="<%= request.getContextPath() %>/" class="btn-primary-custom">
                <i class="fas fa-home me-2"></i> Voltar ao Início
            </a>
        </div>
    </div>
</body>
</html>
