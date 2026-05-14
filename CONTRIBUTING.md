# Contribuindo para o OJJ Acadêmico

Obrigado por querer contribuir com este projeto. Este arquivo descreve como preparar o ambiente, enviar alterações e manter o projeto organizado.

## Regras Gerais

- Mantenha o foco no escopo de autenticação e apresentação.
- Faça alterações pequenas e bem descritas.
- Comente e documente quando adicionar novas rotas ou validadores.
- Não adicione dependências desnecessárias sem aprovação.

## Branches e Versionamento

- A branch principal local ainda está em `master`, mas o repositório remoto usa `main` como padrão.
- Use `git checkout -b nome-da-feature` para criar uma branch de trabalho.
- Faça `git push origin nome-da-feature` ao subir a branch.

## Como Contribuir

1. Faça um fork ou trabalhe na branch de feature local.
2. Crie uma branch descritiva:
   ```bash
git checkout -b feature/descricao-curta
```
3. Faça commits pequenos e claros.
4. Atualize o `README.md` sempre que adicionar uma nova funcionalidade.
5. Faça rebase ou merge da branch `main`/`master` antes de abrir o PR.

## Estrutura de Commits

Use mensagens descritivas, por exemplo:

- `feat: adicionar validação de login`
- `fix: corrigir rota de logout`
- `docs: atualizar guia de deploy`

## Ambiente Local

### Requisitos

- Java 17
- Maven
- MySQL
- Servidor Jakarta/Tomcat compatível

### Build

```bash
mvn clean package
```

## Deploy no Tomcat

1. Gere o arquivo WAR:
   ```bash
   mvn clean package
   ```
2. Copie o arquivo `target/ojj-academico.war` para a pasta `webapps` do Tomcat.
3. Inicie o Tomcat.
4. Acesse:
   ```text
   http://localhost:8080/ojj-academico/
   ```

## Código de Conduta

- Mantenha respeito e clareza nas mensagens de commit.
- Não compartilhe credenciais reais no código.
- Mantenha o repositório limpo e organizado.
