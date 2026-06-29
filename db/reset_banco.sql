-- ============================================================
-- RESET COMPLETO DA BASE DE DADOS OJJ ACADEMICO
-- ============================================================
-- ATENCAO: Este script apaga TODOS os dados e recria apenas
-- a estrutura das tabelas (schema).
-- 
-- APOS EXECUTAR:
-- 1. Reinicie o Tomcat / servidor de aplicacao
-- 2. O SeedService (AppInitializer) populera automaticamente
--    os dados com as senhas criptografadas corretamente (BCrypt)
-- 3. As credenciais serao geradas em credenciais_geradas/
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `ojj_academico`;
CREATE DATABASE `ojj_academico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ojj_academico`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- TABELAS
-- --------------------------------------------------------

CREATE TABLE `ano_academico` (
  `id_ano_academico` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `status` enum('ATIVO','ENCERRADO') DEFAULT 'ATIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  `tipo` enum('MAC','NPP','EXAME','RECURSO') NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `codigo_curso` varchar(20) NOT NULL,
  `nome_curso` varchar(100) NOT NULL,
  `grau` enum('TECNICO_MEDIO','LICENCIATURA','MESTRADO') NOT NULL,
  `regime` enum('LABORAL','POS_LABORAL') NOT NULL,
  `duracao_anos` int(11) NOT NULL,
  `propina_mensal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `codigo_disciplina` varchar(20) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `estudante` (
  `id_estudante` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `numero_estudante` varchar(20) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email_pessoal` varchar(100) DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `numero_bi` varchar(30) NOT NULL,
  `nome_encarregado` varchar(100) DEFAULT NULL,
  `telefone_encarregado` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `data_inscricao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `frequencia` (
  `id_frequencia` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `data_aula` date NOT NULL,
  `status` enum('PRESENTE','AUSENTE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `numero_bi` varchar(30) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `data_admissao` date NOT NULL,
  `id_admin_criador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `historico_academico` (
  `id_historico` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `media_final` decimal(5,2) DEFAULT NULL,
  `resultado` enum('APROVADO','REPROVADO') DEFAULT NULL,
  `ano_letivo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `matricula` (
  `id_matricula` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  `id_ano_academico` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `data_matricula` datetime DEFAULT current_timestamp(),
  `data_confirmacao` datetime DEFAULT NULL,
  `status` enum('PENDENTE','CONFIRMADA','CANCELADA') DEFAULT 'PENDENTE',
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `matricula_disciplina` (
  `id_matricula` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_avaliacao` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `nota` decimal(5,2) NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `operacao_log` (
  `id_log` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `tipo_operacao` varchar(100) NOT NULL,
  `id_estudante_alvo` int(11) DEFAULT NULL,
  `descricao` text NOT NULL,
  `endereco_ip` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `dados_alterados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dados_alterados`)),
  `resultado` enum('SUCESSO','ERRO') NOT NULL,
  `data_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_tesoureiro` int(11) NOT NULL,
  `tipo_pagamento` enum('MATRICULA','PROPINA','DECLARACAO','CERTIFICADO','MULTA','EXAME_RECURSO') NOT NULL,
  `periodo_referencia` varchar(20) DEFAULT NULL,
  `valor_devido` decimal(10,2) NOT NULL,
  `valor_pago` decimal(10,2) DEFAULT 0.00,
  `multa` decimal(10,2) DEFAULT 0.00,
  `data_pagamento` datetime DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `metodo_pagamento` enum('DINHEIRO','TRANSFERENCIA','MULTICAIXA','TPA') DEFAULT NULL,
  `numero_recibo` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `comprovativo` varchar(255) DEFAULT NULL,
  `status` enum('PENDENTE','PAGO','PARCIAL','ATRASADO') DEFAULT 'PENDENTE',
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome_perfil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `plano_curricular` (
  `id_plano_curricular` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `ano_curricular` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `plano_curricular_disciplina` (
  `id_plano_curricular_disciplina` int(11) NOT NULL,
  `id_plano_curricular` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `grau_academico` enum('LICENCIADO','MESTRE','DOUTOR') DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `propina` (
  `id_propina` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `mes_referencia` varchar(20) NOT NULL,
  `ano_referencia` year(4) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `multa` decimal(10,2) DEFAULT 0.00,
  `data_vencimento` date NOT NULL,
  `status` enum('PENDENTE','PAGO','ATRASADO') DEFAULT 'PENDENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `codigo_sala` varchar(20) NOT NULL,
  `bloco` varchar(20) DEFAULT NULL,
  `capacidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `id_ano_academico` int(11) NOT NULL,
  `nome_semestre` enum('1_SEMESTRE','2_SEMESTRE') NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `turma` (
  `id_turma` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `codigo_turma` varchar(20) NOT NULL,
  `turno` enum('MANHA','TARDE','NOITE') NOT NULL,
  `ano_curricular` int(11) NOT NULL,
  `capacidade_maxima` int(11) NOT NULL,
  `estudantes_inscritos` int(11) DEFAULT 0,
  `horario` varchar(100) DEFAULT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `utilizador` (
  `id_utilizador` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `status` enum('ATIVO','INATIVO','BLOQUEADO') DEFAULT 'ATIVO',
  `tentativas_login` int(11) DEFAULT 0,
  `ultimo_ip` varchar(50) DEFAULT NULL,
  `token_reset` varchar(255) DEFAULT NULL,
  `token_expiracao` datetime DEFAULT NULL,
  `data_criacao` datetime DEFAULT current_timestamp(),
  `data_ultimo_acesso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- INDICES E CHAVES PRIMARIAS
-- --------------------------------------------------------

ALTER TABLE `ano_academico`
  ADD PRIMARY KEY (`id_ano_academico`),
  ADD UNIQUE KEY `uq_ano_academico` (`descricao`);

ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `fk_avaliacao_disciplina` (`id_disciplina`),
  ADD KEY `fk_avaliacao_professor` (`id_professor`);

ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `uq_curso_codigo` (`codigo_curso`),
  ADD KEY `fk_curso_departamento` (`id_departamento`);

ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD UNIQUE KEY `uq_departamento` (`nome_departamento`);

ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `uq_disciplina_codigo` (`codigo_disciplina`) USING BTREE;

ALTER TABLE `estudante`
  ADD PRIMARY KEY (`id_estudante`),
  ADD UNIQUE KEY `uq_estudante_numero` (`numero_estudante`),
  ADD UNIQUE KEY `uq_estudante_bi` (`numero_bi`),
  ADD UNIQUE KEY `uq_estudante_utilizador` (`id_utilizador`);

ALTER TABLE `frequencia`
  ADD PRIMARY KEY (`id_frequencia`),
  ADD KEY `fk_frequencia_estudante` (`id_estudante`),
  ADD KEY `fk_frequencia_disciplina` (`id_disciplina`);

ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `uq_funcionario_bi` (`numero_bi`),
  ADD UNIQUE KEY `uq_funcionario_utilizador` (`id_utilizador`),
  ADD KEY `fk_funcionario_departamento` (`id_departamento`),
  ADD KEY `fk_funcionario_admin` (`id_admin_criador`);

ALTER TABLE `historico_academico`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `fk_historico_estudante` (`id_estudante`),
  ADD KEY `fk_historico_disciplina` (`id_disciplina`);

ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `fk_matricula_estudante` (`id_estudante`),
  ADD KEY `fk_matricula_curso` (`id_curso`),
  ADD KEY `fk_matricula_turma` (`id_turma`),
  ADD KEY `fk_matricula_ano` (`id_ano_academico`),
  ADD KEY `fk_matricula_semestre` (`id_semestre`);

ALTER TABLE `matricula_disciplina`
  ADD PRIMARY KEY (`id_matricula`,`id_disciplina`),
  ADD KEY `fk_md_disciplina` (`id_disciplina`);

ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_avaliacao` (`id_avaliacao`),
  ADD KEY `fk_nota_estudante` (`id_estudante`);

ALTER TABLE `operacao_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `fk_log_utilizador` (`id_utilizador`),
  ADD KEY `fk_log_estudante` (`id_estudante_alvo`);

ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD UNIQUE KEY `uq_pagamento_recibo` (`numero_recibo`),
  ADD KEY `fk_pagamento_estudante` (`id_estudante`),
  ADD KEY `fk_pagamento_tesoureiro` (`id_tesoureiro`);

ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `uq_perfil` (`nome_perfil`);

ALTER TABLE `plano_curricular`
  ADD PRIMARY KEY (`id_plano_curricular`),
  ADD KEY `fk_pc_curso` (`id_curso`);

ALTER TABLE `plano_curricular_disciplina`
  ADD PRIMARY KEY (`id_plano_curricular_disciplina`),
  ADD KEY `id_plano_curricular` (`id_plano_curricular`),
  ADD KEY `id_disciplina` (`id_disciplina`);

ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`),
  ADD UNIQUE KEY `uq_professor_funcionario` (`id_funcionario`);

ALTER TABLE `propina`
  ADD PRIMARY KEY (`id_propina`),
  ADD KEY `fk_propina_estudante` (`id_estudante`);

ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD UNIQUE KEY `uq_sala_codigo` (`codigo_sala`);

ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`),
  ADD KEY `fk_semestre_ano` (`id_ano_academico`);

ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD UNIQUE KEY `uq_turma_codigo` (`codigo_turma`),
  ADD KEY `fk_turma_curso` (`id_curso`),
  ADD KEY `fk_turma_sala` (`id_sala`);

ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `uq_utilizador_email` (`email`),
  ADD KEY `fk_utilizador_perfil` (`id_perfil`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
-- --------------------------------------------------------

ALTER TABLE `ano_academico` MODIFY `id_ano_academico` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `avaliacao` MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `curso` MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `departamento` MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `disciplina` MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `estudante` MODIFY `id_estudante` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `frequencia` MODIFY `id_frequencia` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `funcionario` MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `historico_academico` MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `matricula` MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `nota` MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `operacao_log` MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `pagamento` MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `perfil` MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `plano_curricular` MODIFY `id_plano_curricular` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `plano_curricular_disciplina` MODIFY `id_plano_curricular_disciplina` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `professor` MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `propina` MODIFY `id_propina` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `sala` MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `semestre` MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `turma` MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `utilizador` MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
-- RESTRICOES (FOREIGN KEYS)
-- --------------------------------------------------------

ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_avaliacao_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE CASCADE;

ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

ALTER TABLE `estudante`
  ADD CONSTRAINT `fk_estudante_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE;

ALTER TABLE `frequencia`
  ADD CONSTRAINT `fk_frequencia_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_frequencia_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_admin` FOREIGN KEY (`id_admin_criador`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_funcionario_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_funcionario_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE;

ALTER TABLE `historico_academico`
  ADD CONSTRAINT `fk_historico_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_historico_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_ano` FOREIGN KEY (`id_ano_academico`) REFERENCES `ano_academico` (`id_ano_academico`),
  ADD CONSTRAINT `fk_matricula_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `fk_matricula_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_matricula_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`),
  ADD CONSTRAINT `fk_matricula_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

ALTER TABLE `matricula_disciplina`
  ADD CONSTRAINT `fk_md_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`),
  ADD CONSTRAINT `fk_md_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`) ON DELETE CASCADE;

ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_avaliacao` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao` (`id_avaliacao`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nota_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

ALTER TABLE `operacao_log`
  ADD CONSTRAINT `fk_log_estudante` FOREIGN KEY (`id_estudante_alvo`) REFERENCES `estudante` (`id_estudante`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_log_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`);

ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`),
  ADD CONSTRAINT `fk_pagamento_tesoureiro` FOREIGN KEY (`id_tesoureiro`) REFERENCES `funcionario` (`id_funcionario`);

ALTER TABLE `plano_curricular`
  ADD CONSTRAINT `fk_pc_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE;

ALTER TABLE `plano_curricular_disciplina`
  ADD CONSTRAINT `plano_curricular_disciplina_ibfk_1` FOREIGN KEY (`id_plano_curricular`) REFERENCES `plano_curricular` (`id_plano_curricular`),
  ADD CONSTRAINT `plano_curricular_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`);

ALTER TABLE `professor`
  ADD CONSTRAINT `fk_professor_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE CASCADE;

ALTER TABLE `propina`
  ADD CONSTRAINT `fk_propina_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

ALTER TABLE `semestre`
  ADD CONSTRAINT `fk_semestre_ano` FOREIGN KEY (`id_ano_academico`) REFERENCES `ano_academico` (`id_ano_academico`) ON DELETE CASCADE;

ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_turma_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE SET NULL;

ALTER TABLE `utilizador`
  ADD CONSTRAINT `fk_utilizador_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`);

SET FOREIGN_KEY_CHECKS = 1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
