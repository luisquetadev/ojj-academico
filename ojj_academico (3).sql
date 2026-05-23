-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Maio-2026 às 02:33
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ojj_academico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ano_academico`
--

CREATE TABLE `ano_academico` (
  `id_ano_academico` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `status` enum('ATIVO','ENCERRADO') DEFAULT 'ATIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ano_academico`
--

INSERT INTO `ano_academico` (`id_ano_academico`, `descricao`, `data_inicio`, `data_fim`, `status`) VALUES
(1, '2022/2023', '2022-09-01', '2023-07-31', 'ENCERRADO'),
(2, '2023/2024', '2023-09-01', '2024-07-31', 'ENCERRADO'),
(3, '2024/2025', '2024-09-01', '2025-07-31', 'ATIVO'),
(4, '2025/2026', '2025-09-01', '2026-07-31', 'ATIVO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  `tipo` enum('MAC','NPP','EXAME','RECURSO') NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

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

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `id_departamento`, `codigo_curso`, `nome_curso`, `grau`, `regime`, `duracao_anos`, `propina_mensal`) VALUES
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nome_departamento`) VALUES
(12, 'Departamento Da Secretaria'),
(2, 'Departamento de Ciências da Computação'),
(5, 'Departamento de Ciências da Saúde'),
(3, 'Departamento de Ciências Económicas'),
(4, 'Departamento de Ciências Sociais'),
(11, 'Departamento de cobranças'),
(7, 'Departamento de Direito'),
(10, 'Departamento de Educação'),
(1, 'Departamento de Engenharias'),
(9, 'Departamento de Gestão'),
(6, 'Departamento de Letras e Artes'),
(8, 'Departamento de Matemática');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `codigo_disciplina` varchar(20) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`id_disciplina`, `codigo_disciplina`, `nome_disciplina`, `carga_horaria`) VALUES
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudante`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `frequencia`
--

