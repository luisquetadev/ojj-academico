<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Detalhes do Director</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
            <div class="col-md-10">
                <div class="card-custom">
                    <div class="card-header">
                        <h4><i class="fas fa-user-tie"></i> Perfil do Director</h4>
                    </div>
                    <div class="card-body">
                        <!-- Badge Status -->
                        <div class="text-end mb-3">
                            <span class="badge-custom badge-success" style="font-size: 1rem;">
                                <i class="fas fa-check-circle"></i> Activo
                            </span>
                        </div>

                        <!-- Profile Header -->
                        <div class="profile-header">
                            <div class="profile-avatar">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <div class="profile-name">Prof. Dr. Manuel Fernandes</div>
                            <div class="profile-title">Director-Geral do OJJ Académico</div>
                        </div>

                        <!-- Navegação por Tabs -->
                        <ul class="nav nav-tabs nav-tabs-custom" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="personal-tab" data-bs-toggle="tab" data-bs-target="#personal" type="button" role="tab">
                                    <i class="fas fa-user"></i> Dados Pessoais
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="professional-tab" data-bs-toggle="tab" data-bs-target="#professional" type="button" role="tab">
                                    <i class="fas fa-briefcase"></i> Dados Profissionais
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education" type="button" role="tab">
                                    <i class="fas fa-graduation-cap"></i> Formação
                                </button>
                            </li>
                        </ul>

                        <div class="tab-content mt-4">
                            <!-- Dados Pessoais -->
                            <div class="tab-pane fade show active" id="personal" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-id-card"></i> ID:</strong>
                                        <p class="mt-2">1</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-calendar-alt"></i> Data de Nascimento:</strong>
                                        <p class="mt-2">20 de Maio, 1970</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-venus-mars"></i> Sexo:</strong>
                                        <p class="mt-2">Masculino</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-id-card"></i> Número de BI:</strong>
                                        <p class="mt-2">005678901LA023</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-file-invoice"></i> NIF:</strong>
                                        <p class="mt-2">500123456</p>
                                    </div>
                                </div>

                                <div class="alert alert-info mt-2 mb-4">
                                    <i class="fas fa-address-card"></i> Contactos
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-envelope"></i> Email Institucional:</strong>
                                        <p class="mt-2">manuel.fernandes@ojj.ac.ao</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-envelope-open-text"></i> Email Pessoal:</strong>
                                        <p class="mt-2">manuel.fernandes@gmail.com</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-phone"></i> Telefone Principal:</strong>
                                        <p class="mt-2">+244 923 000 111</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-phone-alt"></i> Telefone Alternativo:</strong>
                                        <p class="mt-2">+244 912 000 111</p>
                                    </div>
                                </div>

                                <div class="alert alert-info mt-2 mb-4">
                                    <i class="fas fa-map-marker-alt"></i> Endereço
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-map-pin"></i> Província:</strong>
                                        <p class="mt-2">Luanda</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-location-dot"></i> Município:</strong>
                                        <p class="mt-2">Luanda</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 mb-4">
                                        <strong><i class="fas fa-home"></i> Endereço Completo:</strong>
                                        <p class="mt-2">Avenida 4 de Fevereiro, nº 100, Edifício OJJ, Bairro Ingombota</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Dados Profissionais -->
                            <div class="tab-pane fade" id="professional" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-user-tag"></i> Cargo:</strong>
                                        <p class="mt-2">Director-Geral</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-building"></i> Departamento:</strong>
                                        <p class="mt-2">Direcção-Geral</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-calendar-check"></i> Data de Nomeação:</strong>
                                        <p class="mt-2">15 de Janeiro, 2023</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-calendar-times"></i> Data de Fim de Mandato:</strong>
                                        <p class="mt-2">14 de Janeiro, 2027</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-clock"></i> Período do Mandato:</strong>
                                        <p class="mt-2">2023-2027</p>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <strong><i class="fas fa-flag-checkered"></i> Status:</strong>
                                        <p class="mt-2"><span class="badge-custom badge-success">Activo</span></p>
                                    </div>
                                </div>

                                <div class="alert alert-info mt-2 mb-4">
                                    <i class="fas fa-briefcase"></i> Experiência Profissional
                                </div>

                                <div class="mb-4">
                                    <p>- Director-Geral, OJJ Académico (2023 - Presente)</p>
                                    <p>- Director Académico, OJJ Académico (2018-2022)</p>
                                    <p>- Professor Universitário, Universidade Agostinho Neto (2010-2018)</p>
                                    <p>- Consultor de Gestão (2005-2010)</p>
                                </div>
                            </div>

                            <!-- Formação -->
                            <div class="tab-pane fade" id="education" role="tabpanel">
                                <div class="alert alert-info mt-2 mb-4">
                                    <i class="fas fa-graduation-cap"></i> Formação Académica
                                </div>

                                <div class="mb-4">
                                    <p><strong>Doutoramento em Gestão de Empresas</strong><br>
                                    Universidade de Coimbra, Portugal (2005)</p>
                                    
                                    <p><strong>Mestrado em Administração Pública</strong><br>
                                    Universidade Agostinho Neto (2000)</p>
                                    
                                    <p><strong>Licenciatura em Economia</strong><br>
                                    Universidade Agostinho Neto (1995)</p>
                                </div>

                                <div class="alert alert-info mt-2 mb-4">
                                    <i class="fas fa-certificate"></i> Cursos e Especializações
                                </div>

                                <div class="mb-4">
                                    <p>- Gestão de Instituições de Ensino Superior (Harvard, 2019)</p>
                                    <p>- Liderança Estratégica (FGV, 2017)</p>
                                    <p>- Planeamento Académico (UNESCO, 2015)</p>
                                </div>
                            </div>
                        </div>

                        <!-- Estatísticas Adicionais -->
                        <div class="row mt-4">
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(49, 130, 206, 0.1);">
                                    <div class="stat-number" style="color: var(--primary-color);">8</div>
                                    <div class="stat-label" style="color: var(--primary-color);">Cursos Sob Supervisão</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(56, 161, 105, 0.1);">
                                    <div class="stat-number" style="color: var(--success-color);">15</div>
                                    <div class="stat-label" style="color: var(--success-color);">Anos de Experiência</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(107, 70, 192, 0.1);">
                                    <div class="stat-number" style="color: var(--purple-color);">25</div>
                                    <div class="stat-label" style="color: var(--purple-color);">Projectos Realizados</div>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="index.html" class="btn-secondary-custom">
                                <i class="fas fa-arrow-left"></i> Voltar
                            </a>
                            <a href="editar.html?id=1" class="btn-warning-custom">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <button class="btn-danger-custom" onclick="openDeleteModal(1, 'Prof. Dr. Manuel Fernandes')">
                                <i class="fas fa-trash"></i> Eliminar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Confirmação de Eliminação -->
    <div id="deleteModal" class="modal-overlay">
        <div class="modal-content">
            <h3><i class="fas fa-exclamation-triangle" style="color: var(--danger-color);"></i> Confirmar Eliminação</h3>
            <p>Tem certeza que deseja eliminar o director <strong id="directorNome"></strong>?</p>
            <p style="font-size: 0.9rem; color: var(--danger-color);">Esta acção não pode ser desfeita!</p>
            <div class="modal-buttons">
                <button class="btn-secondary-custom" onclick="closeDeleteModal()">
                    <i class="fas fa-times"></i> Cancelar
                </button>
                <button class="btn-danger-custom" onclick="confirmDelete()">
                    <i class="fas fa-trash"></i> Eliminar
                </button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentDeleteId = null;

        function openDeleteModal(id, nome) {
            currentDeleteId = id;
            document.getElementById('directorNome').textContent = nome;
            document.getElementById('deleteModal').style.display = 'flex';
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').style.display = 'none';
            currentDeleteId = null;
        }

        function confirmDelete() {
            console.log('Eliminar director com ID:', currentDeleteId);
            alert('Director eliminado com sucesso!');
            window.location.href = 'index.html';
        }

        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeDeleteModal();
            }
        });
    </script>
</body>
</html>