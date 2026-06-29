@echo off
title RESET BANCO OJJ ACADEMICO
echo ============================================
echo  RESET COMPLETO - OJJ ACADEMICO
echo ============================================
echo.
echo Este script vai APAGAR toda a base de dados
echo e recriar apenas a estrutura das tabelas.
echo.
echo APOS executar, reinicie o Tomcat para que
echo o SeedService popule os dados com BCrypt.
echo.
echo Certifique-se de que o MySQL esta a correr
echo no XAMPP antes de continuar.
echo.
set /p confirm="Tem a certeza? (S/N): "
if /i not "%confirm%"=="S" (
    echo Operacao cancelada.
    pause
    exit /b
)

echo.
echo A importar schema para o MySQL...

set MYSQL="C:\xampp\mysql\bin\mysql.exe"
set DB_USER=root
set DB_PASS=
set SCHEMA=%~dp0schema_ojj.sql
set RESET=%~dp0reset_banco.sql

echo Usando: %MYSQL%
echo.

if not exist %MYSQL% (
    echo ERRO: MySQL nao encontrado em %MYSQL%
    echo.
    echo Edite este ficheiro .bat se o XAMPP estiver
    echo instalado noutro local.
    pause
    exit /b 1
)

%MYSQL% -u %DB_USER% < "%RESET%"

if %errorlevel% equ 0 (
    echo.
    echo --------------------------------------------
    echo  SUCESSO! Base de dados recriada.
    echo --------------------------------------------
    echo.
    echo Proximos passos:
    echo 1. Reinicie o Tomcat (servidor de aplicacao)
    echo 2. O SeedService vai popular os dados
    echo    com senhas BCrypt corretas
    echo 3. As credenciais serao geradas em:
    echo    credenciais_geradas/
    echo.
) else (
    echo.
    echo ERRO ao importar o schema.
    echo Verifique se o MySQL esta a correr.
    echo.
)

pause
