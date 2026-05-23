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
        
        .welcome-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 16px;
            padding: 40px;
            margin-bottom: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .welcome-card h1 {
            color: var(--primary-color);
            font-size: 2rem;
            margin-bottom: 15px;
        }
        
        .welcome-card p {
            color: var(--dark-color);
            opacity: 0.8;
            line-height: 1.6;
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
        
        .menu-card h3 {
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
            <span><i class="fas fa-user"></i> Bem-vindo, <%= usuario.getUsername() %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="welcome-card">
            <h1><i class="fas fa-graduation-cap"></i> Olá, Estudante!</h1>
            <p>Bem-vindo ao Sistema Académico da Universidade OJJ. Aqui você pode acompanhar seus atendimentos e solicitações.</p>
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