# 💻 GUIA DE IMPLEMENTAÇÃO - SERVLETS E JSPS

## Template Padrão de Servlet

### Exemplo 1: Servlet de Listagem (GET)

```java
package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;

public class EstudanteListServlet extends HttpServlet {
    private final EstudanteService estudanteService;

    public EstudanteListServlet() {
        this.estudanteService = new EstudanteService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Verificar autenticação
            HttpSession session = request.getSession();
            Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
            
            if (utilizador == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Parâmetros de paginação
            int page = 1;
            int pageSize = 10;
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }

            // Parâmetros de filtro
            String filtroNome = request.getParameter("nome");
            String filtroCurso = request.getParameter("curso");

            // Buscar dados
            List<Estudante> estudantes = estudanteService.listar(page, pageSize, filtroNome, filtroCurso);
            int totalRegistros = estudanteService.contar(filtroNome, filtroCurso);
            int totalPaginas = (int) Math.ceil((double) totalRegistros / pageSize);

            // Enviar para JSP
            request.setAttribute("estudantes", estudantes);
            request.setAttribute("paginaAtual", page);
            request.setAttribute("totalPaginas", totalPaginas);
            request.setAttribute("totalRegistros", totalRegistros);
            request.setAttribute("filtroNome", filtroNome);
            request.setAttribute("filtroCurso", filtroCurso);

            request.getRequestDispatcher("/WEB-INF/view/admin/estudante/list.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao listar estudantes: " + e.getMessage());
            try {
                request.getRequestDispatcher("/WEB-INF/view/admin/estudante/list.jsp")
                        .forward(request, response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
```

---

### Exemplo 2: Servlet de Formulário POST (CREATE)

```java
package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dto.EstudanteDTO;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;
import com.ojj.academico.validator.EstudanteValidator;

public class EstudanteAdminServlet extends HttpServlet {
    private final EstudanteService estudanteService;
    private final EstudanteValidator validator;

    public EstudanteAdminServlet() {
        this.estudanteService = new EstudanteService();
        this.validator = new EstudanteValidator();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar formulário vazio
        request.getRequestDispatcher("/WEB-INF/view/admin/estudante/form.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Verificar autenticação
            HttpSession session = request.getSession();
            Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
            
            if (utilizador == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Obter parâmetros do formulário
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String nomeUtilizador = request.getParameter("nomeUtilizador");
            String nBI = request.getParameter("nBI");
            String dataNascimento = request.getParameter("dataNascimento");
            String genero = request.getParameter("genero");
            String curso = request.getParameter("curso");

            // Criar DTO
            EstudanteDTO estudanteDTO = new EstudanteDTO();
            estudanteDTO.setNome(nome);
            estudanteDTO.setEmail(email);
            estudanteDTO.setNomeUtilizador(nomeUtilizador);
            estudanteDTO.setNBI(nBI);
            estudanteDTO.setDataNascimento(dataNascimento);
            estudanteDTO.setGenero(genero);
            estudanteDTO.setCurso(curso);

            // Validar
            if (!validator.validar(estudanteDTO)) {
                request.setAttribute("errors", validator.getErros());
                request.setAttribute("estudanteDTO", estudanteDTO);
                request.getRequestDispatcher("/WEB-INF/view/admin/estudante/form.jsp")
                        .forward(request, response);
                return;
            }

            // Salvar
            Estudante estudante = estudanteService.criar(estudanteDTO);

            if (estudante != null) {
                request.setAttribute("sucesso", "Estudante criado com sucesso!");
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            } else {
                request.setAttribute("error", "Erro ao criar estudante");
                request.setAttribute("estudanteDTO", estudanteDTO);
                request.getRequestDispatcher("/WEB-INF/view/admin/estudante/form.jsp")
                        .forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao criar estudante: " + e.getMessage());
            try {
                request.getRequestDispatcher("/WEB-INF/view/admin/estudante/form.jsp")
                        .forward(request, response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
```

---

