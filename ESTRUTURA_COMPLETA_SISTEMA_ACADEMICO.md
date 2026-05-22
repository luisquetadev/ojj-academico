# 📋 ESTRUTURA COMPLETA DO SISTEMA DE GESTÃO ACADÉMICA

## Sumário Executivo
- **Total de Telas:** 32 principais
- **Total de Servlets:** 32 (um por tela)
- **Arquitetura:** MVC - Model View Controller com Jakarta Servlet
- **Estrutura Base:**
  - Servlets: `src/main/java/com/ojj/academico/controller/`
  - Views (JSP): `src/main/webapp/view/`
  - Configuração: `src/main/webapp/WEB-INF/web.xml`

---

## 🏛️ MÓDULO 0: AUTENTICAÇÃO E ENTRADA

### 0. Tela de Boas-vindas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/WelcomeServlet.java` |
| **View (JSP)** | `src/main/webapp/view/welcome.jsp` |
| **URL Mapeada** | `/welcome` |
| **Função** | Página inicial com opções de login e informações gerais |
| **Acesso** | Público (não autenticado) |

**web.xml:**
```xml
<servlet>
    <servlet-name>WelcomeServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.WelcomeServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>WelcomeServlet</servlet-name>
    <url-pattern>/welcome</url-pattern>
</servlet-mapping>
```

---

### 1. Login
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/LoginServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/auth/login.jsp` ✅ |
| **URL Mapeada** | `/login` ✅ |
| **Função** | Autenticação de utilizadores |
| **Acesso** | Público |

---

### 2. Dashboard Admin
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/DashboardAdminServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/dashboard.jsp` |
| **URL Mapeada** | `/admin/dashboard` |
| **Função** | Painel principal do administrador com resumo de dados |
| **Acesso** | Apenas ADMINISTRADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>DashboardAdminServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.DashboardAdminServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>DashboardAdminServlet</servlet-name>
    <url-pattern>/admin/dashboard</url-pattern>
</servlet-mapping>
```

---

## 👔 MÓDULO 1: FUNCIONÁRIOS

### 3. Listar Funcionários
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/FuncionarioListServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/admin/funcionario/list.jsp` |
| **URL Mapeada** | `/admin/funcionario/list` ✅ |
| **Função** | Listagem paginada de todos os funcionários com filtros |
| **Acesso** | ADMINISTRADOR, RECURSOS_HUMANOS |

---

### 4. Cadastrar Funcionário
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/FuncionarioAdminServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/admin/funcionario/form.jsp` |
| **URL Mapeada** | `/admin/funcionario/new` ✅ |
| **Função** | Formulário para criar novo funcionário |
| **Acesso** | ADMINISTRADOR, RECURSOS_HUMANOS |

---

### 5. Editar Funcionário
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/FuncionarioEditServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/admin/funcionario/edit.jsp` |
| **URL Mapeada** | `/admin/funcionario/edit` ✅ |
| **Função** | Edição de dados de funcionário existente |
| **Acesso** | ADMINISTRADOR, RECURSOS_HUMANOS |

---

### 6. Perfil do Funcionário
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/FuncionarioPerfilServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/funcionario/profile.jsp` |
| **URL Mapeada** | `/admin/funcionario/profile` |
| **Função** | Visualização detalhada do perfil do funcionário |
| **Acesso** | ADMINISTRADOR, RECURSOS_HUMANOS, PRÓPRIO_FUNCIONÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>FuncionarioPerfilServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.FuncionarioPerfilServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>FuncionarioPerfilServlet</servlet-name>
    <url-pattern>/admin/funcionario/profile</url-pattern>
</servlet-mapping>
```

---

## 📚 MÓDULO 2: ESTUDANTES

