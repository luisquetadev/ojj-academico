<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Coordenadores</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/coordenador.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-chalkboard-user"></i> Coordenadores
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
                    <div class="stat-number">8</div>
                    <div class="stat-label">Total de Coordenadores</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">6</div>
                    <div class="stat-label">Coordenadores Ativos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">2</div>
                    <div class="stat-label">Coordenadores Inativos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">12</div>
                    <div class="stat-label">Cursos Sob Gestão</div>
                </div>
            </div>
        </div>

        <div class="card-custom">
            <div class="card-header">
                <h4><i class="fas fa-chalkboard-user"></i> Gestão de Coordenadores</h4>
            </div>
            <div class="card-body">
                <!-- Toolbar -->
                <div class="toolbar">
                    <a href="criar.html" class="btn-success-custom">
                        <i class="fas fa-plus"></i> Novo Coordenador
                    </a>
                    <div class="search-box">
                        <input type="text" class="form-control-custom" placeholder="Pesquisar coordenador...">
                        <button class="btn-primary-custom" style="padding: 12px 20px;">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <!-- Tabela de Coordenadores -->
                <div class="table-responsive">
                    <table class="table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Telefone</th>
                                <th>Curso</th>
                                <th>Status</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Prof. Dr. João Silva
                                </td>
                                <td>joao.silva@ojj.ac.ao</td>
                                <td>+244 923 456 789</td>
                                <td>Engenharia Informática</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=1" class="btn-info-custom" title="Visualizar">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=1" class="btn-warning-custom" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(1, 'Prof. Dr. João Silva')" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Profa. Dra. Maria Santos
                                </td>
                                <td>maria.santos@ojj.ac.ao</td>
                                <td>+244 912 345 678</td>
                                <td>Medicina</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=2" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=2" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(2, 'Profa. Dra. Maria Santos')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Prof. Dr. Carlos Mendes
                                </td>
                                <td>carlos.mendes@ojj.ac.ao</td>
                                <td>+244 934 567 890</td>
                                <td>Direito</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=3" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=3" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(3, 'Prof. Dr. Carlos Mendes')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Profa. Ana Paula Costa
                                </td>
                                <td>ana.costa@ojj.ac.ao</td>
                                <td>+244 945 678 901</td>
                                <td>Arquitetura</td>
                                <td><span class="badge-custom badge-warning">Inativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=4" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=4" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(4, 'Profa. Ana Paula Costa')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Prof. Dr. Ricardo Fonseca
                                </td>
                                <td>ricardo.fonseca@ojj.ac.ao</td>
                                <td>+244 923 456 123</td>
                                <td>Psicologia</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=5" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=5" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(5, 'Prof. Dr. Ricardo Fonseca')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Profa. Dra. Teresa Lima
                                </td>
                                <td>teresa.lima@ojj.ac.ao</td>
                                <td>+244 956 789 012</td>
                                <td>Administração</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=6" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=6" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(6, 'Profa. Dra. Teresa Lima')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Prof. Dr. António Neto
                                </td>
                                <td>antonio.neto@ojj.ac.ao</td>
                                <td>+244 967 890 123</td>
                                <td>Enfermagem</td>
                                <td><span class="badge-custom badge-warning">Inativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=7" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=7" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(7, 'Prof. Dr. António Neto')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>
                                    <i class="fas fa-user-circle" style="color: var(--accent-color); margin-right: 8px;"></i>
                                    Profa. Mónica Carvalho
                                </td>
                                <td>monica.carvalho@ojj.ac.ao</td>
                                <td>+244 978 901 234</td>
                                <td>Comunicação Social</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=8" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=8" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(8, 'Profa. Mónica Carvalho')">
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
            <p>Tem certeza que deseja eliminar o coordenador <strong id="coordenadorNome"></strong>?</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentDeleteId = null;

        function openDeleteModal(id, nome) {
            currentDeleteId = id;
            document.getElementById('coordenadorNome').textContent = nome;
            document.getElementById('deleteModal').style.display = 'flex';
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').style.display = 'none';
            currentDeleteId = null;
        }

        function confirmDelete() {
            console.log('Eliminar coordenador com ID:', currentDeleteId);
            alert('Coordenador eliminado com sucesso!');
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