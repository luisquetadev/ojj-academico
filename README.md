# OJJ Acadêmico - Sistema de Autenticação

## Estrutura da Camada de Apresentação

### Assets Organizados
```
src/main/webapp/assets/
├── css/
│   ├── login.css          # Estilos da página de login
│   ├── register.css       # Estilos da página de cadastro
│   └── dashboard.css      # Estilos dos dashboards (estudante/funcionário)
├── js/
│   └── main.js            # Funções JavaScript comuns
└── images/                # Imagens e ícones (futuro)
```

### Páginas Principais
- **Login**: `view/auth/login.jsp` - Autenticação de usuários
- **Cadastro**: `view/auth/register.jsp` - Registro de novos usuários
- **Dashboard Estudante**: `view/estudante/dashboard_estudante.jsp`
- **Dashboard Funcionário**: `view/funcionario/dashboard_funcionario.jsp`

## Funcionalidades de Autenticação

### Tipos de Usuário
- **Estudante**: Acesso ao dashboard de estudante
- **Funcionário**: Acesso ao dashboard de funcionário
- **Administrador**: Acesso ao dashboard de funcionário (igual ao funcionário)

### Fluxo de Autenticação
1. Usuário acessa a aplicação → redirecionado para login
2. Login bem-sucedido → redirecionado para dashboard apropriado
3. Logout → sessão invalidada e redirecionado para login
4. Acesso a áreas protegidas sem login → redirecionado para login

### Proteção de Rotas
- Filtro `AuthFilter` protege `/view/estudante/*` e `/view/funcionario/*`
- Sessão verifica tipo de perfil do usuário
- Logout limpa a sessão completamente e redireciona para `/`
- Links de logout usam caminhos absolutos: `<%= request.getContextPath() %>/logout`

## Como Usar

1. **Login**: Acesse `/login` ou a página inicial
2. **Cadastro**: Use `/register` para criar novos usuários
3. **Logout**: Clique em "Sair" nos dashboards
4. **Dashboards**: Automáticamente redirecionados após login

## Desenvolvimento

- CSS separado em arquivos individuais por funcionalidade
- JavaScript centralizado em `main.js`
- Estrutura preparada para expansão com mais assets
- Responsivo e acessível