### 7. Listar Estudantes
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/EstudanteListServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/estudante/list.jsp` |
| **URL Mapeada** | `/admin/estudante/list` |
| **Função** | Listagem paginada de estudantes com filtros por curso e ano |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>EstudanteListServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.EstudanteListServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>EstudanteListServlet</servlet-name>
    <url-pattern>/admin/estudante/list</url-pattern>
</servlet-mapping>
```

---

### 8. Cadastrar Estudante
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/EstudanteAdminServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/estudante/form.jsp` |
| **URL Mapeada** | `/admin/estudante/new` |
| **Função** | Formulário para registrar novo estudante |
| **Acesso** | ADMINISTRADOR, SECRETÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>EstudanteAdminServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.EstudanteAdminServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>EstudanteAdminServlet</servlet-name>
    <url-pattern>/admin/estudante/new</url-pattern>
</servlet-mapping>
```

---

### 9. Editar Estudante
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/EstudanteEditServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/estudante/edit.jsp` |
| **URL Mapeada** | `/admin/estudante/edit` |
| **Função** | Edição de informações pessoais do estudante |
| **Acesso** | ADMINISTRADOR, SECRETÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>EstudanteEditServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.EstudanteEditServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>EstudanteEditServlet</servlet-name>
    <url-pattern>/admin/estudante/edit</url-pattern>
</servlet-mapping>
```

---

### 10. Perfil do Estudante
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/EstudantePerfilServlet.java` |
| **View (JSP)** | `src/main/webapp/view/estudante/profile.jsp` |
| **URL Mapeada** | `/estudante/profile` |
| **Função** | Visualização do próprio perfil pelo estudante |
| **Acesso** | ESTUDANTE, ADMINISTRADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>EstudantePerfilServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.EstudantePerfilServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>EstudantePerfilServlet</servlet-name>
    <url-pattern>/estudante/profile</url-pattern>
</servlet-mapping>
```

---

### 11. Matrícula do Estudante
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/MatriculaEstudanteServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/secretaria/matricula/form.jsp` |
| **URL Mapeada** | `/secretario/matricular` ✅ |
| **Função** | Processo de matrícula do estudante em turmas/cursos |
| **Acesso** | SECRETÁRIO, ADMINISTRADOR |

---

### 12. Trancamento/Suspensão
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/TrancamentoServlet.java` |
| **View (JSP)** | `src/main/webapp/view/secretaria/trancamento/form.jsp` |
| **URL Mapeada** | `/secretario/trancamento` |
| **Função** | Gerenciar trancamento ou suspensão de matrícula |
| **Acesso** | SECRETÁRIO, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>TrancamentoServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.TrancamentoServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>TrancamentoServlet</servlet-name>
    <url-pattern>/secretario/trancamento</url-pattern>
</servlet-mapping>
```

---

## 🎓 MÓDULO 3: CURSOS E TURMAS

### 13. Gestão de Cursos
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/CursoServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/curso/list.jsp` |
| **URL Mapeada** | `/admin/curso` |
| **Função** | CRUD de cursos (criar, ler, atualizar, deletar) |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>CursoServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.CursoServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>CursoServlet</servlet-name>
    <url-pattern>/admin/curso</url-pattern>
</servlet-mapping>
```

---

### 14. Gestão de Disciplinas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/DisciplinaServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/disciplina/list.jsp` |
| **URL Mapeada** | `/admin/disciplina` |
| **Função** | CRUD de disciplinas por curso |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>DisciplinaServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.DisciplinaServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>DisciplinaServlet</servlet-name>
    <url-pattern>/admin/disciplina</url-pattern>
</servlet-mapping>
```

---

### 15. Gestão de Turmas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/TurmaServlet.java` |
| **View (JSP)** | `src/main/webapp/view/admin/turma/list.jsp` |
| **URL Mapeada** | `/admin/turma` |
| **Função** | CRUD de turmas, horários e salas |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>TurmaServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.TurmaServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>TurmaServlet</servlet-name>
    <url-pattern>/admin/turma</url-pattern>
