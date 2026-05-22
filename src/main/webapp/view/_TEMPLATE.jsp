<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-PT">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página - OJJ Académico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-2 d-md-block bg-light sidebar">
                <%@ include file="/WEB-INF/components/sidebar.jsp" %>
            </nav>

            <!-- Conteúdo Principal -->
            <main role="main" class="col-md-10 ml-sm-auto pt-3 px-4">
                <h2 class="mb-4">Página</h2>

                <!-- Mensagens -->
                <c:if test="${not empty sucesso}">
                    <div class="alert alert-success">${sucesso}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>

                <!-- Conteúdo -->
                <div class="card">
                    <div class="card-body">
                        <!-- TODO: Implementar conteúdo -->
                        <p>Conteúdo da página aqui...</p>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>

