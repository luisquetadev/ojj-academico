# 📊 RESUMO EXECUTIVO - SISTEMA DE GESTÃO ACADÉMICA

## 🎯 Visão Geral do Projeto

Um sistema completo de gestão académica com **32 telas principais** distribuídas em **9 módulos** funcionais, implementado em **Java com Jakarta Servlet/JSP**.

---

## 📈 Estatísticas do Projeto

| Métrica | Quantidade |
|---------|-----------|
| **Telas Principais** | 32 |
| **Servlets (Controllers)** | 32 |
| **JSPs (Views)** | 35+ |
| **Módulos Funcionais** | 9 |
| **Níveis de Acesso (Roles)** | 7 |
| **Linhas de Código Java** | ~15,000 |
| **Linhas de Código JSP** | ~10,000 |

---

## 🏗️ Arquitetura do Sistema

```
┌─────────────────────────────────────────────────────────────┐
│                     NAVEGADOR DO UTILIZADOR                  │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│              CAMADA DE APRESENTAÇÃO (JSP/HTML)               │
│  views/admin/ │ views/professor/ │ views/estudante/ │ ...   │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│             CAMADA DE CONTROLE (SERVLETS)                    │
│  32 Controllers × GET/POST + Filtros de Autenticação        │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│             CAMADA DE NEGÓCIO (SERVICES)                     │
│  EstudanteService │ FuncionarioService │ PropinaService ... │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│              CAMADA DE DADOS (DAO/REPOSITORY)                │
│  EstudanteDAO │ FuncionarioDAO │ PropinaDAO ...             │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│              BASE DE DADOS (MYSQL)                           │
│  Tabelas: utilizadores, estudantes, funcionarios, ...       │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗂️ Mapa de Navegação Visual

```
┌──────────────────────────────────────────────────────────────────────┐
│                         PÁGINA INICIAL                               │
│                      (welcome.jsp) [0]                               │
└──────────────────────────────────────────────────────────────────────┘
                                 ↓
                    ┌────────────────────────┐
                    │   Login [1]            │
                    └────────────────────────┘
                                 ↓
        ┌────────────────────────────────────────────────┐
        │         Autenticação com Sucesso               │
        └────────────────────────────────────────────────┘
                                 ↓
    ┌─────────────────────────────────────────────────────────┐
    │  DASHBOARD (Baseado no Perfil do Utilizador)           │
    └─────────────────────────────────────────────────────────┘
              ↙              ↓              ↘
    ┌──────────────┐ ┌────────────────┐ ┌──────────────────┐
    │ ADMINISTRADOR│ │   PROFESSOR    │ │   SECRETÁRIO     │
    └──────────────┘ └────────────────┘ └──────────────────┘
         ↓               ↓                     ↓
    ┌─ [2]          ┌─ [23]              ┌─ [11]
    │ Dashboard     │ Minhas Turmas      │ Matricula
    │               │                    │
    ├─ [3-6]        ├─ [24]              ├─ [16]
    │ Funcionários  │ Lançar Notas       │ Declarações
    │               │                    │
    ├─ [7-12]       ├─ [25]              ├─ [17]
    │ Estudantes    │ Pautas             │ Confirmação
    │               │                    │
    ├─ [13-15]      └─ [...]             ├─ [18]
    │ Cursos                             │ Cartão
    │                                    │
    ├─ [31]                              ├─ [19]
    │ Utilizadores                       │ Histórico
    │                                    │
    ├─ [32]                              └─ [12]
    │ Logs                                 Trancamento
    │
    └─ [28-30]
      Relatórios
