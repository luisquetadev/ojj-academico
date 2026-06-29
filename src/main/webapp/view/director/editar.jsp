<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Editar Director</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/director.css">
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
                        <h4><i class="fas fa-user-edit"></i> Editar Director</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning mb-4">
                            <i class="fas fa-info-circle"></i> A editar director ID: <strong>1</strong> - Prof. Dr. Manuel Fernandes
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
                                        <input type="text" class="form-control-custom" required value="Prof. Dr. Manuel Fernandes">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Título Académico *</label>
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
                                        <label class="form-label">Data de Nascimento *</label>
                                        <input type="date" class="form-control-custom" required value="1970-05-20">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Sexo *</label>
                                        <select class="form-control-custom" required>
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
                                        <label class="form-label">Número de BI *</label>
                                        <input type="text" class="form-control-custom" required value="005678901LA023">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">NIF</label>
                                        <input type="text" class="form-control-custom" value="500123456">
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
                                        <input type="email" class="form-control-custom" required value="manuel.fernandes@ojj.ac.ao">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Email Pessoal</label>
                                        <input type="email" class="form-control-custom" value="manuel.fernandes@gmail.com">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Telefone Principal *</label>
                                        <input type="tel" class="form-control-custom" required value="+244 923 000 111">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Telefone Alternativo</label>
                                        <input type="tel" class="form-control-custom" value="+244 912 000 111">
                                    </div>
                                </div>
                            </div>

                            <!-- Informações Profissionais -->
                            <div class="alert alert-info mt-4 mb-4">
                                <i class="fas fa-briefcase"></i> Informações Profissionais
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Cargo/Função *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Director-Geral" selected>Director-Geral</option>
                                            <option value="Director Académico">Director Académico</option>
                                            <option value="Director Administrativo">Director Administrativo</option>
                                            <option value="Director de Recursos Humanos">Director de Recursos Humanos</option>
                                            <option value="Director Financeiro">Director Financeiro</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Departamento</label>
                                        <input type="text" class="form-control-custom" value="Direcção-Geral">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Nomeação *</label>
                                        <input type="date" class="form-control-custom" required value="2023-01-15">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Fim de Mandato</label>
                                        <input type="date" class="form-control-custom" value="2027-01-14">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Período do Mandato</label>
                                        <select class="form-control-custom">
                                            <option value="">Selecione</option>
                                            <option value="2023-2027" selected>2023-2027</option>
                                            <option value="2022-2026">2022-2026</option>
                                            <option value="2021-2025">2021-2025</option>
                                            <option value="2024-2028">2024-2028</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Status *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Activo" selected>Activo</option>
                                            <option value="Inactivo">Inactivo</option>
                                            <option value="Licença">Licença</option>
                                            <option value="Férias">Férias</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Formação Académica</label>
                                <textarea class="form-control-custom" rows="3">- Doutoramento em Gestão de Empresas, Universidade de Coimbra (2005)
- Mestrado em Administração Pública, Universidade Agostinho Neto (2000)
- Licenciatura em Economia, Universidade Agostinho Neto (1995)</textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Experiência Profissional</label>
                                <textarea class="form-control-custom" rows="3">- Director-Geral, OJJ Académico (2023 - Presente)
- Director Académico, OJJ Académico (2018-2022)
- Professor Universitário, Universidade Agostinho Neto (2010-2018)
- Consultor de Gestão (2005-2010)</textarea>
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
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Município</label>
                                <input type="text" class="form-control-custom" value="Luanda">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Endereço Completo</label>
                                <textarea class="form-control-custom" rows="3">Avenida 4 de Fevereiro, nº 100, Edifício OJJ, Bairro Ingombota</textarea>
                            </div>

                            <!-- Observações -->
                            <div class="form-group">
                                <label class="form-label">Observações</label>
                                <textarea class="form-control-custom" rows="3">Director com vasta experiência em gestão académica e administrativa. Reconhecido pela implementação de melhorias significativas nos processos institucionais.</textarea>
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="index.html" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                                <button type="submit" class="btn-purple-custom">
                                    <i class="fas fa-save"></i> Actualizar Director
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