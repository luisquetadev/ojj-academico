<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Utilizador" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Gestão de Utilizadores</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
                <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 style="color: white;"><i class="fas fa-users-cog"></i> Gestão de Utilizadores</h2>
        </div>

        <div class="card-custom">
            <div class="card-body">
                <table class="table table-custom table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Perfil</th>
                            <th>Status</th>
                            <th>Último Acesso</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Utilizador> utilizadores = (List<Utilizador>) request.getAttribute("utilizadores");
                            if (utilizadores != null && !utilizadores.isEmpty()) {
                                for (Utilizador u : utilizadores) {
                                    String perfil = "";
                                    switch(u.getIdPerfil()) {
                                        case 1: perfil = "ADMIN"; break;
                                        case 2: perfil = "SECRETARIA"; break;
                                        case 3: perfil = "TESOURARIA"; break;
                                        case 4: perfil = "DOCENTE"; break;
                                        case 5: perfil = "COORDENADOR"; break;
                                        case 6: perfil = "DIRECTOR"; break;
                                        case 7: perfil = "ESTUDANTE"; break;
                                        default: perfil = "DESCONHECIDO";
                                    }
                        %>
                        <tr>
                            <td><%= u.getIdUtilizador() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><span class="badge bg-secondary"><%= perfil %></span></td>
                            <td>
                                <% if("ATIVO".equals(u.getStatus())) { %>
                                    <span class="badge bg-success">ATIVO</span>
                                <% } else { %>
                                    <span class="badge bg-danger"><%= u.getStatus() != null ? u.getStatus() : "INATIVO" %></span>
                                <% } %>
                            </td>
                            <td><%= u.getDataUltimoAcesso() != null ? u.getDataUltimoAcesso() : "Nunca" %></td>
                            <td>
                                <button class="btn btn-sm btn-warning" title="Bloquear/Desbloquear">
                                    <i class="fas fa-user-lock"></i>
                                </button>
                                <button class="btn btn-sm btn-danger" title="Reset Senha">
                                    <i class="fas fa-key"></i>
                                </button>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center">Nenhum utilizador encontrado</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