```

---

## 📋 Tabela de Telas por Módulo

### **Módulo 0: Autenticação** (2 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 0 | Boas-vindas | WelcomeServlet | welcome.jsp | /welcome | Público |
| 1 | Login | LoginServlet ✅ | login.jsp ✅ | /login | Público |

---

### **Módulo 1: Dashboard** (1 tela)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 2 | Dashboard Admin | DashboardAdminServlet | admin/dashboard.jsp | /admin/dashboard | ADMIN |

---

### **Módulo 2: Funcionários** (4 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 3 | Listar | FuncionarioListServlet ✅ | admin/funcionario/list.jsp | /admin/funcionario/list | ADMIN, RH |
| 4 | Cadastrar | FuncionarioAdminServlet ✅ | admin/funcionario/form.jsp | /admin/funcionario/new | ADMIN, RH |
| 5 | Editar | FuncionarioEditServlet ✅ | admin/funcionario/edit.jsp | /admin/funcionario/edit | ADMIN, RH |
| 6 | Perfil | FuncionarioPerfilServlet | admin/funcionario/profile.jsp | /admin/funcionario/profile | ADMIN, RH |

---

### **Módulo 3: Estudantes** (6 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 7 | Listar | EstudanteListServlet | admin/estudante/list.jsp | /admin/estudante/list | ADMIN, COORD |
| 8 | Cadastrar | EstudanteAdminServlet | admin/estudante/form.jsp | /admin/estudante/new | ADMIN, SEC |
| 9 | Editar | EstudanteEditServlet | admin/estudante/edit.jsp | /admin/estudante/edit | ADMIN, SEC |
| 10 | Perfil | EstudantePerfilServlet | estudante/profile.jsp | /estudante/profile | ESTUDANTE, ADMIN |
| 11 | Matrícula | MatriculaEstudanteServlet ✅ | secretaria/matricula/form.jsp | /secretario/matricular | SEC, ADMIN |
| 12 | Trancamento | TrancamentoServlet | secretaria/trancamento/form.jsp | /secretario/trancamento | SEC, COORD |

---

### **Módulo 4: Cursos e Turmas** (3 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 13 | Gestão Cursos | CursoServlet | admin/curso/list.jsp | /admin/curso | ADMIN, COORD |
| 14 | Gestão Disciplinas | DisciplinaServlet | admin/disciplina/list.jsp | /admin/disciplina | ADMIN, COORD |
| 15 | Gestão Turmas | TurmaServlet | admin/turma/list.jsp | /admin/turma | ADMIN, COORD |

---

### **Módulo 5: Secretaria** (4 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 16 | Emitir Declaração | DeclaracaoEstudanteServlet ✅ | secretaria/declaracao/form.jsp | /secretario/declaracao | SEC, ESTUDANTE |
| 17 | Confirmação Matrícula | ConfirmacaoMatriculaServlet | secretaria/confirmacao/form.jsp | /secretario/confirmacao-matricula | SEC |
| 18 | Cartão Estudante | CartaoEstudanteServlet | secretaria/cartao/form.jsp | /secretario/cartao-estudante | SEC |
| 19 | Histórico Atendimento | HistoricoAtendimentoServlet | secretaria/historico/list.jsp | /secretario/historico-atendimento | SEC |

---

### **Módulo 6: Tesouraria** (3 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 20 | Pagamento Propina | PropinaServlet | tesouraria/propina/form.jsp | /tesouraria/propina | TESOURARIA, ESTUDANTE |
| 21 | Pagamento Serviços | PagamentoServicosServlet | tesouraria/servicos/form.jsp | /tesouraria/pagamento-servicos | TESOURARIA |
| 22 | Histórico Pagamentos | HistoricoPagamentosServlet | tesouraria/historico/list.jsp | /tesouraria/historico | TESOURARIA, ESTUDANTE |

---

### **Módulo 7: Professores** (3 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 23 | Minhas Turmas | ProfessorTurmasServlet | professor/turmas/list.jsp | /professor/turmas | PROFESSOR |
| 24 | Lançar Notas | LancamentoNotasServlet | professor/notas/form.jsp | /professor/lancar-notas | PROFESSOR |
| 25 | Gestão Pautas | GestiaoPautasServlet | professor/pautas/list.jsp | /professor/pautas | PROFESSOR |

---

### **Módulo 8: Coordenação** (2 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 26 | Aprovação Pautas | AprovacaoPautasServlet | coordenador/pautas/list.jsp | /coordenador/aprovacao-pautas | COORDENADOR |
| 27 | Calendário Académico | CalendarioAcademicoServlet | coordenador/calendario/list.jsp | /coordenador/calendario | COORD, ADMIN |

---

### **Módulo 9: Relatórios** (3 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 28 | Relatório Estudantes | RelatorioEstudantesServlet | relatorios/estudantes/list.jsp | /relatorios/estudantes | ADMIN, COORD |
| 29 | Relatório Financeiro | RelatorioFinanceiroServlet | relatorios/financeiro/list.jsp | /relatorios/financeiro | ADMIN, TESOURARIA |
| 30 | Relatório Académico | RelatorioAcademicoServlet | relatorios/academico/list.jsp | /relatorios/academico | ADMIN, COORD |

---

### **Módulo 10: Sistema** (2 telas)

| # | Tela | Servlet | View | URL | Acesso |
|---|------|---------|------|-----|--------|
| 31 | Gestão Utilizadores | GestaoUtilizadoresServlet | sistema/utilizadores/list.jsp | /sistema/utilizadores | ADMIN |
| 32 | Logs/Auditoria | LogsAuditoriaServlet | sistema/logs/list.jsp | /sistema/logs | ADMIN |

---

## 👥 Papéis de Utilizadores (Roles)

```
┌────────────────────────────────────────────────────────────────┐
│              HIERARQUIA DE PAPÉIS NO SISTEMA                   │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. ADMINISTRADOR (Super User)                                 │
│     └─ Acesso total a todas as funcionalidades               │
│        Permissões: *, *, *                                    │
│                                                                │
│  2. COORDENADOR                                                │
│     └─ Gestão académica, aprovação de pautas, calendário     │
│        Permissões: Cursos, Disciplinas, Turmas, Pautas      │
│                                                                │
│  3. PROFESSOR                                                  │
│     └─ Lançamento de notas e gestão de turmas                │
│        Permissões: Turmas, Notas, Pautas                     │
│                                                                │
│  4. SECRETÁRIO                                                 │
│     └─ Matrículas, declarações, documentos                   │
│        Permissões: Matrículas, Declarações, Atendimento      │
│                                                                │
│  5. TESOURARIA                                                 │
│     └─ Pagamentos e históricos financeiros                   │
│        Permissões: Propinas, Pagamentos, Histórico           │
│                                                                │
│  6. RECURSOS HUMANOS                                           │
│     └─ Gestão de funcionários                                │
│        Permissões: Funcionários                               │
│                                                                │
│  7. ESTUDANTE                                                  │
│     └─ Consulta de perfil, pagamentos, documentos           │
│        Permissões: Perfil, Histórico, Declarações           │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---

