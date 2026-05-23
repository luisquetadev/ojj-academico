<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Sistema de Gestão Académica</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
            --primary-color: #1e3a5f;
            --secondary-color: #2c5282;
            --accent-color: #3182ce;
            --light-color: #f7fafc;
            --dark-color: #1a202c;
            --glass-bg: rgba(255, 255, 255, 0.95);
            --glass-border: rgba(255, 255, 255, 0.3);
            --glass-shadow: rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3a5f 0%, #2c5282 50%, #3182ce 100%);
            background-size: 100% 100%;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }
        
        .navbar-custom {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            transition: all 0.3s ease;
        }
        
        .navbar-custom:hover {
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.15);
        }
        
        .navbar-brand {
            color: var(--primary-color) !important;
            font-weight: 700;
            font-size: 1.5rem;
        }
        
        .nav-link {
            color: var(--primary-color) !important;
            font-weight: 600;
            padding: 10px 20px !important;
            border-radius: 8px;
            transition: all 0.3s ease;
            background: rgba(49, 130, 206, 0.1);
        }
        
        .nav-link:hover {
            background: rgba(49, 130, 206, 0.2);
            transform: translateY(-2px);
        }
        
        .hero-section {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 80px 20px 40px;
            position: relative;
        }
        
        .hero-content {
            text-align: center;
            color: white;
            max-width: 1200px;
            position: relative;
            z-index: 1;
        }
        
        .hero-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 8px 24px;
            border-radius: 30px;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 30px;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 25px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            line-height: 1.2;
        }
        
        .hero-subtitle {
            font-size: 1.6rem;
            margin-bottom: 30px;
            opacity: 0.95;
            font-weight: 300;
        }
        
        .hero-description {
            font-size: 1.1rem;
            margin-bottom: 50px;
            opacity: 0.9;
            line-height: 1.8;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .btn-login {
            padding: 16px 45px;
            font-size: 1.2rem;
            border-radius: 8px;
            background: white;
            color: var(--primary-color);
            border: none;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: 700;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }
        
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            background: var(--light-color);
        }
        
        .stats-section {
            margin-top: 80px;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
            margin-bottom: 60px;
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
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: white;
        }
        
        .stat-label {
            font-size: 0.95rem;
            opacity: 0.9;
            font-weight: 500;
            color: white;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 60px;
        }
        
        .feature-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            padding: 35px 30px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: var(--accent-color);
            transition: transform 0.3s ease;
        }
        
        .feature-card:hover .feature-icon {
            transform: scale(1.1);
        }
        
        .feature-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .feature-text {
            color: var(--dark-color);
            font-size: 0.95rem;
            line-height: 1.6;
            opacity: 0.8;
        }
        
        .feature-list {
            margin-top: 15px;
            text-align: left;
            padding-left: 20px;
        }
        
        .feature-list li {
            color: var(--dark-color);
            margin-bottom: 8px;
            font-size: 0.9rem;
            opacity: 0.7;
        }
        
        .feature-list li::marker {
            color: var(--accent-color);
        }
        
        .footer {
            margin-top: 80px;
            padding: 30px;
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
        }
        
        .footer a {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.3rem;
            }
            
            .hero-description {
                font-size: 1rem;
            }
            
            .btn-login {
                padding: 14px 35px;
                font-size: 1.1rem;
            }
            
            .features-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 480px) {
            .hero-title {
                font-size: 2rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar com login no canto superior -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-content">
            <div class="hero-badge">
                <i class="fas fa-graduation-cap"></i> Sistema de Gestão Académica
            </div>
            
            <h1 class="hero-title">
                Bem-vindo ao OJJ Académico
            </h1>
            
            <p class="hero-subtitle">Plataforma completa para gestão acadêmica</p>
            
            <p class="hero-description">
                Sistema integrado para gerenciar estudantes, funcionários, cursos, matrículas, 
                propinas e muito mais. Solução profissional para instituições de ensino superior.
            </p>
            
            <a href="<%= request.getContextPath() %>/login" class="btn-login">
                <i class="fas fa-sign-in-alt"></i> Acessar Sistema
            </a>
            
            <!-- Stats Section -->
            <div class="stats-section">
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-number">32+</div>
                        <div class="stat-label">Telas do Sistema</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">10</div>
                        <div class="stat-label">Módulos Integrados</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">7</div>
                        <div class="stat-label">Tipos de Utilizadores</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Seguro com BCrypt</div>
                    </div>
                </div>
            </div>
            
            <!-- Features Grid -->
            <div class="features-grid">
                <div class="feature-card">
                    <i class="fas fa-user-graduate feature-icon"></i>
                    <h3 class="feature-title">Gestão de Estudantes</h3>
                    <p class="feature-text">Sistema completo para cadastro e gestão de estudantes com histórico acadêmico detalhado.</p>
                    <ul class="feature-list">
                        <li>Cadastro completo</li>
                        <li>Histórico acadêmico</li>
                        <li>Matrículas e trancamentos</li>
                    </ul>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-users feature-icon"></i>
                    <h3 class="feature-title">Gestão de Funcionários</h3>
                    <p class="feature-text">Controle total do corpo docente e administrativo com perfis e permissões personalizadas.</p>
                    <ul class="feature-list">
                        <li>Professores e staff</li>
                        <li>Gestão de perfis</li>
                        <li>Controle de acesso</li>
                    </ul>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-book feature-icon"></i>
                    <h3 class="feature-title">Cursos e Turmas</h3>
                    <p class="feature-text">Organização inteligente de cursos, disciplinas e turmas com planejamento curricular integrado.</p>
                    <ul class="feature-list">
                        <li>Gestão de cursos</li>
                        <li>Disciplinas</li>
                        <li>Turmas e horários</li>
                    </ul>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-money-bill-wave feature-icon"></i>
                    <h3 class="feature-title">Gestão Financeira</h3>
                    <p class="feature-text">Controle completo de propinas, pagamentos e relatórios financeiros em tempo real.</p>
                    <ul class="feature-list">
                        <li>Propinas</li>
                        <li>Pagamentos</li>
                        <li>Relatórios financeiros</li>
                    </ul>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-chalkboard-teacher feature-icon"></i>
                    <h3 class="feature-title">Gestão de Aulas</h3>
                    <p class="feature-text">Ferramentas para professores gerenciarem turmas, lançarem notas e gerenciarem pautas.</p>
                    <ul class="feature-list">
                        <li>Gestão de turmas</li>
                        <li>Lançamento de notas</li>
                        <li>Gestão de pautas</li>
                    </ul>
                </div>
                
                <div class="feature-card">
                    <i class="fas fa-chart-line feature-icon"></i>
                    <h3 class="feature-title">Relatórios Avançados</h3>
                    <p class="feature-text">Relatórios detalhados de estudantes, financeiro e acadêmico para tomada de decisões.</p>
                    <ul class="feature-list">
                        <li>Relatórios estudantis</li>
                        <li>Relatórios financeiros</li>
                        <li>Relatórios acadêmicos</li>
                    </ul>
                </div>
            </div>
            
            <!-- Footer -->
            <div class="footer">
                <p>© 2026 <a href="#">OJJ Académico</a> — Sistema de Gestão Académica</p>
                <p style="margin-top: 10px; opacity: 0.7;">Sistema profissional para gestão acadêmica</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
