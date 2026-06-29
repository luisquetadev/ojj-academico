<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Cursos</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/curso.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-university"></i> OJJ Académico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-book"></i> Cursos
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
                    <div class="stat-number">12</div>
                    <div class="stat-label">Total de Cursos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">8</div>
                    <div class="stat-label">Cursos Ativos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">4</div>
                    <div class="stat-label">Cursos Inativos</div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <div class="stat-number">342</div>
                    <div class="stat-label">Estudantes Matriculados</div>
                </div>
            </div>
        </div>

        <div class="card-custom">
            <div class="card-header">
                <h4><i class="fas fa-book"></i> Gestão de Cursos</h4>
            </div>
            <div class="card-body">
                <!-- Toolbar -->
                <div class="toolbar">
                    <a href="criar.html" class="btn-success-custom">
                        <i class="fas fa-plus"></i> Novo Curso
                    </a>
                    <div class="search-box">
                        <input type="text" class="form-control-custom" placeholder="Pesquisar curso...">
                        <button class="btn-primary-custom" style="padding: 12px 20px;">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <!-- Tabela de Cursos -->
                <div class="table-responsive">
                    <table class="table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome do Curso</th>
                                <th>Código</th>
                                <th>Duração</th>
                                <th>Status</th>
                                <th>Estudantes</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Engenharia Informática</td>
                                <td>EI001</td>
                                <td>5 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>128</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=1" class="btn-info-custom" title="Visualizar">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=1" class="btn-warning-custom" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(1, 'Engenharia Informática')" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Medicina</td>
                                <td>MED002</td>
                                <td>6 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>95</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=2" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=2" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(2, 'Medicina')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Direito</td>
                                <td>DIR003</td>
                                <td>5 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>87</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=3" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=3" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(3, 'Direito')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Arquitetura</td>
                                <td>ARQ004</td>
                                <td>5 Anos</td>
                                <td><span class="badge-custom badge-warning">Inativo</span></td>
                                <td>42</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=4" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=4" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(4, 'Arquitetura')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Psicologia</td>
                                <td>PSI005</td>
                                <td>4 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>64</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=5" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=5" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(5, 'Psicologia')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Administração de Empresas</td>
                                <td>ADM006</td>
                                <td>4 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>73</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=6" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=6" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(6, 'Administração de Empresas')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Enfermagem</td>
                                <td>ENF007</td>
                                <td>4 Anos</td>
                                <td><span class="badge-custom badge-warning">Inativo</span></td>
                                <td>38</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=7" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=7" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(7, 'Enfermagem')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Comunicação Social</td>
                                <td>COM008</td>
                                <td>4 Anos</td>
                                <td><span class="badge-custom badge-success">Ativo</span></td>
                                <td>56</td>
                                <td class="action-buttons">
                                    <a href="ver.html?id=8" class="btn-info-custom">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="editar.html?id=8" class="btn-warning-custom">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button class="btn-danger-custom" onclick="openDeleteModal(8, 'Comunicação Social')">
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
            // Aqui iria a lógica de eliminação
            console.log('Eliminar curso com ID:', currentDeleteId);
            alert('Curso eliminado com sucesso!');
            closeDeleteModal();
            // Recarregar página ou remover linha da tabela
        }

        // Fechar modal ao clicar fora
        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeDeleteModal();
            }
        });
    </script>
</body>
</html>