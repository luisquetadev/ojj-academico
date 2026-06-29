<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Acadêmico - Cartão de Estudante</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/main.css">
    <style>
        body {
            background: #f4f7fb;
            color: #1f2937;
        }

        body::before {
            display: none;
        }

        .document-shell {
            max-width: 1120px;
            margin: 34px auto;
            padding: 0 18px;
        }

        .page-heading {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 18px;
            margin-bottom: 22px;
        }

        .page-heading h1 {
            color: #12324f;
            font-size: 2rem;
            font-weight: 800;
            margin: 0 0 6px;
        }

        .page-heading p {
            color: #667085;
            margin: 0;
        }

        .document-grid {
            display: grid;
            grid-template-columns: minmax(0, 0.92fr) minmax(320px, 1.08fr);
            gap: 22px;
            align-items: stretch;
        }

        .emission-panel,
        .preview-panel {
            background: #ffffff;
            border: 1px solid #dde6f1;
            border-radius: 8px;
            box-shadow: 0 18px 48px rgba(20, 45, 75, 0.08);
        }

        .emission-panel {
            padding: 26px;
        }

        .section-kicker {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #0f766e;
            font-weight: 800;
            font-size: 0.82rem;
            text-transform: uppercase;
            margin-bottom: 14px;
        }

        .emission-panel h2 {
            color: #12324f;
            font-size: 1.35rem;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .field-help {
            color: #667085;
            margin-bottom: 24px;
        }

        .form-label {
            color: #344054;
            font-weight: 700;
        }

        .form-control-custom {
            width: 100%;
            border: 1px solid #cfd9e6;
            border-radius: 8px;
            min-height: 48px;
            padding: 10px 14px;
            color: #1f2937;
            background: #fbfdff;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-control-custom:focus {
            outline: none;
            border-color: #0f766e;
            box-shadow: 0 0 0 4px rgba(15, 118, 110, 0.12);
        }

        .btn-primary {
            background: #0f766e;
            border-color: #0f766e;
            min-height: 46px;
            font-weight: 800;
        }

        .btn-primary:hover {
            background: #115e59;
            border-color: #115e59;
        }

        .btn-secondary {
            background: #eef4f8;
            border-color: #d7e3ec;
            color: #344054;
            font-weight: 700;
        }

        .preview-panel {
            padding: 28px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 18px;
        }

        .student-card-preview {
            width: 100%;
            min-height: 260px;
            border-radius: 8px;
            overflow: hidden;
            background: #ffffff;
            border: 1px solid #d6e1ea;
            box-shadow: 0 20px 44px rgba(18, 50, 79, 0.14);
        }

        .student-card-top {
            background: linear-gradient(135deg, #12324f 0%, #0f766e 100%);
            color: #ffffff;
            padding: 18px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .brand-block {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 800;
        }

        .brand-mark {
            width: 42px;
            height: 42px;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.16);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
        }

        .card-year {
            font-size: 0.82rem;
            font-weight: 800;
            letter-spacing: 0.04em;
            opacity: 0.88;
        }

        .student-card-body {
            padding: 22px;
            display: grid;
            grid-template-columns: 86px 1fr;
            gap: 18px;
            align-items: center;
        }

        .photo-placeholder {
            width: 86px;
            height: 102px;
            border-radius: 8px;
            background: #eef5f7;
            border: 1px dashed #aac3d1;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0f766e;
            font-size: 2rem;
        }

        .student-lines span {
            display: block;
            height: 10px;
            border-radius: 999px;
            background: #d9e6ee;
            margin-bottom: 12px;
        }

        .student-lines span:nth-child(1) {
            width: 76%;
            height: 15px;
            background: #12324f;
        }

        .student-lines span:nth-child(2) {
            width: 56%;
        }

        .student-lines span:nth-child(3) {
            width: 68%;
        }

        .student-card-footer {
            border-top: 1px solid #e5edf3;
            padding: 14px 22px;
            display: flex;
            justify-content: space-between;
            color: #667085;
            font-size: 0.86rem;
            font-weight: 700;
        }

        .preview-note {
            color: #667085;
            font-size: 0.95rem;
            margin: 0;
        }

        @media (max-width: 900px) {
            .page-heading {
                align-items: flex-start;
                flex-direction: column;
            }

            .document-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid px-4">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/secretario/dashboard">
                <i class="fas fa-university"></i> OJJ Acadêmico
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<%= request.getContextPath() %>/secretario/dashboard">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </nav>

    <main class="document-shell">
        <header class="page-heading">
            <div>
                <h1>Cartão de Estudante</h1>
                <p>Emissão de identificação acadêmica para estudantes ativos.</p>
            </div>
            <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-secondary">
                <i class="fas fa-chevron-left"></i> Painel da Secretaria
            </a>
        </header>

        <section class="document-grid">
            <div class="emission-panel">
                <div class="section-kicker">
                    <i class="fas fa-id-card"></i> Documento oficial
                </div>
                <h2>Pesquisar estudante</h2>
                <p class="field-help">Informe o número de estudante para gerar o cartão em PDF com os dados acadêmicos cadastrados.</p>

                <% if(request.getAttribute("erro") != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i><%= request.getAttribute("erro") %>
                    </div>
                <% } %>

                <form action="<%= request.getContextPath() %>/secretario/cartao-estudante" method="post">
                    <div class="mb-4">
                        <label for="numeroEstudante" class="form-label">Número do Estudante</label>
                        <input type="text" class="form-control-custom" id="numeroEstudante" name="numeroEstudante" required placeholder="Ex: 20241234">
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-id-card"></i> Visualizar / Gerar Cartão
                        </button>
                        <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-secondary">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>

            <aside class="preview-panel" aria-label="Pré-visualização do cartão">
                <div class="student-card-preview">
                    <div class="student-card-top">
                        <div class="brand-block">
                            <span class="brand-mark"><i class="fas fa-graduation-cap"></i></span>
                            <span>OJJ Acadêmico</span>
                        </div>
                        <span class="card-year">ESTUDANTE</span>
                    </div>
                    <div class="student-card-body">
                        <div class="photo-placeholder">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <div class="student-lines" aria-hidden="true">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <div class="student-card-footer">
                        <span>Nº do estudante</span>
                        <span>Curso / Turma</span>
                    </div>
                </div>
                <p class="preview-note">O PDF final é gerado após confirmar o número do estudante.</p>
            </aside>
        </section>
    </main>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
