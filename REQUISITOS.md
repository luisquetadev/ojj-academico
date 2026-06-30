# Requisitos do Sistema — OJJ Academico

## Legenda

| Tipo | Descrição |
|---|---|
| RFxxx | Requisito Funcional |
| RNFxxx | Requisito Não Funcional |
| **CT** | Casos de Teste |

---

# Requisitos Funcionais

## Módulo: Autenticação e Segurança

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF001 | Login do utilizador | O sistema deve autenticar utilizadores com email e password (hash bcrypt). | **CT:** Aceder `/login`, inserir `admin@ojj.edu` / `Admin@123`, clicar Entrar. Verificar redirecionamento para dashboard. |
| RF002 | Logout | O sistema deve invalidar a sessão ao clicar em "Sair". | **CT:** Estando logado, clicar "Sair". Verificar redirecionamento para `/` e que ao aceder `/admin/dashboard` redireciona para login. |
| RF003 | Registo de novo utilizador | O sistema deve permitir registo com nome, email e password. | **CT:** Aceder `/register`, preencher formulário, submeter. Verificar criação na BD e redirect para login. |
| RF004 | Controlo de tentativas de login | Após 5 tentativas falhadas, a conta deve ser bloqueada por 15 minutos. | **CT:** Inserir password errada 5x seguidas. Verificar mensagem "Conta temporariamente bloqueada". |
| RF005 | Recuperação de password | O sistema deve enviar email com token para redefinir password. | **CT:** Clicar "Esqueceu a password?", inserir email, verificar token na BD (simulado sem email). |
| RF006 | Protecção de acesso directo a JSP | O sistema deve bloquear acesso directo a ficheiros `.jsp` em `/view/`. | **CT:** Aceder a `/view/admin/dashboard.jsp` directamente. Verificar erro 403 ou redirect. |
| RF007 | Sessão expirar após inactividade | Sessão deve expirar após 30 minutos de inactividade. | **CT:** Aguardar 30 min sem acção, tentar aceder a página protegida. Verificar redirect para login. |

## Módulo: Administração — Funcionários

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF010 | CRUD de funcionários | Admin pode criar, listar, editar e desactivar funcionários. | **CT:** Logar como admin, aceder a funcionários. Criar novo, editar nome, listar, desactivar. Verificar persistência. |
| RF011 | Associar perfil a funcionário | Ao criar funcionário, deve seleccionar perfil (Professor, Secretaria, Tesouraria, etc.). | **CT:** Criar funcionário com perfil "Professor". Verificar que ao logar como esse utilizador vê dashboard de professor. |

## Módulo: Administração — Estudantes

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF020 | CRUD de estudantes | Admin pode criar, listar, editar e desactivar estudantes. | **CT:** Navegar em Admin > Estudantes > Novo, preencher dados, salvar. Verificar na listagem. |
| RF021 | Gerar número de estudante automático | Ao criar estudante, o sistema deve gerar número sequencial único. | **CT:** Criar 2 estudantes, verificar que cada um recebe número diferente (ex: `20240001`, `20240002`). |

## Módulo: Administração — Académico

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF030 | CRUD de cursos | Admin pode criar, editar e desactivar cursos (nome, grau, regime, duração, propina). | **CT:** Admin > Curso > Novo, preencher, salvar. Verificar listagem e edição. |
| RF031 | CRUD de disciplinas | Admin pode gerir disciplinas com código, nome, carga horária. | **CT:** Admin > Disciplina > Nova, salvar, editar. |
| RF032 | CRUD de turmas | Admin pode gerir turmas (código, turno, ano curricular, capacidade). | **CT:** Admin > Turma > Nova, definir turno e capacidade. |
| RF033 | Plano curricular | Associar disciplinas a cursos com semestre e ano curricular. | **CT:** Admin > Plano Curricular, adicionar disciplina a curso com semestre definido. |
| RF034 | Professor-Disciplina | Associar professor a uma disciplina/turma. | **CT:** Admin > Professor-Disciplina, seleccionar professor e disciplina. |