</servlet-mapping>
```

---

## 📄 MÓDULO 4: SECRETARIA

### 16. Emitir Declaração
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/DeclaracaoEstudanteServlet.java` ✅ |
| **View (JSP)** | `src/main/webapp/view/secretaria/declaracao/form.jsp` |
| **URL Mapeada** | `/secretario/declaracao` ✅ |
| **Função** | Emissão de declarações de matrícula/frequência |
| **Acesso** | SECRETÁRIO, ESTUDANTE (própria) |

---

### 17. Emitir Confirmação de Matrícula
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/ConfirmacaoMatriculaServlet.java` |
| **View (JSP)** | `src/main/webapp/view/secretaria/confirmacao/form.jsp` |
| **URL Mapeada** | `/secretario/confirmacao-matricula` |
| **Função** | Gerar e enviar confirmação de matrícula |
| **Acesso** | SECRETÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>ConfirmacaoMatriculaServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.ConfirmacaoMatriculaServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>ConfirmacaoMatriculaServlet</servlet-name>
    <url-pattern>/secretario/confirmacao-matricula</url-pattern>
</servlet-mapping>
```

---

### 18. Emitir Cartão de Estudante
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/CartaoEstudanteServlet.java` |
| **View (JSP)** | `src/main/webapp/view/secretaria/cartao/form.jsp` |
| **URL Mapeada** | `/secretario/cartao-estudante` |
| **Função** | Geração de cartão de identificação digital |
| **Acesso** | SECRETÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>CartaoEstudanteServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.CartaoEstudanteServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>CartaoEstudanteServlet</servlet-name>
    <url-pattern>/secretario/cartao-estudante</url-pattern>
</servlet-mapping>
```

---

### 19. Histórico de Atendimento
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/HistoricoAtendimentoServlet.java` |
| **View (JSP)** | `src/main/webapp/view/secretaria/historico/list.jsp` |
| **URL Mapeada** | `/secretario/historico-atendimento` |
| **Função** | Registro de atendimentos e consultas na secretaria |
| **Acesso** | SECRETÁRIO |

**web.xml:**
```xml
<servlet>
    <servlet-name>HistoricoAtendimentoServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.HistoricoAtendimentoServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>HistoricoAtendimentoServlet</servlet-name>
    <url-pattern>/secretario/historico-atendimento</url-pattern>
</servlet-mapping>
```

---

## 💰 MÓDULO 5: TESOURARIA

### 20. Pagamento de Propina
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/PropinaServlet.java` |
| **View (JSP)** | `src/main/webapp/view/tesouraria/propina/form.jsp` |
| **URL Mapeada** | `/tesouraria/propina` |
| **Função** | Registro e controle de pagamento de propinas |
| **Acesso** | TESOURARIA, ESTUDANTE (consulta) |

**web.xml:**
```xml
<servlet>
    <servlet-name>PropinaServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.PropinaServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>PropinaServlet</servlet-name>
    <url-pattern>/tesouraria/propina</url-pattern>
</servlet-mapping>
```

---

### 21. Pagamento de Serviços
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/PagamentoServicosServlet.java` |
| **View (JSP)** | `src/main/webapp/view/tesouraria/servicos/form.jsp` |
| **URL Mapeada** | `/tesouraria/pagamento-servicos` |
| **Função** | Gerenciamento de pagamentos adicionais (certificados, etc) |
| **Acesso** | TESOURARIA |

**web.xml:**
```xml
<servlet>
    <servlet-name>PagamentoServicosServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.PagamentoServicosServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>PagamentoServicosServlet</servlet-name>
    <url-pattern>/tesouraria/pagamento-servicos</url-pattern>
</servlet-mapping>
```

---

### 22. Histórico de Pagamentos
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/HistoricoPagamentosServlet.java` |
| **View (JSP)** | `src/main/webapp/view/tesouraria/historico/list.jsp` |
| **URL Mapeada** | `/tesouraria/historico` |
| **Função** | Consulta de histórico de pagamentos |
| **Acesso** | TESOURARIA, ESTUDANTE (próprio) |

