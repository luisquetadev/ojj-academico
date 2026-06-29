@echo off
title OJJ ACADEMICO - MIGRATIONS
echo ============================================
echo  APLICAR MIGRATIONS - OJJ ACADEMICO
echo ============================================
echo.
echo Este script aplica migrations SQL pendentes
echo para actualizar a base de dados existente.
echo.
echo Certifique-se de que o MySQL esta a correr
echo no XAMPP antes de continuar.
echo.

set MYSQL="C:\xampp\mysql\bin\mysql.exe"
set DB_USER=root
set DB_PASS=
set DB_NAME=ojj_academico

if not exist %MYSQL% (
    echo ERRO: MySQL nao encontrado em %MYSQL%
    echo Edite este ficheiro se o XAMPP estiver noutro local.
    pause
    exit /b 1
)

echo Migrations disponiveis:
echo.
setlocal enabledelayedexpansion
set count=0
for %%f in (%~dp0migration_*.sql) do (
    set /a count+=1
    echo [!count!] %%~nxf
)

if !count! equ 0 (
    echo Nenhuma migration pendente encontrada.
    pause
    exit /b 0
)

echo.
set /p choice="Escolha o numero da migration (ou 0 para todas): "

if "%choice%"=="0" (
    echo.
    echo A aplicar todas as migrations...
    for %%f in (%~dp0migration_*.sql) do (
        echo   A executar: %%~nxf...
        %MYSQL% -u %DB_USER% %DB_NAME% < "%%f"
        if !errorlevel! equ 0 (
            echo   [OK] %%~nxf
        ) else (
            echo   [ERRO] %%~nxf - ignorando...
        )
    )
) else (
    set idx=0
    for %%f in (%~dp0migration_*.sql) do (
        set /a idx+=1
        if !idx! equ %choice% (
            echo.
            echo A executar: %%~nxf...
            %MYSQL% -u %DB_USER% %DB_NAME% < "%%f"
        )
    )
)

echo.
echo Concluido!
pause