## Módulo: Secretaria

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF040 | Matricular estudante | Secretaria pode matricular estudante num curso/turma. | **CT:** Secretaria > Matrícula > Novo, seleccionar estudante, curso, turma. Verificar criação. |
| RF041 | Confirmar matrícula | Gerar documento de confirmação de matrícula. | **CT:** Após matricular, clicar "Confirmar Matrícula". Verificar PDF gerado. |
| RF042 | Trancamento de matrícula | Secretaria pode trancar matrícula de um estudante. | **CT:** Secretaria > Trancamento, seleccionar estudante, motivo. Verificar status "TRANCADO". |
| RF043 | Emitir declaração | Gerar declaração de estudante (PDF) com situação académica. | **CT:** Secretaria > Declaração, seleccionar estudante, gerar PDF. |
| RF044 | Emitir cartão de estudante | Gerar cartão de estudante (PDF) com foto e dados. | **CT:** Secretaria > Cartão, seleccionar estudante, gerar PDF com foto. |
| RF045 | Histórico de atendimento | Registar e consultar atendimentos realizados ao estudante. | **CT:** Secretaria > Histórico, registar atendimento, consultar listagem. |

## Módulo: Tesouraria

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF050 | Gestão de propinas | Tesouraria pode definir valor de propina, lançar multas, consultar status. | **CT:** Tesouraria > Propinas, listar estudantes, verificar status (PENDENTE/PAGO/ATRASADO). |
| RF051 | Registar pagamento | Registar pagamento de propina ou serviços com emissão de recibo. | **CT:** Tesouraria > Pagamento, seleccionar estudante, valor, método. Verificar recibo gerado. |
| RF052 | Histórico de pagamentos | Consultar todos os pagamentos com filtros por data, estudante, status. | **CT:** Tesouraria > Histórico, aplicar filtros, verificar resultados. |
| RF053 | Pagamento de serviços | Registar pagamentos de serviços (carteira, declaração, etc.). | **CT:** Tesouraria > Serviços, seleccionar serviço, valor, emitir recibo. |

## Módulo: Professor

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF060 | Ver turmas atribuídas | Professor vê lista das suas turmas e disciplinas. | **CT:** Logar como professor, aceder a "Minhas Turmas". |
| RF061 | Lançar notas | Professor pode lançar notas (0-20) para estudantes da sua turma. | **CT:** Professor > Lançar Notas, seleccionar turma > disciplina, inserir notas, salvar. |
| RF062 | Gestão de pautas | Visualizar e imprimir pautas de avaliação. | **CT:** Professor > Pautas, seleccionar turma, ver pauta, imprimir. |

## Módulo: Coordenador

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF070 | Aprovação de pautas | Coordenador pode aprovar ou rejeitar pautas submetidas por professores. | **CT:** Coordenador > Aprovação Pautas, ver pautas pendentes, aprovar. |
| RF071 | Calendário académico | Gerir calendário académico (datas de exames, inscrições, etc.). | **CT:** Coordenador > Calendário, adicionar evento. |

## Módulo: Director

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF080 | Dashboard executivo | Director vê estatísticas globais: total de estudantes, receitas, desempenho. | **CT:** Logar como director, ver números no dashboard. |
| RF081 | Relatórios institucionais | Aceder a relatórios académicos e financeiros consolidados. | **CT:** Director > Relatórios, seleccionar tipo, gerar PDF/HTML. |

## Módulo: Estudante

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF090 | Dashboard pessoal | Estudante vê resumo da sua situação: matrícula, propinas, notas. | **CT:** Logar como estudante, ver dashboard. |
| RF091 | Consultar notas | Estudante pode ver as suas notas por disciplina. | **CT:** Estudante > Notas, ver lista de disciplinas e notas. |
| RF092 | Consultar propinas | Estudante vê histórico de propinas e status de pagamento. | **CT:** Estudante > Propinas, ver tabela com valores e status. |
| RF093 | Histórico académico | Estudante pode emitir seu histórico académico (PDF). | **CT:** Estudante > Histórico, gerar PDF. |

