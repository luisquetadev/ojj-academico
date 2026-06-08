<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamento de Serviços - OJJ Académico</title>
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
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card-custom p-4">
                    <h3 class="mb-4"><i class="fas fa-file-invoice-dollar"></i> Registar Pagamento de Serviço</h3>

                    <c:if test="${not empty sucesso}">
                        <div class="alert alert-success">${sucesso}</div>
                    </c:if>
                    <c:if test="${not empty erro}">
                        <div class="alert alert-danger">${erro}</div>
                    </c:if>

                    <!-- Passo 1: Buscar Estudante -->
                    <div class="search-section mb-4">
                        <h5>1. Identificar Estudante</h5>
                        <form action="${pageContext.request.contextPath}/tesouraria/servicos" method="get" class="d-flex gap-2">
                            <input type="text" name="search" class="form-control" placeholder="Nome, BI ou Número do Estudante..." value="${param.search}">
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

                    <!-- Passo 2: Detalhes do Pagamento -->
                    <c:if test="${not empty estudanteSelecionado}">
                        <hr>
                        <h5>2. Detalhes para: <span class="text-primary">${estudanteSelecionado.nomeCompleto}</span></h5>
                        <form action="${pageContext.request.contextPath}/tesouraria/servicos" method="post" class="mt-3">
                            <input type="hidden" name="idEstudante" value="${estudanteSelecionado.idEstudante}">
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tipo de Serviço</label>
                                    <select name="tipoPagamento" class="form-select" required>
                                        <option value="DECLARACAO">Declaração com Notas</option>
                                        <option value="CERTIFICADO">Certificado de Habilitações</option>
                                        <option value="CARTAO">Cartão de Estudante (2ª Via)</option>
                                        <option value="MULTA">Multa de Biblioteca / Atraso</option>
                                        <option value="EXAME_RECURSO">Exame de Recurso</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Valor (Kz)</label>
                                    <input type="number" step="0.01" name="valor" class="form-control" placeholder="0.00" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Método de Pagamento</label>
                                    <select name="metodoPagamento" class="form-select" required>
                                        <option value="MULTICAIXA">Multicaixa</option>
                                        <option value="DINHEIRO">Dinheiro Vivo</option>
                                        <option value="TRANSFERENCIA">Transferência Bancária</option>
                                        <option value="TPA">TPA</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Referência de Depósito (se aplicável)</label>
                                    <input type="text" name="referencia" class="form-control" placeholder="Nº de Transação">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Observações</label>
                                <textarea name="observacao" class="form-control" rows="2"></textarea>
                            </div>

                            <button type="submit" class="btn btn-success btn-lg w-100">
                                <i class="fas fa-check-circle"></i> Confirmar e Registar Pagamento
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
