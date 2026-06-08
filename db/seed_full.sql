-- Script de seed completo para o banco de dados OJJ Académico.
-- Execute após criar o esquema de tabelas.
-- Assumindo que o banco está vazio.

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS = 0;

-- Perfis de utilizador
INSERT INTO perfil (id_perfil, nome_perfil) VALUES
(1, 'ADMIN'),
(2, 'SECRETARIA'),
(3, 'TESOURARIA'),
(4, 'DOCENTE'),
(5, 'COORDENADOR'),
(6, 'DIRECTOR'),
(7, 'ESTUDANTE'),
(8, 'COORDENADOR_CURSO');

-- Departamentos
INSERT INTO departamento (id_departamento, nome_departamento) VALUES
(1, 'Departamento de Engenharias'),
(2, 'Departamento de Ciências da Computação'),
(3, 'Departamento de Ciências Económicas'),
(4, 'Departamento de Ciências Sociais'),
(5, 'Departamento de Ciências da Saúde'),
(6, 'Departamento de Letras e Artes'),
(7, 'Departamento de Direito'),
(8, 'Departamento de Matemática'),
(9, 'Departamento de Gestão'),
(10, 'Departamento de Educação'),
(11, 'Departamento de cobranças'),
(12, 'Departamento Da Secretaria');

-- Anos académicos
INSERT INTO ano_academico (id_ano_academico, descricao, data_inicio, data_fim, status) VALUES
(1, '2022/2023', '2022-09-01', '2023-07-31', 'ENCERRADO'),
(2, '2023/2024', '2023-09-01', '2024-07-31', 'ENCERRADO'),
(3, '2024/2025', '2024-09-01', '2025-07-31', 'ATIVO'),
(4, '2025/2026', '2025-09-01', '2026-07-31', 'ATIVO');

-- Salas
INSERT INTO sala (id_sala, codigo_sala, bloco, capacidade) VALUES
(1, 'A101', 'Bloco A', 50),
(2, 'A102', 'Bloco A', 45),
(3, 'B201', 'Bloco B', 60),
(4, 'B202', 'Bloco B', 55),
(5, 'C301', 'Bloco C', 40),
(6, 'C302', 'Bloco C', 35),
(7, 'LAB-INFO-1', 'Laboratórios', 30),
(8, 'LAB-INFO-2', 'Laboratórios', 30),
(9, 'AUDITORIO', 'Bloco Central', 200),
(10, 'SALA-PROF', 'Bloco A', 20);

-- Semestres
INSERT INTO semestre (id_semestre, id_ano_academico, nome_semestre, data_inicio, data_fim) VALUES
(1, 3, '1_SEMESTRE', '2024-09-01', '2025-01-31'),
(2, 3, '2_SEMESTRE', '2025-02-01', '2025-07-31'),
(3, 4, '1_SEMESTRE', '2025-09-01', '2026-01-31'),
(4, 4, '2_SEMESTRE', '2026-02-01', '2026-07-31');

-- Cursos
INSERT INTO curso (id_curso, id_departamento, codigo_curso, nome_curso, grau, regime, duracao_anos, propina_mensal) VALUES
(1, 2, 'CC101', 'Engenharia Informática', 'LICENCIATURA', 'LABORAL', 4, 8500.00),
(2, 2, 'CC102', 'Ciência da Computação', 'LICENCIATURA', 'LABORAL', 4, 8200.00),
(3, 1, 'ENG101', 'Engenharia Civil', 'LICENCIATURA', 'LABORAL', 5, 9000.00),
(4, 1, 'ENG102', 'Engenharia Electrotécnica', 'LICENCIATURA', 'LABORAL', 5, 8800.00),
(5, 3, 'ECO101', 'Economia', 'LICENCIATURA', 'POS_LABORAL', 4, 7500.00),
(6, 9, 'GES101', 'Gestão de Empresas', 'LICENCIATURA', 'LABORAL', 4, 7800.00),
(7, 4, 'SOC101', 'Sociologia', 'LICENCIATURA', 'POS_LABORAL', 4, 6500.00),
(8, 7, 'DIR101', 'Direito', 'LICENCIATURA', 'LABORAL', 5, 9500.00),
(9, 5, 'SAU101', 'Enfermagem', 'LICENCIATURA', 'LABORAL', 4, 8000.00),
(10, 10, 'PED101', 'Pedagogia', 'LICENCIATURA', 'POS_LABORAL', 4, 6000.00);