## Módulo: Relatórios

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF100 | Relatório de estudantes | Listar estudantes com filtros (curso, status, ano). | **CT:** Relatórios > Estudantes, aplicar filtros, exportar. |
| RF101 | Relatório financeiro | Receitas por período, propinas pagas vs pendentes. | **CT:** Relatórios > Financeiro, seleccionar mês, ver totais. |
| RF102 | Relatório académico | Desempenho por curso, disciplina, taxas de aprovação. | **CT:** Relatórios > Académico, seleccionar curso, ver estatísticas. |

## Módulo: Sistema

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RF110 | Gestão de utilizadores | Admin pode ver, activar/desactivar utilizadores. | **CT:** Sistema > Utilizadores, desactivar um utilizador, verificar que não consegue logar. |
| RF111 | Logs de auditoria | Registar todas as operações (login, CRUD, pagamentos) com timestamp e IP. | **CT:** Realizar acções, depois consultar Sistema > Logs, verificar entradas registadas. |

---

# Requisitos Não Funcionais

| ID | Nome | Descrição | Como Testar |
|---|---|---|---|
| RNF001 | Segurança — Hash de passwords | Passwords armazenadas com bcrypt (cost factor 12+). | **CT:** Verificar na coluna `password_hash` da BD que o valor não é texto plano. |
| RNF002 | Segurança — SQL Injection | Todas as queries usam PreparedStatements com parâmetros. | **CT:** Inspecionar DAOs para uso de `PreparedStatement` com `?` em vez de concatenação de strings. |
| RNF003 | Segurança — CSRF | Formulários devem incluir token CSRF. | **CT:** Verificar presença de campo oculto `csrf_token` nos formulários. |
| RNF004 | Segurança — XSS | Output escapado com JSTL `c:out` ou `fn:escapeXml()`. | **CT:** Verificar JSPs que usam `${...}` directamente sem escape. |
| RNF005 | Compatibilidade — Java 17+ | O sistema deve compilar com Java 17 (LTS). | **CT:** Correr `mvn compile` com JDK 17. Não deve haver warnings de preview features. |
| RNF006 | Compatibilidade — Tomcat 10+ | Deploy em Apache Tomcat 10+ (Jakarta EE 9+). | **CT:** Fazer deploy do `.war` no Tomcat 10, verificar funcionamento completo. |
| RNF007 | Compatibilidade — MySQL 8+ | Suporte a MySQL 8.0+ (InnoDB, UTF-8). | **CT:** Executar script SQL e verificar que as tabelas usam `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`. |
| RNF008 | Compatibilidade — Navegadores | Suportar Chrome, Firefox, Edge (últimas 2 versões). | **CT:** Testar em cada navegador: login, CRUD, geração de PDF. |
| RNF009 | Responsividade — Mobile | Interface adaptável a ecrãs a partir de 320px de largura. | **CT:** Redimensionar browser para 375px (iPhone), verificar menu e formulários. |
| RNF010 | Responsividade — Tablet | Interface adaptável a ecrãs até 768px. | **CT:** Redimensionar para 768px (iPad), verificar layout. |
| RNF011 | Performance — Paginação | Listagens com mais de 20 registos devem ter paginação. | **CT:** Inserir 25+ estudantes, verificar que a listagem mostra página 1 de 2. |
| RNF012 | Performance — Timeout | Queries SQL com timeout máximo de 5 segundos. | **CT:** Simular BD lenta (ex: `SELECT SLEEP(6)`), verificar erro 500 com timeout. |
| RNF013 | Logging | Todas as operações críticas devem ser logadas com SLF4J/Logback. | **CT:** Verificar se `OperacaoLogService` regista cada CRUD e login. |
| RNF014 | Logging — Formato | Logs em formato estruturado (timestamp, nível, classe, mensagem). | **CT:** Verificar `logback.xml` e ficheiros de log gerados. |
| RNF015 | Docker — Containerização | O sistema deve correr em Docker (Tomcat + MySQL). | **CT:** Correr `docker-compose up`, aceder a `http://localhost:8080/ojj-academico`. |
| RNF016 | Docker — Healthcheck | Containers devem ter healthcheck configurado. | **CT:** Correr `docker ps` e verificar status `healthy` dos containers. |
| RNF017 | Testes unitários | Cobertura mínima de 60% nos validators e serviços críticos. | **CT:** Correr `mvn test`, verificar relatório de cobertura (Jacoco ou similar). |
| RNF018 | Internacionalização | Suporte a português de Angola (pt-AO). | **CT:** Verificar que moeda é Kz (kwanzas) nos formulários de pagamento. |
| RNF019 | Acessibilidade | Contraste mínimo 4.5:1 para texto normal (WCAG AA). | **CT:** Usar ferramenta Lighthouse ou WebAIM Contrast Checker no login e dashboard. |
| RNF020 | Backup — Base de dados | Script de exportação da BD via `mysqldump`. | **CT:** Correr `db/migration.bat backup` ou comando equivalente, verificar ficheiro `.sql` gerado. |

