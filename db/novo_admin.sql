-- Script para registar um novo Administrador no sistema OJJ Académico
-- Este script insere o utilizador e o respectivo perfil de funcionário

-- 1. Inserir na tabela utilizador (id_perfil = 1 para ADMIN)
-- Senha padrão: Admin@2026 (Hash BCrypt abaixo)
INSERT INTO utilizador (id_perfil, email, password_hash, status, data_criacao) 
VALUES (1, 'admin.ojj@gmail.com', '$2a$12$R.9Z9pSj/v7fN8.fBvYl0Ou5Y9p9Sj/v7fN8.fBvYl0Ou5Y9p9Sj', 'ATIVO', NOW());

-- 2. Obter o ID do utilizador inserido e inserir na tabela funcionario
-- Nota: Assume-se que o id_departamento 1 existe (Geral/TI)
SET @last_user_id = LAST_INSERT_ID();

INSERT INTO funcionario (
    id_utilizador, 
    id_departamento, 
    nome_completo, 
    telefone, 
    numero_bi, 
    sexo, 
    data_nascimento, 
    morada, 
    salario, 
    data_admissao
) VALUES (
    @last_user_id,
    1, 
    'Administrador do Sistema', 
    '+258 840000000', 
    '000000001A', 
    'M', 
    '1990-01-01', 
    'Maputo, Avenida 24 de Julho', 
    50000.00, 
    CURDATE()
);

-- Dados de Acesso:
-- Email: admin.ojj@gmail.com
-- Senha: Admin@2026
