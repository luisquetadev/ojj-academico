<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamento de Propinas - OJJ Académico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <style>
        .month-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 10px; }
        .month-btn { padding: 10px; border: 1px solid #444; background: #222; color: #fff; text-align: center; border-radius: 5px; cursor: pointer; }
        .month-btn:hover { background: #333; }
        .month-btn.selected { background: #0d6efd; border-color: #0d6efd; }
    </style>
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
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card-custom p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3><i class="fas fa-calendar-alt"></i> Pagamento de Propina Profissional</h3>
                        <a href="${pageContext.request.contextPath}/tesouraria/dashboard" class="btn btn-outline-light btn-sm"><i class="fas fa-chevron-left"></i> Voltar</a>
                    </div>

                    <c:if test="${not empty sucesso}">
                        <div class="alert alert-success">${sucesso}</div>
                    </c:if>
                    <c:if test="${not empty erro}">
                        <div class="alert alert-danger">${erro}</div>
                    </c:if>

                    <!-- Passo 1: Buscar Estudante -->
                    <div class="search-section mb-4">
                        <h5>1. Identificar Estudante</h5>
                        <form action="${pageContext.request.contextPath}/tesouraria/propina" method="get" class="d-flex gap-2">
                            <input type="text" name="search" class="form-control" placeholder="Nome, BI ou Número..." value="${param.search}">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
                        </form>

                        <c:if test="${not empty estudantes}">
                            <div class="list-group mt-3">
                                <c:forEach var="est" items="${estudantes}">
                                    <a href="?idEstudante=${est.idEstudante}&search=${param.search}" class="list-group-item list-group-item-action ${est.idEstudante == estudanteSelecionado.idEstudante ? 'active' : ''}">
                                        <strong>${est.numeroEstudante}</strong> - ${est.nomeCompleto}
                                    </a>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>

                    <!-- Passo 2: Propinas Existentes -->
                    <c:if test="${not empty estudanteSelecionado}">
                        <hr>
                        <h5>2. Histórico de Propinas: <span class="text-primary">${estudanteSelecionado.nomeCompleto}</span></h5>
                        <div class="table-responsive mt-3">
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr>
                                        <th>Mês</th>
                                        <th>Ano</th>
                                        <th>Valor (Kz)</th>
                                        <th>Multa</th>
                                        <th>Vencimento</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="prop" items="${propinas}">
                                        <tr>
                                            <td>${prop.mesReferencia}</td>
                                            <td>${prop.anoReferencia}</td>
                                            <td><fmt:formatNumber value="${prop.valor}" type="currency" currencySymbol="Kz "/></td>
                                            <td><fmt:formatNumber value="${prop.multa}" type="currency" currencySymbol="Kz "/></td>
                                            <td>${prop.dataVencimento}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${prop.status == 'PAGO'}">
                                                        <span class="badge bg-success">PAGO</span>
                                                    </c:when>
                                                    <c:when test="${prop.status == 'ATRASADO'}">
                                                        <span class="badge bg-danger">ATRASADO</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">${prop.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty propinas}">
                                        <tr>
                                            <td colspan="6" class="text-center py-4 text-muted">Nenhuma propina registada.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <!-- Passo 3: Liquidar Nova Propina -->
                    <c:if test="${not empty estudanteSelecionado}">
                        <hr>
                        <h5>3. Liquidar Nova Mensalidade</h5>
                        <form action="${pageContext.request.contextPath}/tesouraria/propina" method="post" class="mt-3">
                            <input type="hidden" name="idEstudante" value="${estudanteSelecionado.idEstudante}">
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Mês de Referência</label>
                                    <select name="mes" class="form-select" required>
                                        <option value="JANEIRO">Janeiro</option>
                                        <option value="FEVEREIRO">Fevereiro</option>
                                        <option value="MARÇO">Março</option>
                                        <option value="ABRIL">Abril</option>
                                        <option value="MAIO">Maio</option>
                                        <option value="JUNHO">Junho</option>
                                        <option value="JULHO">Julho</option>
                                        <option value="AGOSTO">Agosto</option>
                                        <option value="SETEMBRO">Setembro</option>
                                        <option value="OUTUBRO">Outubro</option>
                                        <option value="NOVEMBRO">Novembro</option>
                                        <option value="DEZEMBRO">Dezembro</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Ano</label>
                                    <input type="number" name="ano" class="form-control" value="2026" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Valor da Propina (Kz)</label>
                                    <c:choose>
                                        <c:when test="${not empty propinaMensal}">
                                            <input type="text" class="form-control" value="<fmt:formatNumber value="${propinaMensal}" type="currency" currencySymbol="Kz "/>" readonly>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" value="---" readonly>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Multa (10% após dia 10)</label>
                                    <c:choose>
                                        <c:when test="${not empty multaCalculada}">
                                            <input type="text" class="form-control ${emDia ? '' : 'text-danger'}" value="<fmt:formatNumber value="${multaCalculada}" type="currency" currencySymbol="Kz "/>" readonly>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" value="---" readonly>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Método de Pagamento</label>
                                    <select name="metodoPagamento" class="form-select" required>
                                        <option value="MULTICAIXA">Multicaixa</option>
                                        <option value="TRANSFERENCIA">Transferência Bancária</option>
                                        <option value="DINHEIRO">Dinheiro Vivo</option>
                                        <option value="TPA">TPA</option>
                                    </select>
                                </div>
                            </div>

                            <c:if test="${not empty emDia and not emDia}">
                                <div class="alert alert-warning py-2">
                                    <i class="fas fa-exclamation-triangle"></i> Pagamento fora do prazo (dia 1-10). Multa de 10% aplicada.
                                </div>
                            </c:if>
                            <div class="alert alert-info py-2">
                                <i class="fas fa-info-circle"></i> O sistema irá gerar um recibo oficial de propina (PRP) após a confirmação.
                            </div>

                            <button type="submit" class="btn btn-success btn-lg w-100">
                                <i class="fas fa-print"></i> Confirmar e Emitir Recibo
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
