<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Usuario" %>
<%@ page import="com.ojj.academico.service.EstudanteService" %>
<%@ page import="com.ojj.academico.service.FuncionarioService" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    EstudanteService service = new EstudanteService();
    FuncionarioService funcionarioService = new FuncionarioService();
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        
        .topbar .logo h2 {
            color: var(--primary-color);
            font-size: 1.5rem;
            margin: 0;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .user-info span {
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .logout-btn {
            padding: 8px 20px;
            background: var(--accent-color);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .logout-btn:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .stat-card i {
            font-size: 2.5rem;
            color: white;
            margin-bottom: 15px;
        }
        
        .stat-card h3 {
            font-size: 2rem;
            font-weight: 700;
            color: white;
            margin-bottom: 5px;
        }
        
        .stat-card p {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.9rem;
        }
        
        .menu-title {
            color: white;
            font-size: 1.5rem;
            margin-bottom: 25px;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }
        
        .menu-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            padding: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .menu-card i {
            font-size: 2.5rem;
            color: var(--accent-color);
            margin-bottom: 15px;
        }
        
        .menu-card h4 {
            color: var(--primary-color);
            font-size: 1.2rem;
            margin-bottom: 10px;
        }
        
        .menu-card p {
            color: var(--dark-color);
            opacity: 0.7;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2><i class="fas fa-university"></i> OJJ Académico</h2>
        </div>
        <div class="user-info">
            <span>Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="stats">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3><%= service.contarEstudantes() %></h3>
                <p>Total de Estudantes</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-chalkboard-user"></i>
                <h3><%= funcionarioService.contarFuncionarios() %></h3>
                <p>Total de Funcionarios</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-headset"></i>
                <h3>10</h3>
                <p>Atendimentos Hoje</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>0</h3>
                <p>Concluidos</p>
            </div>
        </div>
        
        <h3 class="menu-title">Módulos do Sistema</h3>
        <div class="menu-grid">
            <a href="#" class="menu-card">
                <i class="fas fa-user-graduate"></i>
                <h4>Gestão de Estudantes</h4>
                <p>Cadastrar, editar e listar</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-user-tie"></i>
                <h4>Gestão de Funcionarios</h4>
                <p>Gerenciar funcionarios</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-calendar-alt"></i>
                <h4>Registro de Atendimentos</h4>
                <p>Registrar novos atendimentos</p>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-history"></i>
                <h4>Histórico</h4>
                <p>Consultar histórico</p>
            </a>
        </div>
    </div>
</body>
</html>