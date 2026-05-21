-- Seed de usuários para o banco de dados ojja_academico
-- Execute no MySQL com a base de dados criada

INSERT INTO utilizadores (username, senha_hash, tipo_perfil, id_ref) VALUES
('admin1', '$2a$10$Dz.CvShn3oXhyJzbeF5vhO42Y4PrHTlNjw7cAgWEUFRbCKInNC5im', 'Administrador', 0),
('estudante1', '$2a$10$iRbNcIDAPCfGDH/BF/MiCO1QAo0zFLRpQ0eX5F6IpwrJHd8GSGAXu', 'Estudante', 0),
('funcionario1', '$2a$10$foFuVocETUWTuCY2Dl2jaOQCaKzZApx9JOBlHvJn2T8ts.CNfz3ua', 'Funcionario', 0);

-- Senhas originais:
-- admin1 / Admin123
-- estudante1 / Estudante123
-- funcionario1 / Funcionario123