---

# Funções e Responsabilidades por Perfil

| Perfil | Acessos Principais |
|---|---|
| **Admin** | Tudo: funcionários, estudantes, cursos, disciplinas, turmas, sistema, logs |
| **Secretaria** | Matrículas, trancamentos, declarações, cartões, histórico de atendimento |
| **Tesouraria** | Propinas, pagamentos, recibos, histórico financeiro |
| **Professor** | Turmas atribuídas, lançamento de notas, pautas |
| **Coordenador** | Aprovação de pautas, calendário académico |
| **Director** | Dashboard executivo, relatórios institucionais |
| **Estudante** | Dashboard pessoal, notas, propinas, histórico académico (PDF) |

---

# Matriz de Funcionalidades vs Perfis

| Funcionalidade | Admin | Secretaria | Tesouraria | Professor | Coordenador | Director | Estudante |
|---|---|---|---|---|---|---|---|
| Funcionários | CRUD | — | — | — | — | — | — |
| Estudantes | CRUD | Listar | — | — | — | — | Próprio |
| Cursos | CRUD | — | — | — | Ver | Ver | — |
| Turmas | CRUD | — | — | Ver | Ver | Ver | Ver |
| Matrículas | CRUD | CRUD | — | — | — | — | Própria |
| Notas | CRUD | — | — | Lançar | Aprovar | Ver | Ver |
| Pautas | Ver | — | — | CRUD | Aprovar | Ver | — |
| Declarações | — | Emitir | — | — | — | — | Solicitar |
| Cartões | — | Emitir | — | — | — | — | — |
| Propinas | Ver | — | Gerir | — | — | Ver | Ver |
| Pagamentos | Ver | — | Registar | — | — | Ver | Ver |
| Relatórios | Todos | — | Financeiro | — | Académico | Todos | — |
| Utilizadores | CRUD | — | — | — | — | — | — |
| Logs | Ver | — | — | — | — | — | — |

---

# Como Executar os Testes

## Testes Automatizados (JUnit 5 + Mockito)

```bash
# Correr todos os testes
mvn test

# Correr um teste específico
mvn test -Dtest=UtilizadorValidatorTest

# Verificar cobertura (se Jacoco configurado)
mvn jacoco:report
```

## Testes de Compilação

```bash
mvn clean compile
```

## Testes de Integração (Docker)

```bash
docker-compose up -d
# Aguardar healthcheck
docker ps
# Aceder: http://localhost:8080/ojj-academico
```

## Testes Manuais

1. Usar as credenciais seed para testar cada perfil
2. Seguir os casos de teste (CT) indicados para cada RF
3. Verificar logs no terminal ou em `logs/` para operações registadas
4. Testar geração de PDF em várias funcionalidades
