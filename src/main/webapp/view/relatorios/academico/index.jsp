<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>OJJ Académico • Relatório Académico</title>
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
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </nav>
    <div class="container mt-4 text-center">
        <div class="card-custom py-5">
            <i class="fas fa-graduation-cap fa-5x mb-3" style="color: white;"></i>
            <h2 style="color: white;">Relatório Académico</h2>
            <p style="color: rgba(255, 255, 255, 0.8);">Funcionalidade em desenvolvimento.</p>
        </div>
    </div>
</body>
</html>
