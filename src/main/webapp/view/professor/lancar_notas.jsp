<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, com.ojj.academico.model.Turma, com.ojj.academico.model.Disciplina" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Lançar Notas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/professor/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/turmas">
                            <i class="fas fa-chalkboard-teacher"></i> Minhas Turmas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/professor/lancar-notas">
                            <i class="fas fa-edit"></i> Lançar Notas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/pautas">
                            <i class="fas fa-list-alt"></i> Gestão Pautas
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/logout">
                            <i class="fas fa-sign-out-alt"></i> Sair
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card-custom mb-4">
            <h3 class="mb-4" style="color: var(--primary-color);">
                <i class="fas fa-edit"></i> Lançamento de Notas
            </h3>
            <p style="color: var(--dark-color); opacity: 0.7;">
                Selecione a turma, o tipo de avaliação e insira as notas dos estudantes.
            </p>
        </div>

        <% if (request.getAttribute("sucesso") != null) { %>
            <div class="alert alert-success alert-custom">
                <i class="fas fa-check-circle"></i> <%= request.getAttribute("sucesso") %>
            </div>
        <% } %>
        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger alert-custom">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <div class="card-custom mb-4">
            <form method="post" action="<%= request.getContextPath() %>/professor/lancar-notas">
                <input type="hidden" name="action" value="carregar">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-book"></i> Disciplina
                        </label>
                        <select name="idDisciplina" class="form-control form-control-custom" required>
                            <option value="">Selecione uma disciplina...</option>
                            <%
                                List<Disciplina> disciplinas = (List<Disciplina>) request.getAttribute("disciplinas");
                                Disciplina disciplinaSel = (Disciplina) request.getAttribute("disciplinaSelecionada");
                                Integer idDisciplinaAttr = (Integer) request.getAttribute("idDisciplina");
                                if (disciplinas != null) for (Disciplina d : disciplinas) {
                            %>
                                <option value="<%= d.getIdDisciplina() %>"
                                    <%= (disciplinaSel != null && disciplinaSel.getIdDisciplina() == d.getIdDisciplina()) || (idDisciplinaAttr != null && idDisciplinaAttr == d.getIdDisciplina()) ? "selected" : "" %>>
                                    <%= d.getNomeDisciplina() %> (<%= d.getCodigoDisciplina() %>)
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-chalkboard"></i> Turma
                        </label>
                        <select name="idTurma" class="form-control form-control-custom" required>
                            <option value="">Selecione uma turma...</option>
                            <% 
                                List<Turma> turmas = (List<Turma>) request.getAttribute("turmas");
                                Turma turmaSel = (Turma) request.getAttribute("turmaSelecionada");
                                if (turmas != null) for (Turma t : turmas) {
                            %>
                                <option value="<%= t.getIdTurma() %>"
                                    <%= (turmaSel != null && turmaSel.getIdTurma() == t.getIdTurma()) ? "selected" : "" %>>
                                    <%= t.getCodigoTurma() %> - <%= t.getTurno() %> (Ano <%= t.getAnoCurricular() %>)
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-tag"></i> Tipo
                        </label>
                        <select name="tipoAvaliacao" class="form-control form-control-custom" required>
                            <option value="">Tipo...</option>
                            <option value="MAC" <%= "MAC".equals(request.getAttribute("tipoAvaliacao")) ? "selected" : "" %>>MAC</option>
                            <option value="NPP" <%= "NPP".equals(request.getAttribute("tipoAvaliacao")) ? "selected" : "" %>>NPP</option>
                            <option value="EXAME" <%= "EXAME".equals(request.getAttribute("tipoAvaliacao")) ? "selected" : "" %>>Exame</option>
                            <option value="RECURSO" <%= "RECURSO".equals(request.getAttribute("tipoAvaliacao")) ? "selected" : "" %>>Recurso</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-calendar"></i> Data
                        </label>
                        <input type="date" name="dataAvaliacao" class="form-control form-control-custom"
                               value="<%= request.getAttribute("dataAvaliacao") != null ? request.getAttribute("dataAvaliacao") : "" %>">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-info-circle"></i> Descrição
                        </label>
                        <input type="text" name="descricao" class="form-control form-control-custom" 
                               placeholder="Ex: MAC 1 - Matemática"
                               value="<%= request.getAttribute("descricao") != null ? request.getAttribute("descricao") : "" %>">
                    </div>
                    <div class="col-12 text-end">
                        <button type="submit" class="btn btn-primary-custom">
                            <i class="fas fa-search"></i> Carregar Estudantes
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <% 
            List<Map<String, Object> > alunos = (List<Map<String, Object> >) request.getAttribute("alunos");
            if (alunos != null && !alunos.isEmpty()) {
        %>
        <div class="card-custom">
            <h4 class="mb-3" style="color: var(--primary-color);">
                <i class="fas fa-users"></i> 
                Estudantes - <%= turmaSel != null ? turmaSel.getCodigoTurma() : "" %>
                <span class="badge badge-custom badge-success float-end"><%= alunos.size() %> aluno(s)</span>
            </h4>
            <form method="post" action="<%= request.getContextPath() %>/professor/lancar-notas">
                <input type="hidden" name="action" value="salvar">
                <input type="hidden" name="idTurma" value="<%= turmaSel != null ? turmaSel.getIdTurma() : "" %>">
                <input type="hidden" name="idDisciplina" value="<%= idDisciplinaAttr != null ? idDisciplinaAttr : "" %>">
                <input type="hidden" name="tipoAvaliacao" value="<%= request.getAttribute("tipoAvaliacao") %>">
                <input type="hidden" name="descricao" value="<%= request.getAttribute("descricao") != null ? request.getAttribute("descricao") : "" %>">
                <input type="hidden" name="dataAvaliacao" value="<%= request.getAttribute("dataAvaliacao") != null ? request.getAttribute("dataAvaliacao") : "" %>">

                <div class="table-responsive">
                    <table class="table table-custom">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th style="width: 35%;">Estudante</th>
                                <th style="width: 15%;">Nº Estudante</th>
                                <th style="width: 15%;">Nota (0-20)</th>
                                <th style="width: 30%;">Observações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int idx = 0;
                                for (Map<String, Object> aluno : alunos) {
                            %>
                            <tr>
                                <td><%= idx + 1 %></td>
                                <td>
                                    <strong style="color: var(--primary-color);">
                                        <i class="fas fa-user-graduate"></i> <%= aluno.get("nomeCompleto") %>
                                    </strong>
                                </td>
                                <td><span class="badge badge-custom badge-success"><%= aluno.get("numeroEstudante") %></span></td>
                                <td>
                                    <input type="hidden" name="idEstudante" value="<%= aluno.get("idEstudante") %>">
                                    <input type="number" name="nota" class="form-control form-control-custom" 
                                           step="0.01" min="0" max="20" 
                                           placeholder="0.00" style="width: 100px;">
                                </td>
                                <td>
                                    <input type="text" name="observacao" class="form-control form-control-custom" 
                                           placeholder="Observação..." style="width: 100%;">
                                </td>
                            </tr>
                            <% 
                                    idx++;
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div class="text-end mt-3">
                    <button type="submit" class="btn btn-primary-custom">
                        <i class="fas fa-save"></i> Salvar Notas
                    </button>
                </div>
            </form>
        </div>
        <% } else if (alunos != null) { %>
            <div class="card-custom text-center">
                <i class="fas fa-user-slash" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
                <h4 style="color: var(--primary-color);">Nenhum estudante encontrado</h4>
                <p style="color: var(--dark-color); opacity: 0.7;">Esta turma não possui estudantes matriculados.</p>
            </div>
        <% } %>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