-- Turmas
INSERT INTO turma (id_turma, id_curso, id_sala, codigo_turma, turno, ano_curricular, capacidade_maxima, estudantes_inscritos, horario, data_criacao) VALUES
(1, 1, 1, 'INF-1A', 'MANHA', 1, 40, 0, 'Seg/Qua 08:00-10:00', NOW()),
(2, 1, 2, 'INF-1B', 'TARDE', 1, 35, 0, 'Seg/Qua 14:00-16:00', NOW()),
(3, 1, 3, 'INF-2A', 'MANHA', 2, 40, 0, 'Ter/Qui 08:00-10:00', NOW()),
(4, 2, 4, 'CC-1A', 'MANHA', 1, 35, 0, 'Seg/Qua 10:00-12:00', NOW()),
(5, 3, 5, 'CIV-1A', 'MANHA', 1, 45, 0, 'Ter/Qui 08:00-10:00', NOW()),
(6, 5, 6, 'ECO-1A', 'NOITE', 1, 30, 0, 'Seg/Qua 19:00-21:00', NOW()),
(7, 8, 7, 'DIR-1A', 'MANHA', 1, 40, 0, 'Ter/Qui 14:00-16:00', NOW()),
(8, 6, 8, 'GES-1A', 'TARDE', 1, 35, 0, 'Seg/Qua 16:00-18:00', NOW()),
(9, 4, 9, 'ELE-1A', 'MANHA', 1, 50, 0, 'Sex 08:00-12:00', NOW()),
(10, 7, 10, 'SOC-1A', 'NOITE', 1, 25, 0, 'Qua/Sex 19:00-21:00', NOW());