**web.xml:**
```xml
<servlet>
    <servlet-name>HistoricoPagamentosServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.HistoricoPagamentosServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>HistoricoPagamentosServlet</servlet-name>
    <url-pattern>/tesouraria/historico</url-pattern>
</servlet-mapping>
```

---

## 👨‍🏫 MÓDULO 6: PROFESSORES

### 23. Minhas Turmas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/ProfessorTurmasServlet.java` |
| **View (JSP)** | `src/main/webapp/view/professor/turmas/list.jsp` |
| **URL Mapeada** | `/professor/turmas` |
| **Função** | Listagem das turmas atribuídas ao professor |
| **Acesso** | PROFESSOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>ProfessorTurmasServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.ProfessorTurmasServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>ProfessorTurmasServlet</servlet-name>
    <url-pattern>/professor/turmas</url-pattern>
</servlet-mapping>
```

---

### 24. Lançamento de Notas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/LancamentoNotasServlet.java` |
| **View (JSP)** | `src/main/webapp/view/professor/notas/form.jsp` |
| **URL Mapeada** | `/professor/lancar-notas` |
| **Função** | Lançamento de notas/avaliações dos estudantes |
| **Acesso** | PROFESSOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>LancamentoNotasServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.LancamentoNotasServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>LancamentoNotasServlet</servlet-name>
    <url-pattern>/professor/lancar-notas</url-pattern>
</servlet-mapping>
```

---

### 25. Gestão de Pautas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/GestiaoPautasServlet.java` |
| **View (JSP)** | `src/main/webapp/view/professor/pautas/list.jsp` |
| **URL Mapeada** | `/professor/pautas` |
| **Função** | Gerenciar pautas (listas de notas) por turma |
| **Acesso** | PROFESSOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>GestiaoPautasServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.GestiaoPautasServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>GestiaoPautasServlet</servlet-name>
    <url-pattern>/professor/pautas</url-pattern>
</servlet-mapping>
```

---

## 📊 MÓDULO 7: COORDENAÇÃO

### 26. Aprovação de Pautas
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/AprovacaoPautasServlet.java` |
| **View (JSP)** | `src/main/webapp/view/coordenador/pautas/list.jsp` |
| **URL Mapeada** | `/coordenador/aprovacao-pautas` |
| **Função** | Revisão e aprovação de pautas submetidas |
| **Acesso** | COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>AprovacaoPautasServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.AprovacaoPautasServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>AprovacaoPautasServlet</servlet-name>
    <url-pattern>/coordenador/aprovacao-pautas</url-pattern>
</servlet-mapping>
```

---

### 27. Calendário Académico
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/CalendarioAcademicoServlet.java` |
| **View (JSP)** | `src/main/webapp/view/coordenador/calendario/list.jsp` |
| **URL Mapeada** | `/coordenador/calendario` |
| **Função** | Gerenciar datas e períodos académicos |
| **Acesso** | COORDENADOR, ADMINISTRADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>CalendarioAcademicoServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.CalendarioAcademicoServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>CalendarioAcademicoServlet</servlet-name>
    <url-pattern>/coordenador/calendario</url-pattern>
</servlet-mapping>
```

---

## 📈 MÓDULO 8: RELATÓRIOS

### 28. Relatório de Estudantes
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/RelatorioEstudantesServlet.java` |
| **View (JSP)** | `src/main/webapp/view/relatorios/estudantes/list.jsp` |
| **URL Mapeada** | `/relatorios/estudantes` |
| **Função** | Gerar relatórios sobre estudantes (inscritos, ativos, etc) |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>RelatorioEstudantesServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.RelatorioEstudantesServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>RelatorioEstudantesServlet</servlet-name>
    <url-pattern>/relatorios/estudantes</url-pattern>
