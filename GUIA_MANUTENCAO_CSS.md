# Guia de Manutenção CSS

## Estrutura de Ficheiros CSS

| Ficheiro | Linhas | Propósito |
|---|---|---|
| `assets/css/main.css` | 1563 | Design system principal — variáveis, componentes, utilitários |
| `assets/css/dashboard.css` | 291 | Estilos legacy do dashboard |
| `assets/css/login.css` | 132 | Página de login |
| `assets/css/register.css` | 83 | Página de registo |
| `assets/css/director.css` | 593 | Módulo do director |
| `assets/css/curso.css` | 497 | Gestão de cursos |
| `assets/css/coordenador.css` | 538 | Módulo do coordenador |
| `assets/css/bootstrap.min.css` | — | Bootstrap 5 (minificado, **não editar**) |
| `assets/css/all.min.css` | — | Font Awesome 6 (minificado, **não editar**) |

> **Regra:** Alterações globais fazem-se no `main.css`. Ficheiros específicos (director.css, curso.css, etc.) sobrescrevem apenas quando necessário.

---

## 1. Cores

### 1.1 Paleta Principal (`main.css` — raiz `:root`)

```css
--primary: #1e3a5f;         /* Azul escuro — cor principal da marca */
--primary-light: #2c5282;    /* Azul médio — hover, gradientes */
--primary-dark: #0f2440;     /* Azul muito escuro — footer, bg escuro */
--accent: #3182ce;           /* Azul vibrante — links, elementos interactivos */
--accent-light: #63b3ed;     /* Azul claro — hover de accent */
--accent-dark: #1a4f8a;      /* Azul escuro — active state */
```

### 1.2 Cores Semânticas

```css
--success: #38a169;         /* Verde — sucesso, pago, activo */
--success-light: #48bb78;   /* Verde claro — hover */
--warning: #d69e2e;         /* Amarelo — aviso, pendente */
--warning-light: #ecc94b;   /* Amarelo claro */
--danger: #e53e3e;          /* Vermelho — erro, bloqueado, atrasado */
--danger-light: #fc8181;    /* Vermelho claro */
--info: #3182ce;            /* Azul — informativo */
```

### 1.3 Cores Adicionais para Cards/S tags

```css
--purple: #6b46c0;          /* Roxo — estatísticas/cards */
--purple-light: #9f7aea;
--pink: #d53f8c;            /* Rosa */
--orange: #dd6b20;          /* Laranja */
--teal: #319795;            /* Teal */
```

### 1.4 Escala de Cinza

```css
--gray-50: #f7fafc;
--gray-100: #edf2f7;        /* Fundo de tabelas, inputs */
--gray-200: #e2e8f0;        /* Bordas */
--gray-300: #cbd5e0;
--gray-400: #a0aec0;        /* Placeholder, texto secundário */
--gray-500: #718096;
--gray-600: #4a5568;        /* Texto corporal */
--gray-700: #2d3748;
--gray-800: #1a202c;        /* Títulos */
```

### 1.5 Como Mudar uma Cor

**Exemplo:** Alterar a cor primária de azul para verde.

1. Abrir `assets/css/main.css`
2. Localizar `:root {`
3. Substituir o valor de `--primary`, `--primary-light`, `--primary-dark`:

```css
--primary: #1b5e20;         /* Verde escuro */
--primary-light: #2e7d32;
--primary-dark: #0d3b10;
```

4. Ajustar `--accent` para complementar:

```css
--accent: #4caf50;
--accent-light: #81c784;
--accent-dark: #388e3c;
```

5. Atualizar o gradiente de fundo:

```css
--bg-gradient: linear-gradient(135deg, #1b5e20 0%, #2e7d32 50%, #4caf50 100%);
```

6. Verificar contraste nos botões, cards e badges que usam estas variáveis.

---

## 2. Tipografia

### 2.1 Font Family

```css
/* main.css — linha ~26 */
--font-primary: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
```

