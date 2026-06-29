<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.math.BigDecimal, com.ojj.academico.model.*" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Gestão de Pautas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        @media print {
            .no-print { display: none !important; }
            body { background: white; }
            .card-custom { box-shadow: none; border: 1px solid #ddd; }
        }
        .nota-cell { text-align: center; font-weight: 600; min-width: 70px; }
        .nota-cell input { width: 70px; text-align: center; }
        .nota-vazia { color: #999; font-style: italic; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom no-print">
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
                        <a class="nav-link" href="<%= request.getContextPath() %>/professor/lancar-notas">
                            <i class="fas fa-edit"></i> Lançar Notas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/professor/pautas">
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
        <div class="card-custom mb-4 no-print">
            <h3 class="mb-4" style="color: var(--primary-color);">
                <i class="fas fa-list-alt"></i> Gestão de Pautas
            </h3>
            <p style="color: var(--dark-color); opacity: 0.7;">
                Visualize, edite e imprima as pautas de avaliação por turma e disciplina.
            </p>
        </div>

        <% if (request.getAttribute("sucesso") != null) { %>
            <div class="alert alert-success alert-custom no-print">
                <i class="fas fa-check-circle"></i> <%= request.getAttribute("sucesso") %>
            </div>
        <% } %>
        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger alert-custom no-print">
                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <div class="card-custom mb-4 no-print">
            <form method="post" action="<%= request.getContextPath() %>/professor/pautas">
                <input type="hidden" name="action" value="carregar">
                <div class="row g-3">
                    <div class="col-md-5">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-book"></i> Disciplina
                        </label>
                        <select name="idDisciplina" class="form-control form-control-custom" required>
                            <option value="">Selecione...</option>
                            <%
                                List<Disciplina> disciplinas = (List<Disciplina>) request.getAttribute("disciplinas");
                                Disciplina disciplinaSel = (Disciplina) request.getAttribute("disciplinaSelecionada");
                                if (disciplinas != null) for (Disciplina d : disciplinas) {
                            %>
                                <option value="<%= d.getIdDisciplina() %>"
                                    <%= (disciplinaSel != null && disciplinaSel.getIdDisciplina() == d.getIdDisciplina()) ? "selected" : "" %>>
                                    <%= d.getNomeDisciplina() %> (<%= d.getCodigoDisciplina() %>)
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <label class="form-label" style="color: var(--primary-color); font-weight: 600;">
                            <i class="fas fa-chalkboard"></i> Turma
                        </label>
                        <select name="idTurma" class="form-control form-control-custom" required>
                            <option value="">Selecione...</option>
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
                    <div class="col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary-custom w-100">
                            <i class="fas fa-search"></i> Carregar
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <%
            List<Avaliacao> avaliacoes = (List<Avaliacao>) request.getAttribute("avaliacoes");
            List<Map<String, Object> > alunos = (List<Map<String, Object> >) request.getAttribute("alunos");
            Boolean modoEdicao = (Boolean) request.getAttribute("modoEdicao");
            if (modoEdicao == null) modoEdicao = false;

            if (avaliacoes != null && alunos != null && !avaliacoes.isEmpty() && !alunos.isEmpty()) {
        %>
        <div class="card-custom">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 style="color: var(--primary-color); margin: 0;">
                    <i class="fas fa-file-alt"></i> 
                    Pauta: <%= turmaSel != null ? turmaSel.getCodigoTurma() : "" %> - 
                    <%= disciplinaSel != null ? disciplinaSel.getNomeDisciplina() : "" %>
                </h4>
                <div class="no-print">
                    <% if (!modoEdicao) { %>
                        <form method="post" action="<%= request.getContextPath() %>/professor/pautas" style="display:inline;">
                            <input type="hidden" name="action" value="editar">
                            <input type="hidden" name="idTurma" value="<%= turmaSel != null ? turmaSel.getIdTurma() : "" %>">
                            <input type="hidden" name="idDisciplina" value="<%= disciplinaSel != null ? disciplinaSel.getIdDisciplina() : "" %>">
                            <button type="submit" class="btn btn-warning-custom">
                                <i class="fas fa-edit"></i> Editar
                            </button>
                        </form>
                        <button onclick="window.print()" class="btn btn-secondary-custom">
                            <i class="fas fa-print"></i> Imprimir
                        </button>
                    <% } %>
                </div>
            </div>

            <div class="table-responsive">
                <form method="post" action="<%= request.getContextPath() %>/professor/pautas" id="formPauta">
                    <input type="hidden" name="action" value="salvar">
                    <input type="hidden" name="idTurma" value="<%= turmaSel != null ? turmaSel.getIdTurma() : "" %>">
                    <input type="hidden" name="idDisciplina" value="<%= disciplinaSel != null ? disciplinaSel.getIdDisciplina() : "" %>">

                    <table class="table table-custom table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th style="width: 20%;">Estudante</th>
                                <th style="width: 8%;">Nº</th>
                                <% for (Avaliacao a : avaliacoes) { %>
                                    <th class="nota-cell" style="min-width: 80px;">
                                        <%= a.getTipo() %><br>
                                        <small style="font-weight:normal; font-size:0.75rem;"><%= a.getDescricao() != null && a.getDescricao().length() > 15 ? a.getDescricao().substring(0, 15) + "..." : a.getDescricao() != null ? a.getDescricao() : "" %></small>
                                    </th>
                                <% } %>
                                <th class="nota-cell" style="min-width: 60px; background: #e8f5e9;">Média</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int idx = 0;
                                for (Map<String, Object> aluno : alunos) {
                                    int idEstudante = (int) aluno.get("idEstudante");
                                    Map<Integer, Map<String, Object> > notasMap = (Map<Integer, Map<String, Object> >) aluno.get("notas");
                                    double soma = 0;
                                    int count = 0;
                            %>
                            <tr>
                                <td><%= ++idx %></td>
                                <td><strong><%= aluno.get("nomeCompleto") %></strong></td>
                                <td><%= aluno.get("numeroEstudante") %></td>
                                <%
                                    for (Avaliacao a : avaliacoes) {
                                        Map<String, Object> notaInfo = notasMap.get(a.getIdAvaliacao());
                                        BigDecimal notaVal = notaInfo != null && notaInfo.get("nota") != null ? (BigDecimal) notaInfo.get("nota") : null;
                                        Integer idNota = notaInfo != null && notaInfo.get("idNota") != null ? (Integer) notaInfo.get("idNota") : null;
                                        String obs = notaInfo != null && notaInfo.get("observacao") != null ? (String) notaInfo.get("observacao") : "";
                                %>
                                <td class="nota-cell">
                                    <% if (modoEdicao) { %>
                                        <input type="hidden" name="idAvaliacao" value="<%= a.getIdAvaliacao() %>">
                                        <input type="hidden" name="idEstudante" value="<%= idEstudante %>">
                                        <input type="hidden" name="idNota" value="<%= idNota != null ? idNota : "" %>">
                                        <input type="number" name="nota" class="form-control form-control-custom"
                                               step="0.01" min="0" max="20"
                                               value="<%= notaVal != null ? notaVal : "" %>"
                                               placeholder="-"
                                               style="width: 70px; text-align: center; display: inline;">
                                        <input type="text" name="observacao" value="<%= obs %>" placeholder="obs" style="display:none;">
                                    <% } else { %>
                                        <%= notaVal != null ? notaVal : "<span class='nota-vazia'>-</span>" %>
                                        <% if (notaVal != null) { soma += notaVal.doubleValue(); count++; } %>
                                    <% } %>
                                </td>
                                <% } %>
                                <td class="nota-cell" style="background: #e8f5e9; font-weight: 700;">
                                    <%= count > 0 ? String.format("%.2f", soma / count) : "-" %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <% if (modoEdicao) { %>
                        <div class="text-end mt-3 no-print">
                            <a href="<%= request.getContextPath() %>/professor/pautas" class="btn btn-secondary-custom">
                                <i class="fas fa-times"></i> Cancelar
                            </a>
                            <button type="submit" class="btn btn-success-custom">
                                <i class="fas fa-save"></i> Salvar Alterações
                            </button>
                        </div>
                    <% } %>
                </form>
            </div>
        </div>
        <% } else if (avaliacoes != null && alunos != null && !alunos.isEmpty()) { %>
            <div class="card-custom text-center">
                <i class="fas fa-info-circle" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
                <h4 style="color: var(--primary-color);">Nenhuma avaliação encontrada</h4>
                <p>Não existem avaliações registadas para esta disciplina. Crie avaliações na página de Lançamento de Notas.</p>
            </div>
        <% } else if (avaliacoes != null) { %>
            <div class="card-custom text-center">
                <i class="fas fa-user-slash" style="font-size: 3rem; color: var(--warning-color); margin-bottom: 15px;"></i>
                <h4 style="color: var(--primary-color);">Nenhum estudante encontrado</h4>
                <p>Esta turma não possui estudantes matriculados ou não existem avaliações para esta disciplina.</p>
            </div>
        <% } %>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