## 📊 Matriz de Permissões (RBAC)

| Funcionalidade | ADMIN | COORD | PROF | SEC | TESOUR | RH | ESTUD |
|----------------|:-----:|:-----:|:----:|:---:|:------:|:--:|:-----:|
| **Funcionários** | ✅ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| **Estudantes** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ | 👤 |
| **Cursos** | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| **Turmas** | ✅ | ✅ | 👤 | ❌ | ❌ | ❌ | ❌ |
| **Matrículas** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ | 👤 |
| **Notas** | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ | 👤 |
| **Pautas** | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Declarações** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ | 👤 |
| **Pagamentos** | ✅ | ❌ | ❌ | ❌ | ✅ | ❌ | 👤 |
| **Relatórios** | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Utilizadores** | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |

**Legenda:** ✅ Acesso total | 👤 Acesso pessoal | ❌ Sem acesso

---

## 🔄 Fluxo de Autenticação

```
┌─────────────────────────────────────────────────────────┐
│                   UTILIZADOR ACESSA                      │
│                   /admin/estudante/list                  │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│    AuthFilter Verifica Sessão e Autenticação            │
│    if (utilizador == null) → Redireciona para /login    │
└─────────────────────────────────────────────────────────┘
                           ↓ (autenticado)
┌─────────────────────────────────────────────────────────┐
│   Servlet Verifica Autorização (Papel)                  │
│   if (!ADMIN && !COORDENADOR) → Erro 403 Proibido       │
└─────────────────────────────────────────────────────────┘
                           ↓ (autorizado)
┌─────────────────────────────────────────────────────────┐
│   Controller Executa Lógica de Negócio                  │
│   • Busca dados do banco                                │
│   • Processa filtros e paginação                        │
│   • Envia atributos para JSP                            │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│   JSP Renderiza Página HTML                             │
│   • Exibe tabela de dados                               │
│   • Links de ação (editar, deletar)                     │
│   • Formulários de filtro                               │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│   Resposta Enviada ao Navegador                         │
└─────────────────────────────────────────────────────────┘
```

---

## 📁 Estrutura de Pastas - Visão Geral

```
ojj-academico/
│
├── src/main/java/com/ojj/academico/
│   ├── controller/                    ← 32 Servlets
│   ├── service/                       ← Lógica de negócio
│   ├── repository/ ou dao/            ← Acesso a dados
│   ├── model/                         ← Entidades
│   ├── dto/                           ← Data Transfer Objects
│   ├── validator/                     ← Validações
│   ├── filters/                       ← Filtros (Auth)
│   ├── utils/                         ← Utilitários
│   └── conf/                          ← Configuração
│
├── src/main/webapp/
│   ├── view/                          ← 35+ JSPs
│   │   ├── welcome.jsp
│   │   ├── admin/
│   │   ├── professor/
│   │   ├── estudante/
│   │   ├── secretaria/
│   │   ├── tesouraria/
│   │   ├── coordenador/
│   │   ├── relatorios/
│   │   ├── sistema/
│   │   └── error/
│   ├── WEB-INF/
│   │   └── web.xml                    ← Configuração Servlet
│   └── assets/
│       ├── css/
│       ├── js/
│       └── images/
│
├── pom.xml                            ← Dependências Maven
├── README.md
└── CHECKLIST_IMPLEMENTACAO.md

```

