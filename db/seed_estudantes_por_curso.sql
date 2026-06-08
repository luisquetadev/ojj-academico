-- Script para inserir 40 estudantes em cada curso com dados completos e matrículas associadas.
-- Ajuste id_ano_academico e id_semestre conforme o ano letivo desejado.

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS seq_n;
CREATE TEMPORARY TABLE seq_n (n INT PRIMARY KEY);
INSERT INTO seq_n (n) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(36),(37),(38),(39),(40);

-- 1. Inserir utilizadores de estudante.
INSERT INTO utilizador (id_perfil, email, password_hash, status)
SELECT
  7,
  CONCAT('estudante', LPAD((c.id_curso - 1) * 40 + s.n, 4, '0'), '@ojj.edu'),
  '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
  'ATIVO'
FROM curso c
CROSS JOIN seq_n s
ORDER BY c.id_curso, s.n;

SET @primeiro_id_utilizador = LAST_INSERT_ID();

-- 2. Inserir estudantes com dados completos usando os utilizadores criados.
INSERT INTO estudante (
    id_utilizador,
    numero_estudante,
    nome_completo,
    sexo,
    data_nascimento,
    telefone,
    email_pessoal,
    morada,
    provincia,
    nacionalidade,
    numero_bi,
    nome_encarregado,
    telefone_encarregado,
    data_inscricao
)
SELECT
    @primeiro_id_utilizador + ((c.id_curso - 1) * 40 + s.n) - 1,
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

SET @primeiro_id_estudante = LAST_INSERT_ID();

-- 3. Inserir matrículas para os estudantes nas turmas existentes por curso.
INSERT INTO matricula (
    id_estudante,
    id_curso,
    id_turma,
    id_ano_academico,
    id_semestre,
    data_matricula,
    status,
    observacoes
)
SELECT
    @primeiro_id_estudante + ((c.id_curso - 1) * 40 + s.n) - 1,
    c.id_curso,
    (
        SELECT MIN(id_turma)
        FROM turma t
        WHERE t.id_curso = c.id_curso
    ),
    4,
    3,
    NOW(),
    'CONFIRMADA',
    'Matricula automática para preenchimento de carga inicial.'
FROM curso c
CROSS JOIN seq_n s
ORDER BY c.id_curso, s.n;

-- 4. Atualizar contagem de estudantes inscritos nas turmas.
UPDATE turma t
JOIN (
    SELECT id_turma, COUNT(*) AS total
    FROM matricula
    GROUP BY id_turma
) m ON t.id_turma = m.id_turma
SET t.estudantes_inscritos = m.total;

DROP TEMPORARY TABLE IF EXISTS seq_n;
COMMIT;
