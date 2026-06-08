<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ojj.academico.model.Curso" %>
<%@ page import="com.ojj.academico.model.Turma" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Nova Matrícula</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        .section-title {
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 5px;
            margin-bottom: 20px;
            color: var(--primary-color);
            font-weight: bold;
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/secretario/dashboard">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/secretario/dashboard">
                    <i class="fas fa-arrow-left"></i> Voltar ao Dashboard
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card-custom">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="fas fa-user-graduate"></i> Ficha de Registro e Matrícula</h4>
                        <span class="badge bg-primary">Novo Estudante</span>
                    </div>
                    <div class="card-body p-4">
                        <% if(request.getAttribute("erro") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show">
                                <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("erro") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <% } %>
                        
                        <% if(request.getAttribute("resultado") != null) { 
                            com.ojj.academico.service.RegistroResult res = (com.ojj.academico.service.RegistroResult) request.getAttribute("resultado");
                        %>
                            <div class="alert alert-success">
                                <h5><i class="fas fa-check-circle"></i> <%= res.getMensagem() %></h5>
                                <hr>
                                <p><strong>Credenciais Geradas:</strong></p>
                                <ul>
                                    <li><strong>Usuário (Email):</strong> <%= res.getEmail() %></li>
                                    <li><strong>Senha Temporária:</strong> <code style="font-size: 1.2rem; background: #eee; padding: 2px 5px; border-radius: 4px;"><%= res.getSenhaTemporaria() %></code></li>
                                </ul>
                                <p class="small text-muted mb-0">Por favor, entregue estas credenciais ao estudante. Ele deverá alterar a senha no primeiro acesso.</p>
                            </div>
                        <% } %>

                        <form action="<%= request.getContextPath() %>/secretario/matricular" method="post">
                            <!-- Dados Pessoais -->
                            <div class="section-title"><i class="fas fa-id-card"></i> Dados Pessoais</div>
                            <div class="row mb-3">
                                <div class="col-md-8 mb-3">
                                    <label for="nomeCompleto" class="form-label">Nome Completo *</label>
                                    <input type="text" class="form-control-custom" id="nomeCompleto" name="nomeCompleto" required placeholder="Ex: João Manuel dos Santos">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="numeroBi" class="form-label">Nº de BI *</label>
                                    <input type="text" class="form-control-custom" id="numeroBi" name="numeroBi" required placeholder="Nº do Bilhete de Identidade">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-4 mb-3">
                                    <label for="dataNascimento" class="form-label">Data de Nascimento *</label>
                                    <input type="date" class="form-control-custom" id="dataNascimento" name="dataNascimento" required>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="sexo" class="form-label">Sexo *</label>
                                    <select class="form-control-custom" id="sexo" name="sexo" required>
                                        <option value="">Selecione...</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Feminino</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="nacionalidade" class="form-label">Nacionalidade *</label>
                                    <input type="text" class="form-control-custom" id="nacionalidade" name="nacionalidade" required value="Angolana">
                                </div>
                            </div>

                            <!-- Contactos -->
                            <div class="section-title mt-4"><i class="fas fa-phone"></i> Contactos e Localização</div>
                            <div class="row mb-3">
                                <div class="col-md-6 mb-3">
                                    <label for="emailPessoal" class="form-label">E-mail * (Servirá como login)</label>
                                    <input type="email" class="form-control-custom" id="emailPessoal" name="emailPessoal" required placeholder="estudante@exemplo.com">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="telefone" class="form-label">Telefone *</label>
                                    <input type="tel" class="form-control-custom" id="telefone" name="telefone" required placeholder="+244 ...">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-8 mb-3">
                                    <label for="morada" class="form-label">Endereço / Morada *</label>
                                    <input type="text" class="form-control-custom" id="morada" name="morada" required placeholder="Bairro, Rua, Casa nº">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="provincia" class="form-label">Província *</label>
                                    <select class="form-control-custom" id="provincia" name="provincia" required>
                                        <option value="">Selecione...</option>
                                        <option value="Bengo">Bengo</option>
                                        <option value="Benguela">Benguela</option>
                                        <option value="Bié">Bié</option>
                                        <option value="Cabinda">Cabinda</option>
                                        <option value="Cuando Cubango">Cuando Cubango</option>
                                        <option value="Cuanza Norte">Cuanza Norte</option>
                                        <option value="Cuanza Sul">Cuanza Sul</option>
                                        <option value="Cunene">Cunene</option>
                                        <option value="Huambo">Huambo</option>
                                        <option value="Huíla">Huíla</option>
                                        <option value="Luanda">Luanda</option>
                                        <option value="Lunda Norte">Lunda Norte</option>
                                        <option value="Lunda Sul">Lunda Sul</option>
                                        <option value="Malanje">Malanje</option>
                                        <option value="Moxico">Moxico</option>
                                        <option value="Namibe">Namibe</option>
                                        <option value="Uíge">Uíge</option>
                                        <option value="Zaire">Zaire</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Encarregado -->
                            <div class="section-title mt-4"><i class="fas fa-users"></i> Dados do Encarregado</div>
                            <div class="row mb-3">
                                <div class="col-md-8 mb-3">
                                    <label for="nomeEncarregado" class="form-label">Nome do Encarregado</label>
                                    <input type="text" class="form-control-custom" id="nomeEncarregado" name="nomeEncarregado">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="telefoneEncarregado" class="form-label">Telefone do Encarregado</label>
                                    <input type="tel" class="form-control-custom" id="telefoneEncarregado" name="telefoneEncarregado">
                                </div>
                            </div>

                            <!-- Dados Académicos -->
                            <div class="section-title mt-4"><i class="fas fa-graduation-cap"></i> Informação Académica</div>
                            <div class="row mb-3">
                                <div class="col-md-6 mb-3">
                                    <label for="idCurso" class="form-label">Curso *</label>
                                    <select class="form-control-custom" id="idCurso" name="idCurso" required>
                                        <option value="">Selecione o curso...</option>
                                        <option value="1">Engenharia Informática</option>
                                        <option value="2">Gestão de Empresas</option>
                                        <option value="3">Direito</option>
                                        <option value="4">Contabilidade</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="idTurma" class="form-label">Turma *</label>
                                    <select class="form-control-custom" id="idTurma" name="idTurma" required>
                                        <option value="">Selecione a turma...</option>
                                        <option value="1">I11 - Manhã</option>
                                        <option value="2">G21 - Tarde</option>
                                        <option value="3">D31 - Noite</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="col-md-6 mb-3">
                                    <label for="idAnoAcademico" class="form-label">Ano Académico *</label>
                                    <select class="form-control-custom" id="idAnoAcademico" name="idAnoAcademico" required>
                                        <option value="1">2024</option>
                                        <option value="2">2025</option>
                                        <option value="3">2026</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="idSemestre" class="form-label">Semestre *</label>
                                    <select class="form-control-custom" id="idSemestre" name="idSemestre" required>
                                        <option value="1">1º Semestre</option>
                                        <option value="2">2º Semestre</option>
                                    </select>
                                </div>
                            </div>

                            <hr>
                            
                            <div class="d-flex justify-content-end gap-2">
                                <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-secondary">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                                <button type="reset" class="btn btn-warning">
                                    <i class="fas fa-undo"></i> Limpar
                                </button>
                                <button type="submit" class="btn btn-primary px-5">
                                    <i class="fas fa-save"></i> Finalizar Matrícula
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
