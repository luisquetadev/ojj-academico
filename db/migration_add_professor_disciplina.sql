-- ============================================================
-- Migration: Add professor_disciplina linking table
-- ============================================================

CREATE TABLE IF NOT EXISTS professor_disciplina (
  id_professor_disciplina int(11) NOT NULL AUTO_INCREMENT,
  id_professor int(11) NOT NULL,
  id_disciplina int(11) NOT NULL,
  PRIMARY KEY (id_professor_disciplina),
  UNIQUE KEY uq_professor_disciplina (id_professor, id_disciplina),
  KEY fk_pd_professor (id_professor),
  KEY fk_pd_disciplina (id_disciplina)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE professor_disciplina
  ADD CONSTRAINT fk_pd_professor FOREIGN KEY (id_professor) REFERENCES professor (id_professor) ON DELETE CASCADE,
  ADD CONSTRAINT fk_pd_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina) ON DELETE CASCADE;

-- Assign existing professors to some disciplines based on seed data
INSERT INTO professor_disciplina (id_professor, id_disciplina) VALUES
(30, 1),  -- Programacao I
(30, 6),  -- Programacao II
(30, 11), -- Banco de Dados I
(30, 12), -- Programacao III
(30, 10), -- Modulo MVC
(31, 4),  -- Fisica
(31, 15), -- Redes I
(31, 16), -- Redes de Computadores
(31, 19); -- Fisica Geral