**Para mudar:** Substituir esta variável. Exemplo para usar Inter:

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
--font-primary: 'Inter', sans-serif;
```

### 2.2 Tamanhos de Letra (classes utilitárias)

```css
.fs-small  { font-size: 0.82rem; }   /* Rótulos, metadados */
.fs-normal { font-size: 0.95rem; }   /* Texto padrão */
.fs-medium { font-size: 1.1rem; }    /* Destaque subtil */
.fs-large  { font-size: 1.4rem; }    /* Subtítulos */
```

### 2.3 Tamanhos por Elemento

| Elemento | Classe/Tag | Tamanho |
|---|---|---|
| Nome da marca no navbar | `.navbar-brand` | `1.4rem` |
| Título da página | `h2` em `.page-header` | `1.8rem` |
| Título do welcome card | `h1` | `1.8rem` |
| Números de estatísticas | `.stat-number` | `2.5rem` |
| Nome no perfil | `.profile-name` | `1.6rem` |
| Cabeçalhos de tabela | `.table-custom th` | `0.85rem` uppercase |
| Badges | `.badge-custom` | `0.8rem` |
| Botões | `.btn-custom` | `0.95rem` |
| Botões pequenos | `.btn-sm-custom` | `0.82rem` |
| Botões grandes | `.btn-lg-custom` | `1.05rem` |
| Labels de formulário | `.form-label, label` | `0.92rem` |

**Para alterar um tamanho específico:** Localizar o selector no `main.css` e ajustar o `font-size`.

---

## 3. Espaçamentos

### 3.1 Classes Utilitárias de Gap

```css
.gap-1 { gap: 0.25rem; }
.gap-2 { gap: 0.5rem; }
.gap-3 { gap: 1rem; }
.gap-4 { gap: 1.5rem; }
.gap-5 { gap: 2rem; }
```

### 3.2 Margins

```css
.mt-1 { margin-top: 0.25rem; }  ...  .mt-5 { margin-top: 2rem; }
.mb-1 { margin-bottom: 0.25rem; } ...  .mb-5 { margin-bottom: 2rem; }
```

### 3.3 Paddings

```css
.p-2 { padding: 0.5rem; }  ...  .p-5 { padding: 2rem; }
```

---

## 4. Sombras

```css
--shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.08);   /* Cards subtis */
--shadow-md: 0 4px 15px rgba(0, 0, 0, 0.1);   /* Cards padrão */
--shadow-lg: 0 10px 30px rgba(0, 0, 0, 0.15); /* Modais, dropdowns */
--shadow-xl: 0 20px 40px rgba(0, 0, 0, 0.2);  /* Elementos em destaque */
```

---

## 5. Bordas Arredondadas

```css
--radius-sm: 6px;    /* Inputs, badges */
--radius-md: 10px;   /* Cards, botões */
--radius-lg: 16px;   /* Modais */
--radius-xl: 24px;   /* Avatares, pills */
```

---

## 6. Breakpoints (Responsividade)

```css
/* Tablet — 768px (main.css) */
@media (max-width: 768px) {
    /* Navbar: padding reduzido */
    /* Cards: padding 1.5rem -> 1rem */
    /* Topbar: flex-wrap */
    /* Login card: max-width 90% */
    /* stat-number: 2.5rem -> 1.8rem */
    /* Botões: padding reduzido */
    /* Tabela: font-size menor */
    /* Toolbar: flex-direction column */
}

/* Mobile pequeno — 480px */
@media (max-width: 480px) {
    /* Menu grid: 1 coluna */
    /* Modal content: padding 1rem */
}

