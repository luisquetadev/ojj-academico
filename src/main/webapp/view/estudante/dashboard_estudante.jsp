<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Estudante".equals(usuario.getTipoPerfil())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard • Estudante OJJ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
        }
        
        .topbar {
            background: linear-gradient(135deg, #667eea, #4a3580);
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo h2 {
            font-size: 22px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logout-btn {
            background: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 8px;
            color: white;
            text-decoration: none;
        }
        
        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
        }
        
        .welcome-card {
            background: linear-gradient(135deg, #667eea, #4a3580);
            color: white;
            padding: 35px;
            border-radius: 20px;
            margin-bottom: 30px;
        }
        
        .welcome-card h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }
        
        .menu-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-decoration: none;
            color: #333;
            text-align: center;
            transition: 0.3s;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            background: linear-gradient(135deg, #667eea, #4a3580);
            color: white;
        }
        
        .menu-card i {
            font-size: 50px;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .menu-card:hover i {
            color: white;
        }
        
        .menu-card h3 {
            font-size: 18px;
            margin-bottom: 8px;
        }
        
        .menu-card p {
            font-size: 13px;
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">
            <h2>🏛️ OJJ Acadêmico</h2>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user"></i> Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="welcome-card">
            <h1><i class="fas fa-graduation-cap"></i> Olá, Estudante!</h1>
            <p>Bem-vindo ao Sistema Acadêmico da Universidade OJJ. Aqui você pode acompanhar seus atendimentos e solicitações.</p>
        </div>
        
        <div class="menu-grid">
            <a href="#" class="menu-card">
                <i class="fas fa-user-circle"></i>
                <div>
                    <h3>Meus Dados</h3>
                    <p>Consultar e atualizar informações pessoais</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-headset"></i>
                <div>
                    <h3>Solicitar Atendimento</h3>
                    <p>Abrir novo atendimento ou solicitação</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-history"></i>
                <div>
                    <h3>Meu Histórico</h3>
                    <p>Visualizar todos os seus atendimentos</p>
                </div>
            </a>
            <a href="#" class="menu-card">
                <i class="fas fa-book"></i>
                <div>
                    <h3>Matrícula</h3>
                    <p>Informações sobre sua matrícula</p>
                </div>
            </a>
        </div>
    </div>
</body>
</html>