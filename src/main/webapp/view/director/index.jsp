<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Directores</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/director.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-user-tie"></i> Directores
                </a>
                <a class="nav-link" href="#">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Estatísticas -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">4</div>
                    <div class="stat-label">Total de Directores</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">3</div>
                    <div class="stat-label">Directores Activos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">1</div>
                    <div class="stat-label">Directores Inactivos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">8</div>
                    <div class="stat-label">Cursos Sob Supervisão</div>
                </div>
            </div>
        </div>

        <div class="card-custom">
            <div class="card-header">
                <h4><i class="fas fa-user-tie"></i> Gestão de Directores</h4>
            </div>
            <div class="card-body">
                <!-- Toolbar -->
                <div class="toolbar">
                    <a href="criar.html" class="btn-purple-custom">
                        <i class="fas fa-plus"></i> Novo Director
                    </a>
                    <div class="search-box">
                        <input type="text" class="form-control-custom" placeholder="Pesquisar director...">
                        <button class="btn-primary-custom" style="padding: 12px 20px;">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <!-- Tabela de Directores -->
                <div class="table-responsive">
                    <table class="table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Cargo</th>
                                <th>Email</th>
                                <th>Telefone</th>
                                <th>Mandato</th>
                                <th>Status</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <i class="fas fa-user-tie" style="color: var(--purple-color); margin-right: 8px;"></i>
                                    Prof. Dr. Manuel Fernandes
                                </td>
                                <td>Director-Geral</td>
                                <td>manuel.fernandes@ojj.ac.ao</td>
                                <td>+244 923 000 111</td>
                                <td>2023-2027</td>
                                <td><span class="badge-custom badge-success">Activo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=1" class="btn-info-custom" title="Visualizar">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=1" class="btn-warning-custom" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(1, 'Prof. Dr. Manuel Fernandes')" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <i class="fas fa-user-tie" style="color: var(--purple-color); margin-right: 8px;"></i>
                                    Profa. Dra. Helena Costa
                                 </td>
                                <td>Directora Académica</td>
                                <td>helena.costa@ojj.ac.ao</td>
                                <td>+244 923 000 222</td>
                                <td>2023-2027</td>
                                <td><span class="badge-custom badge-success">Activo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=2" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=2" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(2, 'Profa. Dra. Helena Costa')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <i class="fas fa-user-tie" style="color: var(--purple-color); margin-right: 8px;"></i>
                                    Prof. Dr. Carlos Rodrigues
                                 </td>
                                <td>Director Administrativo</td>
                                <td>carlos.rodrigues@ojj.ac.ao</td>
                                <td>+244 923 000 333</td>
                                <td>2023-2027</td>
                                <td><span class="badge-custom badge-success">Activo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=3" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=3" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(3, 'Prof. Dr. Carlos Rodrigues')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>
                                    <i class="fas fa-user-tie" style="color: var(--purple-color); margin-right: 8px;"></i>
                                    Profa. Mónica Santos
                                 </td>
                                <td>Directora de Recursos Humanos</td>
                                <td>monica.santos@ojj.ac.ao</td>
                                <td>+244 923 000 444</td>
                                <td>2022-2026</td>
                                <td><span class="badge-custom badge-warning">Inactivo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=4" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=4" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(4, 'Profa. Mónica Santos')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
            closeDeleteModal();
        }

        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeDeleteModal();
            }
        });
    </script>
</body>
</html>