</servlet-mapping>
```

---

### 29. Relatório Financeiro
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/RelatorioFinanceiroServlet.java` |
| **View (JSP)** | `src/main/webapp/view/relatorios/financeiro/list.jsp` |
| **URL Mapeada** | `/relatorios/financeiro` |
| **Função** | Relatórios de receitas, pagamentos e inadimplência |
| **Acesso** | ADMINISTRADOR, TESOURARIA |

**web.xml:**
```xml
<servlet>
    <servlet-name>RelatorioFinanceiroServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.RelatorioFinanceiroServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>RelatorioFinanceiroServlet</servlet-name>
    <url-pattern>/relatorios/financeiro</url-pattern>
</servlet-mapping>
```

---

### 30. Relatório Académico
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/RelatorioAcademicoServlet.java` |
| **View (JSP)** | `src/main/webapp/view/relatorios/academico/list.jsp` |
| **URL Mapeada** | `/relatorios/academico` |
| **Função** | Relatórios de desempenho, reprovações e aprovações |
| **Acesso** | ADMINISTRADOR, COORDENADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>RelatorioAcademicoServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.RelatorioAcademicoServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>RelatorioAcademicoServlet</servlet-name>
    <url-pattern>/relatorios/academico</url-pattern>
</servlet-mapping>
```

---

## ⚙️ MÓDULO 9: SISTEMA

### 31. Gestão de Utilizadores
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/GestaoUtilizadoresServlet.java` |
| **View (JSP)** | `src/main/webapp/view/sistema/utilizadores/list.jsp` |
| **URL Mapeada** | `/sistema/utilizadores` |
| **Função** | CRUD de utilizadores, papéis e permissões |
| **Acesso** | ADMINISTRADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>GestaoUtilizadoresServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.GestaoUtilizadoresServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>GestaoUtilizadoresServlet</servlet-name>
    <url-pattern>/sistema/utilizadores</url-pattern>
</servlet-mapping>
```

---

### 32. Logs/Auditoria
| Descrição | Localização |
|-----------|------------|
| **Servlet** | `src/main/java/com/ojj/academico/controller/LogsAuditoriaServlet.java` |
| **View (JSP)** | `src/main/webapp/view/sistema/logs/list.jsp` |
| **URL Mapeada** | `/sistema/logs` |
| **Função** | Visualizar registos de auditoria e atividades do sistema |
| **Acesso** | ADMINISTRADOR |

**web.xml:**
```xml
<servlet>
    <servlet-name>LogsAuditoriaServlet</servlet-name>
    <servlet-class>com.ojj.academico.controller.LogsAuditoriaServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>LogsAuditoriaServlet</servlet-name>
    <url-pattern>/sistema/logs</url-pattern>
</servlet-mapping>
```

---

## 📋 RESUMO DE TODOS OS ARQUIVOS

### Servlets a Criar (30 novos):

```
src/main/java/com/ojj/academico/controller/
├── WelcomeServlet.java
├── DashboardAdminServlet.java
├── FuncionarioPerfilServlet.java
├── EstudanteListServlet.java
├── EstudanteAdminServlet.java
├── EstudanteEditServlet.java
├── EstudantePerfilServlet.java
├── TrancamentoServlet.java
├── CursoServlet.java
├── DisciplinaServlet.java
├── TurmaServlet.java
├── ConfirmacaoMatriculaServlet.java
├── CartaoEstudanteServlet.java
├── HistoricoAtendimentoServlet.java
├── PropinaServlet.java
├── PagamentoServicosServlet.java
├── HistoricoPagamentosServlet.java
├── ProfessorTurmasServlet.java
├── LancamentoNotasServlet.java
├── GestiaoPautasServlet.java
├── AprovacaoPautasServlet.java
├── CalendarioAcademicoServlet.java
├── RelatorioEstudantesServlet.java
├── RelatorioFinanceiroServlet.java
├── RelatorioAcademicoServlet.java
├── GestaoUtilizadoresServlet.java
└── LogsAuditoriaServlet.java
```