/* Desktop — 992px */
@media (min-width: 992px) {
    /* Menu grid: minmax(220px, 1fr) */
}
```

**Para adicionar um breakpoint:** Inserir novo `@media` no `main.css` seguindo o padrão existente.

---

## 7. Componentes Principais

### 7.1 Cards (`main.css` ~linha 300)

```css
.card-custom {
    background: var(--glass-bg);
    backdrop-filter: blur(20px);
    border: 1px solid var(--glass-border);
    border-radius: var(--radius-md);
    padding: 1.5rem;
    box-shadow: var(--shadow-md);
}
```

**Onde é usado:** Todas as páginas com conteúdo empacotado.

### 7.2 Cards de Estatística

```css
.stat-card { ... }              /* Base */
.stat-card-primary { ... }      /* Gradiente azul */
.stat-card-success { ... }      /* Gradiente verde */
.stat-card-warning { ... }      /* Gradiente amarelo */
.stat-card-danger { ... }       /* Gradiente vermelho */
.stat-card-info { ... }         /* Gradiente azul info */
.stat-card-purple { ... }       /* Gradiente roxo */
.stat-card-pink { ... }         /* Gradiente rosa */
.stat-card-teal { ... }         /* Gradiente teal */
```

**Onde é usado:** Dashboards (admin, director, coordenador, etc.).

**Para mudar o gradiente de um stat-card:** Localizar `stat-card-primary` e alterar o `background: linear-gradient(...)`.

### 7.3 Botões

```css
.btn-primary-custom { background: var(--primary); }
.btn-secondary-custom { background: var(--gray-500); }
.btn-success-custom { background: var(--success); }
.btn-warning-custom { background: var(--warning); }
.btn-danger-custom { background: var(--danger); }
.btn-info-custom { background: var(--info); }
.btn-purple-custom { background: var(--purple); }
.btn-pink-custom { background: var(--pink); }
```

**Onde é usado:** Todos os formulários e acções no sistema.

### 7.4 Tabelas

```css
.table-custom {
    /* Borda, background, font-size */
}
.table-custom thead {
    /* Fundo: var(--primary), texto: branco */
}
```

**Onde é usado:** Listagens (estudantes, funcionários, pagamentos, etc.).

### 7.5 Badges

```css
.badge-custom-success { background: var(--success); }
.badge-custom-warning { background: var(--warning); }
.badge-custom-danger { background: var(--danger); }
.badge-custom-info { background: var(--info); }
.badge-custom-purple { background: var(--purple); }
.badge-custom-secondary { background: var(--gray-500); }
```

**Onde é usado:** Status de matrícula, pagamento, perfis de utilizador.

### 7.6 Alertas

```css
.alert-custom-success { border-left: 4px solid var(--success); }
.alert-custom-danger { border-left: 4px solid var(--danger); }
.alert-custom-warning { border-left: 4px solid var(--warning); }
.alert-custom-info { border-left: 4px solid var(--info); }
```

**Onde é usado:** Mensagens de feedback ao utilizador.

### 7.7 Navbar

```css
.navbar-custom {
    background: var(--glass-bg);
    backdrop-filter: blur(20px);
    box-shadow: var(--shadow-sm);
}
.navbar-custom.scrolled {
    box-shadow: var(--shadow-md);
}
```

**Onde é usado:** Topo de todas as páginas internas.

### 7.8 Menu Grid (Dashboard)

```css
.menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
}
```

**Onde é usado:** Página inicial do dashboard de cada perfil.

### 7.9 Modais

```css
.modal-overlay { ... }
.modal-content { ... }
```

**Onde é usado:** Confirmações de exclusão, formulários rápidos.

### 7.10 Avatares

```css
.profile-avatar {
    width: 120px; height: 120px;
    border-radius: 50%;
    background: var(--bg-gradient);
}
```

**Onde é usado:** Perfis de utilizador.

---

## 8. Animações

```css
.animate-fade-in     /* Opacity 0 -> 1 */
.animate-slide-up    /* TranslateY 20px -> 0 */
.animate-slide-down  /* TranslateY -20px -> 0 */
.animate-pulse       /* Opacity pulsing */
```

**Para adicionar nova animação:** Definir `@keyframes` e criar classe utilitária.

---

## 9. Utilitários Disponíveis

```css
.text-primary   .text-success   .text-warning   .text-danger
.text-info      .text-purple    .text-pink      .text-teal
.text-muted     .text-white

.bg-primary     .bg-success     .bg-warning     .bg-danger
.bg-info        .bg-purple      .bg-pink

.fw-light       .fw-normal      .fw-medium      .fw-semibold   .fw-bold
.text-center    .text-end       .text-start

.d-flex         .d-grid         .d-none         .d-block
.flex-column    .flex-wrap      .align-items-center
.justify-center  .justify-between
```

---

## 10. Checklist para Alterações CSS

- [ ] Usar variáveis CSS (`--primary`, `--success`, etc.) em vez de valores hardcoded
- [ ] Testar em 3 breakpoints: desktop (≥992px), tablet (768px), mobile (480px)
- [ ] Verificar contraste de cor (acessibilidade)
- [ ] Alterar no `main.css` primeiro; só usar ficheiro específico se for exclusivo daquele módulo
- [ ] Após alteração, limpar cache do browser (Ctrl+F5)
- [ ] Correr `mvn compile` para garantir que não há erros
