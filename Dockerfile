# Estágio 1: Build
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copiar o pom.xml e baixar as dependências (otimiza o cache do Docker)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar o código fonte e realizar o build
COPY src ./src
RUN mvn clean package -DskipTests

# Estágio 2: Runtime
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat

# Remover aplicações padrão do Tomcat para limpar o ambiente
RUN rm -rf webapps/*

# Copiar o WAR gerado no estágio de build para o diretório webapps do Tomcat
# O nome do arquivo WAR definido no pom.xml é ojj-academico.war
COPY --from=build /app/target/ojj-academico.war webapps/ROOT.war

# Expor a porta padrão do Tomcat
EXPOSE 8080

# O Tomcat inicia automaticamente ao rodar o container
CMD ["catalina.sh", "run"]