CREATE TABLE `frequencia` (
  `id_frequencia` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `data_aula` date NOT NULL,
  `status` enum('PRESENTE','AUSENTE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

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

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `id_utilizador`, `id_departamento`, `nome_completo`, `telefone`, `numero_bi`, `sexo`, `data_nascimento`, `morada`, `salario`, `data_admissao`, `id_admin_criador`) VALUES
(1, 1, 2, 'João Manuel Silva', '923456789', 'BI001234ABC', 'M', '1980-05-15', 'Luanda, Maianga', 250000.00, '2010-01-10', NULL),
(2, 2, 12, 'Maria Fernanda Santos', '934567890', 'BI001235ABC', 'F', '1985-08-20', 'Luanda, Kilamba', 150000.00, '2015-03-15', NULL),
(3, 3, 11, 'Carlos Alberto Pereira', '945678901', 'BI001236ABC', 'M', '1990-11-10', 'Luanda, Talatona', 120000.00, '2018-07-01', NULL),
(4, 4, 2, 'Ana Cristina Lopes', '956789012', 'BI001237ABC', 'F', '1975-02-25', 'Luanda, Viana', 180000.00, '2012-09-20', NULL),
(5, 5, 1, 'Ricardo José Almeida', '967890123', 'BI001238ABC', 'M', '1982-07-30', 'Luanda, Benfica', 175000.00, '2014-11-05', NULL),
(6, 6, 2, 'Paula Sofia Mendes', '978901234', 'BI001239ABC', 'F', '1978-12-12', 'Luanda, Camama', 220000.00, '2011-05-20', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_academico`
--

CREATE TABLE `historico_academico` (
  `id_historico` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `media_final` decimal(5,2) DEFAULT NULL,
  `resultado` enum('APROVADO','REPROVADO') DEFAULT NULL,
  `ano_letivo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula_disciplina`
--

CREATE TABLE `matricula_disciplina` (
  `id_matricula` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_avaliacao` int(11) NOT NULL,
  `id_estudante` int(11) NOT NULL,
  `nota` decimal(5,2) NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `operacao_log`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome_perfil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome_perfil`) VALUES
(1, 'ADMIN'),
(5, 'COORDENADOR'),
(8, 'COORDENADOR_CURSO'),
(6, 'DIRECTOR'),
(4, 'DOCENTE'),
(7, 'ESTUDANTE'),
(2, 'SECRETARIA'),
(3, 'TESOURARIA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_curricular`
--

CREATE TABLE `plano_curricular` (
  `id_plano_curricular` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `ano_curricular` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `plano_curricular`
--

INSERT INTO `plano_curricular` (`id_plano_curricular`, `id_curso`, `ano_curricular`, `semestre`, `carga_horaria`) VALUES
(1, 1, 1, 1, 60),
(2, 1, 1, 2, 60),
(3, 1, 2, 1, 75),
(4, 1, 2, 2, 60),
(5, 1, 1, 1, 90),
(6, 2, 1, 1, 60),
(7, 2, 2, 1, 75),
(8, 3, 1, 1, 90),
(9, 3, 1, 1, 60),
(10, 5, 1, 1, 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_curricular_disciplina`
--

CREATE TABLE `plano_curricular_disciplina` (
  `id_plano_curricular_disciplina` int(11) NOT NULL,
  `id_plano_curricular` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `grau_academico` enum('LICENCIADO','MESTRE','DOUTOR') DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `propina`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `codigo_sala` varchar(20) NOT NULL,
  `bloco` varchar(20) DEFAULT NULL,
  `capacidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `codigo_sala`, `bloco`, `capacidade`) VALUES
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `id_ano_academico` int(11) NOT NULL,
  `nome_semestre` enum('1_SEMESTRE','2_SEMESTRE') NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `semestre`
--

INSERT INTO `semestre` (`id_semestre`, `id_ano_academico`, `nome_semestre`, `data_inicio`, `data_fim`) VALUES
(1, 3, '1_SEMESTRE', '2024-09-01', '2025-01-31'),
(2, 3, '2_SEMESTRE', '2025-02-01', '2025-07-31'),
(3, 4, '1_SEMESTRE', '2025-09-01', '2026-01-31'),
(4, 4, '2_SEMESTRE', '2026-02-01', '2026-07-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

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

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`id_turma`, `id_curso`, `id_sala`, `codigo_turma`, `turno`, `ano_curricular`, `capacidade_maxima`, `estudantes_inscritos`, `horario`, `data_criacao`) VALUES
(1, 1, 1, 'INF-1A', 'MANHA', 1, 40, 15, 'Seg/Qua 08:00-10:00', '2026-05-22 16:33:54'),
(2, 1, 2, 'INF-1B', 'TARDE', 1, 35, 12, 'Seg/Qua 14:00-16:00', '2026-05-22 16:33:54'),
(3, 1, 3, 'INF-2A', 'MANHA', 2, 40, 10, 'Ter/Qui 08:00-10:00', '2026-05-22 16:33:54'),
(4, 2, 4, 'CC-1A', 'MANHA', 1, 35, 8, 'Seg/Qua 10:00-12:00', '2026-05-22 16:33:54'),
(5, 3, 5, 'CIV-1A', 'MANHA', 1, 45, 12, 'Ter/Qui 08:00-10:00', '2026-05-22 16:33:54'),
(6, 5, 6, 'ECO-1A', 'NOITE', 1, 30, 9, 'Seg/Qua 19:00-21:00', '2026-05-22 16:33:54'),
(7, 8, 7, 'DIR-1A', 'MANHA', 1, 40, 14, 'Ter/Qui 14:00-16:00', '2026-05-22 16:33:54'),
(8, 6, 8, 'GES-1A', 'TARDE', 1, 35, 10, 'Seg/Qua 16:00-18:00', '2026-05-22 16:33:54'),
(9, 4, 9, 'ELE-1A', 'MANHA', 1, 50, 8, 'Sex 08:00-12:00', '2026-05-22 16:33:54'),
(10, 7, 10, 'SOC-1A', 'NOITE', 1, 25, 6, 'Qua/Sex 19:00-21:00', '2026-05-22 16:33:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

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

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id_utilizador`, `id_perfil`, `email`, `password_hash`, `status`, `tentativas_login`, `ultimo_ip`, `token_reset`, `token_expiracao`, `data_criacao`, `data_ultimo_acesso`) VALUES
(1, 1, 'admin@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(2, 2, 'secretaria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(3, 3, 'tesouraria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(4, 4, 'professor1@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(5, 4, 'professor2@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(6, 5, 'coordenador@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(7, 6, 'diretor@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(8, 7, 'estudante1@estudante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(9, 7, 'estudante2@estudante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(10, 7, 'estudante3@estudante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-05-22 16:37:40', NULL),
(11, 1, 'admin', 'Admin@123', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(12, 2, 'funcionario', 'Funcionario@123', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(13, 3, 'estudante', 'Estudante@123', NULL, 0, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ano_academico`
--
ALTER TABLE `ano_academico`
  ADD PRIMARY KEY (`id_ano_academico`),
  ADD UNIQUE KEY `uq_ano_academico` (`descricao`);

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `fk_avaliacao_disciplina` (`id_disciplina`),
  ADD KEY `fk_avaliacao_professor` (`id_professor`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `uq_curso_codigo` (`codigo_curso`),
  ADD KEY `fk_curso_departamento` (`id_departamento`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD UNIQUE KEY `uq_departamento` (`nome_departamento`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `uq_disciplina_codigo` (`codigo_disciplina`) USING BTREE;

--
-- Índices para tabela `estudante`
--
ALTER TABLE `estudante`
  ADD PRIMARY KEY (`id_estudante`),
  ADD UNIQUE KEY `uq_estudante_numero` (`numero_estudante`),
  ADD UNIQUE KEY `uq_estudante_bi` (`numero_bi`),
  ADD UNIQUE KEY `uq_estudante_utilizador` (`id_utilizador`);

--
-- Índices para tabela `frequencia`
--
ALTER TABLE `frequencia`
  ADD PRIMARY KEY (`id_frequencia`),
  ADD KEY `fk_frequencia_estudante` (`id_estudante`),
  ADD KEY `fk_frequencia_disciplina` (`id_disciplina`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `uq_funcionario_bi` (`numero_bi`),
  ADD UNIQUE KEY `uq_funcionario_utilizador` (`id_utilizador`),
  ADD KEY `fk_funcionario_departamento` (`id_departamento`),
  ADD KEY `fk_funcionario_admin` (`id_admin_criador`);

--
-- Índices para tabela `historico_academico`
--
ALTER TABLE `historico_academico`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `fk_historico_estudante` (`id_estudante`),
  ADD KEY `fk_historico_disciplina` (`id_disciplina`);

--
-- Índices para tabela `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `fk_matricula_estudante` (`id_estudante`),
  ADD KEY `fk_matricula_curso` (`id_curso`),
  ADD KEY `fk_matricula_turma` (`id_turma`),
  ADD KEY `fk_matricula_ano` (`id_ano_academico`),
  ADD KEY `fk_matricula_semestre` (`id_semestre`);

--
-- Índices para tabela `matricula_disciplina`
--
ALTER TABLE `matricula_disciplina`
  ADD PRIMARY KEY (`id_matricula`,`id_disciplina`),
  ADD KEY `fk_md_disciplina` (`id_disciplina`);

--
-- Índices para tabela `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_avaliacao` (`id_avaliacao`),
  ADD KEY `fk_nota_estudante` (`id_estudante`);

--
-- Índices para tabela `operacao_log`
--
ALTER TABLE `operacao_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `fk_log_utilizador` (`id_utilizador`),
  ADD KEY `fk_log_estudante` (`id_estudante_alvo`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD UNIQUE KEY `uq_pagamento_recibo` (`numero_recibo`),
  ADD KEY `fk_pagamento_estudante` (`id_estudante`),
  ADD KEY `fk_pagamento_tesoureiro` (`id_tesoureiro`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `uq_perfil` (`nome_perfil`);

--
-- Índices para tabela `plano_curricular`
--
ALTER TABLE `plano_curricular`
  ADD PRIMARY KEY (`id_plano_curricular`),
  ADD KEY `fk_pc_curso` (`id_curso`);

--
-- Índices para tabela `plano_curricular_disciplina`
--
ALTER TABLE `plano_curricular_disciplina`
  ADD PRIMARY KEY (`id_plano_curricular_disciplina`),
  ADD KEY `id_plano_curricular` (`id_plano_curricular`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`),
  ADD UNIQUE KEY `uq_professor_funcionario` (`id_funcionario`);

--
-- Índices para tabela `propina`
--
ALTER TABLE `propina`
  ADD PRIMARY KEY (`id_propina`),
  ADD KEY `fk_propina_estudante` (`id_estudante`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD UNIQUE KEY `uq_sala_codigo` (`codigo_sala`);

--
-- Índices para tabela `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`),
  ADD KEY `fk_semestre_ano` (`id_ano_academico`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD UNIQUE KEY `uq_turma_codigo` (`codigo_turma`),
  ADD KEY `fk_turma_curso` (`id_curso`),
  ADD KEY `fk_turma_sala` (`id_sala`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `uq_utilizador_email` (`email`),
  ADD KEY `fk_utilizador_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ano_academico`
--
ALTER TABLE `ano_academico`
  MODIFY `id_ano_academico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `estudante`
--
ALTER TABLE `estudante`
  MODIFY `id_estudante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `frequencia`
--
ALTER TABLE `frequencia`
  MODIFY `id_frequencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `historico_academico`
--
ALTER TABLE `historico_academico`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `operacao_log`
--
ALTER TABLE `operacao_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `plano_curricular`
--
ALTER TABLE `plano_curricular`
  MODIFY `id_plano_curricular` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `plano_curricular_disciplina`
--
ALTER TABLE `plano_curricular_disciplina`
  MODIFY `id_plano_curricular_disciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `propina`
--
ALTER TABLE `propina`
  MODIFY `id_propina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_avaliacao_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Limitadores para a tabela `estudante`
--
ALTER TABLE `estudante`
  ADD CONSTRAINT `fk_estudante_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `frequencia`
--
ALTER TABLE `frequencia`
  ADD CONSTRAINT `fk_frequencia_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_frequencia_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_admin` FOREIGN KEY (`id_admin_criador`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_funcionario_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_funcionario_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `historico_academico`
--
ALTER TABLE `historico_academico`
  ADD CONSTRAINT `fk_historico_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_historico_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_ano` FOREIGN KEY (`id_ano_academico`) REFERENCES `ano_academico` (`id_ano_academico`),
  ADD CONSTRAINT `fk_matricula_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `fk_matricula_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_matricula_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`),
  ADD CONSTRAINT `fk_matricula_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

--
-- Limitadores para a tabela `matricula_disciplina`
--
ALTER TABLE `matricula_disciplina`
  ADD CONSTRAINT `fk_md_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`),
  ADD CONSTRAINT `fk_md_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_avaliacao` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao` (`id_avaliacao`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nota_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `operacao_log`
--
ALTER TABLE `operacao_log`
  ADD CONSTRAINT `fk_log_estudante` FOREIGN KEY (`id_estudante_alvo`) REFERENCES `estudante` (`id_estudante`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_log_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`),
  ADD CONSTRAINT `fk_pagamento_tesoureiro` FOREIGN KEY (`id_tesoureiro`) REFERENCES `funcionario` (`id_funcionario`);

--
-- Limitadores para a tabela `plano_curricular`
--
ALTER TABLE `plano_curricular`
  ADD CONSTRAINT `fk_pc_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `plano_curricular_disciplina`
--
ALTER TABLE `plano_curricular_disciplina`
  ADD CONSTRAINT `plano_curricular_disciplina_ibfk_1` FOREIGN KEY (`id_plano_curricular`) REFERENCES `plano_curricular` (`id_plano_curricular`),
  ADD CONSTRAINT `plano_curricular_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `fk_professor_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `propina`
--
ALTER TABLE `propina`
  ADD CONSTRAINT `fk_propina_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `fk_semestre_ano` FOREIGN KEY (`id_ano_academico`) REFERENCES `ano_academico` (`id_ano_academico`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_turma_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `fk_utilizador_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
