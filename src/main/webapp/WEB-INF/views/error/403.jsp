<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Acesso Negado</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <div class="error-wrapper">
        <div class="error-card animate-slide-up">
            <div class="error-icon">
                <i class="fas fa-lock"></i>
            </div>
            <h2>403</h2>
            <h3>Acesso Negado</h3>
            <p>Você não tem permissão para aceder a esta área do sistema.</p>
            <a href="<%= request.getContextPath() %>/" class="btn btn-primary-custom">
                <i class="fas fa-home"></i> Voltar ao Início
            </a>
        </div>
    </div>
</body>
</html>
