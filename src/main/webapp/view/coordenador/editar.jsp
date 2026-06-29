<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Editar Coordenador</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/coordenador.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                <a class="nav-link" href="#">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card-custom">
                    <div class="card-header">
                        <h4><i class="fas fa-user-edit"></i> Editar Coordenador</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning mb-4">
                            <i class="fas fa-info-circle"></i> A editar coordenador ID: <strong>1</strong> - Prof. Dr. João Silva
                        </div>

                        <form action="index.html" method="GET">
                            <!-- Informações Pessoais -->
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle"></i> Informações Pessoais
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Nome Completo *</label>
                                        <input type="text" class="form-control-custom" required value="Prof. Dr. João Silva">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Título Acadêmico *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Prof.">Prof.</option>
                                            <option value="Profa.">Profa.</option>
                                            <option value="Prof. Dr." selected>Prof. Dr.</option>
                                            <option value="Profa. Dra.">Profa. Dra.</option>
                                            <option value="Prof. Msc.">Prof. Msc.</option>
                                            <option value="Profa. Msc.">Profa. Msc.</option>
                                            <option value="Dr.">Dr.</option>
                                            <option value="Dra.">Dra.</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Nascimento</label>
                                        <input type="date" class="form-control-custom" value="1975-03-15">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Sexo</label>
                                        <select class="form-control-custom">
                                            <option value="">Selecione</option>
                                            <option value="M" selected>Masculino</option>
                                            <option value="F">Feminino</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Número de BI</label>
                                        <input type="text" class="form-control-custom" value="001234567LA042">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">NIF</label>
                                        <input type="text" class="form-control-custom" value="123456789">
                                    </div>
                                </div>
                            </div>

                            <!-- Contactos -->
                            <div class="alert alert-info mt-4 mb-4">
                                <i class="fas fa-address-card"></i> Contactos
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Email Institucional *</label>
                                        <input type="email" class="form-control-custom" required value="joao.silva@ojj.ac.ao">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Email Pessoal</label>
                                        <input type="email" class="form-control-custom" value="joao.silva@gmail.com">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Telefone Principal *</label>
                                        <input type="tel" class="form-control-custom" required value="+244 923 456 789">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Telefone Alternativo</label>
                                        <input type="tel" class="form-control-custom" value="+244 912 345 678">
                                    </div>
                                </div>
                            </div>

                            <!-- Informações Acadêmicas -->
                            <div class="alert alert-info mt-4 mb-4">
                                <i class="fas fa-graduation-cap"></i> Informações Acadêmicas e Profissionais
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Curso sob Coordenação *</label>
                                        <select class="form-control-custom" required>
                                            <option value="">Selecione o curso</option>
                                            <option value="1" selected>Engenharia Informática</option>
                                            <option value="2">Medicina</option>
                                            <option value="3">Direito</option>
                                            <option value="4">Arquitetura</option>
                                            <option value="5">Psicologia</option>
                                            <option value="6">Administração de Empresas</option>
                                            <option value="7">Enfermagem</option>
                                            <option value="8">Comunicação Social</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Grau Acadêmico *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Licenciatura">Licenciatura</option>
                                            <option value="Mestrado">Mestrado</option>
                                            <option value="Doutoramento" selected>Doutoramento</option>
                                            <option value="Pós-Doutoramento">Pós-Doutoramento</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Especialização/Área de Atuação</label>
                                <input type="text" class="form-control-custom" value="Inteligência Artificial e Sistemas de Informação">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Instituição de Formação</label>
                                <input type="text" class="form-control-custom" value="Universidade de Coimbra, Portugal">
                            </div>

                            <!-- Status e Data -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Status *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Ativo" selected>Ativo</option>
                                            <option value="Inativo">Inativo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Admissão</label>
                                        <input type="date" class="form-control-custom" value="2020-02-10">
                                    </div>
                                </div>
                            </div>

                            <!-- Endereço -->
                            <div class="alert alert-info mt-4 mb-4">
                                <i class="fas fa-map-marker-alt"></i> Endereço
                            </div>

                            <div class="form-group">
                                <label class="form-label">Província</label>
                                <select class="form-control-custom">
                                    <option value="">Selecione a província</option>
                                    <option value="Luanda" selected>Luanda</option>
                                    <option value="Benguela">Benguela</option>
                                    <option value="Huíla">Huíla</option>
                                    <option value="Bié">Bié</option>
                                    <option value="Huambo">Huambo</option>
                                    <option value="Cabinda">Cabinda</option>
                                    <option value="Cuando Cubango">Cuando Cubango</option>
                                    <option value="Cuanza Norte">Cuanza Norte</option>
                                    <option value="Cuanza Sul">Cuanza Sul</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Município</label>
                                <input type="text" class="form-control-custom" value="Luanda">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Endereço Completo</label>
                                <textarea class="form-control-custom" rows="3">Rua da Missão, nº 15, Bairro Ingombota</textarea>
                            </div>

                            <!-- Observações -->
                            <div class="form-group">
                                <label class="form-label">Observações</label>
                                <textarea class="form-control-custom" rows="3">Coordenador com vasta experiência em desenvolvimento de sistemas e inteligência artificial. Possui publicações internacionais.</textarea>
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="index.html" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                                <button type="submit" class="btn-success-custom">
                                    <i class="fas fa-save"></i> Atualizar Coordenador
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>