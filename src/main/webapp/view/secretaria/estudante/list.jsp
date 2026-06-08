<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Estudante" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Listagem de Estudantes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .badge-pago { background-color: #28a745; }
        .badge-pendente { background-color: #ffc107; color: #000; }
        .badge-atrasado { background-color: #dc3545; }
        .badge-nenhum { background-color: #6c757d; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="javascript:history.back()">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-6">
                <h3 style="color: white;"><i class="fas fa-users"></i> Consulta de Estudantes</h3>
                <p style="color: #ccc;">Visualize dados académicos e estado financeiro.</p>
            </div>
            <div class="col-md-6 text-end">
                <form action="<%= request.getContextPath() %>/admin/estudante/list" method="get" class="d-flex">
                    <input type="text" name="search" class="form-control-custom me-2" placeholder="Nome, Nº Estudante ou BI..." value="<%= request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm") : "" %>">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i> Filtrar
                    </button>
                </form>
            </div>
        </div>

        <div class="card-custom">
            <div class="card-body p-0">
                <% if(request.getAttribute("erro") != null) { %>
                    <div class="alert alert-danger m-3"><%= request.getAttribute("erro") %></div>
                <% } %>
                
                <div class="table-responsive">
                    <table class="table table-hover table-dark mb-0">
                        <thead>
                            <tr>
                                <th>Nº Estudante</th>
                                <th>Nome Completo</th>
                                <th>BI</th>
                                <th>Telemóvel</th>
                                <th>Estado Propina</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Estudante> estudantes = (List<Estudante>) request.getAttribute("estudantes");
                                Map<Integer, String> statusPropinas = (Map<Integer, String>) request.getAttribute("statusPropinas");
                                
                                if (estudantes != null && !estudantes.isEmpty()) {
                                    for (Estudante e : estudantes) {
                                        String status = statusPropinas.get(e.getIdEstudante());
                                        String badgeClass = "badge-nenhum";
                                        if ("PAGO".equals(status)) badgeClass = "badge-pago";
                                        else if ("PENDENTE".equals(status)) badgeClass = "badge-pendente";
                                        else if ("ATRASADO".equals(status)) badgeClass = "badge-atrasado";
                            %>
                            <tr>
                                <td><span class="fw-bold text-primary"><%= e.getNumeroEstudante() %></span></td>
                                <td><%= e.getNomeCompleto() %></td>
                                <td><%= e.getNumeroBi() %></td>
                                <td><%= e.getTelefone() %></td>
                                <td>
                                    <span class="badge <%= badgeClass %>">
                                        <%= status != null ? status : "NENHUM" %>
                                    </span>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="<%= request.getContextPath() %>/secretario/cartao-estudante?numeroEstudante=<%= e.getNumeroEstudante() %>" class="btn btn-sm btn-outline-light" title="Ver Cartão">
                                            <i class="fas fa-id-card"></i>
                                        </a>
                                        <a href="<%= request.getContextPath() %>/secretario/declaracao?numeroEstudante=<%= e.getNumeroEstudante() %>" class="btn btn-sm btn-outline-light" title="Gerar Declaração">
                                            <i class="fas fa-file-pdf"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="6" class="text-center py-4 text-muted">Nenhum estudante encontrado com os critérios informados.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
