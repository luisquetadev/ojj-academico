<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Histórico de Pagamentos - OJJ Académico</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/tesouraria/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/tesouraria/dashboard">
                            <i class="fas fa-arrow-left"></i> Voltar ao Painel
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card-custom p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3><i class="fas fa-history"></i> Histórico de Pagamentos</h3>
                <a href="${pageContext.request.contextPath}/tesouraria/servicos" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Novo Pagamento
                </a>
            </div>

            <c:if test="${not empty erro}">
                <div class="alert alert-danger">${erro}</div>
            </c:if>

            <div class="table-responsive">
                <table class="table table-hover table-dark mt-3">
                    <thead>
                        <tr>
                            <th>Recibo</th>
                            <th>Data</th>
                            <th>Estudante</th>
                            <th>Tipo</th>
                            <th>Valor (Kz)</th>
                            <th>Método</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${pagamentos}">
                            <tr>
                                <td><code>${p.numeroRecibo}</code></td>
                                <td>${p.dataPagamento}</td>
                                <td>${p.idEstudante}</td> <!-- Seria melhor o nome, mas simplificando para ID por agora -->
                                <td><span class="badge bg-info">${p.tipoPagamento}</span></td>
                                <td><fmt:formatNumber value="${p.valorPago}" type="currency" currencySymbol="Kz " /></td>
                                <td>${p.metodoPagamento}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.status == 'PAGO'}">
                                            <span class="badge bg-success">PAGO</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-warning text-dark">${p.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty pagamentos}">
                            <tr>
                                <td colspan="7" class="text-center py-4 text-muted">Nenhum pagamento registrado até o momento.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