### Exemplo 3: Servlet de Edição (PUT/POST)

```java
package com.ojj.academico.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;

public class EstudanteEditServlet extends HttpServlet {
    private final EstudanteService estudanteService;

    public EstudanteEditServlet() {
        this.estudanteService = new EstudanteService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            
            if (idParam == null || idParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID não fornecido");
                return;
            }

            int id = Integer.parseInt(idParam);
            Estudante estudante = estudanteService.buscarPorId(id);

            if (estudante == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Estudante não encontrado");
                return;
            }

            request.setAttribute("estudante", estudante);
            request.getRequestDispatcher("/WEB-INF/view/admin/estudante/edit.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            
            if (idParam == null || idParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID não fornecido");
                return;
            }

            int id = Integer.parseInt(idParam);
            
            // Obter parâmetros
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String genero = request.getParameter("genero");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");

            // Buscar e atualizar
            Estudante estudante = estudanteService.buscarPorId(id);
            
            if (estudante != null) {
                estudante.setNome(nome);
                estudante.setEmail(email);
                estudante.setGenero(genero);
                estudante.setTelefone(telefone);
                estudante.setEndereco(endereco);

                if (estudanteService.atualizar(estudante)) {
                    request.setAttribute("sucesso", "Estudante atualizado com sucesso!");
                    response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
                } else {
                    request.setAttribute("error", "Erro ao atualizar estudante");
                    request.setAttribute("estudante", estudante);
                    request.getRequestDispatcher("/WEB-INF/view/admin/estudante/edit.jsp")
                            .forward(request, response);
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Estudante não encontrado");
            }

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}
```

---

## Template Padrão de JSP

### Exemplo 1: JSP de Listagem

```jsp
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-PT">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Estudantes - OJJ Académico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>Listar Estudantes</h2>
                    <a href="${pageContext.request.contextPath}/admin/estudante/new" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Novo Estudante
                    </a>
                </div>

                <!-- Mensagens de Sucesso/Erro -->
                <c:if test="${not empty sucesso}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sucesso}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${error}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>

                <!-- Filtros -->
                <div class="card mb-4">
                    <div class="card-body">
                        <form method="GET" action="${pageContext.request.contextPath}/admin/estudante/list" class="form-inline">
                            <div class="form-group mr-3">
                                <label for="nome" class="mr-2">Nome:</label>
                                <input type="text" class="form-control" id="nome" name="nome" 
                                       value="${filtroNome}" placeholder="Buscar por nome...">
                            </div>
                            <div class="form-group mr-3">
                                <label for="curso" class="mr-2">Curso:</label>
                                <select class="form-control" id="curso" name="curso">
                                    <option value="">Selecionar...</option>
                                    <option value="Engenharia">Engenharia</option>
                                    <option value="Direito">Direito</option>
                                    <option value="Administração">Administração</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search"></i> Filtrar
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Tabela -->
                <div class="card">
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty estudantes}">
                                <p class="text-muted">Nenhum estudante encontrado.</p>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Email</th>
                                            <th>Curso</th>
                                            <th>Data Inscrição</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${estudantes}" var="estudante">
                                            <tr>
                                                <td>${estudante.id}</td>
                                                <td>${estudante.nome}</td>
                                                <td>${estudante.email}</td>
                                                <td>${estudante.curso.nome}</td>
                                                <td>
                                                    <fmt:formatDate value="${estudante.dataCriacao}" pattern="dd/MM/yyyy" />
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/estudante/edit?id=${estudante.id}" 
                                                       class="btn btn-sm btn-warning" title="Editar">
                                                        <i class="fas fa-edit"></i>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/admin/estudante/profile?id=${estudante.id}" 
                                                       class="btn btn-sm btn-info" title="Perfil">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <a href="#" onclick="confirmarDelecao(${estudante.id})" 
                                                       class="btn btn-sm btn-danger" title="Deletar">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Paginação -->
                                <c:if test="${totalPaginas > 1}">
                                    <nav aria-label="Page navigation" class="mt-4">
                                        <ul class="pagination justify-content-center">
                                            <c:if test="${paginaAtual > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=1${not empty filtroNome ? '&nome='.concat(filtroNome) : ''}">
                                                        Primeira
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${paginaAtual - 1}${not empty filtroNome ? '&nome='.concat(filtroNome) : ''}">
                                                        Anterior
                                                    </a>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPaginas}" var="i">
                                                <li class="page-item ${i == paginaAtual ? 'active' : ''}">
                                                    <a class="page-link" href="?page=${i}${not empty filtroNome ? '&nome='.concat(filtroNome) : ''}">
                                                        ${i}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <c:if test="${paginaAtual < totalPaginas}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${paginaAtual + 1}${not empty filtroNome ? '&nome='.concat(filtroNome) : ''}">
                                                        Próxima
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${totalPaginas}${not empty filtroNome ? '&nome='.concat(filtroNome) : ''}">
                                                        Última
                                                    </a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>

                                    <p class="text-muted text-center">
                                        Página ${paginaAtual} de ${totalPaginas} (Total: ${totalRegistros} registos)
                                    </p>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <script>
        function confirmarDelecao(id) {
            if (confirm('Tem certeza que deseja deletar este estudante?')) {
                // Implementar lógica de deleção
                console.log('Deletar estudante ' + id);
            }
        }
    </script>
</body>
</html>
```

