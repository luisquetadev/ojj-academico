<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJJ Acadêmico - Declarações</title>
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
            color: #9a3412;
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
            border-color: #9a3412;
            box-shadow: 0 0 0 4px rgba(154, 52, 18, 0.12);
        }

        .btn-primary {
            background: #9a3412;
            border-color: #9a3412;
            min-height: 46px;
            font-weight: 800;
        }

        .btn-primary:hover {
            background: #7c2d12;
            border-color: #7c2d12;
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

        .paper-preview {
            min-height: 380px;
            background: #ffffff;
            border: 1px solid #d6e1ea;
            border-radius: 8px;
            box-shadow: 0 20px 44px rgba(18, 50, 79, 0.12);
            padding: 30px;
            position: relative;
        }

        .paper-preview::before {
            content: "";
            position: absolute;
            inset: 0;
            border-top: 8px solid #12324f;
            border-radius: 8px 8px 0 0;
            pointer-events: none;
        }

        .paper-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e5edf3;
        }

        .paper-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #12324f;
            font-weight: 900;
        }

        .paper-seal {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: #fff4ed;
            color: #9a3412;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.35rem;
        }

        .paper-tag {
            color: #9a3412;
            font-size: 0.78rem;
            font-weight: 900;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }

        .paper-title {
            margin: 34px 0 22px;
            text-align: center;
            color: #12324f;
            font-size: 1.35rem;
            font-weight: 900;
            text-transform: uppercase;
        }

        .paper-lines span {
            display: block;
            height: 10px;
            border-radius: 999px;
            background: #d9e6ee;
            margin-bottom: 14px;
        }

        .paper-lines span:nth-child(1) {
            width: 96%;
        }

        .paper-lines span:nth-child(2) {
            width: 88%;
        }

        .paper-lines span:nth-child(3) {
            width: 92%;
        }

        .paper-lines span:nth-child(4) {
            width: 58%;
        }

        .signature-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 54px;
        }

        .signature-line {
            width: 210px;
            border-top: 1px solid #9fb1c1;
            padding-top: 8px;
            color: #667085;
            font-size: 0.82rem;
            text-align: center;
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
                <h1>Emissão de Declaração</h1>
                <p>Geração de declaração acadêmica em PDF para estudantes cadastrados.</p>
            </div>
            <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-secondary">
                <i class="fas fa-chevron-left"></i> Painel da Secretaria
            </a>
        </header>

        <section class="document-grid">
            <div class="emission-panel">
                <div class="section-kicker">
                    <i class="fas fa-file-pdf"></i> Documento acadêmico
                </div>
                <h2>Pesquisar estudante</h2>
                <p class="field-help">Informe o número de estudante para gerar a declaração de frequência ou matrícula com dados oficiais.</p>

                <% if(request.getAttribute("erro") != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i><%= request.getAttribute("erro") %>
                    </div>
                <% } %>

                <form action="<%= request.getContextPath() %>/secretario/declaracao" method="post">
                    <div class="mb-4">
                        <label for="numeroEstudante" class="form-label">Número do Estudante</label>
                        <input type="text" class="form-control-custom" id="numeroEstudante" name="numeroEstudante" required placeholder="Ex: 20241234">
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-download"></i> Gerar e Descarregar PDF
                        </button>
                        <a href="<%= request.getContextPath() %>/secretario/dashboard" class="btn btn-secondary">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>

            <aside class="preview-panel" aria-label="Pré-visualização da declaração">
                <div class="paper-preview">
                    <div class="paper-head">
                        <div class="paper-brand">
                            <span class="paper-seal"><i class="fas fa-university"></i></span>
                            <span>OJJ Acadêmico</span>
                        </div>
                        <span class="paper-tag">Declaração</span>
                    </div>
                    <div class="paper-title">Declaração Acadêmica</div>
                    <div class="paper-lines" aria-hidden="true">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="signature-area">
                        <div class="signature-line">Secretaria Acadêmica</div>
                    </div>
                </div>
                <p class="preview-note">O documento final é montado pelo sistema depois da validação do estudante.</p>
            </aside>
        </section>
    </main>

    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
