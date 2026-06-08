-- Seed de utilizadores para o banco de dados ojj_academico.
-- Execute depois de importar o dump principal.

INSERT INTO utilizador (id_perfil, email, password_hash, status) VALUES
(1, 'admin1@ojj.edu', '$2a$10$Dz.CvShn3oXhyJzbeF5vhO42Y4PrHTlNjw7cAgWEUFRbCKInNC5im', 'ATIVO'),
(7, 'estudante1@ojj.edu', '$2a$10$iRbNcIDAPCfGDH/BF/MiCO1QAo0zFLRpQ0eX5F6IpwrJHd8GSGAXu', 'ATIVO'),
(2, 'funcionario1@ojj.edu', '$2a$10$foFuVocETUWTuCY2Dl2jaOQCaKzZApx9JOBlHvJn2T8ts.CNfz3ua', 'ATIVO');

-- Senhas originais:
-- admin1@ojj.edu / Admin123
-- estudante1@ojj.edu / Estudante123
-- funcionario1@ojj.edu / Funcionario123