---

### Exemplo 2: JSP de Formulário

```jsp
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-PT">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty estudante ? 'Novo Estudante' : 'Editar Estudante'} - OJJ Académico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
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
                <h2 class="mb-4">${empty estudante ? 'Novo Estudante' : 'Editar Estudante'}</h2>

                <!-- Erros de Validação -->
                <c:if test="${not empty errors}">
                    <div class="alert alert-danger" role="alert">
                        <h5>Erros encontrados:</h5>
                        <ul>
                            <c:forEach items="${errors}" var="error">
                                <li>${error}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>

                <!-- Formulário -->
                <div class="card">
                    <div class="card-body">
                        <form method="POST" 
                              action="${empty estudante ? 
                                  pageContext.request.contextPath.concat('/admin/estudante/new') : 
                                  pageContext.request.contextPath.concat('/admin/estudante/edit')}" 
                              class="needs-validation" novalidate>

                            <c:if test="${not empty estudante}">
                                <input type="hidden" name="id" value="${estudante.id}">
                            </c:if>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nome">Nome Completo *</label>
                                    <input type="text" class="form-control" id="nome" name="nome" 
                                           value="${not empty estudante ? estudante.nome : ''}" 
                                           placeholder="Insira o nome completo" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email *</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           value="${not empty estudante ? estudante.email : ''}" 
                                           placeholder="email@exemplo.com" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nBI">Número de BI *</label>
                                    <input type="text" class="form-control" id="nBI" name="nBI" 
                                           value="${not empty estudante ? estudante.nBI : ''}" 
                                           placeholder="000000000AB00" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="dataNascimento">Data de Nascimento *</label>
                                    <input type="date" class="form-control" id="dataNascimento" name="dataNascimento" 
                                           value="${not empty estudante ? estudante.dataNascimento : ''}" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="genero">Gênero *</label>
                                    <select class="form-control" id="genero" name="genero" required>
                                        <option value="">Selecionar...</option>
                                        <option value="M" ${estudante.genero == 'M' ? 'selected' : ''}>Masculino</option>
                                        <option value="F" ${estudante.genero == 'F' ? 'selected' : ''}>Feminino</option>
                                        <option value="O" ${estudante.genero == 'O' ? 'selected' : ''}>Outro</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="telefone">Telefone</label>
                                    <input type="tel" class="form-control" id="telefone" name="telefone" 
                                           value="${not empty estudante ? estudante.telefone : ''}" 
                                           placeholder="+244 9xx xxx xxx">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="endereco">Endereço</label>
                                <input type="text" class="form-control" id="endereco" name="endereco" 
                                       value="${not empty estudante ? estudante.endereco : ''}" 
                                       placeholder="Rua, número, cidade">
                            </div>

                            <div class="form-group">
                                <label for="curso">Curso *</label>
                                <select class="form-control" id="curso" name="curso" required>
                                    <option value="">Selecionar curso...</option>
                                    <option value="1">Engenharia Informática</option>
                                    <option value="2">Administração</option>
                                    <option value="3">Direito</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">
                                    ${empty estudante ? 'Criar' : 'Atualizar'} Estudante
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/estudante/list" class="btn btn-secondary">
                                    Cancelar
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <script>
        // Validação de formulário Bootstrap
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.querySelectorAll('.needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
```

