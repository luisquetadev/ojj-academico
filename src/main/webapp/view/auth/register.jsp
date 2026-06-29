<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Cadastro</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .register-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .register-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 16px;
            padding: 50px 40px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }
        
        .register-card h1 {
            color: var(--primary-color);
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        .input-group label {
            display: block;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }
        
        .input-group input,
        .input-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }
        
        .input-group input:focus,
        .input-group select:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
            background: white;
        }
        
        .btn-register {
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
        
        .btn-register:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(49, 130, 206, 0.4);
        }
        
        .link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-card">
            <h1><i class="fas fa-user-plus"></i> Cadastro de Usuário</h1>
            
            <% if(request.getAttribute("erro") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("erro") %>
                </div>
            <% } else if(request.getAttribute("mensagem") != null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("mensagem") %>
                </div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/register" method="post">
                <div class="input-group">
                    <label for="username">Email</label>
                    <input type="text" id="username" name="username" placeholder="Digite seu email" required>
                </div>
                <div class="input-group">
                    <label for="password">Senha</label>
                    <input type="password" id="password" name="password" placeholder="Digite sua senha" required>
                </div>
                <div class="input-group">
                    <label for="tipoPerfil">Perfil</label>
                    <select id="tipoPerfil" name="tipoPerfil" required>
                        <option value="">Selecione</option>
                        <option value="Estudante">Estudante</option>
                        <option value="Funcionario">Funcionário</option>
                        <option value="Administrador">Administrador</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="idRef">Referência (id)</label>
                    <input type="number" id="idRef" name="idRef" min="0" value="0">
                </div>
                <button class="btn-register" type="submit">
                    <i class="fas fa-user-plus"></i> Cadastrar
                </button>
            </form>
            <a class="link" href="<%= request.getContextPath() %>/login">
                <i class="fas fa-arrow-left"></i> Voltar ao Login
            </a>
        </div>
    </div>
</body>
</html>
