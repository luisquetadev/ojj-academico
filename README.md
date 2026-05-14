# OJJ Acadêmico

Sistema base de autenticação e dashboards para a aplicação acadêmica da Universidade OJJ.
Esta versão foca na autenticação do usuário, controles de sessão e páginas de apresentação para login, logout e dashboards.

---

## Visão Geral

- Página de login centralizada: `src/main/webapp/view/auth/login.jsp`
- Cadastro de usuário: `src/main/webapp/view/auth/register.jsp`
- Dashboard Estudante: `src/main/webapp/view/estudante/dashboard_estudante.jsp`
- Dashboard Funcionário / Administrador: `src/main/webapp/view/funcionario/dashboard_funcionario.jsp`
- Rotas protegidas por filtro de sessão: `com.ojj.academico.filters.AuthFilter`
- Logout por servlet: `com.ojj.academico.controller.LogoutServlet`

---

## Estrutura de Arquivos Importantes

```text
src/main/java/com/ojj/academico/
├── conf/
│   └── AppConfig.java              # Configuração de caminhos e constantes
├── controller/
│   ├── LoginServlet.java           # Tratamento de login
│   ├── LogoutServlet.java          # Tratamento de logout
│   └── RegisterServlet.java        # Cadastro de usuário
├── filters/
│   └── AuthFilter.java             # Protege áreas autenticadas
├── model/
│   └── Usuario.java                # Entidade de usuário
├── repository/
│   └── UsuarioRepository.java      # Persistência de usuário
├── service/
│   └── UsuarioService.java         # Lógica de autenticação e registro
├── validator/
│   └── UsuarioValidator.java       # Validação de dados de login e cadastro
├── utils/
│   ├── ConnectionFactory.java      # Conexão com banco MySQL
│   └── PasswordUtils.java          # Hash de senha BCrypt
```

```text
src/main/webapp/
├── assets/
│   ├── css/
│   │   ├── login.css
│   │   ├── register.css
│   │   └── dashboard.css
│   ├── js/
│   │   └── main.js
│   └── images/
├── view/
│   ├── auth/
│   │   ├── login.jsp
│   │   └── register.jsp
│   ├── estudante/
│   │   └── dashboard_estudante.jsp
│   └── funcionario/
│       └── dashboard_funcionario.jsp
└── WEB-INF/
    └── web.xml
```

---

## Funcionalidades de Autenticação

### Tipos de usuário suportados
- `Estudante` → dashboard de estudante
- `Funcionario` → dashboard de funcionário
- `Administrador` → roteado para o dashboard de funcionário

### Fluxo de login
1. Usuário acessa a aplicação em `/` ou `/login`
2. Preenche `username` e `password`
3. `LoginServlet` valida os dados e chama `UsuarioService.autenticar(...)`
4. Se válido, o usuário é armazenado na sessão
5. O usuário é redirecionado para o dashboard correto

### Logout
- O link de logout usa caminho absoluto para evitar problemas de rota:
  - `<%= request.getContextPath() %>/logout`
- `LogoutServlet` invalida a sessão e redireciona para `/`
- Ao acessar URLs protegidas sem sessão válida, o filtro `AuthFilter` redireciona para `/`

---

## Configuração do Banco de Dados

A conexão com o MySQL está configurada em `src/main/java/com/ojj/academico/utils/ConnectionFactory.java`:

- URL: `jdbc:mysql://localhost:3306/ojj_academico?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true`
- Usuário: `root`
- Senha: `""` (vazia)

A tabela usada é `utilizadores` com colunas mínimas:
- `id_utilizador`
- `username`
- `senha_hash`
- `tipo_perfil`
- `id_ref`

> Ajuste as credenciais de banco se necessário antes de executar.

---

## Como Rodar Localmente

### Pré-requisitos
- Java 17
- Maven
- MySQL em execução com base `ojj_academico`
- Tomcat ou outro servidor Jakarta/Servlet

### Build e execução
```bash
mvn clean package
```

### Deploy no Tomcat
1. Gere o WAR:
   ```bash
   mvn clean package
   ```
2. Copie o arquivo `target/ojj-academico.war` para o diretório `webapps` do Tomcat.
3. Inicie ou reinicie o Tomcat.
4. Acesse a aplicação em:
   ```text
   http://localhost:8080/ojj-academico/
   ```

> Se estiver usando IDE, basta configurar o Tomcat como servidor e deployar o artefato `ojj-academico.war`.

### Uso
- Acesse: `http://localhost:8080/ojj-academico/`
- Login padrão: use conta cadastrada ou registre uma nova em `/register`

---

## Credenciais de Teste

Caso queira adicionar usuários diretamente no banco, use este exemplo:

```sql
INSERT INTO utilizadores (username, senha_hash, tipo_perfil, id_ref) VALUES
('admin1', '$2a$10$Dz.CvShn3oXhyJzbeF5vhO42Y4PrHTlNjw7cAgWEUFRbCKInNC5im', 'Administrador', 0),
('admin2', '$2a$10$MkyMOIB7xQQgmmLl2N4Oe5kw.C75UaOdSVfX4evrfBI95LQrCM3a', 'Administrador', 0),
('estudante1', '$2a$10$iRbNcIDAPCfGDH/BF/MiCO1QAo0zFLRpQ0eX5F6IpwrJHd8GSGAXu', 'Estudante', 0),
('estudante2', '$2a$10$BKxsUfiQfAayDqN7PXZiY.KUv8jD4MeKgtHlvL5pFy4QGdBVEJ7rm', 'Estudante', 0),
('funcionario1', '$2a$10$foFuVocETUWTuCY2Dl2jaOQCaKzZApx9JOBlHvJn2T8ts.CNfz3ua', 'Funcionario', 0),
('funcionario2', '$2a$10$FHcrvOlkyCAEKUaq5Kjw8e3pKuNldZR64ObPXzLogt88PCKX1q6gG', 'Funcionario', 0);
```

- Senhas originais:
  - `Admin123`
  - `Estudante123`
  - `Funcionario123`

---

## Tags e Versionamento
- Versão atual marcada: `v1.0.0`
- Branch principal atual: `master`
- Repositório remoto: `https://github.com/luisquetadev/ojj-academico.git`

---

## Próximos Passos

- Adicionar validação de perfil mais detalhada para `Administrador`
- Implementar persistência de dados de estudante e funcionário
- Criar dashboards funcionais com rotas específicas
- Adicionar testes automatizados de integração e unidade

---

## Notas para o Responsável pela Autenticação

Seu escopo atual é:
- manter o login funcionando
- garantir logout correto
- proteger páginas privadas com sessão
- fazer redirecionamento para dashboards com base no `tipoPerfil`

Foco no fluxo de autenticação e apresentação mínima das telas.
