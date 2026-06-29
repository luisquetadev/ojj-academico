# OJJ Académico

Sistema de gestão académica web com **193+ servlets/páginas**, desenvolvido em **Java/Jakarta EE 10** com **MySQL**.

## Stack

| Camada | Tecnologia |
|--------|-----------|
| Backend | Java 17, Jakarta Servlet 6.0 |
| Frontend | JSP, Bootstrap 5, Font Awesome |
| Banco | MySQL 8+ (InnoDB) |
| Build | Maven 3 |
| Servidor | Apache Tomcat 10 |

## Funcionalidades

- Autenticação por papel (admin, secretaria, tesouraria, professor, coordenador, estudante)
- Gestão de: cursos, disciplinas, turmas, funcionários, estudantes, professores
- Matrículas e inscrições em disciplinas
- Lançamento e consulta de notas (pautas)
- Gestão de propinas e pagamentos
- Relatórios financeiro e académico
- Logs de operações formatados
- Associação professor-disciplina

## Pré-requisitos

- Java 17+
- Apache Tomcat 10+
- MySQL 8+
- Maven 3+

## Setup rápido

```bash
# 1. Clonar
git clone https://github.com/luisquetadev/ojj-academico.git
cd ojj-academico

# 2. Criar base de dados
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ojj_academico"
mysql -u root ojj_academico < db/schema_ojj.sql

# 3. Compilar
mvn clean package

# 4. Colocar WAR no Tomcat e iniciar servidor
#    O SeedService irá popular os dados automaticamente
```

## Estrutura

```
src/main/java/com/ojj/academico/
  ├── controller/     # Servlets (camada de apresentação)
  ├── service/        # Regras de negócio
  ├── repository/     # Repositórios (abstração do DAO)
  ├── dao/            # Data Access Objects (SQL)
  ├── model/          # Entidades Javabean
  ├── filters/        # Filtros (autenticação, logging)
  └── util/           # Utilitários

src/main/webapp/
  ├── view/           # JSPs organizadas por módulo
  └── assets/         # CSS, JS, imagens
```

## Credenciais padrão

Após o SeedService popular os dados, as credenciais são geradas em `credenciais_geradas/`.

## Migrações

Scripts SQL incrementais em `db/migration_*.sql` — executar manualmente quando adicionados.

## Licença

MIT