-- Utilizadores base
INSERT INTO utilizador (id_utilizador, id_perfil, email, password_hash, status, tentativas_login, ultimo_ip, token_reset, token_expiracao, data_criacao, data_ultimo_acesso) VALUES
(30, 1, 'admin@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(31, 2, 'secretaria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(32, 3, 'tesouraria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(33, 4, 'professor1@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(34, 4, 'professor2@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(35, 5, 'coordenador@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL),
(36, 6, 'diretor@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, NOW(), NULL);

-- Funcionários base
INSERT INTO funcionario (id_funcionario, id_utilizador, id_departamento, nome_completo, telefone, numero_bi, sexo, data_nascimento, morada, salario, data_admissao, id_admin_criador) VALUES
(30, 31, 12, 'Maria Fernanda Santos', '934567890', 'BI001235ABC', 'F', '1985-08-20', 'Luanda, Kilamba', 150000.00, '2015-03-15', NULL),
(31, 32, 11, 'Carlos Alberto Pereira', '945678901', 'BI001236ABC', 'M', '1990-11-10', 'Luanda, Talatona', 120000.00, '2018-07-01', NULL),
(32, 35, 2, 'Paula Sofia Mendes', '978901234', 'BI001239ABC', 'F', '1978-12-12', 'Luanda, Camama', 220000.00, '2011-05-20', NULL),
(33, 33, 2, 'Ana Cristina Lopes', '956789012', 'BI001237ABC', 'F', '1975-02-25', 'Luanda, Viana', 180000.00, '2012-09-20', NULL),
(34, 34, 1, 'Ricardo José Almeida', '967890123', 'BI001238ABC', 'M', '1982-07-30', 'Luanda, Benfica', 175000.00, '2014-11-05', NULL),
(35, 36, 4, 'José Manuel Cardoso', '912345678', 'BI001240ABC', 'M', '1976-04-10', 'Luanda, Miramar', 200000.00, '2013-06-30', NULL);

-- Professores base
INSERT INTO professor (id_professor, id_funcionario, grau_academico, especialidade) VALUES
(30, 33, 'MESTRE', 'Sistemas de Informação'),
(31, 34, 'DOUTOR', 'Redes e Telecomunicações');

-- Disciplinas principais
INSERT INTO disciplina (id_disciplina, codigo_disciplina, nome_disciplina, carga_horaria) VALUES
(1, 'INF101', 'Programação I', 60),
(2, 'INF101', 'Introdução A Informatica I', 60),
(3, 'INF101', 'Lingua Portuguesa', 60),
(4, 'INF101', 'Fisica', 60),
(5, 'INF101', 'Matematica I', 60),
(6, 'INF102', 'Programação II', 60),
(7, 'INF102', 'Estrutura de Dados I', 60),
(8, 'INF102', 'Algebra Linear', 60),
(9, 'INF102', 'Estaistica e Probabilidade', 60),
(10, 'INF102', 'Modulo MVC', 60),
(11, 'INF201', 'Banco de Dados I', 75),
(12, 'INF201', 'Programação III', 75),
(13, 'INF201', 'Codigo Limpo I', 75),
(14, 'INF201', 'Estrutura de Dados II', 75),
(15, 'INF201', 'Redes I', 75),
(16, 'INF202', 'Redes de Computadores', 60),
(17, 'MAT101', 'Cálculo I', 90),
(18, 'MAT102', 'Álgebra Linear', 60),
(19, 'FIS101', 'Física Geral', 60),
(20, 'ECO101', 'Microeconomia', 60),
(21, 'GES101', 'Administração Geral', 45),
(22, 'DIR101', 'Introdução ao Direito', 60);

-- Plano curricular mínimo para dar contexto
INSERT INTO plano_curricular (id_plano_curricular, id_curso, ano_curricular, semestre, carga_horaria) VALUES
(1, 1, 1, 1, 60),
(2, 1, 1, 2, 60),
(3, 2, 1, 1, 60),
(4, 2, 1, 2, 60),
(5, 3, 1, 1, 90),
(6, 5, 1, 1, 60);

INSERT INTO plano_curricular_disciplina (id_plano_curricular_disciplina, id_plano_curricular, id_disciplina) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 5),
(4, 2, 6),
(5, 2, 7),
(6, 3, 2),
(7, 3, 8),
(8, 4, 10),
(9, 5, 4),
(10, 6, 20);

-- Tabela auxiliar para gerar 40 estudantes por curso
CREATE TEMPORARY TABLE seq_n (n INT PRIMARY KEY);
INSERT INTO seq_n (n) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(36),(37),(38),(39),(40);

-- Estudantes como utilizadores
INSERT INTO utilizador (id_utilizador, id_perfil, email, password_hash, status, tentativas_login, ultimo_ip, token_reset, token_expiracao, data_criacao, data_ultimo_acesso)
SELECT
  50 + ((c.id_curso - 1) * 40 + s.n),
  7,
  CONCAT('estudante', LPAD((c.id_curso - 1) * 40 + s.n, 4, '0'), '@ojj.edu'),
  '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
  'ATIVO',
  0,
  NULL,
  NULL,
  NULL,
  NOW(),
  NULL
FROM curso c
CROSS JOIN seq_n s
ORDER BY c.id_curso, s.n;

-- Dados de estudante
INSERT INTO estudante (id_estudante, id_utilizador, numero_estudante, nome_completo, sexo, data_nascimento, telefone, email_pessoal, morada, provincia, nacionalidade, numero_bi, nome_encarregado, telefone_encarregado, data_inscricao)
SELECT
  30 + ((c.id_curso - 1) * 40 + s.n),
  50 + ((c.id_curso - 1) * 40 + s.n),
  CONCAT('STU', LPAD((c.id_curso - 1) * 40 + s.n, 6, '0')),
  CONCAT('Estudante ', LPAD((c.id_curso - 1) * 40 + s.n, 4, '0'), ' - ', c.nome_curso),
  CASE WHEN MOD((c.id_curso - 1) * 40 + s.n, 2) = 0 THEN 'F' ELSE 'M' END,
  DATE_SUB(CURDATE(), INTERVAL 18 + MOD((c.id_curso - 1) * 40 + s.n, 10) YEAR),
  CONCAT('92', LPAD((c.id_curso - 1) * 40 + s.n, 7, '0')),
  CONCAT('estudante', LPAD((c.id_curso - 1) * 40 + s.n, 4, '0'), '@mail.ojj.edu'),
  CONCAT('Rua dos Estudantes, Bairro ', LPAD(c.id_curso, 2, '0')),
  CASE c.id_departamento
    WHEN 1 THEN 'Luanda'
    WHEN 2 THEN 'Benguela'
    WHEN 3 THEN 'Huambo'
    WHEN 4 THEN 'Lubango'
    WHEN 5 THEN 'Malanje'
    WHEN 6 THEN 'Uíge'
    WHEN 7 THEN 'Cabinda'
    WHEN 8 THEN 'Bengo'
    WHEN 9 THEN 'Cunene'
    ELSE 'Luanda'
  END,
  'Angola',
  CONCAT('BI', LPAD((c.id_curso - 1) * 40 + s.n, 10, '0')),
  CONCAT('Encarregado ', LPAD((c.id_curso - 1) * 40 + s.n, 4, '0')),
  CONCAT('92', LPAD((c.id_curso - 1) * 40 + s.n, 7, '0')),
  NOW()
FROM curso c
CROSS JOIN seq_n s
ORDER BY c.id_curso, s.n;

-- Matrículas dos estudantes na primeira turma de cada curso
INSERT INTO matricula (id_matricula, id_estudante, id_curso, id_turma, id_ano_academico, id_semestre, data_matricula, status, observacoes)
SELECT
  30 + ((c.id_curso - 1) * 40 + s.n),
  30 + ((c.id_curso - 1) * 40 + s.n),
  c.id_curso,
  (SELECT MIN(t.id_turma) FROM turma t WHERE t.id_curso = c.id_curso),
  4,
  3,
  NOW(),
  'CONFIRMADA',
  CONCAT('Matrícula automática para curso ', c.codigo_curso)
FROM curso c
CROSS JOIN seq_n s
ORDER BY c.id_curso, s.n;

-- Ajustar a contagem de estudantes por turma
UPDATE turma t
JOIN (
  SELECT id_turma, COUNT(*) AS total
  FROM matricula
  GROUP BY id_turma
) m ON t.id_turma = m.id_turma
SET t.estudantes_inscritos = m.total;

DROP TEMPORARY TABLE IF EXISTS seq_n;
SET FOREIGN_KEY_CHECKS = 1;

-- Senhas padrão dos utilizadores:
-- admin@ojj.edu / qualquer senha hash válida com o mesmo hash usado acima
-- todos os estudantes usam o hash padrão definido no script