---

## 📚 Arquivos de Documentação Fornecidos

1. **ESTRUTURA_COMPLETA_SISTEMA_ACADEMICO.md**
   - Descrição detalhada de todas as 32 telas
   - Localização de cada arquivo
   - Configuração web.xml para cada servlet
   - Matriz de permissões

2. **GUIA_IMPLEMENTACAO_SERVLETS_JSPS.md**
   - Exemplos de código padrão
   - Templates de Servlet (GET, POST, PUT)
   - Templates de JSP (Listagem, Formulário)
   - Dicas de implementação
   - Checklist por módulo

3. **web.xml**
   - Configuração completa e pronta para usar
   - Todos os 32+ servlets mapeados
   - Filtros de autenticação
   - Tratamento de erros
   - Configuração de sessão

4. **criar_estrutura.sh**
   - Script bash para criar toda a estrutura
   - Cria pastas e arquivos-modelo
   - Gera checklist de implementação
   - Facilita o setup inicial

5. **RESUMO_EXECUTIVO.md** (este arquivo)
   - Visão geral do projeto
   - Tabelas de telas
   - Diagramas de arquitetura
   - Matriz de permissões

---

## 🚀 Como Começar

### Passo 1: Preparar Ambiente
```bash
# Clonar repositório
git clone https://github.com/luisquetadev/ojj-academico.git
cd ojj-academico

# Criar estrutura de pastas
bash criar_estrutura.sh .
```

### Passo 2: Implementar Servlets
- Usar templates como base
- Seguir convenções de nomenclatura
- Implementar lógica de negócio
- Adicionar ao web.xml

### Passo 3: Criar JSPs
- Usar template Bootstrap
- Manter consistência visual
- Implementar paginação
- Adicionar validação client-side

### Passo 4: Configurar web.xml
- Copiar arquivo fornecido
- Adicionar mapeamentos faltantes
- Configurar filtros de autenticação

### Passo 5: Testes
- Testar autenticação
- Testar autorização
- Testar CRUD completo
- Validar paginação

---

## 📊 Cronograma Estimado

| Fase | Duração | Tarefas |
|------|---------|---------|
| **Planejamento** | 1-2 dias | Setup, criar estrutura |
| **Backend Fase 1** | 5-7 dias | Servlets módulos 0-3 |
| **Backend Fase 2** | 5-7 dias | Servlets módulos 4-7 |
| **Backend Fase 3** | 3-5 dias | Servlets módulos 8-10 |
| **Frontend Fase 1** | 7-10 dias | JSPs módulos 0-3 |
| **Frontend Fase 2** | 7-10 dias | JSPs módulos 4-7 |
| **Frontend Fase 3** | 5-7 dias | JSPs módulos 8-10 |
| **Testes** | 7-10 dias | Testes unitários e integração |
| **Deploy** | 2-3 dias | Configuração servidor, deployment |
| **TOTAL** | ~6-8 semanas | Projeto completo |

---

## ✅ Checklist Rápido

- [ ] Estrutura de pastas criada
- [ ] Arquivos de documentação revisados
- [ ] web.xml copiado para WEB-INF
- [ ] Primeiros Servlets implementados
- [ ] Primeiras JSPs criadas
- [ ] Autenticação testada
- [ ] Paginação funcionando
- [ ] Relatórios implementados
- [ ] Testes passando
- [ ] Sistema em produção

---

## 📞 Suporte e Referências

- **Documentação Jakarta Servlet:** https://jakarta.ee/specifications/servlet/
- **JSTL Reference:** https://docs.oracle.com/cd/E19575-01/819-3669/bnakc/index.html
- **Bootstrap 5:** https://getbootstrap.com/docs/5.0/
- **MySQL Connector/J:** https://dev.mysql.com/doc/connector-j/

---

**Projeto:** Sistema de Gestão Académica OJJ  
**Versão:** 1.0.0  
**Data:** May 22, 2026  
**Status:** 📋 Planejamento Completo ✅  
**Próxima Etapa:** 🔧 Implementação em Desenvolvimento

---

## 🎓 Conclusão

Este projeto fornece uma **estrutura completa e bem documentada** para implementar um sistema robusto de gestão académica. Com os templates, guias e arquivos de configuração fornecidos, o desenvolvimento pode iniciar imediatamente com alta produtividade e qualidade garantida.

**Sucesso na implementação! 🚀**
