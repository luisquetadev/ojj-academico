<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plano Curricular - OJJ Academico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
</head>
<body>
<main class="dashboard-container">
    <section class="dashboard-header">
        <div>
            <span class="dashboard-kicker">Administracao</span>
            <c:choose>
                <c:when test="${not empty curso}">
                    <h1>Plano Curricular: ${curso.nomeCurso}</h1>
                    <p>Gerir as disciplinas do curso por ano e semestre.</p>
                </c:when>
                <c:otherwise>
                    <h1>Planos Curriculares</h1>
                    <p>Selecione um curso para gerir o seu plano curricular.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div>
            <c:if test="${not empty curso}">
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/plano-curricular">Todos os Cursos</a>
            </c:if>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Voltar</a>
        </div>
    </section>

    <c:if test="${not empty mensagem}">
        <div class="alert alert-success">${mensagem}</div>
    </c:if>
    <c:if test="${not empty erro}">
        <div class="alert alert-danger">${erro}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty curso}">
            <section class="dashboard-card">
                <h2>Adicionar Novo Periodo ao Plano</h2>
                <form method="post" class="form-grid form-inline" style="display:flex; gap:1rem; align-items:flex-end; flex-wrap:wrap;">
                    <input type="hidden" name="action" value="addPlano">
                    <input type="hidden" name="cursoId" value="${curso.idCurso}">
                    <label>
                        Ano Curricular
                        <input type="number" name="anoCurricular" min="1" max="10" required>
                    </label>
                    <label>
                        Semestre
                        <select name="semestre" required>
                            <option value="1">1 Semestre</option>
                            <option value="2">2 Semestre</option>
                        </select>
                    </label>
                    <label>
                        Carga Horaria
                        <input type="number" name="cargaHoraria" min="0">
                    </label>
                    <button type="submit" class="btn btn-primary">Adicionar</button>
                </form>
            </section>

            <c:forEach var="plano" items="${planos}">
                <section class="dashboard-card">
                    <div style="display:flex; justify-content:space-between; align-items:center;">
                        <h2>${plano.anoCurricular} Ano - ${plano.semestre} Semestre</h2>
                        <div style="display:flex; gap:0.5rem;">
                            <form method="post" style="display:inline;" onsubmit="return confirm('Remover este periodo?');">
                                <input type="hidden" name="action" value="deletePlano">
                                <input type="hidden" name="cursoId" value="${curso.idCurso}">
                                <input type="hidden" name="idPlanoCurricular" value="${plano.idPlanoCurricular}">
                                <button type="submit" class="btn btn-danger btn-sm">Remover Periodo</button>
                            </form>
                        </div>
                    </div>

                    <c:set var="disciplinas" value="${disciplinasPorPlano[plano.idPlanoCurricular]}" />
                    <table class="data-table">
                        <thead>
                        <tr><th>Codigo</th><th>Disciplina</th><th>Carga Horaria</th><th>Accao</th></tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty disciplinas}">
                                <c:forEach var="disc" items="${disciplinas}">
                                    <tr>
                                        <td>${disc.codigoDisciplina}</td>
                                        <td>${disc.nomeDisciplina}</td>
                                        <td>${disc.cargaHoraria}</td>
                                        <td>
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="removeDisciplina">
                                                <input type="hidden" name="cursoId" value="${curso.idCurso}">
                                                <input type="hidden" name="idPlanoCurricular" value="${plano.idPlanoCurricular}">
                                                <input type="hidden" name="idDisciplina" value="${disc.idDisciplina}">
                                                <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="text-center text-muted">Nenhuma disciplina associada a este periodo.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>

                    <details style="margin-top:0.5rem;">
                        <summary style="cursor:pointer; color:var(--primary); font-weight:600;">Adicionar Disciplina</summary>
                        <form method="post" class="form-grid form-inline" style="display:flex; gap:0.5rem; align-items:flex-end; flex-wrap:wrap; margin-top:0.5rem;">
                            <input type="hidden" name="action" value="addDisciplina">
                            <input type="hidden" name="cursoId" value="${curso.idCurso}">
                            <input type="hidden" name="idPlanoCurricular" value="${plano.idPlanoCurricular}">
                            <label>
                                Disciplina
                                <select name="idDisciplina" required>
                                    <option value="">Selecionar...</option>
                                    <c:forEach var="disc" items="${todasDisciplinas}">
                                        <c:set var="jaAssociada" value="false" />
                                        <c:if test="${not empty disciplinas}">
                                            <c:forEach var="assoc" items="${disciplinas}">
                                                <c:if test="${assoc.idDisciplina == disc.idDisciplina}">
                                                    <c:set var="jaAssociada" value="true" />
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${!jaAssociada}">
                                            <option value="${disc.idDisciplina}">${disc.codigoDisciplina} - ${disc.nomeDisciplina}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </label>
                            <button type="submit" class="btn btn-primary btn-sm">Adicionar</button>
                        </form>
                    </details>
                </section>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <section class="dashboard-card">
                <h2>Selecione um Curso</h2>
                <table class="data-table">
                    <thead>
                    <tr><th>Codigo</th><th>Nome</th><th>Grau</th><th>Duracao</th><th>Accao</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach var="curso" items="${cursos}">
                        <tr>
                            <td>${curso.codigoCurso}</td>
                            <td>${curso.nomeCurso}</td>
                            <td>${curso.grau}</td>
                            <td>${curso.duracaoAnos} anos</td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/plano-curricular?cursoId=${curso.idCurso}">
                                    Gerir Plano
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