### JSPs a Criar (30 novas):

```
src/main/webapp/view/
├── welcome.jsp
├── admin/
│   ├── dashboard.jsp
│   ├── funcionario/
│   │   ├── list.jsp
│   │   ├── form.jsp
│   │   ├── edit.jsp
│   │   └── profile.jsp
│   ├── estudante/
│   │   ├── list.jsp
│   │   ├── form.jsp
│   │   ├── edit.jsp
│   │   └── profile.jsp
│   ├── curso/
│   │   └── list.jsp
│   ├── disciplina/
│   │   └── list.jsp
│   └── turma/
│       └── list.jsp
├── secretaria/
│   ├── matricula/
│   │   └── form.jsp
│   ├── declaracao/
│   │   └── form.jsp
│   ├── confirmacao/
│   │   └── form.jsp
│   ├── cartao/
│   │   └── form.jsp
│   ├── trancamento/
│   │   └── form.jsp
│   └── historico/
│       └── list.jsp
├── tesouraria/
│   ├── propina/
│   │   └── form.jsp
│   ├── servicos/
│   │   └── form.jsp
│   └── historico/
│       └── list.jsp
├── professor/
│   ├── turmas/
│   │   └── list.jsp
│   ├── notas/
│   │   └── form.jsp
│   └── pautas/
│       └── list.jsp
├── coordenador/
│   ├── pautas/
│   │   └── list.jsp
│   └── calendario/
│       └── list.jsp
├── estudante/
│   └── profile.jsp
├── relatorios/
│   ├── estudantes/
│   │   └── list.jsp
│   ├── financeiro/
│   │   └── list.jsp
│   └── academico/
│       └── list.jsp
└── sistema/
    ├── utilizadores/
    │   └── list.jsp
    └── logs/
        └── list.jsp
```

---

## ✅ STATUS ATUAL

| Item | Servlet | JSP | Web.xml |
|------|---------|-----|---------|
| 0. Boas-vindas | ❌ | ❌ | ❌ |
| 1. Login | ✅ | ✅ | ✅ |
| 2. Dashboard Admin | ❌ | ❌ | ❌ |
| 3. Listar Funcionários | ✅ | ❌ | ✅ |
| 4. Cadastrar Funcionário | ✅ | ❌ | ✅ |
| 5. Editar Funcionário | ✅ | ❌ | ✅ |
| 6. Perfil Funcionário | ❌ | ❌ | ❌ |
| 7-32. Restante | ❌ | ❌ | ❌ |

---

## 🔐 Níveis de Acesso

| Perfil | Permissões |
|--------|-----------|
| **ADMINISTRADOR** | Acesso total a todas as funcionalidades |
| **COORDENADOR** | Gestão académica (pautas, calendário, cursos) |
| **PROFESSOR** | Lançamento de notas, turmas |
| **SECRETÁRIO** | Matrículas, declarações, históricos |
| **TESOURARIA** | Pagamentos e históricos financeiros |
| **RECURSOS_HUMANOS** | Gestão de funcionários |
| **ESTUDANTE** | Consultas pessoais, perfil, pagamentos |

---

## 🛠️ Próximas Etapas

1. **Criar os 30 Servlets restantes** com padrão MVC
2. **Criar todas as JSPs** com layouts responsivos
3. **Atualizar web.xml** com todos os mapeamentos
4. **Implementar filtros de segurança** por papel de utilizador
5. **Adicionar validação** de entrada em todos os formulários
6. **Implementar paginação** nas listagens
7. **Adicionar relatórios em PDF** (iReport ou JasperReports)

---

**Documento Gerado em:** May 22, 2026
**Status:** 🟡 Planejamento Completo - Aguardando Implementação