---

## Checklist de Implementação por Módulo

### ✅ Módulo 0: Autenticação
- [ ] WelcomeServlet
- [ ] welcome.jsp
- [ ] web.xml mapping

### ✅ Módulo 2: Funcionários
- [x] FuncionarioListServlet (EXISTENTE)
- [x] FuncionarioAdminServlet (EXISTENTE)
- [x] FuncionarioEditServlet (EXISTENTE)
- [ ] FuncionarioPerfilServlet
- [ ] list.jsp
- [ ] form.jsp
- [ ] edit.jsp
- [ ] profile.jsp

### ⏳ Módulo 3: Estudantes
- [ ] EstudanteListServlet
- [ ] EstudanteAdminServlet
- [ ] EstudanteEditServlet
- [ ] EstudantePerfilServlet
- [ ] JSPs correspondentes

*... (continuar para outros módulos)*

---

## Dicas de Implementação

### 1. Estrutura de Pastas
```
src/main/java/com/ojj/academico/controller/
  ├── admin/          (servlets admin)
  ├── professor/      (servlets professor)
  ├── estudante/      (servlets estudante)
  ├── secretaria/     (servlets secretaria)
  ├── tesouraria/     (servlets tesouraria)
  └── coordenador/    (servlets coordenador)
```

### 2. Convenções de Nomes
- **Servlets:** `NomeServlet.java` (ex: EstudanteListServlet)
- **JSPs:** `acao.jsp` (ex: list.jsp, form.jsp, edit.jsp, profile.jsp)
- **URLs:** `/modulo/recurso/acao` (ex: /admin/estudante/list)

### 3. Tratamento de Erros
```java
try {
    // Lógica
} catch (SQLException e) {
    e.printStackTrace();
    request.setAttribute("error", "Mensagem amigável: " + e.getMessage());
    // Reencaminhar para JSP
}
```

### 4. Autenticação e Autorização
```java
HttpSession session = request.getSession();
Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

if (utilizador == null) {
    response.sendRedirect(request.getContextPath() + "/login");
    return;
}

// Verificar perfil
if (!utilizador.getPerfil().getNome().equals("ADMINISTRADOR")) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acesso negado");
    return;
}
```

### 5. Paginação Padrão
```java
int page = 1;
int pageSize = 10;
String pageParam = request.getParameter("page");
if (pageParam != null && !pageParam.isEmpty()) {
    page = Integer.parseInt(pageParam);
}
```

### 6. Mensagens Flash
```jsp
<c:if test="${not empty sucesso}">
    <div class="alert alert-success">${sucesso}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
```

---

## Próximas Etapas Recomendadas

1. ✅ **Criar estrutura de pastas** dentro de `controller/`
2. ✅ **Implementar Servlets de Listagem** (template repetível)
3. ✅ **Criar JSPs com Bootstrap** (responsivas)
4. ✅ **Atualizar web.xml** com mapeamentos
5. ✅ **Testar fluxo de autenticação**
6. ✅ **Adicionar paginação**
7. ✅ **Implementar validações**
8. ✅ **Adicionar testes unitários**

---

**Data:** May 22, 2026
**Status:** 📝 Guia de Implementação Completo
