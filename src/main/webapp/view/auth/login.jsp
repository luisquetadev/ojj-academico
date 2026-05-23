<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 16px;
            padding: 50px 40px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }
        
        .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo h1 {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .logo p {
            color: var(--secondary-color);
            font-size: 0.95rem;
            opacity: 0.8;
        }
        
        .login-badge {
            display: inline-block;
            background: rgba(49, 130, 206, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(49, 130, 206, 0.2);
            padding: 8px 20px;
            border-radius: 30px;
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--accent-color);
            margin-bottom: 25px;
            width: 100%;
            text-align: center;
        }
        
        .input-group {
            margin-bottom: 25px;
        }
        
        .input-group label {
            display: block;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }
        
        .input-icon {
            position: relative;
        }
        
        .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent-color);
            font-size: 1rem;
        }
        
        .input-icon input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }
        
        .input-icon input:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
            background: white;
        }
        
        .btn-login {
            width: 100%;
            padding: 14px;
            border-radius: 8px;
            background: var(--accent-color);
            color: white;
            border: none;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(49, 130, 206, 0.3);
        }
        
        .btn-login:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(49, 130, 206, 0.4);
        }
        
        .error-message {
            background: rgba(229, 62, 62, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(229, 62, 62, 0.3);
            border-radius: 8px;
            padding: 12px 15px;
            margin-bottom: 20px;
            color: var(--danger-color);
            font-size: 0.9rem;
            text-align: center;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }
        
        .footer p {
            color: var(--dark-color);
            font-size: 0.85rem;
            opacity: 0.7;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="logo">
                <h1><i class="fas fa-university"></i> OJJ Académico</h1>
                <p>Sistema de Gestão Académica</p>
            </div>
            
            <div class="login-badge">
                <i class="fas fa-lock"></i> Acesso ao Sistema
            </div>
            
            <% if(request.getAttribute("erro") != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
                </div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="input-group">
                    <label><i class="fas fa-user"></i> Email</label>
                    <div class="input-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="username" placeholder="Digite seu email" required>
                    </div>
                </div>
                
                <div class="input-group">
                    <label><i class="fas fa-lock"></i> Senha</label>
                    <div class="input-icon">
                        <i class="fas fa-key"></i>
                        <input type="password" name="password" placeholder="Digite sua senha" required>
                    </div>
                </div>
                
                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i> Entrar
                </button>
            </form>
            
            <div class="footer">
                <p>© 2026 OJJ Académico — Sistema de Gestão Académica</p>
                <p>Sistema profissional para gestão acadêmica</p>
            </div>
        </div>
    </div>
</body>
</html>