<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Detalhes do Curso</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/curso.css">
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
                        <h4><i class="fas fa-info-circle"></i> Detalhes do Curso</h4>
                    </div>
                    <div class="card-body">
                        <!-- Badge Status -->
                        <div class="text-end mb-3">
                            <span class="badge-custom badge-success" style="font-size: 1rem;">
                                <i class="fas fa-check-circle"></i> Ativo
                            </span>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <strong><i class="fas fa-tag"></i> ID do Curso:</strong>
                                <p class="mt-2 fs-5">1</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <strong><i class="fas fa-barcode"></i> Código:</strong>
                                <p class="mt-2 fs-5">EI001</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mb-4">
                                <strong><i class="fas fa-graduation-cap"></i> Nome do Curso:</strong>
                                <p class="mt-2 fs-4 fw-bold" style="color: var(--primary-color);">Engenharia Informática</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-4">
                                <strong><i class="fas fa-hourglass-half"></i> Duração:</strong>
                                <p class="mt-2">5 Anos</p>
                            </div>
                            <div class="col-md-4 mb-4">
                                <strong><i class="fas fa-users"></i> Vagas Anuais:</strong>
                                <p class="mt-2">60</p>
                            </div>
                            <div class="col-md-4 mb-4">
                                <strong><i class="fas fa-dollar-sign"></i> Propina:</strong>
                                <p class="mt-2">250.00 USD</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <strong><i class="fas fa-user-tie"></i> Coordenação:</strong>
                                <p class="mt-2">Prof. Dr. João Silva</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <strong><i class="fas fa-calendar-alt"></i> Data de Criação:</strong>
                                <p class="mt-2">15 de Janeiro, 2020</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <strong><i class="fas fa-clipboard-list"></i> Pré-requisitos:</strong>
                                <p class="mt-2">12ª Classe com ênfase em Matemática e Física</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <strong><i class="fas fa-align-left"></i> Descrição do Curso:</strong>
                                <p class="mt-2" style="text-align: justify;">O curso de Engenharia Informática forma profissionais capacitados para desenvolver soluções tecnológicas, programar sistemas, gerenciar bancos de dados e atuar em diversas áreas da tecnologia da informação. Os graduados estarão aptos a trabalhar com desenvolvimento de software, gestão de projetos de TI, segurança da informação, entre outras áreas.</p>
                            </div>
                        </div>

                        <!-- Estatísticas Adicionais -->
                        <div class="row mt-4">
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(49, 130, 206, 0.1);">
                                    <div class="stat-number" style="color: var(--primary-color);">128</div>
                                    <div class="stat-label" style="color: var(--primary-color);">Estudantes Matriculados</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(56, 161, 105, 0.1);">
                                    <div class="stat-number" style="color: var(--success-color);">24</div>
                                    <div class="stat-label" style="color: var(--success-color);">Docentes</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="stat-card" style="background: rgba(214, 158, 46, 0.1);">
                                    <div class="stat-number" style="color: var(--warning-color);">18</div>
                                    <div class="stat-label" style="color: var(--warning-color);">Disciplinas</div>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="index.html" class="btn-secondary-custom">
                                <i class="fas fa-arrow-left"></i> Voltar
                            </a>
                            <a href="editar.html?id=1" class="btn-warning-custom">
                                <i class="fas fa-edit"></i> Editar Curso
                            </a>
                            <button class="btn-danger-custom" onclick="openDeleteModal(1, 'Engenharia Informática')">
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
            <p>Tem certeza que deseja eliminar o curso <strong id="cursoNome"></strong>?</p>
            <p style="font-size: 0.9rem; color: var(--danger-color);">Esta ação não pode ser desfeita!</p>
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

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentDeleteId = null;

        function openDeleteModal(id, nome) {
            currentDeleteId = id;
            document.getElementById('cursoNome').textContent = nome;
            document.getElementById('deleteModal').style.display = 'flex';
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').style.display = 'none';
            currentDeleteId = null;
        }

        function confirmDelete() {
            console.log('Eliminar curso com ID:', currentDeleteId);
            alert('Curso eliminado com sucesso!');
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