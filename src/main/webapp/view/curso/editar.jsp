<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Académico • Editar Curso</title>
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
                        <h4><i class="fas fa-edit"></i> Editar Curso</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning mb-4">
                            <i class="fas fa-info-circle"></i> A editar curso ID: <strong>1</strong> - Engenharia Informática
                        </div>

                        <form action="index.html" method="GET">
                            <div class="form-group">
                                <label class="form-label">Nome do Curso *</label>
                                <input type="text" class="form-control-custom" required value="Engenharia Informática">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Código do Curso *</label>
                                <input type="text" class="form-control-custom" required value="EI001">
                                <small class="text-muted">Código único identificador do curso</small>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Duração *</label>
                                        <select class="form-control-custom" required>
                                            <option value="2 Anos">2 Anos</option>
                                            <option value="3 Anos">3 Anos</option>
                                            <option value="4 Anos">4 Anos</option>
                                            <option value="5 Anos" selected>5 Anos</option>
                                            <option value="6 Anos">6 Anos</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Status *</label>
                                        <select class="form-control-custom" required>
                                            <option value="Ativo" selected>Ativo</option>
                                            <option value="Inativo">Inativo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Descrição do Curso</label>
                                <textarea class="form-control-custom" rows="4" placeholder="Descreva o curso, suas disciplinas, objetivos e áreas de atuação...">O curso de Engenharia Informática forma profissionais capacitados para desenvolver soluções tecnológicas, programar sistemas, gerenciar bancos de dados e atuar em diversas áreas da tecnologia da informação.</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Vagas Anuais</label>
                                        <input type="number" class="form-control-custom" value="60">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Propina (USD)</label>
                                        <input type="number" step="0.01" class="form-control-custom" value="250.00">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Coordenação do Curso</label>
                                <input type="text" class="form-control-custom" value="Prof. Dr. João Silva">
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Data de Criação</label>
                                        <input type="date" class="form-control-custom" value="2020-01-15">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Pré-requisitos</label>
                                        <input type="text" class="form-control-custom" value="12ª Classe com ênfase em Matemática e Física">
                                    </div>
                                </div>
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="index.html" class="btn-secondary-custom">
                                    <i class="fas fa-times"></i> Cancelar
                                </a>
                                <button type="submit" class="btn-success-custom">
                                    <i class="fas fa-save"></i> Atualizar Curso
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