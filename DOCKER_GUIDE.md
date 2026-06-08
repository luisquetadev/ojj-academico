# Guia de Execução com Docker - OJJ Académico

Este projeto foi configurado para rodar em containers Docker, facilitando a execução em qualquer máquina sem a necessidade de instalar Java, Tomcat ou MySQL localmente.

## 🚀 Como Rodar o Projeto

### Pré-requisitos
*   [Docker](https://www.docker.com/products/docker-desktop/) instalado.
*   [Docker Compose](https://docs.docker.com/compose/install/) instalado (geralmente já vem com o Docker Desktop).

### Passos para Iniciar
1.  Abra o terminal na pasta raiz do projeto.
2.  Execute o seguinte comando para construir e subir os containers:
    ```bash
    docker-compose up --build
    ```
3.  Aguarde a inicialização. O Docker irá:
    *   Baixar as imagens necessárias (Maven, Tomcat, MySQL).
    *   Compilar o código Java e gerar o arquivo `.war`.
    *   Configurar o banco de dados MySQL e importar automaticamente a estrutura (`ojj_academico.sql`) e os dados iniciais (`db/seed_completo.sql`).
    *   Iniciar o servidor Tomcat.

4.  Acesse o sistema no seu navegador:
    *   URL: [http://localhost:8080](http://localhost:8080)

### Comandos Úteis
*   **Parar o sistema:** `docker-compose down`
*   **Rodar em background:** `docker-compose up -d`
*   **Ver logs da aplicação:** `docker-compose logs -f app`
*   **Limpar tudo (incluindo banco de dados):** `docker-compose down -v`

---

## 🛠️ O que foi alterado para o Docker?

1.  **`ConnectionFactory.java`**: Refatorado para ler as configurações do banco de dados a partir de variáveis de ambiente. Isso permite que a aplicação se conecte ao container do MySQL (`db`) dinamicamente.
    *   `DB_HOST`: Nome do serviço no docker-compose (padrão: `db`).
    *   `DB_NAME`: Nome do banco (padrão: `ojj_academico`).
    *   `DB_USER`: Usuário (padrão: `root`).
    *   `DB_PASS`: Senha (padrão: vazio).

2.  **`Dockerfile`**: Criado um arquivo de receita multi-estágio:
    *   **Estágio de Build**: Usa Maven para compilar o projeto.
    *   **Estágio de Runtime**: Usa Tomcat 10.1 (compatível com Jakarta EE 10) para rodar a aplicação.

3.  **`docker-compose.yml`**: Orquestra dois serviços:
    *   **`db`**: MySQL 8.0 que inicializa automaticamente o esquema do banco a partir do arquivo SQL principal.
    *   **`app`**: A aplicação Java que espera o banco estar saudável antes de iniciar.

## 📁 Estrutura do Docker

*   **MySQL Data**: Os dados do banco são persistidos em um volume chamado `mysql_data`, para que você não perca os dados ao reiniciar os containers.
*   **ROOT.war**: A aplicação é implantada no contexto raiz do Tomcat, portanto o acesso é direto via `localhost:8080`.
