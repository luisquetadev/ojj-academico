<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo Academico - OJJ Academico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
</head>
<body>
<main class="dashboard-container">
    <section class="dashboard-header">
        <div>
            <span class="dashboard-kicker">Administracao</span>
            <h1>Catalogo Academico</h1>
            <p>Dados carregados diretamente da base de dados academica.</p>
        </div>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Voltar</a>
    </section>

    <section class="dashboard-card">
        <c:choose>
            <c:when test="${entityType == 'curso'}">
                <h2>Cursos</h2>
                <table class="data-table">
                    <thead>
                    <tr><th>Codigo</th><th>Nome</th><th>Grau</th><th>Regime</th><th>Duracao</th><th>Propina</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach var="curso" items="${cursos}">
                        <tr>
                            <td>${curso.codigoCurso}</td>
                            <td>${curso.nomeCurso}</td>
                            <td>${curso.grau}</td>
                            <td>${curso.regime}</td>
                            <td>${curso.duracaoAnos} anos</td>
                            <td>${curso.propinaMensal}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:when test="${entityType == 'disciplina'}">
                <h2>Disciplinas</h2>
                <table class="data-table">
                    <thead>
                    <tr><th>Codigo</th><th>Nome</th><th>Carga horaria</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach var="disciplina" items="${disciplinas}">
                        <tr>
                            <td>${disciplina.codigoDisciplina}</td>
                            <td>${disciplina.nomeDisciplina}</td>
                            <td>${disciplina.cargaHoraria}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h2>Turmas</h2>
                <table class="data-table">
                    <thead>
                    <tr><th>Codigo</th><th>Curso</th><th>Turno</th><th>Ano</th><th>Inscritos</th><th>Capacidade</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach var="turma" items="${turmas}">
                        <tr>
                            <td>${turma.codigoTurma}</td>
                            <td>${turma.idCurso}</td>
                            <td>${turma.turno}</td>
                            <td>${turma.anoCurricular}</td>
                            <td>${turma.estudantesInscritos}</td>
                            <td>${turma.capacidadeMaxima}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </section>
</main>
</body>
</html>
