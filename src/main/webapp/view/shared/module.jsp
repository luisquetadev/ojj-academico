<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} - OJJ Academico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
</head>
<body>
<main class="dashboard-container">
    <section class="dashboard-header">
        <div>
            <span class="dashboard-kicker">${moduleName}</span>
            <h1>${pageTitle}</h1>
            <p>${pageDescription}</p>
        </div>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Voltar</a>
    </section>

    <c:if test="${not empty mensagem}">
        <div class="alert alert-success">${mensagem}</div>
    </c:if>
    <c:if test="${not empty erro}">
        <div class="alert alert-danger">${erro}</div>
    </c:if>

    <section class="dashboard-card">
        <form method="post" class="form-grid">
            <label>
                Numero do estudante
                <input type="text" name="numeroEstudante" placeholder="Ex.: 20240001">
            </label>
            <label>
                Referencia
                <input type="text" name="referencia" placeholder="Documento, pagamento ou pauta">
            </label>
            <label>
                Observacao
                <input type="text" name="observacao" placeholder="Informacao adicional">
            </label>
            <button type="submit" class="btn btn-primary">Registar</button>
        </form>
    </section>

    <c:if test="${not empty turmas}">
        <section class="dashboard-card">
            <h2>Turmas</h2>
            <table class="data-table">
                <thead>
                <tr><th>Codigo</th><th>Turno</th><th>Ano</th><th>Inscritos</th><th>Capacidade</th></tr>
                </thead>
                <tbody>
                <c:forEach var="turma" items="${turmas}">
                    <tr>
                        <td>${turma.codigoTurma}</td>
                        <td>${turma.turno}</td>
                        <td>${turma.anoCurricular}</td>
                        <td>${turma.estudantesInscritos}</td>
                        <td>${turma.capacidadeMaxima}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </c:if>

    <c:if test="${not empty pagamentos}">
        <section class="dashboard-card">
            <h2>Pagamentos</h2>
            <table class="data-table">
                <thead>
                <tr><th>Recibo</th><th>Tipo</th><th>Periodo</th><th>Valor pago</th><th>Status</th></tr>
                </thead>
                <tbody>
                <c:forEach var="pagamento" items="${pagamentos}">
                    <tr>
                        <td>${pagamento.numeroRecibo}</td>
                        <td>${pagamento.tipoPagamento}</td>
                        <td>${pagamento.periodoReferencia}</td>
                        <td>${pagamento.valorPago}</td>
                        <td>${pagamento.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </c:if>

    <c:if test="${not empty propinas}">
        <section class="dashboard-card">
            <h2>Propinas</h2>
            <table class="data-table">
                <thead>
                <tr><th>Estudante</th><th>Mes</th><th>Ano</th><th>Valor</th><th>Status</th></tr>
                </thead>
                <tbody>
                <c:forEach var="propina" items="${propinas}">
                    <tr>
                        <td>${propina.idEstudante}</td>
                        <td>${propina.mesReferencia}</td>
                        <td>${propina.anoReferencia}</td>
                        <td>${propina.valor}</td>
                        <td>${propina.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </c:if>
</main>
</body>
</html>
