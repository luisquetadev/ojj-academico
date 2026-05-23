<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Novo Curso</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
            <div class="col-md-8">
                <div class="card-custom">
                    <div class="card-header">
                        <h4><i class="fas fa-plus-circle"></i> Criar Novo Curso</h4>
                    </div>
                    <div class="card-body">
                        <form action="index.html" method="GET">
                            <div class="form-group">
                                <label class="form-label">Nome do Curso *</label>
                                <input type="text" class="form-control-custom" required placeholder="Ex: Engenharia Informática">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Código do Curso *</label>
                                <input type="text" class="form-control-custom" required placeholder="Ex: EI001">
                                <small class="text-muted">Código único identificador do curso</small>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Duração *</label>
                                        <select class="form-control-custom" required>
                                            <option value="">Selecione a duração</option>
                                            <option value="2 Anos">2 Anos</option>
                                            <option value="3 Anos">3 Anos</option>
                                            <option value="4 Anos">4 Anos</option>
                                            <option value="5 Anos">5 Anos</option>
                                            <option value="6 Anos">6 Anos</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Status *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Ativo">Ativo</option>
                                            <option value="Inativo">Inativo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Descrição do Curso</label>
                                <textarea class="form-control-custom" rows="4" placeholder="Descreva o curso, suas disciplinas, objetivos e áreas de atuação..."></textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Vagas Anuais</label>
                                        <input type="number" class="form-control-custom" placeholder="Número de vagas por ano">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Propina (USD)</label>
                                        <input type="number" step="0.01" class="form-control-custom" placeholder="Valor da propina">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Coordenação do Curso</label>
                                <input type="text" class="form-control-custom" placeholder="Nome do coordenador do curso">
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Criação</label>
                                        <input type="date" class="form-control-custom">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Pré-requisitos</label>
                                        <input type="text" class="form-control-custom" placeholder="Pré-requisitos para ingresso">
                                    </div>
                                </div>
                            </div>

                            <div class="alert alert-info mt-3 mb-4" style="background: rgba(49, 130, 206, 0.1); border-color: rgba(49, 130, 206, 0.3); color: var(--accent-color);">
                                <i class="fas fa-info-circle"></i> Os campos marcados com * são obrigatórios.
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="index.html" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                                <button type="submit" class="btn-success-custom">
                                    <i class="fas fa-save"></i> Salvar Curso
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