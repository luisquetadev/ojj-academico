<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Funcionario".equals(usuario.getTipoPerfil())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Funcionario - OJJ</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f5f7fb; }
        .topbar { background: linear-gradient(135deg, #667eea, #4a3580); color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .logo h2 { font-size: 22px; }
        .user-info { display: flex; align-items: center; gap: 15px; }
        .logout-btn { background: rgba(255,255,255,0.2); padding: 8px 15px; border-radius: 8px; color: white; text-decoration: none; }
        .logout-btn:hover { background: rgba(255,255,255,0.3); }
        .container { max-width: 1200px; margin: 0 auto; padding: 30px; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; margin-bottom: 40px; }
        .stat-card { background: white; padding: 25px; border-radius: 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); text-align: center; }
        .stat-card i { font-size: 40px; color: #667eea; margin-bottom: 15px; }
        .stat-card h3 { font-size: 28px; color: #333; }
        .stat-card p { color: #666; font-size: 14px; }
        .menu-title { font-size: 20px; color: #333; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #667eea; }
        .menu-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
        .menu-card { background: white; padding: 25px; border-radius: 15px; text-decoration: none; color: #333; transition: 0.3s; border: 1px solid #e0e0e0; display: block; }
        .menu-card:hover { background: linear-gradient(135deg, #667eea, #4a3580); color: white; transform: translateX(5px); }
        .menu-card i { font-size: 35px; margin-bottom: 10px; display: block; }
        .menu-card h4 { font-size: 16px; margin-bottom: 5px; }
        .menu-card p { font-size: 12px; opacity: 0.8; }
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2>OJJ Academico</h2>
        </div>
        <div class="user-info">
            <span>Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="logout" class="logout-btn">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="stats">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3>0</h3>
                <p>Total de Estudantes</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-chalkboard-user"></i>
                <h3>0</h3>
                <p>Total de Funcionarios</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-headset"></i>
                <h3>0</h3>
                <p>Atendimentos Hoje</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>0</h3>
                <p>Concluidos</p>
            </div>
        </div>
        
        <h3 class="menu-title">Modulos do Sistema</h3>
        <div class="menu-grid">
            <a href="#" class="menu-card">
                <i class="fas fa-user-graduate"></i>
                <h4>Gestao de Estudantes</h4>
                <p>Cadastrar, editar e listar</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-user-tie"></i>
                <h4>Gestao de Funcionarios</h4>
                <p>Gerenciar funcionarios</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-calendar-alt"></i>
                <h4>Registro de Atendimentos</h4>
                <p>Registrar novos atendimentos</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-history"></i>
                <h4>Historico</h4>
                <p>Consultar historico</p>
            </a>
        </div>
    </div>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</body>
</html>