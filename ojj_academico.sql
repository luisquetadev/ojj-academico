-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Jun-2026 às 22:49
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
(1, 2, 'CC101', 'Engenharia Inform??tica', 'LICENCIATURA', 'LABORAL', 4, 8500.00),
(2, 2, 'CC102', 'Ci??ncia da Computa????o', 'LICENCIATURA', 'LABORAL', 4, 8200.00),
(3, 1, 'ENG101', 'Engenharia Civil', 'LICENCIATURA', 'LABORAL', 5, 9000.00),
(4, 1, 'ENG102', 'Engenharia Electrot??cnica', 'LICENCIATURA', 'LABORAL', 5, 8800.00),
(5, 3, 'ECO101', 'Economia', 'LICENCIATURA', 'POS_LABORAL', 4, 7500.00),
(6, 9, 'GES101', 'Gest??o de Empresas', 'LICENCIATURA', 'LABORAL', 4, 7800.00),
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
(2, 'Departamento de Ci??ncias da Computa????o'),
(5, 'Departamento de Ci??ncias da Sa??de'),
(3, 'Departamento de Ci??ncias Econ??micas'),
(4, 'Departamento de Ci??ncias Sociais'),
(11, 'Departamento de cobran??as'),
(7, 'Departamento de Direito'),
(10, 'Departamento de Educa????o'),
(1, 'Departamento de Engenharias'),
(9, 'Departamento de Gest??o'),
(6, 'Departamento de Letras e Artes'),
(8, 'Departamento de Matem??tica');

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
(1, 'INF101', 'Programa????o I', 60),
(2, 'INF101', 'Introdu????o A Informatica I', 60),
(3, 'INF101', 'Lingua Portuguesa', 60),
(4, 'INF101', 'Fisica', 60),
(5, 'INF101', 'Matematica I', 60),
(6, 'INF102', 'Programa????o II', 60),
(7, 'INF102', 'Estrutura de Dados I', 60),
(8, 'INF102', 'Algebra Linear', 60),
(9, 'INF102', 'Estaistica e Probabilidade', 60),
(10, 'INF102', 'Modulo MVC', 60),
(11, 'INF201', 'Banco de Dados I', 75),
(12, 'INF201', 'Programa????o III', 75),
(13, 'INF201', 'Codigo Limpo I', 75),
(14, 'INF201', 'Estrutura de Dados II', 75),
(15, 'INF201', 'Redes I', 75),
(16, 'INF202', 'Redes de Computadores', 60),
(17, 'MAT101', 'C??lculo I', 90),
(18, 'MAT102', '??lgebra Linear', 60),
(19, 'FIS101', 'F??sica Geral', 60),
(20, 'ECO101', 'Microeconomia', 60),
(21, 'GES101', 'Administra????o Geral', 45),
(22, 'DIR101', 'Introdu????o ao Direito', 60);

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

--
-- Extraindo dados da tabela `estudante`
--

INSERT INTO `estudante` (`id_estudante`, `id_utilizador`, `numero_estudante`, `nome_completo`, `sexo`, `data_nascimento`, `telefone`, `email_pessoal`, `morada`, `provincia`, `nacionalidade`, `numero_bi`, `nome_encarregado`, `telefone_encarregado`, `foto`, `data_inscricao`) VALUES
(1, 9, 'STU000001', 'Milton Caetano', 'M', '2007-06-06', '920000001', 'estudante0001@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000001', 'Encarregado 0001', '920000001', NULL, '2026-06-06 14:34:39'),
(2, 10, 'STU000002', 'Victor Pedro', 'F', '2006-06-06', '920000002', 'estudante0002@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000002', 'Encarregado 0002', '920000002', NULL, '2026-06-06 14:34:39'),
(3, 11, 'STU000003', 'Mariano Armando', 'M', '2005-06-06', '920000003', 'estudante0003@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000003', 'Encarregado 0003', '920000003', NULL, '2026-06-06 14:34:39'),
(4, 12, 'STU000004', 'Fátima Costa', 'F', '2004-06-06', '920000004', 'estudante0004@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000004', 'Encarregado 0004', '920000004', NULL, '2026-06-06 14:34:39'),
(5, 13, 'STU000005', 'Estudante 0005 - Engenharia Inform??tica', 'M', '2003-06-06', '920000005', 'estudante0005@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000005', 'Encarregado 0005', '920000005', NULL, '2026-06-06 14:34:39'),
(6, 14, 'STU000006', 'Estudante 0006 - Engenharia Inform??tica', 'F', '2002-06-06', '920000006', 'estudante0006@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000006', 'Encarregado 0006', '920000006', NULL, '2026-06-06 14:34:39'),
(7, 15, 'STU000007', 'Estudante 0007 - Engenharia Inform??tica', 'M', '2001-06-06', '920000007', 'estudante0007@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000007', 'Encarregado 0007', '920000007', NULL, '2026-06-06 14:34:39'),
(8, 16, 'STU000008', 'Estudante 0008 - Engenharia Inform??tica', 'F', '2000-06-06', '920000008', 'estudante0008@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000008', 'Encarregado 0008', '920000008', NULL, '2026-06-06 14:34:39'),
(9, 17, 'STU000009', 'Estudante 0009 - Engenharia Inform??tica', 'M', '1999-06-06', '920000009', 'estudante0009@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000009', 'Encarregado 0009', '920000009', NULL, '2026-06-06 14:34:39'),
(10, 18, 'STU000010', 'Estudante 0010 - Engenharia Inform??tica', 'F', '2008-06-06', '920000010', 'estudante0010@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000010', 'Encarregado 0010', '920000010', NULL, '2026-06-06 14:34:39'),
(11, 19, 'STU000011', 'Estudante 0011 - Engenharia Inform??tica', 'M', '2007-06-06', '920000011', 'estudante0011@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000011', 'Encarregado 0011', '920000011', NULL, '2026-06-06 14:34:39'),
(12, 20, 'STU000012', 'Estudante 0012 - Engenharia Inform??tica', 'F', '2006-06-06', '920000012', 'estudante0012@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000012', 'Encarregado 0012', '920000012', NULL, '2026-06-06 14:34:39'),
(13, 21, 'STU000013', 'Estudante 0013 - Engenharia Inform??tica', 'M', '2005-06-06', '920000013', 'estudante0013@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000013', 'Encarregado 0013', '920000013', NULL, '2026-06-06 14:34:39'),
(14, 22, 'STU000014', 'Estudante 0014 - Engenharia Inform??tica', 'F', '2004-06-06', '920000014', 'estudante0014@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000014', 'Encarregado 0014', '920000014', NULL, '2026-06-06 14:34:39'),
(15, 23, 'STU000015', 'Estudante 0015 - Engenharia Inform??tica', 'M', '2003-06-06', '920000015', 'estudante0015@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000015', 'Encarregado 0015', '920000015', NULL, '2026-06-06 14:34:39'),
(16, 24, 'STU000016', 'Estudante 0016 - Engenharia Inform??tica', 'F', '2002-06-06', '920000016', 'estudante0016@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000016', 'Encarregado 0016', '920000016', NULL, '2026-06-06 14:34:39'),
(17, 25, 'STU000017', 'Estudante 0017 - Engenharia Inform??tica', 'M', '2001-06-06', '920000017', 'estudante0017@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000017', 'Encarregado 0017', '920000017', NULL, '2026-06-06 14:34:39'),
(18, 26, 'STU000018', 'Estudante 0018 - Engenharia Inform??tica', 'F', '2000-06-06', '920000018', 'estudante0018@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000018', 'Encarregado 0018', '920000018', NULL, '2026-06-06 14:34:39'),
(19, 27, 'STU000019', 'Estudante 0019 - Engenharia Inform??tica', 'M', '1999-06-06', '920000019', 'estudante0019@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000019', 'Encarregado 0019', '920000019', NULL, '2026-06-06 14:34:39'),
(20, 28, 'STU000020', 'Estudante 0020 - Engenharia Inform??tica', 'F', '2008-06-06', '920000020', 'estudante0020@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000020', 'Encarregado 0020', '920000020', NULL, '2026-06-06 14:34:39'),
(21, 29, 'STU000021', 'Estudante 0021 - Engenharia Inform??tica', 'M', '2007-06-06', '920000021', 'estudante0021@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000021', 'Encarregado 0021', '920000021', NULL, '2026-06-06 14:34:39'),
(22, 30, 'STU000022', 'Estudante 0022 - Engenharia Inform??tica', 'F', '2006-06-06', '920000022', 'estudante0022@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000022', 'Encarregado 0022', '920000022', NULL, '2026-06-06 14:34:39'),
(23, 31, 'STU000023', 'Estudante 0023 - Engenharia Inform??tica', 'M', '2005-06-06', '920000023', 'estudante0023@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000023', 'Encarregado 0023', '920000023', NULL, '2026-06-06 14:34:39'),
(24, 32, 'STU000024', 'Estudante 0024 - Engenharia Inform??tica', 'F', '2004-06-06', '920000024', 'estudante0024@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000024', 'Encarregado 0024', '920000024', NULL, '2026-06-06 14:34:39'),
(25, 33, 'STU000025', 'Estudante 0025 - Engenharia Inform??tica', 'M', '2003-06-06', '920000025', 'estudante0025@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000025', 'Encarregado 0025', '920000025', NULL, '2026-06-06 14:34:39'),
(26, 34, 'STU000026', 'Estudante 0026 - Engenharia Inform??tica', 'F', '2002-06-06', '920000026', 'estudante0026@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000026', 'Encarregado 0026', '920000026', NULL, '2026-06-06 14:34:39'),
(27, 35, 'STU000027', 'Estudante 0027 - Engenharia Inform??tica', 'M', '2001-06-06', '920000027', 'estudante0027@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000027', 'Encarregado 0027', '920000027', NULL, '2026-06-06 14:34:39'),
(28, 36, 'STU000028', 'Estudante 0028 - Engenharia Inform??tica', 'F', '2000-06-06', '920000028', 'estudante0028@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000028', 'Encarregado 0028', '920000028', NULL, '2026-06-06 14:34:39'),
(29, 37, 'STU000029', 'Estudante 0029 - Engenharia Inform??tica', 'M', '1999-06-06', '920000029', 'estudante0029@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000029', 'Encarregado 0029', '920000029', NULL, '2026-06-06 14:34:39'),
(30, 38, 'STU000030', 'Estudante 0030 - Engenharia Inform??tica', 'F', '2008-06-06', '920000030', 'estudante0030@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000030', 'Encarregado 0030', '920000030', NULL, '2026-06-06 14:34:39'),
(31, 39, 'STU000031', 'Estudante 0031 - Engenharia Inform??tica', 'M', '2007-06-06', '920000031', 'estudante0031@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000031', 'Encarregado 0031', '920000031', NULL, '2026-06-06 14:34:39'),
(32, 40, 'STU000032', 'Estudante 0032 - Engenharia Inform??tica', 'F', '2006-06-06', '920000032', 'estudante0032@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000032', 'Encarregado 0032', '920000032', NULL, '2026-06-06 14:34:39'),
(33, 41, 'STU000033', 'Estudante 0033 - Engenharia Inform??tica', 'M', '2005-06-06', '920000033', 'estudante0033@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000033', 'Encarregado 0033', '920000033', NULL, '2026-06-06 14:34:39'),
(34, 42, 'STU000034', 'Estudante 0034 - Engenharia Inform??tica', 'F', '2004-06-06', '920000034', 'estudante0034@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000034', 'Encarregado 0034', '920000034', NULL, '2026-06-06 14:34:39'),
(35, 43, 'STU000035', 'Estudante 0035 - Engenharia Inform??tica', 'M', '2003-06-06', '920000035', 'estudante0035@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000035', 'Encarregado 0035', '920000035', NULL, '2026-06-06 14:34:39'),
(36, 44, 'STU000036', 'Estudante 0036 - Engenharia Inform??tica', 'F', '2002-06-06', '920000036', 'estudante0036@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000036', 'Encarregado 0036', '920000036', NULL, '2026-06-06 14:34:39'),
(37, 45, 'STU000037', 'Estudante 0037 - Engenharia Inform??tica', 'M', '2001-06-06', '920000037', 'estudante0037@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000037', 'Encarregado 0037', '920000037', NULL, '2026-06-06 14:34:39'),
(38, 46, 'STU000038', 'Estudante 0038 - Engenharia Inform??tica', 'F', '2000-06-06', '920000038', 'estudante0038@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000038', 'Encarregado 0038', '920000038', NULL, '2026-06-06 14:34:39'),
(39, 47, 'STU000039', 'Estudante 0039 - Engenharia Inform??tica', 'M', '1999-06-06', '920000039', 'estudante0039@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000039', 'Encarregado 0039', '920000039', NULL, '2026-06-06 14:34:39'),
(40, 48, 'STU000040', 'Estudante 0040 - Engenharia Inform??tica', 'F', '2008-06-06', '920000040', 'estudante0040@mail.ojj.edu', 'Rua dos Estudantes, Bairro 01', 'Benguela', 'Angola', 'BI0000000040', 'Encarregado 0040', '920000040', NULL, '2026-06-06 14:34:39'),
(41, 49, 'STU000041', 'Estudante 0041 - Ci??ncia da Computa????o', 'M', '2007-06-06', '920000041', 'estudante0041@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000041', 'Encarregado 0041', '920000041', NULL, '2026-06-06 14:34:39'),
(42, 50, 'STU000042', 'Estudante 0042 - Ci??ncia da Computa????o', 'F', '2006-06-06', '920000042', 'estudante0042@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000042', 'Encarregado 0042', '920000042', NULL, '2026-06-06 14:34:39'),
(43, 51, 'STU000043', 'Estudante 0043 - Ci??ncia da Computa????o', 'M', '2005-06-06', '920000043', 'estudante0043@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000043', 'Encarregado 0043', '920000043', NULL, '2026-06-06 14:34:39'),
(44, 52, 'STU000044', 'Estudante 0044 - Ci??ncia da Computa????o', 'F', '2004-06-06', '920000044', 'estudante0044@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000044', 'Encarregado 0044', '920000044', NULL, '2026-06-06 14:34:39'),
(45, 53, 'STU000045', 'Estudante 0045 - Ci??ncia da Computa????o', 'M', '2003-06-06', '920000045', 'estudante0045@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000045', 'Encarregado 0045', '920000045', NULL, '2026-06-06 14:34:39'),
(46, 54, 'STU000046', 'Estudante 0046 - Ci??ncia da Computa????o', 'F', '2002-06-06', '920000046', 'estudante0046@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000046', 'Encarregado 0046', '920000046', NULL, '2026-06-06 14:34:39'),
(47, 55, 'STU000047', 'Estudante 0047 - Ci??ncia da Computa????o', 'M', '2001-06-06', '920000047', 'estudante0047@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000047', 'Encarregado 0047', '920000047', NULL, '2026-06-06 14:34:39'),
(48, 56, 'STU000048', 'Estudante 0048 - Ci??ncia da Computa????o', 'F', '2000-06-06', '920000048', 'estudante0048@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000048', 'Encarregado 0048', '920000048', NULL, '2026-06-06 14:34:39'),
(49, 57, 'STU000049', 'Estudante 0049 - Ci??ncia da Computa????o', 'M', '1999-06-06', '920000049', 'estudante0049@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000049', 'Encarregado 0049', '920000049', NULL, '2026-06-06 14:34:39'),
(50, 58, 'STU000050', 'Estudante 0050 - Ci??ncia da Computa????o', 'F', '2008-06-06', '920000050', 'estudante0050@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000050', 'Encarregado 0050', '920000050', NULL, '2026-06-06 14:34:39'),
(51, 59, 'STU000051', 'Estudante 0051 - Ci??ncia da Computa????o', 'M', '2007-06-06', '920000051', 'estudante0051@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000051', 'Encarregado 0051', '920000051', NULL, '2026-06-06 14:34:39'),
(52, 60, 'STU000052', 'Estudante 0052 - Ci??ncia da Computa????o', 'F', '2006-06-06', '920000052', 'estudante0052@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000052', 'Encarregado 0052', '920000052', NULL, '2026-06-06 14:34:39'),
(53, 61, 'STU000053', 'Estudante 0053 - Ci??ncia da Computa????o', 'M', '2005-06-06', '920000053', 'estudante0053@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000053', 'Encarregado 0053', '920000053', NULL, '2026-06-06 14:34:39'),
(54, 62, 'STU000054', 'Estudante 0054 - Ci??ncia da Computa????o', 'F', '2004-06-06', '920000054', 'estudante0054@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000054', 'Encarregado 0054', '920000054', NULL, '2026-06-06 14:34:39'),
(55, 63, 'STU000055', 'Estudante 0055 - Ci??ncia da Computa????o', 'M', '2003-06-06', '920000055', 'estudante0055@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000055', 'Encarregado 0055', '920000055', NULL, '2026-06-06 14:34:39'),
(56, 64, 'STU000056', 'Estudante 0056 - Ci??ncia da Computa????o', 'F', '2002-06-06', '920000056', 'estudante0056@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000056', 'Encarregado 0056', '920000056', NULL, '2026-06-06 14:34:39'),
(57, 65, 'STU000057', 'Estudante 0057 - Ci??ncia da Computa????o', 'M', '2001-06-06', '920000057', 'estudante0057@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000057', 'Encarregado 0057', '920000057', NULL, '2026-06-06 14:34:39'),
(58, 66, 'STU000058', 'Estudante 0058 - Ci??ncia da Computa????o', 'F', '2000-06-06', '920000058', 'estudante0058@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000058', 'Encarregado 0058', '920000058', NULL, '2026-06-06 14:34:39'),
(59, 67, 'STU000059', 'Estudante 0059 - Ci??ncia da Computa????o', 'M', '1999-06-06', '920000059', 'estudante0059@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000059', 'Encarregado 0059', '920000059', NULL, '2026-06-06 14:34:39'),
(60, 68, 'STU000060', 'Estudante 0060 - Ci??ncia da Computa????o', 'F', '2008-06-06', '920000060', 'estudante0060@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000060', 'Encarregado 0060', '920000060', NULL, '2026-06-06 14:34:39'),
(61, 69, 'STU000061', 'Estudante 0061 - Ci??ncia da Computa????o', 'M', '2007-06-06', '920000061', 'estudante0061@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000061', 'Encarregado 0061', '920000061', NULL, '2026-06-06 14:34:39'),
(62, 70, 'STU000062', 'Estudante 0062 - Ci??ncia da Computa????o', 'F', '2006-06-06', '920000062', 'estudante0062@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000062', 'Encarregado 0062', '920000062', NULL, '2026-06-06 14:34:39'),
(63, 71, 'STU000063', 'Estudante 0063 - Ci??ncia da Computa????o', 'M', '2005-06-06', '920000063', 'estudante0063@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000063', 'Encarregado 0063', '920000063', NULL, '2026-06-06 14:34:39'),
(64, 72, 'STU000064', 'Estudante 0064 - Ci??ncia da Computa????o', 'F', '2004-06-06', '920000064', 'estudante0064@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000064', 'Encarregado 0064', '920000064', NULL, '2026-06-06 14:34:39'),
(65, 73, 'STU000065', 'Estudante 0065 - Ci??ncia da Computa????o', 'M', '2003-06-06', '920000065', 'estudante0065@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000065', 'Encarregado 0065', '920000065', NULL, '2026-06-06 14:34:39'),
(66, 74, 'STU000066', 'Estudante 0066 - Ci??ncia da Computa????o', 'F', '2002-06-06', '920000066', 'estudante0066@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000066', 'Encarregado 0066', '920000066', NULL, '2026-06-06 14:34:39'),
(67, 75, 'STU000067', 'Estudante 0067 - Ci??ncia da Computa????o', 'M', '2001-06-06', '920000067', 'estudante0067@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000067', 'Encarregado 0067', '920000067', NULL, '2026-06-06 14:34:39'),
(68, 76, 'STU000068', 'Estudante 0068 - Ci??ncia da Computa????o', 'F', '2000-06-06', '920000068', 'estudante0068@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000068', 'Encarregado 0068', '920000068', NULL, '2026-06-06 14:34:39'),
(69, 77, 'STU000069', 'Estudante 0069 - Ci??ncia da Computa????o', 'M', '1999-06-06', '920000069', 'estudante0069@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000069', 'Encarregado 0069', '920000069', NULL, '2026-06-06 14:34:39'),
(70, 78, 'STU000070', 'Estudante 0070 - Ci??ncia da Computa????o', 'F', '2008-06-06', '920000070', 'estudante0070@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000070', 'Encarregado 0070', '920000070', NULL, '2026-06-06 14:34:39'),
(71, 79, 'STU000071', 'Estudante 0071 - Ci??ncia da Computa????o', 'M', '2007-06-06', '920000071', 'estudante0071@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000071', 'Encarregado 0071', '920000071', NULL, '2026-06-06 14:34:39'),
(72, 80, 'STU000072', 'Estudante 0072 - Ci??ncia da Computa????o', 'F', '2006-06-06', '920000072', 'estudante0072@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000072', 'Encarregado 0072', '920000072', NULL, '2026-06-06 14:34:39'),
(73, 81, 'STU000073', 'Estudante 0073 - Ci??ncia da Computa????o', 'M', '2005-06-06', '920000073', 'estudante0073@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000073', 'Encarregado 0073', '920000073', NULL, '2026-06-06 14:34:39'),
(74, 82, 'STU000074', 'Estudante 0074 - Ci??ncia da Computa????o', 'F', '2004-06-06', '920000074', 'estudante0074@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000074', 'Encarregado 0074', '920000074', NULL, '2026-06-06 14:34:39'),
(75, 83, 'STU000075', 'Estudante 0075 - Ci??ncia da Computa????o', 'M', '2003-06-06', '920000075', 'estudante0075@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000075', 'Encarregado 0075', '920000075', NULL, '2026-06-06 14:34:39'),
(76, 84, 'STU000076', 'Estudante 0076 - Ci??ncia da Computa????o', 'F', '2002-06-06', '920000076', 'estudante0076@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000076', 'Encarregado 0076', '920000076', NULL, '2026-06-06 14:34:39'),
(77, 85, 'STU000077', 'Estudante 0077 - Ci??ncia da Computa????o', 'M', '2001-06-06', '920000077', 'estudante0077@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000077', 'Encarregado 0077', '920000077', NULL, '2026-06-06 14:34:39'),
(78, 86, 'STU000078', 'Estudante 0078 - Ci??ncia da Computa????o', 'F', '2000-06-06', '920000078', 'estudante0078@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000078', 'Encarregado 0078', '920000078', NULL, '2026-06-06 14:34:39'),
(79, 87, 'STU000079', 'Estudante 0079 - Ci??ncia da Computa????o', 'M', '1999-06-06', '920000079', 'estudante0079@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000079', 'Encarregado 0079', '920000079', NULL, '2026-06-06 14:34:39'),
(80, 88, 'STU000080', 'Estudante 0080 - Ci??ncia da Computa????o', 'F', '2008-06-06', '920000080', 'estudante0080@mail.ojj.edu', 'Rua dos Estudantes, Bairro 02', 'Benguela', 'Angola', 'BI0000000080', 'Encarregado 0080', '920000080', NULL, '2026-06-06 14:34:39'),
(81, 89, 'STU000081', 'Estudante 0081 - Engenharia Civil', 'M', '2007-06-06', '920000081', 'estudante0081@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000081', 'Encarregado 0081', '920000081', NULL, '2026-06-06 14:34:39'),
(82, 90, 'STU000082', 'Estudante 0082 - Engenharia Civil', 'F', '2006-06-06', '920000082', 'estudante0082@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000082', 'Encarregado 0082', '920000082', NULL, '2026-06-06 14:34:39'),
(83, 91, 'STU000083', 'Estudante 0083 - Engenharia Civil', 'M', '2005-06-06', '920000083', 'estudante0083@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000083', 'Encarregado 0083', '920000083', NULL, '2026-06-06 14:34:39'),
(84, 92, 'STU000084', 'Estudante 0084 - Engenharia Civil', 'F', '2004-06-06', '920000084', 'estudante0084@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000084', 'Encarregado 0084', '920000084', NULL, '2026-06-06 14:34:39'),
(85, 93, 'STU000085', 'Estudante 0085 - Engenharia Civil', 'M', '2003-06-06', '920000085', 'estudante0085@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000085', 'Encarregado 0085', '920000085', NULL, '2026-06-06 14:34:39'),
(86, 94, 'STU000086', 'Estudante 0086 - Engenharia Civil', 'F', '2002-06-06', '920000086', 'estudante0086@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000086', 'Encarregado 0086', '920000086', NULL, '2026-06-06 14:34:39'),
(87, 95, 'STU000087', 'Estudante 0087 - Engenharia Civil', 'M', '2001-06-06', '920000087', 'estudante0087@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000087', 'Encarregado 0087', '920000087', NULL, '2026-06-06 14:34:39'),
(88, 96, 'STU000088', 'Estudante 0088 - Engenharia Civil', 'F', '2000-06-06', '920000088', 'estudante0088@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000088', 'Encarregado 0088', '920000088', NULL, '2026-06-06 14:34:39'),
(89, 97, 'STU000089', 'Estudante 0089 - Engenharia Civil', 'M', '1999-06-06', '920000089', 'estudante0089@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000089', 'Encarregado 0089', '920000089', NULL, '2026-06-06 14:34:39'),
(90, 98, 'STU000090', 'Estudante 0090 - Engenharia Civil', 'F', '2008-06-06', '920000090', 'estudante0090@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000090', 'Encarregado 0090', '920000090', NULL, '2026-06-06 14:34:39'),
(91, 99, 'STU000091', 'Estudante 0091 - Engenharia Civil', 'M', '2007-06-06', '920000091', 'estudante0091@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000091', 'Encarregado 0091', '920000091', NULL, '2026-06-06 14:34:39'),
(92, 100, 'STU000092', 'Estudante 0092 - Engenharia Civil', 'F', '2006-06-06', '920000092', 'estudante0092@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000092', 'Encarregado 0092', '920000092', NULL, '2026-06-06 14:34:39'),
(93, 101, 'STU000093', 'Estudante 0093 - Engenharia Civil', 'M', '2005-06-06', '920000093', 'estudante0093@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000093', 'Encarregado 0093', '920000093', NULL, '2026-06-06 14:34:39'),
(94, 102, 'STU000094', 'Estudante 0094 - Engenharia Civil', 'F', '2004-06-06', '920000094', 'estudante0094@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000094', 'Encarregado 0094', '920000094', NULL, '2026-06-06 14:34:39'),
(95, 103, 'STU000095', 'Estudante 0095 - Engenharia Civil', 'M', '2003-06-06', '920000095', 'estudante0095@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000095', 'Encarregado 0095', '920000095', NULL, '2026-06-06 14:34:39'),
(96, 104, 'STU000096', 'Estudante 0096 - Engenharia Civil', 'F', '2002-06-06', '920000096', 'estudante0096@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000096', 'Encarregado 0096', '920000096', NULL, '2026-06-06 14:34:39'),
(97, 105, 'STU000097', 'Estudante 0097 - Engenharia Civil', 'M', '2001-06-06', '920000097', 'estudante0097@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000097', 'Encarregado 0097', '920000097', NULL, '2026-06-06 14:34:39'),
(98, 106, 'STU000098', 'Estudante 0098 - Engenharia Civil', 'F', '2000-06-06', '920000098', 'estudante0098@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000098', 'Encarregado 0098', '920000098', NULL, '2026-06-06 14:34:39'),
(99, 107, 'STU000099', 'Estudante 0099 - Engenharia Civil', 'M', '1999-06-06', '920000099', 'estudante0099@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000099', 'Encarregado 0099', '920000099', NULL, '2026-06-06 14:34:39'),
(100, 108, 'STU000100', 'Estudante 0100 - Engenharia Civil', 'F', '2008-06-06', '920000100', 'estudante0100@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000100', 'Encarregado 0100', '920000100', NULL, '2026-06-06 14:34:39'),
(101, 109, 'STU000101', 'Estudante 0101 - Engenharia Civil', 'M', '2007-06-06', '920000101', 'estudante0101@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000101', 'Encarregado 0101', '920000101', NULL, '2026-06-06 14:34:39'),
(102, 110, 'STU000102', 'Estudante 0102 - Engenharia Civil', 'F', '2006-06-06', '920000102', 'estudante0102@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000102', 'Encarregado 0102', '920000102', NULL, '2026-06-06 14:34:39'),
(103, 111, 'STU000103', 'Estudante 0103 - Engenharia Civil', 'M', '2005-06-06', '920000103', 'estudante0103@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000103', 'Encarregado 0103', '920000103', NULL, '2026-06-06 14:34:39'),
(104, 112, 'STU000104', 'Estudante 0104 - Engenharia Civil', 'F', '2004-06-06', '920000104', 'estudante0104@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000104', 'Encarregado 0104', '920000104', NULL, '2026-06-06 14:34:39'),
(105, 113, 'STU000105', 'Estudante 0105 - Engenharia Civil', 'M', '2003-06-06', '920000105', 'estudante0105@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000105', 'Encarregado 0105', '920000105', NULL, '2026-06-06 14:34:39'),
(106, 114, 'STU000106', 'Estudante 0106 - Engenharia Civil', 'F', '2002-06-06', '920000106', 'estudante0106@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000106', 'Encarregado 0106', '920000106', NULL, '2026-06-06 14:34:39'),
(107, 115, 'STU000107', 'Estudante 0107 - Engenharia Civil', 'M', '2001-06-06', '920000107', 'estudante0107@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000107', 'Encarregado 0107', '920000107', NULL, '2026-06-06 14:34:39'),
(108, 116, 'STU000108', 'Estudante 0108 - Engenharia Civil', 'F', '2000-06-06', '920000108', 'estudante0108@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000108', 'Encarregado 0108', '920000108', NULL, '2026-06-06 14:34:39'),
(109, 117, 'STU000109', 'Estudante 0109 - Engenharia Civil', 'M', '1999-06-06', '920000109', 'estudante0109@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000109', 'Encarregado 0109', '920000109', NULL, '2026-06-06 14:34:39'),
(110, 118, 'STU000110', 'Estudante 0110 - Engenharia Civil', 'F', '2008-06-06', '920000110', 'estudante0110@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000110', 'Encarregado 0110', '920000110', NULL, '2026-06-06 14:34:39'),
(111, 119, 'STU000111', 'Estudante 0111 - Engenharia Civil', 'M', '2007-06-06', '920000111', 'estudante0111@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000111', 'Encarregado 0111', '920000111', NULL, '2026-06-06 14:34:39'),
(112, 120, 'STU000112', 'Estudante 0112 - Engenharia Civil', 'F', '2006-06-06', '920000112', 'estudante0112@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000112', 'Encarregado 0112', '920000112', NULL, '2026-06-06 14:34:39'),
(113, 121, 'STU000113', 'Estudante 0113 - Engenharia Civil', 'M', '2005-06-06', '920000113', 'estudante0113@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000113', 'Encarregado 0113', '920000113', NULL, '2026-06-06 14:34:39'),
(114, 122, 'STU000114', 'Estudante 0114 - Engenharia Civil', 'F', '2004-06-06', '920000114', 'estudante0114@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000114', 'Encarregado 0114', '920000114', NULL, '2026-06-06 14:34:39'),
(115, 123, 'STU000115', 'Estudante 0115 - Engenharia Civil', 'M', '2003-06-06', '920000115', 'estudante0115@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000115', 'Encarregado 0115', '920000115', NULL, '2026-06-06 14:34:39'),
(116, 124, 'STU000116', 'Estudante 0116 - Engenharia Civil', 'F', '2002-06-06', '920000116', 'estudante0116@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000116', 'Encarregado 0116', '920000116', NULL, '2026-06-06 14:34:39'),
(117, 125, 'STU000117', 'Estudante 0117 - Engenharia Civil', 'M', '2001-06-06', '920000117', 'estudante0117@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000117', 'Encarregado 0117', '920000117', NULL, '2026-06-06 14:34:39'),
(118, 126, 'STU000118', 'Estudante 0118 - Engenharia Civil', 'F', '2000-06-06', '920000118', 'estudante0118@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000118', 'Encarregado 0118', '920000118', NULL, '2026-06-06 14:34:39'),
(119, 127, 'STU000119', 'Estudante 0119 - Engenharia Civil', 'M', '1999-06-06', '920000119', 'estudante0119@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000119', 'Encarregado 0119', '920000119', NULL, '2026-06-06 14:34:39'),
(120, 128, 'STU000120', 'Estudante 0120 - Engenharia Civil', 'F', '2008-06-06', '920000120', 'estudante0120@mail.ojj.edu', 'Rua dos Estudantes, Bairro 03', 'Luanda', 'Angola', 'BI0000000120', 'Encarregado 0120', '920000120', NULL, '2026-06-06 14:34:39'),
(121, 129, 'STU000121', 'Estudante 0121 - Engenharia Electrot??cnica', 'M', '2007-06-06', '920000121', 'estudante0121@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000121', 'Encarregado 0121', '920000121', NULL, '2026-06-06 14:34:39'),
(122, 130, 'STU000122', 'Estudante 0122 - Engenharia Electrot??cnica', 'F', '2006-06-06', '920000122', 'estudante0122@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000122', 'Encarregado 0122', '920000122', NULL, '2026-06-06 14:34:39'),
(123, 131, 'STU000123', 'Estudante 0123 - Engenharia Electrot??cnica', 'M', '2005-06-06', '920000123', 'estudante0123@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000123', 'Encarregado 0123', '920000123', NULL, '2026-06-06 14:34:39'),
(124, 132, 'STU000124', 'Estudante 0124 - Engenharia Electrot??cnica', 'F', '2004-06-06', '920000124', 'estudante0124@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000124', 'Encarregado 0124', '920000124', NULL, '2026-06-06 14:34:39'),
(125, 133, 'STU000125', 'Estudante 0125 - Engenharia Electrot??cnica', 'M', '2003-06-06', '920000125', 'estudante0125@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000125', 'Encarregado 0125', '920000125', NULL, '2026-06-06 14:34:39'),
(126, 134, 'STU000126', 'Estudante 0126 - Engenharia Electrot??cnica', 'F', '2002-06-06', '920000126', 'estudante0126@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000126', 'Encarregado 0126', '920000126', NULL, '2026-06-06 14:34:39'),
(127, 135, 'STU000127', 'Estudante 0127 - Engenharia Electrot??cnica', 'M', '2001-06-06', '920000127', 'estudante0127@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000127', 'Encarregado 0127', '920000127', NULL, '2026-06-06 14:34:39'),
(128, 136, 'STU000128', 'Estudante 0128 - Engenharia Electrot??cnica', 'F', '2000-06-06', '920000128', 'estudante0128@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000128', 'Encarregado 0128', '920000128', NULL, '2026-06-06 14:34:39'),
(129, 137, 'STU000129', 'Estudante 0129 - Engenharia Electrot??cnica', 'M', '1999-06-06', '920000129', 'estudante0129@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000129', 'Encarregado 0129', '920000129', NULL, '2026-06-06 14:34:39'),
(130, 138, 'STU000130', 'Estudante 0130 - Engenharia Electrot??cnica', 'F', '2008-06-06', '920000130', 'estudante0130@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000130', 'Encarregado 0130', '920000130', NULL, '2026-06-06 14:34:39'),
(131, 139, 'STU000131', 'Estudante 0131 - Engenharia Electrot??cnica', 'M', '2007-06-06', '920000131', 'estudante0131@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000131', 'Encarregado 0131', '920000131', NULL, '2026-06-06 14:34:39'),
(132, 140, 'STU000132', 'Estudante 0132 - Engenharia Electrot??cnica', 'F', '2006-06-06', '920000132', 'estudante0132@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000132', 'Encarregado 0132', '920000132', NULL, '2026-06-06 14:34:39'),
(133, 141, 'STU000133', 'Estudante 0133 - Engenharia Electrot??cnica', 'M', '2005-06-06', '920000133', 'estudante0133@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000133', 'Encarregado 0133', '920000133', NULL, '2026-06-06 14:34:39'),
(134, 142, 'STU000134', 'Estudante 0134 - Engenharia Electrot??cnica', 'F', '2004-06-06', '920000134', 'estudante0134@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000134', 'Encarregado 0134', '920000134', NULL, '2026-06-06 14:34:39'),
(135, 143, 'STU000135', 'Estudante 0135 - Engenharia Electrot??cnica', 'M', '2003-06-06', '920000135', 'estudante0135@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000135', 'Encarregado 0135', '920000135', NULL, '2026-06-06 14:34:39'),
(136, 144, 'STU000136', 'Estudante 0136 - Engenharia Electrot??cnica', 'F', '2002-06-06', '920000136', 'estudante0136@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000136', 'Encarregado 0136', '920000136', NULL, '2026-06-06 14:34:39'),
(137, 145, 'STU000137', 'Estudante 0137 - Engenharia Electrot??cnica', 'M', '2001-06-06', '920000137', 'estudante0137@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000137', 'Encarregado 0137', '920000137', NULL, '2026-06-06 14:34:39'),
(138, 146, 'STU000138', 'Estudante 0138 - Engenharia Electrot??cnica', 'F', '2000-06-06', '920000138', 'estudante0138@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000138', 'Encarregado 0138', '920000138', NULL, '2026-06-06 14:34:39'),
(139, 147, 'STU000139', 'Estudante 0139 - Engenharia Electrot??cnica', 'M', '1999-06-06', '920000139', 'estudante0139@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000139', 'Encarregado 0139', '920000139', NULL, '2026-06-06 14:34:39'),
(140, 148, 'STU000140', 'Estudante 0140 - Engenharia Electrot??cnica', 'F', '2008-06-06', '920000140', 'estudante0140@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000140', 'Encarregado 0140', '920000140', NULL, '2026-06-06 14:34:39'),
(141, 149, 'STU000141', 'Estudante 0141 - Engenharia Electrot??cnica', 'M', '2007-06-06', '920000141', 'estudante0141@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000141', 'Encarregado 0141', '920000141', NULL, '2026-06-06 14:34:39'),
(142, 150, 'STU000142', 'Estudante 0142 - Engenharia Electrot??cnica', 'F', '2006-06-06', '920000142', 'estudante0142@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000142', 'Encarregado 0142', '920000142', NULL, '2026-06-06 14:34:39'),
(143, 151, 'STU000143', 'Estudante 0143 - Engenharia Electrot??cnica', 'M', '2005-06-06', '920000143', 'estudante0143@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000143', 'Encarregado 0143', '920000143', NULL, '2026-06-06 14:34:39'),
(144, 152, 'STU000144', 'Estudante 0144 - Engenharia Electrot??cnica', 'F', '2004-06-06', '920000144', 'estudante0144@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000144', 'Encarregado 0144', '920000144', NULL, '2026-06-06 14:34:39'),
(145, 153, 'STU000145', 'Estudante 0145 - Engenharia Electrot??cnica', 'M', '2003-06-06', '920000145', 'estudante0145@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000145', 'Encarregado 0145', '920000145', NULL, '2026-06-06 14:34:39'),
(146, 154, 'STU000146', 'Estudante 0146 - Engenharia Electrot??cnica', 'F', '2002-06-06', '920000146', 'estudante0146@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000146', 'Encarregado 0146', '920000146', NULL, '2026-06-06 14:34:39'),
(147, 155, 'STU000147', 'Estudante 0147 - Engenharia Electrot??cnica', 'M', '2001-06-06', '920000147', 'estudante0147@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000147', 'Encarregado 0147', '920000147', NULL, '2026-06-06 14:34:39'),
(148, 156, 'STU000148', 'Estudante 0148 - Engenharia Electrot??cnica', 'F', '2000-06-06', '920000148', 'estudante0148@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000148', 'Encarregado 0148', '920000148', NULL, '2026-06-06 14:34:39'),
(149, 157, 'STU000149', 'Estudante 0149 - Engenharia Electrot??cnica', 'M', '1999-06-06', '920000149', 'estudante0149@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000149', 'Encarregado 0149', '920000149', NULL, '2026-06-06 14:34:39'),
(150, 158, 'STU000150', 'Estudante 0150 - Engenharia Electrot??cnica', 'F', '2008-06-06', '920000150', 'estudante0150@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000150', 'Encarregado 0150', '920000150', NULL, '2026-06-06 14:34:39'),
(151, 159, 'STU000151', 'Estudante 0151 - Engenharia Electrot??cnica', 'M', '2007-06-06', '920000151', 'estudante0151@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000151', 'Encarregado 0151', '920000151', NULL, '2026-06-06 14:34:39'),
(152, 160, 'STU000152', 'Estudante 0152 - Engenharia Electrot??cnica', 'F', '2006-06-06', '920000152', 'estudante0152@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000152', 'Encarregado 0152', '920000152', NULL, '2026-06-06 14:34:39'),
(153, 161, 'STU000153', 'Estudante 0153 - Engenharia Electrot??cnica', 'M', '2005-06-06', '920000153', 'estudante0153@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000153', 'Encarregado 0153', '920000153', NULL, '2026-06-06 14:34:39'),
(154, 162, 'STU000154', 'Estudante 0154 - Engenharia Electrot??cnica', 'F', '2004-06-06', '920000154', 'estudante0154@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000154', 'Encarregado 0154', '920000154', NULL, '2026-06-06 14:34:39'),
(155, 163, 'STU000155', 'Estudante 0155 - Engenharia Electrot??cnica', 'M', '2003-06-06', '920000155', 'estudante0155@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000155', 'Encarregado 0155', '920000155', NULL, '2026-06-06 14:34:39'),
(156, 164, 'STU000156', 'Estudante 0156 - Engenharia Electrot??cnica', 'F', '2002-06-06', '920000156', 'estudante0156@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000156', 'Encarregado 0156', '920000156', NULL, '2026-06-06 14:34:39'),
(157, 165, 'STU000157', 'Estudante 0157 - Engenharia Electrot??cnica', 'M', '2001-06-06', '920000157', 'estudante0157@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000157', 'Encarregado 0157', '920000157', NULL, '2026-06-06 14:34:39'),
(158, 166, 'STU000158', 'Estudante 0158 - Engenharia Electrot??cnica', 'F', '2000-06-06', '920000158', 'estudante0158@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000158', 'Encarregado 0158', '920000158', NULL, '2026-06-06 14:34:39'),
(159, 167, 'STU000159', 'Estudante 0159 - Engenharia Electrot??cnica', 'M', '1999-06-06', '920000159', 'estudante0159@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000159', 'Encarregado 0159', '920000159', NULL, '2026-06-06 14:34:39'),
(160, 168, 'STU000160', 'Estudante 0160 - Engenharia Electrot??cnica', 'F', '2008-06-06', '920000160', 'estudante0160@mail.ojj.edu', 'Rua dos Estudantes, Bairro 04', 'Luanda', 'Angola', 'BI0000000160', 'Encarregado 0160', '920000160', NULL, '2026-06-06 14:34:39'),
(161, 169, 'STU000161', 'Estudante 0161 - Economia', 'M', '2007-06-06', '920000161', 'estudante0161@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000161', 'Encarregado 0161', '920000161', NULL, '2026-06-06 14:34:39'),
(162, 170, 'STU000162', 'Estudante 0162 - Economia', 'F', '2006-06-06', '920000162', 'estudante0162@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000162', 'Encarregado 0162', '920000162', NULL, '2026-06-06 14:34:39'),
(163, 171, 'STU000163', 'Estudante 0163 - Economia', 'M', '2005-06-06', '920000163', 'estudante0163@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000163', 'Encarregado 0163', '920000163', NULL, '2026-06-06 14:34:39'),
(164, 172, 'STU000164', 'Estudante 0164 - Economia', 'F', '2004-06-06', '920000164', 'estudante0164@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000164', 'Encarregado 0164', '920000164', NULL, '2026-06-06 14:34:39'),
(165, 173, 'STU000165', 'Estudante 0165 - Economia', 'M', '2003-06-06', '920000165', 'estudante0165@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000165', 'Encarregado 0165', '920000165', NULL, '2026-06-06 14:34:39'),
(166, 174, 'STU000166', 'Estudante 0166 - Economia', 'F', '2002-06-06', '920000166', 'estudante0166@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000166', 'Encarregado 0166', '920000166', NULL, '2026-06-06 14:34:39'),
(167, 175, 'STU000167', 'Estudante 0167 - Economia', 'M', '2001-06-06', '920000167', 'estudante0167@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000167', 'Encarregado 0167', '920000167', NULL, '2026-06-06 14:34:39'),
(168, 176, 'STU000168', 'Estudante 0168 - Economia', 'F', '2000-06-06', '920000168', 'estudante0168@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000168', 'Encarregado 0168', '920000168', NULL, '2026-06-06 14:34:39'),
(169, 177, 'STU000169', 'Estudante 0169 - Economia', 'M', '1999-06-06', '920000169', 'estudante0169@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000169', 'Encarregado 0169', '920000169', NULL, '2026-06-06 14:34:39'),
(170, 178, 'STU000170', 'Estudante 0170 - Economia', 'F', '2008-06-06', '920000170', 'estudante0170@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000170', 'Encarregado 0170', '920000170', NULL, '2026-06-06 14:34:39'),
(171, 179, 'STU000171', 'Estudante 0171 - Economia', 'M', '2007-06-06', '920000171', 'estudante0171@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000171', 'Encarregado 0171', '920000171', NULL, '2026-06-06 14:34:39'),
(172, 180, 'STU000172', 'Estudante 0172 - Economia', 'F', '2006-06-06', '920000172', 'estudante0172@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000172', 'Encarregado 0172', '920000172', NULL, '2026-06-06 14:34:39'),
(173, 181, 'STU000173', 'Estudante 0173 - Economia', 'M', '2005-06-06', '920000173', 'estudante0173@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000173', 'Encarregado 0173', '920000173', NULL, '2026-06-06 14:34:39'),
(174, 182, 'STU000174', 'Estudante 0174 - Economia', 'F', '2004-06-06', '920000174', 'estudante0174@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000174', 'Encarregado 0174', '920000174', NULL, '2026-06-06 14:34:39'),
(175, 183, 'STU000175', 'Estudante 0175 - Economia', 'M', '2003-06-06', '920000175', 'estudante0175@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000175', 'Encarregado 0175', '920000175', NULL, '2026-06-06 14:34:39'),
(176, 184, 'STU000176', 'Estudante 0176 - Economia', 'F', '2002-06-06', '920000176', 'estudante0176@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000176', 'Encarregado 0176', '920000176', NULL, '2026-06-06 14:34:39'),
(177, 185, 'STU000177', 'Estudante 0177 - Economia', 'M', '2001-06-06', '920000177', 'estudante0177@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000177', 'Encarregado 0177', '920000177', NULL, '2026-06-06 14:34:39'),
(178, 186, 'STU000178', 'Estudante 0178 - Economia', 'F', '2000-06-06', '920000178', 'estudante0178@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000178', 'Encarregado 0178', '920000178', NULL, '2026-06-06 14:34:39'),
(179, 187, 'STU000179', 'Estudante 0179 - Economia', 'M', '1999-06-06', '920000179', 'estudante0179@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000179', 'Encarregado 0179', '920000179', NULL, '2026-06-06 14:34:39'),
(180, 188, 'STU000180', 'Estudante 0180 - Economia', 'F', '2008-06-06', '920000180', 'estudante0180@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000180', 'Encarregado 0180', '920000180', NULL, '2026-06-06 14:34:39'),
(181, 189, 'STU000181', 'Estudante 0181 - Economia', 'M', '2007-06-06', '920000181', 'estudante0181@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000181', 'Encarregado 0181', '920000181', NULL, '2026-06-06 14:34:39'),
(182, 190, 'STU000182', 'Estudante 0182 - Economia', 'F', '2006-06-06', '920000182', 'estudante0182@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000182', 'Encarregado 0182', '920000182', NULL, '2026-06-06 14:34:39'),
(183, 191, 'STU000183', 'Estudante 0183 - Economia', 'M', '2005-06-06', '920000183', 'estudante0183@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000183', 'Encarregado 0183', '920000183', NULL, '2026-06-06 14:34:39'),
(184, 192, 'STU000184', 'Estudante 0184 - Economia', 'F', '2004-06-06', '920000184', 'estudante0184@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000184', 'Encarregado 0184', '920000184', NULL, '2026-06-06 14:34:39'),
(185, 193, 'STU000185', 'Estudante 0185 - Economia', 'M', '2003-06-06', '920000185', 'estudante0185@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000185', 'Encarregado 0185', '920000185', NULL, '2026-06-06 14:34:39'),
(186, 194, 'STU000186', 'Estudante 0186 - Economia', 'F', '2002-06-06', '920000186', 'estudante0186@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000186', 'Encarregado 0186', '920000186', NULL, '2026-06-06 14:34:39'),
(187, 195, 'STU000187', 'Estudante 0187 - Economia', 'M', '2001-06-06', '920000187', 'estudante0187@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000187', 'Encarregado 0187', '920000187', NULL, '2026-06-06 14:34:39'),
(188, 196, 'STU000188', 'Estudante 0188 - Economia', 'F', '2000-06-06', '920000188', 'estudante0188@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000188', 'Encarregado 0188', '920000188', NULL, '2026-06-06 14:34:39'),
(189, 197, 'STU000189', 'Estudante 0189 - Economia', 'M', '1999-06-06', '920000189', 'estudante0189@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000189', 'Encarregado 0189', '920000189', NULL, '2026-06-06 14:34:39'),
(190, 198, 'STU000190', 'Estudante 0190 - Economia', 'F', '2008-06-06', '920000190', 'estudante0190@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000190', 'Encarregado 0190', '920000190', NULL, '2026-06-06 14:34:39'),
(191, 199, 'STU000191', 'Estudante 0191 - Economia', 'M', '2007-06-06', '920000191', 'estudante0191@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000191', 'Encarregado 0191', '920000191', NULL, '2026-06-06 14:34:39'),
(192, 200, 'STU000192', 'Estudante 0192 - Economia', 'F', '2006-06-06', '920000192', 'estudante0192@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000192', 'Encarregado 0192', '920000192', NULL, '2026-06-06 14:34:39'),
(193, 201, 'STU000193', 'Estudante 0193 - Economia', 'M', '2005-06-06', '920000193', 'estudante0193@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000193', 'Encarregado 0193', '920000193', NULL, '2026-06-06 14:34:39'),
(194, 202, 'STU000194', 'Estudante 0194 - Economia', 'F', '2004-06-06', '920000194', 'estudante0194@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000194', 'Encarregado 0194', '920000194', NULL, '2026-06-06 14:34:39');
INSERT INTO `estudante` (`id_estudante`, `id_utilizador`, `numero_estudante`, `nome_completo`, `sexo`, `data_nascimento`, `telefone`, `email_pessoal`, `morada`, `provincia`, `nacionalidade`, `numero_bi`, `nome_encarregado`, `telefone_encarregado`, `foto`, `data_inscricao`) VALUES
(195, 203, 'STU000195', 'Estudante 0195 - Economia', 'M', '2003-06-06', '920000195', 'estudante0195@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000195', 'Encarregado 0195', '920000195', NULL, '2026-06-06 14:34:39'),
(196, 204, 'STU000196', 'Estudante 0196 - Economia', 'F', '2002-06-06', '920000196', 'estudante0196@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000196', 'Encarregado 0196', '920000196', NULL, '2026-06-06 14:34:39'),
(197, 205, 'STU000197', 'Estudante 0197 - Economia', 'M', '2001-06-06', '920000197', 'estudante0197@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000197', 'Encarregado 0197', '920000197', NULL, '2026-06-06 14:34:39'),
(198, 206, 'STU000198', 'Estudante 0198 - Economia', 'F', '2000-06-06', '920000198', 'estudante0198@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000198', 'Encarregado 0198', '920000198', NULL, '2026-06-06 14:34:39'),
(199, 207, 'STU000199', 'Estudante 0199 - Economia', 'M', '1999-06-06', '920000199', 'estudante0199@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000199', 'Encarregado 0199', '920000199', NULL, '2026-06-06 14:34:39'),
(200, 208, 'STU000200', 'Estudante 0200 - Economia', 'F', '2008-06-06', '920000200', 'estudante0200@mail.ojj.edu', 'Rua dos Estudantes, Bairro 05', 'Huambo', 'Angola', 'BI0000000200', 'Encarregado 0200', '920000200', NULL, '2026-06-06 14:34:39'),
(201, 209, 'STU000201', 'Estudante 0201 - Gest??o de Empresas', 'M', '2007-06-06', '920000201', 'estudante0201@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000201', 'Encarregado 0201', '920000201', NULL, '2026-06-06 14:34:39'),
(202, 210, 'STU000202', 'Estudante 0202 - Gest??o de Empresas', 'F', '2006-06-06', '920000202', 'estudante0202@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000202', 'Encarregado 0202', '920000202', NULL, '2026-06-06 14:34:39'),
(203, 211, 'STU000203', 'Estudante 0203 - Gest??o de Empresas', 'M', '2005-06-06', '920000203', 'estudante0203@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000203', 'Encarregado 0203', '920000203', NULL, '2026-06-06 14:34:39'),
(204, 212, 'STU000204', 'Estudante 0204 - Gest??o de Empresas', 'F', '2004-06-06', '920000204', 'estudante0204@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000204', 'Encarregado 0204', '920000204', NULL, '2026-06-06 14:34:39'),
(205, 213, 'STU000205', 'Estudante 0205 - Gest??o de Empresas', 'M', '2003-06-06', '920000205', 'estudante0205@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000205', 'Encarregado 0205', '920000205', NULL, '2026-06-06 14:34:39'),
(206, 214, 'STU000206', 'Estudante 0206 - Gest??o de Empresas', 'F', '2002-06-06', '920000206', 'estudante0206@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000206', 'Encarregado 0206', '920000206', NULL, '2026-06-06 14:34:39'),
(207, 215, 'STU000207', 'Estudante 0207 - Gest??o de Empresas', 'M', '2001-06-06', '920000207', 'estudante0207@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000207', 'Encarregado 0207', '920000207', NULL, '2026-06-06 14:34:39'),
(208, 216, 'STU000208', 'Estudante 0208 - Gest??o de Empresas', 'F', '2000-06-06', '920000208', 'estudante0208@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000208', 'Encarregado 0208', '920000208', NULL, '2026-06-06 14:34:39'),
(209, 217, 'STU000209', 'Estudante 0209 - Gest??o de Empresas', 'M', '1999-06-06', '920000209', 'estudante0209@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000209', 'Encarregado 0209', '920000209', NULL, '2026-06-06 14:34:39'),
(210, 218, 'STU000210', 'Estudante 0210 - Gest??o de Empresas', 'F', '2008-06-06', '920000210', 'estudante0210@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000210', 'Encarregado 0210', '920000210', NULL, '2026-06-06 14:34:39'),
(211, 219, 'STU000211', 'Estudante 0211 - Gest??o de Empresas', 'M', '2007-06-06', '920000211', 'estudante0211@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000211', 'Encarregado 0211', '920000211', NULL, '2026-06-06 14:34:39'),
(212, 220, 'STU000212', 'Estudante 0212 - Gest??o de Empresas', 'F', '2006-06-06', '920000212', 'estudante0212@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000212', 'Encarregado 0212', '920000212', NULL, '2026-06-06 14:34:39'),
(213, 221, 'STU000213', 'Estudante 0213 - Gest??o de Empresas', 'M', '2005-06-06', '920000213', 'estudante0213@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000213', 'Encarregado 0213', '920000213', NULL, '2026-06-06 14:34:39'),
(214, 222, 'STU000214', 'Estudante 0214 - Gest??o de Empresas', 'F', '2004-06-06', '920000214', 'estudante0214@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000214', 'Encarregado 0214', '920000214', NULL, '2026-06-06 14:34:39'),
(215, 223, 'STU000215', 'Estudante 0215 - Gest??o de Empresas', 'M', '2003-06-06', '920000215', 'estudante0215@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000215', 'Encarregado 0215', '920000215', NULL, '2026-06-06 14:34:39'),
(216, 224, 'STU000216', 'Estudante 0216 - Gest??o de Empresas', 'F', '2002-06-06', '920000216', 'estudante0216@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000216', 'Encarregado 0216', '920000216', NULL, '2026-06-06 14:34:39'),
(217, 225, 'STU000217', 'Estudante 0217 - Gest??o de Empresas', 'M', '2001-06-06', '920000217', 'estudante0217@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000217', 'Encarregado 0217', '920000217', NULL, '2026-06-06 14:34:39'),
(218, 226, 'STU000218', 'Estudante 0218 - Gest??o de Empresas', 'F', '2000-06-06', '920000218', 'estudante0218@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000218', 'Encarregado 0218', '920000218', NULL, '2026-06-06 14:34:39'),
(219, 227, 'STU000219', 'Estudante 0219 - Gest??o de Empresas', 'M', '1999-06-06', '920000219', 'estudante0219@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000219', 'Encarregado 0219', '920000219', NULL, '2026-06-06 14:34:39'),
(220, 228, 'STU000220', 'Estudante 0220 - Gest??o de Empresas', 'F', '2008-06-06', '920000220', 'estudante0220@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000220', 'Encarregado 0220', '920000220', NULL, '2026-06-06 14:34:39'),
(221, 229, 'STU000221', 'Estudante 0221 - Gest??o de Empresas', 'M', '2007-06-06', '920000221', 'estudante0221@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000221', 'Encarregado 0221', '920000221', NULL, '2026-06-06 14:34:39'),
(222, 230, 'STU000222', 'Estudante 0222 - Gest??o de Empresas', 'F', '2006-06-06', '920000222', 'estudante0222@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000222', 'Encarregado 0222', '920000222', NULL, '2026-06-06 14:34:39'),
(223, 231, 'STU000223', 'Estudante 0223 - Gest??o de Empresas', 'M', '2005-06-06', '920000223', 'estudante0223@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000223', 'Encarregado 0223', '920000223', NULL, '2026-06-06 14:34:39'),
(224, 232, 'STU000224', 'Estudante 0224 - Gest??o de Empresas', 'F', '2004-06-06', '920000224', 'estudante0224@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000224', 'Encarregado 0224', '920000224', NULL, '2026-06-06 14:34:39'),
(225, 233, 'STU000225', 'Estudante 0225 - Gest??o de Empresas', 'M', '2003-06-06', '920000225', 'estudante0225@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000225', 'Encarregado 0225', '920000225', NULL, '2026-06-06 14:34:39'),
(226, 234, 'STU000226', 'Estudante 0226 - Gest??o de Empresas', 'F', '2002-06-06', '920000226', 'estudante0226@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000226', 'Encarregado 0226', '920000226', NULL, '2026-06-06 14:34:39'),
(227, 235, 'STU000227', 'Estudante 0227 - Gest??o de Empresas', 'M', '2001-06-06', '920000227', 'estudante0227@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000227', 'Encarregado 0227', '920000227', NULL, '2026-06-06 14:34:39'),
(228, 236, 'STU000228', 'Estudante 0228 - Gest??o de Empresas', 'F', '2000-06-06', '920000228', 'estudante0228@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000228', 'Encarregado 0228', '920000228', NULL, '2026-06-06 14:34:39'),
(229, 237, 'STU000229', 'Estudante 0229 - Gest??o de Empresas', 'M', '1999-06-06', '920000229', 'estudante0229@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000229', 'Encarregado 0229', '920000229', NULL, '2026-06-06 14:34:39'),
(230, 238, 'STU000230', 'Estudante 0230 - Gest??o de Empresas', 'F', '2008-06-06', '920000230', 'estudante0230@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000230', 'Encarregado 0230', '920000230', NULL, '2026-06-06 14:34:39'),
(231, 239, 'STU000231', 'Estudante 0231 - Gest??o de Empresas', 'M', '2007-06-06', '920000231', 'estudante0231@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000231', 'Encarregado 0231', '920000231', NULL, '2026-06-06 14:34:39'),
(232, 240, 'STU000232', 'Estudante 0232 - Gest??o de Empresas', 'F', '2006-06-06', '920000232', 'estudante0232@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000232', 'Encarregado 0232', '920000232', NULL, '2026-06-06 14:34:39'),
(233, 241, 'STU000233', 'Estudante 0233 - Gest??o de Empresas', 'M', '2005-06-06', '920000233', 'estudante0233@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000233', 'Encarregado 0233', '920000233', NULL, '2026-06-06 14:34:39'),
(234, 242, 'STU000234', 'Estudante 0234 - Gest??o de Empresas', 'F', '2004-06-06', '920000234', 'estudante0234@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000234', 'Encarregado 0234', '920000234', NULL, '2026-06-06 14:34:39'),
(235, 243, 'STU000235', 'Estudante 0235 - Gest??o de Empresas', 'M', '2003-06-06', '920000235', 'estudante0235@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000235', 'Encarregado 0235', '920000235', NULL, '2026-06-06 14:34:39'),
(236, 244, 'STU000236', 'Estudante 0236 - Gest??o de Empresas', 'F', '2002-06-06', '920000236', 'estudante0236@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000236', 'Encarregado 0236', '920000236', NULL, '2026-06-06 14:34:39'),
(237, 245, 'STU000237', 'Estudante 0237 - Gest??o de Empresas', 'M', '2001-06-06', '920000237', 'estudante0237@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000237', 'Encarregado 0237', '920000237', NULL, '2026-06-06 14:34:39'),
(238, 246, 'STU000238', 'Estudante 0238 - Gest??o de Empresas', 'F', '2000-06-06', '920000238', 'estudante0238@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000238', 'Encarregado 0238', '920000238', NULL, '2026-06-06 14:34:39'),
(239, 247, 'STU000239', 'Estudante 0239 - Gest??o de Empresas', 'M', '1999-06-06', '920000239', 'estudante0239@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000239', 'Encarregado 0239', '920000239', NULL, '2026-06-06 14:34:39'),
(240, 248, 'STU000240', 'Estudante 0240 - Gest??o de Empresas', 'F', '2008-06-06', '920000240', 'estudante0240@mail.ojj.edu', 'Rua dos Estudantes, Bairro 06', 'Cunene', 'Angola', 'BI0000000240', 'Encarregado 0240', '920000240', NULL, '2026-06-06 14:34:39'),
(241, 249, 'STU000241', 'Estudante 0241 - Sociologia', 'M', '2007-06-06', '920000241', 'estudante0241@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000241', 'Encarregado 0241', '920000241', NULL, '2026-06-06 14:34:39'),
(242, 250, 'STU000242', 'Estudante 0242 - Sociologia', 'F', '2006-06-06', '920000242', 'estudante0242@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000242', 'Encarregado 0242', '920000242', NULL, '2026-06-06 14:34:39'),
(243, 251, 'STU000243', 'Estudante 0243 - Sociologia', 'M', '2005-06-06', '920000243', 'estudante0243@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000243', 'Encarregado 0243', '920000243', NULL, '2026-06-06 14:34:39'),
(244, 252, 'STU000244', 'Estudante 0244 - Sociologia', 'F', '2004-06-06', '920000244', 'estudante0244@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000244', 'Encarregado 0244', '920000244', NULL, '2026-06-06 14:34:39'),
(245, 253, 'STU000245', 'Estudante 0245 - Sociologia', 'M', '2003-06-06', '920000245', 'estudante0245@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000245', 'Encarregado 0245', '920000245', NULL, '2026-06-06 14:34:39'),
(246, 254, 'STU000246', 'Estudante 0246 - Sociologia', 'F', '2002-06-06', '920000246', 'estudante0246@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000246', 'Encarregado 0246', '920000246', NULL, '2026-06-06 14:34:39'),
(247, 255, 'STU000247', 'Estudante 0247 - Sociologia', 'M', '2001-06-06', '920000247', 'estudante0247@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000247', 'Encarregado 0247', '920000247', NULL, '2026-06-06 14:34:39'),
(248, 256, 'STU000248', 'Estudante 0248 - Sociologia', 'F', '2000-06-06', '920000248', 'estudante0248@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000248', 'Encarregado 0248', '920000248', NULL, '2026-06-06 14:34:39'),
(249, 257, 'STU000249', 'Estudante 0249 - Sociologia', 'M', '1999-06-06', '920000249', 'estudante0249@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000249', 'Encarregado 0249', '920000249', NULL, '2026-06-06 14:34:39'),
(250, 258, 'STU000250', 'Estudante 0250 - Sociologia', 'F', '2008-06-06', '920000250', 'estudante0250@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000250', 'Encarregado 0250', '920000250', NULL, '2026-06-06 14:34:39'),
(251, 259, 'STU000251', 'Estudante 0251 - Sociologia', 'M', '2007-06-06', '920000251', 'estudante0251@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000251', 'Encarregado 0251', '920000251', NULL, '2026-06-06 14:34:39'),
(252, 260, 'STU000252', 'Estudante 0252 - Sociologia', 'F', '2006-06-06', '920000252', 'estudante0252@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000252', 'Encarregado 0252', '920000252', NULL, '2026-06-06 14:34:39'),
(253, 261, 'STU000253', 'Estudante 0253 - Sociologia', 'M', '2005-06-06', '920000253', 'estudante0253@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000253', 'Encarregado 0253', '920000253', NULL, '2026-06-06 14:34:39'),
(254, 262, 'STU000254', 'Estudante 0254 - Sociologia', 'F', '2004-06-06', '920000254', 'estudante0254@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000254', 'Encarregado 0254', '920000254', NULL, '2026-06-06 14:34:39'),
(255, 263, 'STU000255', 'Estudante 0255 - Sociologia', 'M', '2003-06-06', '920000255', 'estudante0255@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000255', 'Encarregado 0255', '920000255', NULL, '2026-06-06 14:34:39'),
(256, 264, 'STU000256', 'Estudante 0256 - Sociologia', 'F', '2002-06-06', '920000256', 'estudante0256@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000256', 'Encarregado 0256', '920000256', NULL, '2026-06-06 14:34:39'),
(257, 265, 'STU000257', 'Estudante 0257 - Sociologia', 'M', '2001-06-06', '920000257', 'estudante0257@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000257', 'Encarregado 0257', '920000257', NULL, '2026-06-06 14:34:39'),
(258, 266, 'STU000258', 'Estudante 0258 - Sociologia', 'F', '2000-06-06', '920000258', 'estudante0258@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000258', 'Encarregado 0258', '920000258', NULL, '2026-06-06 14:34:39'),
(259, 267, 'STU000259', 'Estudante 0259 - Sociologia', 'M', '1999-06-06', '920000259', 'estudante0259@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000259', 'Encarregado 0259', '920000259', NULL, '2026-06-06 14:34:39'),
(260, 268, 'STU000260', 'Estudante 0260 - Sociologia', 'F', '2008-06-06', '920000260', 'estudante0260@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000260', 'Encarregado 0260', '920000260', NULL, '2026-06-06 14:34:39'),
(261, 269, 'STU000261', 'Estudante 0261 - Sociologia', 'M', '2007-06-06', '920000261', 'estudante0261@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000261', 'Encarregado 0261', '920000261', NULL, '2026-06-06 14:34:39'),
(262, 270, 'STU000262', 'Estudante 0262 - Sociologia', 'F', '2006-06-06', '920000262', 'estudante0262@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000262', 'Encarregado 0262', '920000262', NULL, '2026-06-06 14:34:39'),
(263, 271, 'STU000263', 'Estudante 0263 - Sociologia', 'M', '2005-06-06', '920000263', 'estudante0263@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000263', 'Encarregado 0263', '920000263', NULL, '2026-06-06 14:34:39'),
(264, 272, 'STU000264', 'Estudante 0264 - Sociologia', 'F', '2004-06-06', '920000264', 'estudante0264@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000264', 'Encarregado 0264', '920000264', NULL, '2026-06-06 14:34:39'),
(265, 273, 'STU000265', 'Estudante 0265 - Sociologia', 'M', '2003-06-06', '920000265', 'estudante0265@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000265', 'Encarregado 0265', '920000265', NULL, '2026-06-06 14:34:39'),
(266, 274, 'STU000266', 'Estudante 0266 - Sociologia', 'F', '2002-06-06', '920000266', 'estudante0266@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000266', 'Encarregado 0266', '920000266', NULL, '2026-06-06 14:34:39'),
(267, 275, 'STU000267', 'Estudante 0267 - Sociologia', 'M', '2001-06-06', '920000267', 'estudante0267@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000267', 'Encarregado 0267', '920000267', NULL, '2026-06-06 14:34:39'),
(268, 276, 'STU000268', 'Estudante 0268 - Sociologia', 'F', '2000-06-06', '920000268', 'estudante0268@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000268', 'Encarregado 0268', '920000268', NULL, '2026-06-06 14:34:39'),
(269, 277, 'STU000269', 'Estudante 0269 - Sociologia', 'M', '1999-06-06', '920000269', 'estudante0269@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000269', 'Encarregado 0269', '920000269', NULL, '2026-06-06 14:34:39'),
(270, 278, 'STU000270', 'Estudante 0270 - Sociologia', 'F', '2008-06-06', '920000270', 'estudante0270@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000270', 'Encarregado 0270', '920000270', NULL, '2026-06-06 14:34:39'),
(271, 279, 'STU000271', 'Estudante 0271 - Sociologia', 'M', '2007-06-06', '920000271', 'estudante0271@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000271', 'Encarregado 0271', '920000271', NULL, '2026-06-06 14:34:39'),
(272, 280, 'STU000272', 'Estudante 0272 - Sociologia', 'F', '2006-06-06', '920000272', 'estudante0272@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000272', 'Encarregado 0272', '920000272', NULL, '2026-06-06 14:34:39'),
(273, 281, 'STU000273', 'Estudante 0273 - Sociologia', 'M', '2005-06-06', '920000273', 'estudante0273@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000273', 'Encarregado 0273', '920000273', NULL, '2026-06-06 14:34:39'),
(274, 282, 'STU000274', 'Estudante 0274 - Sociologia', 'F', '2004-06-06', '920000274', 'estudante0274@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000274', 'Encarregado 0274', '920000274', NULL, '2026-06-06 14:34:39'),
(275, 283, 'STU000275', 'Estudante 0275 - Sociologia', 'M', '2003-06-06', '920000275', 'estudante0275@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000275', 'Encarregado 0275', '920000275', NULL, '2026-06-06 14:34:39'),
(276, 284, 'STU000276', 'Estudante 0276 - Sociologia', 'F', '2002-06-06', '920000276', 'estudante0276@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000276', 'Encarregado 0276', '920000276', NULL, '2026-06-06 14:34:39'),
(277, 285, 'STU000277', 'Estudante 0277 - Sociologia', 'M', '2001-06-06', '920000277', 'estudante0277@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000277', 'Encarregado 0277', '920000277', NULL, '2026-06-06 14:34:39'),
(278, 286, 'STU000278', 'Estudante 0278 - Sociologia', 'F', '2000-06-06', '920000278', 'estudante0278@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000278', 'Encarregado 0278', '920000278', NULL, '2026-06-06 14:34:39'),
(279, 287, 'STU000279', 'Estudante 0279 - Sociologia', 'M', '1999-06-06', '920000279', 'estudante0279@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000279', 'Encarregado 0279', '920000279', NULL, '2026-06-06 14:34:39'),
(280, 288, 'STU000280', 'Estudante 0280 - Sociologia', 'F', '2008-06-06', '920000280', 'estudante0280@mail.ojj.edu', 'Rua dos Estudantes, Bairro 07', 'Lubango', 'Angola', 'BI0000000280', 'Encarregado 0280', '920000280', NULL, '2026-06-06 14:34:39'),
(281, 289, 'STU000281', 'Estudante 0281 - Direito', 'M', '2007-06-06', '920000281', 'estudante0281@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000281', 'Encarregado 0281', '920000281', NULL, '2026-06-06 14:34:39'),
(282, 290, 'STU000282', 'Estudante 0282 - Direito', 'F', '2006-06-06', '920000282', 'estudante0282@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000282', 'Encarregado 0282', '920000282', NULL, '2026-06-06 14:34:39'),
(283, 291, 'STU000283', 'Estudante 0283 - Direito', 'M', '2005-06-06', '920000283', 'estudante0283@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000283', 'Encarregado 0283', '920000283', NULL, '2026-06-06 14:34:39'),
(284, 292, 'STU000284', 'Estudante 0284 - Direito', 'F', '2004-06-06', '920000284', 'estudante0284@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000284', 'Encarregado 0284', '920000284', NULL, '2026-06-06 14:34:39'),
(285, 293, 'STU000285', 'Estudante 0285 - Direito', 'M', '2003-06-06', '920000285', 'estudante0285@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000285', 'Encarregado 0285', '920000285', NULL, '2026-06-06 14:34:39'),
(286, 294, 'STU000286', 'Estudante 0286 - Direito', 'F', '2002-06-06', '920000286', 'estudante0286@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000286', 'Encarregado 0286', '920000286', NULL, '2026-06-06 14:34:39'),
(287, 295, 'STU000287', 'Estudante 0287 - Direito', 'M', '2001-06-06', '920000287', 'estudante0287@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000287', 'Encarregado 0287', '920000287', NULL, '2026-06-06 14:34:39'),
(288, 296, 'STU000288', 'Estudante 0288 - Direito', 'F', '2000-06-06', '920000288', 'estudante0288@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000288', 'Encarregado 0288', '920000288', NULL, '2026-06-06 14:34:39'),
(289, 297, 'STU000289', 'Estudante 0289 - Direito', 'M', '1999-06-06', '920000289', 'estudante0289@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000289', 'Encarregado 0289', '920000289', NULL, '2026-06-06 14:34:39'),
(290, 298, 'STU000290', 'Estudante 0290 - Direito', 'F', '2008-06-06', '920000290', 'estudante0290@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000290', 'Encarregado 0290', '920000290', NULL, '2026-06-06 14:34:39'),
(291, 299, 'STU000291', 'Estudante 0291 - Direito', 'M', '2007-06-06', '920000291', 'estudante0291@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000291', 'Encarregado 0291', '920000291', NULL, '2026-06-06 14:34:39'),
(292, 300, 'STU000292', 'Estudante 0292 - Direito', 'F', '2006-06-06', '920000292', 'estudante0292@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000292', 'Encarregado 0292', '920000292', NULL, '2026-06-06 14:34:39'),
(293, 301, 'STU000293', 'Estudante 0293 - Direito', 'M', '2005-06-06', '920000293', 'estudante0293@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000293', 'Encarregado 0293', '920000293', NULL, '2026-06-06 14:34:39'),
(294, 302, 'STU000294', 'Estudante 0294 - Direito', 'F', '2004-06-06', '920000294', 'estudante0294@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000294', 'Encarregado 0294', '920000294', NULL, '2026-06-06 14:34:39'),
(295, 303, 'STU000295', 'Estudante 0295 - Direito', 'M', '2003-06-06', '920000295', 'estudante0295@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000295', 'Encarregado 0295', '920000295', NULL, '2026-06-06 14:34:39'),
(296, 304, 'STU000296', 'Estudante 0296 - Direito', 'F', '2002-06-06', '920000296', 'estudante0296@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000296', 'Encarregado 0296', '920000296', NULL, '2026-06-06 14:34:39'),
(297, 305, 'STU000297', 'Estudante 0297 - Direito', 'M', '2001-06-06', '920000297', 'estudante0297@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000297', 'Encarregado 0297', '920000297', NULL, '2026-06-06 14:34:39'),
(298, 306, 'STU000298', 'Estudante 0298 - Direito', 'F', '2000-06-06', '920000298', 'estudante0298@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000298', 'Encarregado 0298', '920000298', NULL, '2026-06-06 14:34:39'),
(299, 307, 'STU000299', 'Estudante 0299 - Direito', 'M', '1999-06-06', '920000299', 'estudante0299@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000299', 'Encarregado 0299', '920000299', NULL, '2026-06-06 14:34:39'),
(300, 308, 'STU000300', 'Estudante 0300 - Direito', 'F', '2008-06-06', '920000300', 'estudante0300@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000300', 'Encarregado 0300', '920000300', NULL, '2026-06-06 14:34:39'),
(301, 309, 'STU000301', 'Estudante 0301 - Direito', 'M', '2007-06-06', '920000301', 'estudante0301@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000301', 'Encarregado 0301', '920000301', NULL, '2026-06-06 14:34:39'),
(302, 310, 'STU000302', 'Estudante 0302 - Direito', 'F', '2006-06-06', '920000302', 'estudante0302@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000302', 'Encarregado 0302', '920000302', NULL, '2026-06-06 14:34:39'),
(303, 311, 'STU000303', 'Estudante 0303 - Direito', 'M', '2005-06-06', '920000303', 'estudante0303@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000303', 'Encarregado 0303', '920000303', NULL, '2026-06-06 14:34:39'),
(304, 312, 'STU000304', 'Estudante 0304 - Direito', 'F', '2004-06-06', '920000304', 'estudante0304@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000304', 'Encarregado 0304', '920000304', NULL, '2026-06-06 14:34:39'),
(305, 313, 'STU000305', 'Estudante 0305 - Direito', 'M', '2003-06-06', '920000305', 'estudante0305@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000305', 'Encarregado 0305', '920000305', NULL, '2026-06-06 14:34:39'),
(306, 314, 'STU000306', 'Estudante 0306 - Direito', 'F', '2002-06-06', '920000306', 'estudante0306@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000306', 'Encarregado 0306', '920000306', NULL, '2026-06-06 14:34:39'),
(307, 315, 'STU000307', 'Estudante 0307 - Direito', 'M', '2001-06-06', '920000307', 'estudante0307@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000307', 'Encarregado 0307', '920000307', NULL, '2026-06-06 14:34:39'),
(308, 316, 'STU000308', 'Estudante 0308 - Direito', 'F', '2000-06-06', '920000308', 'estudante0308@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000308', 'Encarregado 0308', '920000308', NULL, '2026-06-06 14:34:39'),
(309, 317, 'STU000309', 'Estudante 0309 - Direito', 'M', '1999-06-06', '920000309', 'estudante0309@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000309', 'Encarregado 0309', '920000309', NULL, '2026-06-06 14:34:39'),
(310, 318, 'STU000310', 'Estudante 0310 - Direito', 'F', '2008-06-06', '920000310', 'estudante0310@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000310', 'Encarregado 0310', '920000310', NULL, '2026-06-06 14:34:39'),
(311, 319, 'STU000311', 'Estudante 0311 - Direito', 'M', '2007-06-06', '920000311', 'estudante0311@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000311', 'Encarregado 0311', '920000311', NULL, '2026-06-06 14:34:39'),
(312, 320, 'STU000312', 'Estudante 0312 - Direito', 'F', '2006-06-06', '920000312', 'estudante0312@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000312', 'Encarregado 0312', '920000312', NULL, '2026-06-06 14:34:39'),
(313, 321, 'STU000313', 'Estudante 0313 - Direito', 'M', '2005-06-06', '920000313', 'estudante0313@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000313', 'Encarregado 0313', '920000313', NULL, '2026-06-06 14:34:39'),
(314, 322, 'STU000314', 'Estudante 0314 - Direito', 'F', '2004-06-06', '920000314', 'estudante0314@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000314', 'Encarregado 0314', '920000314', NULL, '2026-06-06 14:34:39'),
(315, 323, 'STU000315', 'Estudante 0315 - Direito', 'M', '2003-06-06', '920000315', 'estudante0315@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000315', 'Encarregado 0315', '920000315', NULL, '2026-06-06 14:34:39'),
(316, 324, 'STU000316', 'Estudante 0316 - Direito', 'F', '2002-06-06', '920000316', 'estudante0316@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000316', 'Encarregado 0316', '920000316', NULL, '2026-06-06 14:34:39'),
(317, 325, 'STU000317', 'Estudante 0317 - Direito', 'M', '2001-06-06', '920000317', 'estudante0317@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000317', 'Encarregado 0317', '920000317', NULL, '2026-06-06 14:34:39'),
(318, 326, 'STU000318', 'Estudante 0318 - Direito', 'F', '2000-06-06', '920000318', 'estudante0318@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000318', 'Encarregado 0318', '920000318', NULL, '2026-06-06 14:34:39'),
(319, 327, 'STU000319', 'Estudante 0319 - Direito', 'M', '1999-06-06', '920000319', 'estudante0319@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000319', 'Encarregado 0319', '920000319', NULL, '2026-06-06 14:34:39'),
(320, 328, 'STU000320', 'Estudante 0320 - Direito', 'F', '2008-06-06', '920000320', 'estudante0320@mail.ojj.edu', 'Rua dos Estudantes, Bairro 08', 'Cabinda', 'Angola', 'BI0000000320', 'Encarregado 0320', '920000320', NULL, '2026-06-06 14:34:39'),
(321, 329, 'STU000321', 'Estudante 0321 - Enfermagem', 'M', '2007-06-06', '920000321', 'estudante0321@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000321', 'Encarregado 0321', '920000321', NULL, '2026-06-06 14:34:39'),
(322, 330, 'STU000322', 'Estudante 0322 - Enfermagem', 'F', '2006-06-06', '920000322', 'estudante0322@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000322', 'Encarregado 0322', '920000322', NULL, '2026-06-06 14:34:39'),
(323, 331, 'STU000323', 'Estudante 0323 - Enfermagem', 'M', '2005-06-06', '920000323', 'estudante0323@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000323', 'Encarregado 0323', '920000323', NULL, '2026-06-06 14:34:39'),
(324, 332, 'STU000324', 'Estudante 0324 - Enfermagem', 'F', '2004-06-06', '920000324', 'estudante0324@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000324', 'Encarregado 0324', '920000324', NULL, '2026-06-06 14:34:39'),
(325, 333, 'STU000325', 'Estudante 0325 - Enfermagem', 'M', '2003-06-06', '920000325', 'estudante0325@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000325', 'Encarregado 0325', '920000325', NULL, '2026-06-06 14:34:39'),
(326, 334, 'STU000326', 'Estudante 0326 - Enfermagem', 'F', '2002-06-06', '920000326', 'estudante0326@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000326', 'Encarregado 0326', '920000326', NULL, '2026-06-06 14:34:39'),
(327, 335, 'STU000327', 'Estudante 0327 - Enfermagem', 'M', '2001-06-06', '920000327', 'estudante0327@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000327', 'Encarregado 0327', '920000327', NULL, '2026-06-06 14:34:39'),
(328, 336, 'STU000328', 'Estudante 0328 - Enfermagem', 'F', '2000-06-06', '920000328', 'estudante0328@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000328', 'Encarregado 0328', '920000328', NULL, '2026-06-06 14:34:39'),
(329, 337, 'STU000329', 'Estudante 0329 - Enfermagem', 'M', '1999-06-06', '920000329', 'estudante0329@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000329', 'Encarregado 0329', '920000329', NULL, '2026-06-06 14:34:39'),
(330, 338, 'STU000330', 'Estudante 0330 - Enfermagem', 'F', '2008-06-06', '920000330', 'estudante0330@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000330', 'Encarregado 0330', '920000330', NULL, '2026-06-06 14:34:39'),
(331, 339, 'STU000331', 'Estudante 0331 - Enfermagem', 'M', '2007-06-06', '920000331', 'estudante0331@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000331', 'Encarregado 0331', '920000331', NULL, '2026-06-06 14:34:39'),
(332, 340, 'STU000332', 'Estudante 0332 - Enfermagem', 'F', '2006-06-06', '920000332', 'estudante0332@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000332', 'Encarregado 0332', '920000332', NULL, '2026-06-06 14:34:39'),
(333, 341, 'STU000333', 'Estudante 0333 - Enfermagem', 'M', '2005-06-06', '920000333', 'estudante0333@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000333', 'Encarregado 0333', '920000333', NULL, '2026-06-06 14:34:39'),
(334, 342, 'STU000334', 'Estudante 0334 - Enfermagem', 'F', '2004-06-06', '920000334', 'estudante0334@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000334', 'Encarregado 0334', '920000334', NULL, '2026-06-06 14:34:39'),
(335, 343, 'STU000335', 'Estudante 0335 - Enfermagem', 'M', '2003-06-06', '920000335', 'estudante0335@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000335', 'Encarregado 0335', '920000335', NULL, '2026-06-06 14:34:39'),
(336, 344, 'STU000336', 'Estudante 0336 - Enfermagem', 'F', '2002-06-06', '920000336', 'estudante0336@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000336', 'Encarregado 0336', '920000336', NULL, '2026-06-06 14:34:39'),
(337, 345, 'STU000337', 'Estudante 0337 - Enfermagem', 'M', '2001-06-06', '920000337', 'estudante0337@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000337', 'Encarregado 0337', '920000337', NULL, '2026-06-06 14:34:39'),
(338, 346, 'STU000338', 'Estudante 0338 - Enfermagem', 'F', '2000-06-06', '920000338', 'estudante0338@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000338', 'Encarregado 0338', '920000338', NULL, '2026-06-06 14:34:39'),
(339, 347, 'STU000339', 'Estudante 0339 - Enfermagem', 'M', '1999-06-06', '920000339', 'estudante0339@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000339', 'Encarregado 0339', '920000339', NULL, '2026-06-06 14:34:39'),
(340, 348, 'STU000340', 'Estudante 0340 - Enfermagem', 'F', '2008-06-06', '920000340', 'estudante0340@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000340', 'Encarregado 0340', '920000340', NULL, '2026-06-06 14:34:39'),
(341, 349, 'STU000341', 'Estudante 0341 - Enfermagem', 'M', '2007-06-06', '920000341', 'estudante0341@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000341', 'Encarregado 0341', '920000341', NULL, '2026-06-06 14:34:39'),
(342, 350, 'STU000342', 'Estudante 0342 - Enfermagem', 'F', '2006-06-06', '920000342', 'estudante0342@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000342', 'Encarregado 0342', '920000342', NULL, '2026-06-06 14:34:39'),
(343, 351, 'STU000343', 'Estudante 0343 - Enfermagem', 'M', '2005-06-06', '920000343', 'estudante0343@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000343', 'Encarregado 0343', '920000343', NULL, '2026-06-06 14:34:39'),
(344, 352, 'STU000344', 'Estudante 0344 - Enfermagem', 'F', '2004-06-06', '920000344', 'estudante0344@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000344', 'Encarregado 0344', '920000344', NULL, '2026-06-06 14:34:39'),
(345, 353, 'STU000345', 'Estudante 0345 - Enfermagem', 'M', '2003-06-06', '920000345', 'estudante0345@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000345', 'Encarregado 0345', '920000345', NULL, '2026-06-06 14:34:39'),
(346, 354, 'STU000346', 'Estudante 0346 - Enfermagem', 'F', '2002-06-06', '920000346', 'estudante0346@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000346', 'Encarregado 0346', '920000346', NULL, '2026-06-06 14:34:39'),
(347, 355, 'STU000347', 'Estudante 0347 - Enfermagem', 'M', '2001-06-06', '920000347', 'estudante0347@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000347', 'Encarregado 0347', '920000347', NULL, '2026-06-06 14:34:39'),
(348, 356, 'STU000348', 'Estudante 0348 - Enfermagem', 'F', '2000-06-06', '920000348', 'estudante0348@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000348', 'Encarregado 0348', '920000348', NULL, '2026-06-06 14:34:39'),
(349, 357, 'STU000349', 'Estudante 0349 - Enfermagem', 'M', '1999-06-06', '920000349', 'estudante0349@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000349', 'Encarregado 0349', '920000349', NULL, '2026-06-06 14:34:39'),
(350, 358, 'STU000350', 'Estudante 0350 - Enfermagem', 'F', '2008-06-06', '920000350', 'estudante0350@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000350', 'Encarregado 0350', '920000350', NULL, '2026-06-06 14:34:39'),
(351, 359, 'STU000351', 'Estudante 0351 - Enfermagem', 'M', '2007-06-06', '920000351', 'estudante0351@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000351', 'Encarregado 0351', '920000351', NULL, '2026-06-06 14:34:39'),
(352, 360, 'STU000352', 'Estudante 0352 - Enfermagem', 'F', '2006-06-06', '920000352', 'estudante0352@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000352', 'Encarregado 0352', '920000352', NULL, '2026-06-06 14:34:39'),
(353, 361, 'STU000353', 'Estudante 0353 - Enfermagem', 'M', '2005-06-06', '920000353', 'estudante0353@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000353', 'Encarregado 0353', '920000353', NULL, '2026-06-06 14:34:39'),
(354, 362, 'STU000354', 'Estudante 0354 - Enfermagem', 'F', '2004-06-06', '920000354', 'estudante0354@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000354', 'Encarregado 0354', '920000354', NULL, '2026-06-06 14:34:39'),
(355, 363, 'STU000355', 'Estudante 0355 - Enfermagem', 'M', '2003-06-06', '920000355', 'estudante0355@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000355', 'Encarregado 0355', '920000355', NULL, '2026-06-06 14:34:39'),
(356, 364, 'STU000356', 'Estudante 0356 - Enfermagem', 'F', '2002-06-06', '920000356', 'estudante0356@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000356', 'Encarregado 0356', '920000356', NULL, '2026-06-06 14:34:39'),
(357, 365, 'STU000357', 'Estudante 0357 - Enfermagem', 'M', '2001-06-06', '920000357', 'estudante0357@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000357', 'Encarregado 0357', '920000357', NULL, '2026-06-06 14:34:39'),
(358, 366, 'STU000358', 'Estudante 0358 - Enfermagem', 'F', '2000-06-06', '920000358', 'estudante0358@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000358', 'Encarregado 0358', '920000358', NULL, '2026-06-06 14:34:39'),
(359, 367, 'STU000359', 'Estudante 0359 - Enfermagem', 'M', '1999-06-06', '920000359', 'estudante0359@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000359', 'Encarregado 0359', '920000359', NULL, '2026-06-06 14:34:39'),
(360, 368, 'STU000360', 'Estudante 0360 - Enfermagem', 'F', '2008-06-06', '920000360', 'estudante0360@mail.ojj.edu', 'Rua dos Estudantes, Bairro 09', 'Malanje', 'Angola', 'BI0000000360', 'Encarregado 0360', '920000360', NULL, '2026-06-06 14:34:39'),
(361, 369, 'STU000361', 'Estudante 0361 - Pedagogia', 'M', '2007-06-06', '920000361', 'estudante0361@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000361', 'Encarregado 0361', '920000361', NULL, '2026-06-06 14:34:39'),
(362, 370, 'STU000362', 'Estudante 0362 - Pedagogia', 'F', '2006-06-06', '920000362', 'estudante0362@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000362', 'Encarregado 0362', '920000362', NULL, '2026-06-06 14:34:39'),
(363, 371, 'STU000363', 'Estudante 0363 - Pedagogia', 'M', '2005-06-06', '920000363', 'estudante0363@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000363', 'Encarregado 0363', '920000363', NULL, '2026-06-06 14:34:39'),
(364, 372, 'STU000364', 'Estudante 0364 - Pedagogia', 'F', '2004-06-06', '920000364', 'estudante0364@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000364', 'Encarregado 0364', '920000364', NULL, '2026-06-06 14:34:39'),
(365, 373, 'STU000365', 'Estudante 0365 - Pedagogia', 'M', '2003-06-06', '920000365', 'estudante0365@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000365', 'Encarregado 0365', '920000365', NULL, '2026-06-06 14:34:39'),
(366, 374, 'STU000366', 'Estudante 0366 - Pedagogia', 'F', '2002-06-06', '920000366', 'estudante0366@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000366', 'Encarregado 0366', '920000366', NULL, '2026-06-06 14:34:39'),
(367, 375, 'STU000367', 'Estudante 0367 - Pedagogia', 'M', '2001-06-06', '920000367', 'estudante0367@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000367', 'Encarregado 0367', '920000367', NULL, '2026-06-06 14:34:39'),
(368, 376, 'STU000368', 'Estudante 0368 - Pedagogia', 'F', '2000-06-06', '920000368', 'estudante0368@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000368', 'Encarregado 0368', '920000368', NULL, '2026-06-06 14:34:39'),
(369, 377, 'STU000369', 'Estudante 0369 - Pedagogia', 'M', '1999-06-06', '920000369', 'estudante0369@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000369', 'Encarregado 0369', '920000369', NULL, '2026-06-06 14:34:39'),
(370, 378, 'STU000370', 'Estudante 0370 - Pedagogia', 'F', '2008-06-06', '920000370', 'estudante0370@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000370', 'Encarregado 0370', '920000370', NULL, '2026-06-06 14:34:39'),
(371, 379, 'STU000371', 'Estudante 0371 - Pedagogia', 'M', '2007-06-06', '920000371', 'estudante0371@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000371', 'Encarregado 0371', '920000371', NULL, '2026-06-06 14:34:39'),
(372, 380, 'STU000372', 'Estudante 0372 - Pedagogia', 'F', '2006-06-06', '920000372', 'estudante0372@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000372', 'Encarregado 0372', '920000372', NULL, '2026-06-06 14:34:39'),
(373, 381, 'STU000373', 'Estudante 0373 - Pedagogia', 'M', '2005-06-06', '920000373', 'estudante0373@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000373', 'Encarregado 0373', '920000373', NULL, '2026-06-06 14:34:39'),
(374, 382, 'STU000374', 'Estudante 0374 - Pedagogia', 'F', '2004-06-06', '920000374', 'estudante0374@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000374', 'Encarregado 0374', '920000374', NULL, '2026-06-06 14:34:39'),
(375, 383, 'STU000375', 'Estudante 0375 - Pedagogia', 'M', '2003-06-06', '920000375', 'estudante0375@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000375', 'Encarregado 0375', '920000375', NULL, '2026-06-06 14:34:39'),
(376, 384, 'STU000376', 'Estudante 0376 - Pedagogia', 'F', '2002-06-06', '920000376', 'estudante0376@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000376', 'Encarregado 0376', '920000376', NULL, '2026-06-06 14:34:39'),
(377, 385, 'STU000377', 'Estudante 0377 - Pedagogia', 'M', '2001-06-06', '920000377', 'estudante0377@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000377', 'Encarregado 0377', '920000377', NULL, '2026-06-06 14:34:39'),
(378, 386, 'STU000378', 'Estudante 0378 - Pedagogia', 'F', '2000-06-06', '920000378', 'estudante0378@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000378', 'Encarregado 0378', '920000378', NULL, '2026-06-06 14:34:39'),
(379, 387, 'STU000379', 'Estudante 0379 - Pedagogia', 'M', '1999-06-06', '920000379', 'estudante0379@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000379', 'Encarregado 0379', '920000379', NULL, '2026-06-06 14:34:39'),
(380, 388, 'STU000380', 'Estudante 0380 - Pedagogia', 'F', '2008-06-06', '920000380', 'estudante0380@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000380', 'Encarregado 0380', '920000380', NULL, '2026-06-06 14:34:39'),
(381, 389, 'STU000381', 'Estudante 0381 - Pedagogia', 'M', '2007-06-06', '920000381', 'estudante0381@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000381', 'Encarregado 0381', '920000381', NULL, '2026-06-06 14:34:39'),
(382, 390, 'STU000382', 'Estudante 0382 - Pedagogia', 'F', '2006-06-06', '920000382', 'estudante0382@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000382', 'Encarregado 0382', '920000382', NULL, '2026-06-06 14:34:39'),
(383, 391, 'STU000383', 'Estudante 0383 - Pedagogia', 'M', '2005-06-06', '920000383', 'estudante0383@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000383', 'Encarregado 0383', '920000383', NULL, '2026-06-06 14:34:39'),
(384, 392, 'STU000384', 'Estudante 0384 - Pedagogia', 'F', '2004-06-06', '920000384', 'estudante0384@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000384', 'Encarregado 0384', '920000384', NULL, '2026-06-06 14:34:39'),
(385, 393, 'STU000385', 'Estudante 0385 - Pedagogia', 'M', '2003-06-06', '920000385', 'estudante0385@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000385', 'Encarregado 0385', '920000385', NULL, '2026-06-06 14:34:39'),
(386, 394, 'STU000386', 'Estudante 0386 - Pedagogia', 'F', '2002-06-06', '920000386', 'estudante0386@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000386', 'Encarregado 0386', '920000386', NULL, '2026-06-06 14:34:39'),
(387, 395, 'STU000387', 'Estudante 0387 - Pedagogia', 'M', '2001-06-06', '920000387', 'estudante0387@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000387', 'Encarregado 0387', '920000387', NULL, '2026-06-06 14:34:39'),
(388, 396, 'STU000388', 'Estudante 0388 - Pedagogia', 'F', '2000-06-06', '920000388', 'estudante0388@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000388', 'Encarregado 0388', '920000388', NULL, '2026-06-06 14:34:39'),
(389, 397, 'STU000389', 'Estudante 0389 - Pedagogia', 'M', '1999-06-06', '920000389', 'estudante0389@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000389', 'Encarregado 0389', '920000389', NULL, '2026-06-06 14:34:39'),
(390, 398, 'STU000390', 'Estudante 0390 - Pedagogia', 'F', '2008-06-06', '920000390', 'estudante0390@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000390', 'Encarregado 0390', '920000390', NULL, '2026-06-06 14:34:39'),
(391, 399, 'STU000391', 'Estudante 0391 - Pedagogia', 'M', '2007-06-06', '920000391', 'estudante0391@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000391', 'Encarregado 0391', '920000391', NULL, '2026-06-06 14:34:39'),
(392, 400, 'STU000392', 'Estudante 0392 - Pedagogia', 'F', '2006-06-06', '920000392', 'estudante0392@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000392', 'Encarregado 0392', '920000392', NULL, '2026-06-06 14:34:39'),
(393, 401, 'STU000393', 'Estudante 0393 - Pedagogia', 'M', '2005-06-06', '920000393', 'estudante0393@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000393', 'Encarregado 0393', '920000393', NULL, '2026-06-06 14:34:39'),
(394, 402, 'STU000394', 'Estudante 0394 - Pedagogia', 'F', '2004-06-06', '920000394', 'estudante0394@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000394', 'Encarregado 0394', '920000394', NULL, '2026-06-06 14:34:39');
INSERT INTO `estudante` (`id_estudante`, `id_utilizador`, `numero_estudante`, `nome_completo`, `sexo`, `data_nascimento`, `telefone`, `email_pessoal`, `morada`, `provincia`, `nacionalidade`, `numero_bi`, `nome_encarregado`, `telefone_encarregado`, `foto`, `data_inscricao`) VALUES
(395, 403, 'STU000395', 'Estudante 0395 - Pedagogia', 'M', '2003-06-06', '920000395', 'estudante0395@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000395', 'Encarregado 0395', '920000395', NULL, '2026-06-06 14:34:39'),
(396, 404, 'STU000396', 'Estudante 0396 - Pedagogia', 'F', '2002-06-06', '920000396', 'estudante0396@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000396', 'Encarregado 0396', '920000396', NULL, '2026-06-06 14:34:39'),
(397, 405, 'STU000397', 'Estudante 0397 - Pedagogia', 'M', '2001-06-06', '920000397', 'estudante0397@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000397', 'Encarregado 0397', '920000397', NULL, '2026-06-06 14:34:39'),
(398, 406, 'STU000398', 'Estudante 0398 - Pedagogia', 'F', '2000-06-06', '920000398', 'estudante0398@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000398', 'Encarregado 0398', '920000398', NULL, '2026-06-06 14:34:39'),
(399, 407, 'STU000399', 'Estudante 0399 - Pedagogia', 'M', '1999-06-06', '920000399', 'estudante0399@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000399', 'Encarregado 0399', '920000399', NULL, '2026-06-06 14:34:39'),
(400, 408, 'STU000400', 'Estudante 0400 - Pedagogia', 'F', '2008-06-06', '920000400', 'estudante0400@mail.ojj.edu', 'Rua dos Estudantes, Bairro 10', 'Luanda', 'Angola', 'BI0000000400', 'Encarregado 0400', '920000400', NULL, '2026-06-06 14:34:39'),
(403, 421, '20261925', 'Petelson Queta', 'M', '2005-06-02', '+244931889898', 'petelson@gmail.com', 'RUA 02, BAIRRO CAMAMA I, Comuna de GOLFE, Município de CAMAMA, Província de LUANDA', 'Gaza', 'Angolana', '990000999055', 'Luís Queta', '931889898', NULL, '2026-06-06 14:40:17'),
(404, 423, '20265320', 'Miguel Bengui', 'M', '2000-02-08', '+244931889898', 'miguel@gmail.com', 'RUA 02, BAIRRO CAMAMA I, Comuna de GOLFE, Município de CAMAMA, Província de LUANDA', 'Zambézia', 'Moçambicana', '747484848494', 'Lucas bre', '954345432', NULL, '2026-06-06 14:44:35'),
(405, 427, '20261722', 'Sebastião Manuel', 'M', '2004-02-18', '+244931889898', 'sebastiao@gmail.com', 'RUA 02, BAIRRO CAMAMA I, Comuna de GOLFE, Município de CAMAMA, Província de LUANDA', 'Cabo Delgado', 'Moçambicana', '747484848444', 'Luís Joaquim Queta', '931889898', NULL, '2026-06-06 14:48:34'),
(406, 428, '20269337', 'Mariano Armando', 'M', '1981-09-16', '+244931889898', 'mariano@gmail.com', 'RUA 02, BAIRRO CAMAMA I, Comuna de GOLFE, Município de CAMAMA, Província de LUANDA', 'Nampula', 'Moçambicana', '999000999055', 'Luís Joaquim Queta', '931889898', NULL, '2026-06-06 15:37:57');

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
(1, 2, 12, 'Maria Fernanda Santos', '934567890', 'BI001235ABC', 'F', '1985-08-20', 'Luanda, Kilamba', 150000.00, '2015-03-15', NULL),
(2, 3, 11, 'Carlos Alberto Pereira', '945678901', 'BI001236ABC', 'M', '1990-11-10', 'Luanda, Talatona', 120000.00, '2018-07-01', NULL),
(3, 6, 2, 'Paula Sofia Mendes', '978901234', 'BI001239ABC', 'F', '1978-12-12', 'Luanda, Camama', 220000.00, '2011-05-20', NULL),
(4, 4, 2, 'Ana Cristina Lopes', '956789012', 'BI001237ABC', 'F', '1975-02-25', 'Luanda, Viana', 180000.00, '2012-09-20', NULL),
(5, 5, 1, 'Ricardo Jos?? Almeida', '967890123', 'BI001238ABC', 'M', '1982-07-30', 'Luanda, Benfica', 175000.00, '2014-11-05', NULL),
(6, 7, 4, 'Jos?? Manuel Cardoso', '912345678', 'BI001240ABC', 'M', '1976-04-10', 'Luanda, Miramar', 200000.00, '2013-06-30', NULL);

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

--
-- Extraindo dados da tabela `matricula`
--

INSERT INTO `matricula` (`id_matricula`, `id_estudante`, `id_curso`, `id_turma`, `id_ano_academico`, `id_semestre`, `data_matricula`, `data_confirmacao`, `status`, `observacoes`) VALUES
(322, 1, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(323, 2, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(324, 3, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(325, 4, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(326, 5, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(327, 6, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(328, 7, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(329, 8, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(330, 9, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(331, 10, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(332, 11, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(333, 12, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(334, 13, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(335, 14, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(336, 15, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(337, 16, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(338, 17, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(339, 18, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(340, 19, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(341, 20, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(342, 21, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(343, 22, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(344, 23, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(345, 24, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(346, 25, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(347, 26, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(348, 27, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(349, 28, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(350, 29, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(351, 30, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(352, 31, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(353, 32, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(354, 33, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(355, 34, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(356, 35, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(357, 36, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(358, 37, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(359, 38, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(360, 39, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(361, 40, 1, 1, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC101'),
(362, 41, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(363, 42, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(364, 43, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(365, 44, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(366, 45, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(367, 46, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(368, 47, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(369, 48, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(370, 49, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(371, 50, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(372, 51, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(373, 52, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(374, 53, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(375, 54, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(376, 55, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(377, 56, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(378, 57, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(379, 58, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(380, 59, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(381, 60, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(382, 61, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(383, 62, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(384, 63, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(385, 64, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(386, 65, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(387, 66, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(388, 67, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(389, 68, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(390, 69, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(391, 70, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(392, 71, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(393, 72, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(394, 73, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(395, 74, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(396, 75, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(397, 76, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(398, 77, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(399, 78, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(400, 79, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(401, 80, 2, 4, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso CC102'),
(402, 81, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(403, 82, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(404, 83, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(405, 84, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(406, 85, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(407, 86, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(408, 87, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(409, 88, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(410, 89, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(411, 90, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(412, 91, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(413, 92, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(414, 93, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(415, 94, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(416, 95, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(417, 96, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(418, 97, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(419, 98, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(420, 99, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(421, 100, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(422, 101, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(423, 102, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(424, 103, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(425, 104, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(426, 105, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(427, 106, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(428, 107, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(429, 108, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(430, 109, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(431, 110, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(432, 111, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(433, 112, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(434, 113, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(435, 114, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(436, 115, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(437, 116, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(438, 117, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(439, 118, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(440, 119, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(441, 120, 3, 5, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG101'),
(442, 121, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(443, 122, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(444, 123, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(445, 124, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(446, 125, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(447, 126, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(448, 127, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(449, 128, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(450, 129, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(451, 130, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(452, 131, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(453, 132, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(454, 133, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(455, 134, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(456, 135, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(457, 136, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(458, 137, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(459, 138, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(460, 139, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(461, 140, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(462, 141, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(463, 142, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(464, 143, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(465, 144, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(466, 145, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(467, 146, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(468, 147, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(469, 148, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(470, 149, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(471, 150, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(472, 151, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(473, 152, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(474, 153, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(475, 154, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(476, 155, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(477, 156, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(478, 157, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(479, 158, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(480, 159, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(481, 160, 4, 9, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ENG102'),
(482, 161, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(483, 162, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(484, 163, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(485, 164, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(486, 165, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(487, 166, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(488, 167, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(489, 168, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(490, 169, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(491, 170, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(492, 171, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(493, 172, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(494, 173, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(495, 174, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(496, 175, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(497, 176, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(498, 177, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(499, 178, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(500, 179, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(501, 180, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(502, 181, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(503, 182, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(504, 183, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(505, 184, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(506, 185, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(507, 186, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(508, 187, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(509, 188, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(510, 189, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(511, 190, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(512, 191, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(513, 192, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(514, 193, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(515, 194, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(516, 195, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(517, 196, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(518, 197, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(519, 198, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(520, 199, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(521, 200, 5, 6, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso ECO101'),
(522, 201, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(523, 202, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(524, 203, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(525, 204, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(526, 205, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(527, 206, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(528, 207, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(529, 208, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(530, 209, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(531, 210, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(532, 211, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(533, 212, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(534, 213, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(535, 214, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(536, 215, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(537, 216, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(538, 217, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(539, 218, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(540, 219, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(541, 220, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(542, 221, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(543, 222, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(544, 223, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(545, 224, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(546, 225, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(547, 226, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(548, 227, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(549, 228, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(550, 229, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(551, 230, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(552, 231, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(553, 232, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(554, 233, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(555, 234, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(556, 235, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(557, 236, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(558, 237, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(559, 238, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(560, 239, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(561, 240, 6, 8, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso GES101'),
(562, 241, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(563, 242, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(564, 243, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(565, 244, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(566, 245, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(567, 246, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(568, 247, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(569, 248, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(570, 249, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(571, 250, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(572, 251, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(573, 252, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(574, 253, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(575, 254, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(576, 255, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(577, 256, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(578, 257, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(579, 258, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(580, 259, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(581, 260, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(582, 261, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(583, 262, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(584, 263, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(585, 264, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(586, 265, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(587, 266, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(588, 267, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(589, 268, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(590, 269, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(591, 270, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(592, 271, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(593, 272, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(594, 273, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(595, 274, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(596, 275, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(597, 276, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(598, 277, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(599, 278, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(600, 279, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(601, 280, 7, 10, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SOC101'),
(602, 281, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(603, 282, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(604, 283, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(605, 284, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(606, 285, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(607, 286, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(608, 287, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(609, 288, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(610, 289, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(611, 290, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(612, 291, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(613, 292, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(614, 293, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(615, 294, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(616, 295, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(617, 296, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(618, 297, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(619, 298, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(620, 299, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(621, 300, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(622, 301, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(623, 302, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(624, 303, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(625, 304, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(626, 305, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(627, 306, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(628, 307, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(629, 308, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(630, 309, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(631, 310, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(632, 311, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(633, 312, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(634, 313, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(635, 314, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(636, 315, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(637, 316, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(638, 317, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(639, 318, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(640, 319, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(641, 320, 8, 7, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso DIR101'),
(642, 321, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(643, 322, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(644, 323, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(645, 324, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(646, 325, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(647, 326, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(648, 327, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(649, 328, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(650, 329, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(651, 330, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(652, 331, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(653, 332, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(654, 333, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(655, 334, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(656, 335, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(657, 336, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(658, 337, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(659, 338, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(660, 339, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(661, 340, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(662, 341, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(663, 342, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(664, 343, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(665, 344, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(666, 345, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(667, 346, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(668, 347, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(669, 348, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(670, 349, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(671, 350, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(672, 351, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(673, 352, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(674, 353, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(675, 354, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(676, 355, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(677, 356, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(678, 357, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(679, 358, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(680, 359, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(681, 360, 9, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso SAU101'),
(682, 361, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(683, 362, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(684, 363, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(685, 364, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(686, 365, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(687, 366, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(688, 367, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(689, 368, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(690, 369, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(691, 370, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(692, 371, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(693, 372, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(694, 373, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(695, 374, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(696, 375, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(697, 376, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(698, 377, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(699, 378, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(700, 379, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(701, 380, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(702, 381, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(703, 382, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(704, 383, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(705, 384, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(706, 385, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(707, 386, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(708, 387, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(709, 388, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(710, 389, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(711, 390, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(712, 391, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(713, 392, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(714, 393, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(715, 394, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(716, 395, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(717, 396, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(718, 397, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(719, 398, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(720, 399, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(721, 400, 10, 0, 4, 3, '2026-06-06 14:34:39', NULL, 'CONFIRMADA', 'Matr??cula autom??tica para curso PED101'),
(833, 405, 1, 1, 3, 1, '2026-06-06 14:48:35', NULL, 'CONFIRMADA', 'Matrícula automática no registro'),
(834, 406, 1, 1, 3, 1, '2026-06-06 15:37:57', NULL, NULL, 'Matrícula automática no registro');

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

--
-- Extraindo dados da tabela `operacao_log`
--

INSERT INTO `operacao_log` (`id_log`, `id_utilizador`, `tipo_operacao`, `id_estudante_alvo`, `descricao`, `endereco_ip`, `user_agent`, `dados_alterados`, `resultado`, `data_hora`) VALUES
(34, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:38:22'),
(35, 2, 'GET /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:38:37'),
(36, 2, 'POST /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:40:16'),
(37, 2, 'POST /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:42:51'),
(38, 2, 'POST /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:44:34'),
(39, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:47:13'),
(40, 2, 'GET /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:47:20'),
(41, 2, 'POST /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:48:34'),
(42, 2, 'MATRICULA_ESTUDANTE', 405, 'Cadastro e matrícula do estudante: Sebastião Manuel', NULL, NULL, NULL, 'SUCESSO', '2026-06-06 14:48:35'),
(43, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:48:59'),
(44, 2, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 14:49:05'),
(45, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:36:14'),
(46, 2, 'GET /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:36:25'),
(47, 2, 'POST /secretario/matricular', NULL, 'Acesso ao recurso: /secretario/matricular', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:37:56'),
(48, 2, 'MATRICULA_ESTUDANTE', 406, 'Cadastro e matrícula do estudante: Mariano Armando (Nº 20269337)', NULL, NULL, NULL, 'SUCESSO', '2026-06-06 15:37:57'),
(49, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:38:06'),
(50, 2, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:38:07'),
(51, 21, 'GET /estudante/dashboard', NULL, 'Acesso ao recurso: /estudante/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 15:39:44'),
(52, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:09:43'),
(53, 2, 'GET /secretario/cartao-estudante', NULL, 'Acesso ao recurso: /secretario/cartao-estudante', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:09:51'),
(54, 2, 'POST /secretario/cartao-estudante', NULL, 'Acesso ao recurso: /secretario/cartao-estudante', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:10:29'),
(55, 2, 'GET /secretario/cartao-estudante', NULL, 'Acesso ao recurso: /secretario/cartao-estudante', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:15:03'),
(56, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:15:06'),
(57, 2, 'GET /secretario/declaracao', NULL, 'Acesso ao recurso: /secretario/declaracao', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:15:09'),
(58, 2, 'POST /secretario/declaracao', NULL, 'Acesso ao recurso: /secretario/declaracao', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:15:14'),
(59, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:16:41'),
(60, 2, 'GET /secretario/dashboard', NULL, 'Acesso ao recurso: /secretario/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:16:49'),
(61, 2, 'GET /secretario/historico', NULL, 'Acesso ao recurso: /secretario/historico', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:16:53'),
(62, 2, 'GET /', NULL, 'Acesso ao recurso: /', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:16:55'),
(63, 2, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:16:58'),
(64, 2, 'POST /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:02'),
(65, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:02'),
(66, 424, 'GET /sistema/logs', NULL, 'Acesso ao recurso: /sistema/logs', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:27'),
(67, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:37'),
(68, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:42'),
(69, 424, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:55'),
(70, 424, 'GET /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:17:59'),
(71, 424, 'POST /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:20'),
(72, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:20'),
(73, 424, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:28'),
(74, 424, 'GET /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:32'),
(75, 424, 'POST /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:45'),
(76, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:46'),
(77, 424, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:54'),
(78, 424, 'GET /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:18:58'),
(79, 424, 'POST /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:17'),
(80, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:18'),
(81, 424, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:23'),
(82, 424, 'GET /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:26'),
(83, 424, 'POST /admin/estudante/edit', NULL, 'Acesso ao recurso: /admin/estudante/edit', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:52'),
(84, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:19:52'),
(85, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:20:28'),
(86, 424, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:20:46'),
(87, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:20:47'),
(88, 424, 'GET /admin/curso', NULL, 'Acesso ao recurso: /admin/curso', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:20:59'),
(89, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:21:05'),
(90, 424, 'GET /admin/funcionario/new', NULL, 'Acesso ao recurso: /admin/funcionario/new', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:34:13'),
(91, 424, 'POST /admin/funcionario/new', NULL, 'Acesso ao recurso: /admin/funcionario/new', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:37:06'),
(92, 424, 'POST /admin/funcionario/new', NULL, 'Acesso ao recurso: /admin/funcionario/new', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:38:05'),
(93, 424, 'POST /admin/funcionario/new', NULL, 'Acesso ao recurso: /admin/funcionario/new', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 16:44:01'),
(94, 424, 'GET /admin/funcionario/list', NULL, 'Acesso ao recurso: /admin/funcionario/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:00:13'),
(95, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:01:23'),
(96, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:01:26'),
(97, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:03'),
(98, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:11'),
(99, 424, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:16'),
(100, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:23'),
(101, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:28'),
(102, 424, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:02:35'),
(103, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:03:03'),
(104, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:03:18'),
(105, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:03:27'),
(106, 3, 'POST /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:03'),
(107, 3, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:12'),
(108, 3, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:12'),
(109, 3, 'POST /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:16'),
(110, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:17'),
(111, 424, 'GET /sistema/logs', NULL, 'Acesso ao recurso: /sistema/logs', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:26'),
(112, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:04:39'),
(113, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-06 17:05:00'),
(114, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:20:51'),
(115, 424, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:21:12'),
(116, 424, 'GET /admin/curso', NULL, 'Acesso ao recurso: /admin/curso', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:21:53'),
(117, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:05'),
(118, 424, 'GET /admin/funcionario/list', NULL, 'Acesso ao recurso: /admin/funcionario/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:12'),
(119, 424, 'GET /admin/funcionario/new', NULL, 'Acesso ao recurso: /admin/funcionario/new', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:21'),
(120, 424, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:26'),
(121, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:53'),
(122, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:22:57'),
(123, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:12'),
(124, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:25'),
(125, 3, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:31'),
(126, 3, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:31'),
(127, 3, 'POST /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:33'),
(128, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:33'),
(129, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:38'),
(130, 3, 'POST /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:52'),
(131, 3, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:56'),
(132, 3, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:56'),
(133, 3, 'POST /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:58'),
(134, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:45:58'),
(135, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:46:03'),
(136, 3, 'GET /tesouraria/servicos', NULL, 'Acesso ao recurso: /tesouraria/servicos', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:48:28'),
(137, 3, 'GET /', NULL, 'Acesso ao recurso: /', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 20:48:34'),
(138, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:05:23'),
(139, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:05:43'),
(140, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:05:55'),
(141, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:05:57'),
(142, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:00'),
(143, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:12'),
(144, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:17'),
(145, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:21'),
(146, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:22'),
(147, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-08 21:06:24'),
(148, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:40:31'),
(149, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:40:37'),
(150, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:40:50'),
(151, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:40:53'),
(152, 3, 'POST /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:41:18'),
(153, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:41:43'),
(154, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:41:49'),
(155, 3, 'GET /admin/estudante/profile', NULL, 'Acesso ao recurso: /admin/estudante/profile', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:19'),
(156, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:29'),
(157, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:38'),
(158, 3, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:43'),
(159, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:48'),
(160, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:42:55'),
(161, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:03'),
(162, 3, 'GET /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:05'),
(163, 3, 'POST /tesouraria/propina', NULL, 'Acesso ao recurso: /tesouraria/propina', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:17'),
(164, 3, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:32'),
(165, 3, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:44'),
(166, 3, 'GET /tesouraria/servicos', NULL, 'Acesso ao recurso: /tesouraria/servicos', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:51'),
(167, 3, 'GET /', NULL, 'Acesso ao recurso: /', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:43:53'),
(168, 3, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:00'),
(169, 3, 'POST /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:05'),
(170, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:05'),
(171, 424, 'GET /relatorios/estudantes', NULL, 'Acesso ao recurso: /relatorios/estudantes', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:28'),
(172, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:35'),
(173, 424, 'GET /relatorios/financeiro', NULL, 'Acesso ao recurso: /relatorios/financeiro', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:44:39'),
(174, 424, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:57:08'),
(175, 424, 'GET /logout', NULL, 'Acesso ao recurso: /logout', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:57:13'),
(176, 426, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:57:20'),
(177, 426, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-09 01:57:35'),
(178, 426, 'GET /tesouraria/dashboard', NULL, 'Acesso ao recurso: /tesouraria/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 19:13:18'),
(179, 426, 'GET /admin/estudante/list', NULL, 'Acesso ao recurso: /admin/estudante/list', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 19:13:29'),
(180, 4, 'GET /professor/dashboard', NULL, 'Acesso ao recurso: /professor/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 20:04:43'),
(181, 4, 'GET /professor/lancar-notas', NULL, 'Acesso ao recurso: /professor/lancar-notas', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 20:04:49'),
(182, 4, 'POST /professor/lancar-notas', NULL, 'Acesso ao recurso: /professor/lancar-notas', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 20:09:06'),
(183, 4, 'GET /admin/dashboard', NULL, 'Acesso ao recurso: /admin/dashboard', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 20:09:11'),
(184, 4, 'GET /login', NULL, 'Acesso ao recurso: /login', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, 'SUCESSO', '2026-06-21 20:09:11');

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

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_estudante`, `id_tesoureiro`, `tipo_pagamento`, `periodo_referencia`, `valor_devido`, `valor_pago`, `multa`, `data_pagamento`, `data_vencimento`, `metodo_pagamento`, `numero_recibo`, `referencia`, `comprovativo`, `status`, `observacao`) VALUES
(1, 1, 2, 'PROPINA', 'JANEIRO/2026', 10000.00, 10000.00, 0.00, '2026-06-09 01:41:18', NULL, 'DINHEIRO', 'PRP-1780969278', NULL, NULL, 'PAGO', NULL),
(2, 2, 2, 'PROPINA', 'JANEIRO/2026', 233322.00, 233322.00, 0.00, '2026-06-09 01:43:17', NULL, 'MULTICAIXA', 'PRP-1780969397', NULL, NULL, 'PAGO', NULL);

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
(3, 2, 1, 1, 60),
(4, 2, 1, 2, 60),
(5, 3, 1, 1, 90),
(6, 5, 1, 1, 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_curricular_disciplina`
--

CREATE TABLE `plano_curricular_disciplina` (
  `id_plano_curricular_disciplina` int(11) NOT NULL,
  `id_plano_curricular` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `plano_curricular_disciplina`
--

INSERT INTO `plano_curricular_disciplina` (`id_plano_curricular_disciplina`, `id_plano_curricular`, `id_disciplina`) VALUES
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

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`id_professor`, `id_funcionario`, `grau_academico`, `especialidade`) VALUES
(1, 4, 'MESTRE', 'Sistemas de Informa????o'),
(2, 5, 'DOUTOR', 'Redes e Telecomunica????es');

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
(7, 'LAB-INFO-1', 'Laborat??rios', 30),
(8, 'LAB-INFO-2', 'Laborat??rios', 30),
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
(1, 1, 1, 'INF-1A', 'MANHA', 1, 40, 40, 'Seg/Qua 08:00-10:00', '2026-06-06 14:34:38'),
(2, 1, 2, 'INF-1B', 'TARDE', 1, 35, 0, 'Seg/Qua 14:00-16:00', '2026-06-06 14:34:38'),
(3, 1, 3, 'INF-2A', 'MANHA', 2, 40, 0, 'Ter/Qui 08:00-10:00', '2026-06-06 14:34:38'),
(4, 2, 4, 'CC-1A', 'MANHA', 1, 35, 40, 'Seg/Qua 10:00-12:00', '2026-06-06 14:34:38'),
(5, 3, 5, 'CIV-1A', 'MANHA', 1, 45, 40, 'Ter/Qui 08:00-10:00', '2026-06-06 14:34:38'),
(6, 5, 6, 'ECO-1A', 'NOITE', 1, 30, 40, 'Seg/Qua 19:00-21:00', '2026-06-06 14:34:38'),
(7, 8, 7, 'DIR-1A', 'MANHA', 1, 40, 40, 'Ter/Qui 14:00-16:00', '2026-06-06 14:34:38'),
(8, 6, 8, 'GES-1A', 'TARDE', 1, 35, 40, 'Seg/Qua 16:00-18:00', '2026-06-06 14:34:38'),
(9, 4, 9, 'ELE-1A', 'MANHA', 1, 50, 40, 'Sex 08:00-12:00', '2026-06-06 14:34:38'),
(10, 7, 10, 'SOC-1A', 'NOITE', 1, 25, 40, 'Qua/Sex 19:00-21:00', '2026-06-06 14:34:38');

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
(1, 1, 'admin@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:38', NULL),
(2, 2, 'secretaria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:38', NULL),
(3, 3, 'tesouraria@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, '0:0:0:0:0:0:0:1', NULL, NULL, '2026-06-06 14:34:38', '2026-06-09 02:42:48'),
(4, 4, 'professor1@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, '0:0:0:0:0:0:0:1', NULL, NULL, '2026-06-06 14:34:38', '2026-06-21 21:04:43'),
(5, 4, 'professor2@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:38', NULL),
(6, 5, 'coordenador@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:38', NULL),
(7, 6, 'diretor@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:38', NULL),
(9, 7, 'estudante0001@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(10, 7, 'estudante0002@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(11, 7, 'estudante0003@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(12, 7, 'estudante0004@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(13, 7, 'estudante0005@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(14, 7, 'estudante0006@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(15, 7, 'estudante0007@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(16, 7, 'estudante0008@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(17, 7, 'estudante0009@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(18, 7, 'estudante0010@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(19, 7, 'estudante0011@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(20, 7, 'estudante0012@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(21, 7, 'estudante0013@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(22, 7, 'estudante0014@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(23, 7, 'estudante0015@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(24, 7, 'estudante0016@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(25, 7, 'estudante0017@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(26, 7, 'estudante0018@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(27, 7, 'estudante0019@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(28, 7, 'estudante0020@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(29, 7, 'estudante0021@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(30, 7, 'estudante0022@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(31, 7, 'estudante0023@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(32, 7, 'estudante0024@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(33, 7, 'estudante0025@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(34, 7, 'estudante0026@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(35, 7, 'estudante0027@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(36, 7, 'estudante0028@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(37, 7, 'estudante0029@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(38, 7, 'estudante0030@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(39, 7, 'estudante0031@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(40, 7, 'estudante0032@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(41, 7, 'estudante0033@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(42, 7, 'estudante0034@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(43, 7, 'estudante0035@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(44, 7, 'estudante0036@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(45, 7, 'estudante0037@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(46, 7, 'estudante0038@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(47, 7, 'estudante0039@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(48, 7, 'estudante0040@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(49, 7, 'estudante0041@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(50, 7, 'estudante0042@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(51, 7, 'estudante0043@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(52, 7, 'estudante0044@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(53, 7, 'estudante0045@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(54, 7, 'estudante0046@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(55, 7, 'estudante0047@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(56, 7, 'estudante0048@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(57, 7, 'estudante0049@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(58, 7, 'estudante0050@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(59, 7, 'estudante0051@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(60, 7, 'estudante0052@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(61, 7, 'estudante0053@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(62, 7, 'estudante0054@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(63, 7, 'estudante0055@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(64, 7, 'estudante0056@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(65, 7, 'estudante0057@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(66, 7, 'estudante0058@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(67, 7, 'estudante0059@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(68, 7, 'estudante0060@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(69, 7, 'estudante0061@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(70, 7, 'estudante0062@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(71, 7, 'estudante0063@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(72, 7, 'estudante0064@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(73, 7, 'estudante0065@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(74, 7, 'estudante0066@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(75, 7, 'estudante0067@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(76, 7, 'estudante0068@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(77, 7, 'estudante0069@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(78, 7, 'estudante0070@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(79, 7, 'estudante0071@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(80, 7, 'estudante0072@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(81, 7, 'estudante0073@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(82, 7, 'estudante0074@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(83, 7, 'estudante0075@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(84, 7, 'estudante0076@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(85, 7, 'estudante0077@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(86, 7, 'estudante0078@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(87, 7, 'estudante0079@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(88, 7, 'estudante0080@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(89, 7, 'estudante0081@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(90, 7, 'estudante0082@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(91, 7, 'estudante0083@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(92, 7, 'estudante0084@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(93, 7, 'estudante0085@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(94, 7, 'estudante0086@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(95, 7, 'estudante0087@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(96, 7, 'estudante0088@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(97, 7, 'estudante0089@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(98, 7, 'estudante0090@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(99, 7, 'estudante0091@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(100, 7, 'estudante0092@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(101, 7, 'estudante0093@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(102, 7, 'estudante0094@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(103, 7, 'estudante0095@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(104, 7, 'estudante0096@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(105, 7, 'estudante0097@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(106, 7, 'estudante0098@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(107, 7, 'estudante0099@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(108, 7, 'estudante0100@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(109, 7, 'estudante0101@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(110, 7, 'estudante0102@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(111, 7, 'estudante0103@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(112, 7, 'estudante0104@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(113, 7, 'estudante0105@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(114, 7, 'estudante0106@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(115, 7, 'estudante0107@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(116, 7, 'estudante0108@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(117, 7, 'estudante0109@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(118, 7, 'estudante0110@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(119, 7, 'estudante0111@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(120, 7, 'estudante0112@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(121, 7, 'estudante0113@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(122, 7, 'estudante0114@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(123, 7, 'estudante0115@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(124, 7, 'estudante0116@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(125, 7, 'estudante0117@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(126, 7, 'estudante0118@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(127, 7, 'estudante0119@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(128, 7, 'estudante0120@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(129, 7, 'estudante0121@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(130, 7, 'estudante0122@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(131, 7, 'estudante0123@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(132, 7, 'estudante0124@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(133, 7, 'estudante0125@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(134, 7, 'estudante0126@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(135, 7, 'estudante0127@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(136, 7, 'estudante0128@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(137, 7, 'estudante0129@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(138, 7, 'estudante0130@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(139, 7, 'estudante0131@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(140, 7, 'estudante0132@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(141, 7, 'estudante0133@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(142, 7, 'estudante0134@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(143, 7, 'estudante0135@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(144, 7, 'estudante0136@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(145, 7, 'estudante0137@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(146, 7, 'estudante0138@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(147, 7, 'estudante0139@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(148, 7, 'estudante0140@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(149, 7, 'estudante0141@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(150, 7, 'estudante0142@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(151, 7, 'estudante0143@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(152, 7, 'estudante0144@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(153, 7, 'estudante0145@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(154, 7, 'estudante0146@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(155, 7, 'estudante0147@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(156, 7, 'estudante0148@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(157, 7, 'estudante0149@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(158, 7, 'estudante0150@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(159, 7, 'estudante0151@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(160, 7, 'estudante0152@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(161, 7, 'estudante0153@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(162, 7, 'estudante0154@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(163, 7, 'estudante0155@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(164, 7, 'estudante0156@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(165, 7, 'estudante0157@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(166, 7, 'estudante0158@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(167, 7, 'estudante0159@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(168, 7, 'estudante0160@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(169, 7, 'estudante0161@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(170, 7, 'estudante0162@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(171, 7, 'estudante0163@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(172, 7, 'estudante0164@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(173, 7, 'estudante0165@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(174, 7, 'estudante0166@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(175, 7, 'estudante0167@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(176, 7, 'estudante0168@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(177, 7, 'estudante0169@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(178, 7, 'estudante0170@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(179, 7, 'estudante0171@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(180, 7, 'estudante0172@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(181, 7, 'estudante0173@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(182, 7, 'estudante0174@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(183, 7, 'estudante0175@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(184, 7, 'estudante0176@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(185, 7, 'estudante0177@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(186, 7, 'estudante0178@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(187, 7, 'estudante0179@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(188, 7, 'estudante0180@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(189, 7, 'estudante0181@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(190, 7, 'estudante0182@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(191, 7, 'estudante0183@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(192, 7, 'estudante0184@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(193, 7, 'estudante0185@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(194, 7, 'estudante0186@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(195, 7, 'estudante0187@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(196, 7, 'estudante0188@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(197, 7, 'estudante0189@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(198, 7, 'estudante0190@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(199, 7, 'estudante0191@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(200, 7, 'estudante0192@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(201, 7, 'estudante0193@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(202, 7, 'estudante0194@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(203, 7, 'estudante0195@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(204, 7, 'estudante0196@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(205, 7, 'estudante0197@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(206, 7, 'estudante0198@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(207, 7, 'estudante0199@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(208, 7, 'estudante0200@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(209, 7, 'estudante0201@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(210, 7, 'estudante0202@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(211, 7, 'estudante0203@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(212, 7, 'estudante0204@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(213, 7, 'estudante0205@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(214, 7, 'estudante0206@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(215, 7, 'estudante0207@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(216, 7, 'estudante0208@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(217, 7, 'estudante0209@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(218, 7, 'estudante0210@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(219, 7, 'estudante0211@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(220, 7, 'estudante0212@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(221, 7, 'estudante0213@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(222, 7, 'estudante0214@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(223, 7, 'estudante0215@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(224, 7, 'estudante0216@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(225, 7, 'estudante0217@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(226, 7, 'estudante0218@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(227, 7, 'estudante0219@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(228, 7, 'estudante0220@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(229, 7, 'estudante0221@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(230, 7, 'estudante0222@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(231, 7, 'estudante0223@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(232, 7, 'estudante0224@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(233, 7, 'estudante0225@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(234, 7, 'estudante0226@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(235, 7, 'estudante0227@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(236, 7, 'estudante0228@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(237, 7, 'estudante0229@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(238, 7, 'estudante0230@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(239, 7, 'estudante0231@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(240, 7, 'estudante0232@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(241, 7, 'estudante0233@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(242, 7, 'estudante0234@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(243, 7, 'estudante0235@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(244, 7, 'estudante0236@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(245, 7, 'estudante0237@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(246, 7, 'estudante0238@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(247, 7, 'estudante0239@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(248, 7, 'estudante0240@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(249, 7, 'estudante0241@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(250, 7, 'estudante0242@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(251, 7, 'estudante0243@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(252, 7, 'estudante0244@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(253, 7, 'estudante0245@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(254, 7, 'estudante0246@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(255, 7, 'estudante0247@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(256, 7, 'estudante0248@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(257, 7, 'estudante0249@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(258, 7, 'estudante0250@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(259, 7, 'estudante0251@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(260, 7, 'estudante0252@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(261, 7, 'estudante0253@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(262, 7, 'estudante0254@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(263, 7, 'estudante0255@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(264, 7, 'estudante0256@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(265, 7, 'estudante0257@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(266, 7, 'estudante0258@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(267, 7, 'estudante0259@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(268, 7, 'estudante0260@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(269, 7, 'estudante0261@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(270, 7, 'estudante0262@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(271, 7, 'estudante0263@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(272, 7, 'estudante0264@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(273, 7, 'estudante0265@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(274, 7, 'estudante0266@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(275, 7, 'estudante0267@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(276, 7, 'estudante0268@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(277, 7, 'estudante0269@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(278, 7, 'estudante0270@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(279, 7, 'estudante0271@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(280, 7, 'estudante0272@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(281, 7, 'estudante0273@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(282, 7, 'estudante0274@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(283, 7, 'estudante0275@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(284, 7, 'estudante0276@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(285, 7, 'estudante0277@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(286, 7, 'estudante0278@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(287, 7, 'estudante0279@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(288, 7, 'estudante0280@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(289, 7, 'estudante0281@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(290, 7, 'estudante0282@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(291, 7, 'estudante0283@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(292, 7, 'estudante0284@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(293, 7, 'estudante0285@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(294, 7, 'estudante0286@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(295, 7, 'estudante0287@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(296, 7, 'estudante0288@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(297, 7, 'estudante0289@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(298, 7, 'estudante0290@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(299, 7, 'estudante0291@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(300, 7, 'estudante0292@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(301, 7, 'estudante0293@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(302, 7, 'estudante0294@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(303, 7, 'estudante0295@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(304, 7, 'estudante0296@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(305, 7, 'estudante0297@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(306, 7, 'estudante0298@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(307, 7, 'estudante0299@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(308, 7, 'estudante0300@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(309, 7, 'estudante0301@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(310, 7, 'estudante0302@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(311, 7, 'estudante0303@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(312, 7, 'estudante0304@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(313, 7, 'estudante0305@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(314, 7, 'estudante0306@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(315, 7, 'estudante0307@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(316, 7, 'estudante0308@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(317, 7, 'estudante0309@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(318, 7, 'estudante0310@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(319, 7, 'estudante0311@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(320, 7, 'estudante0312@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL);
INSERT INTO `utilizador` (`id_utilizador`, `id_perfil`, `email`, `password_hash`, `status`, `tentativas_login`, `ultimo_ip`, `token_reset`, `token_expiracao`, `data_criacao`, `data_ultimo_acesso`) VALUES
(321, 7, 'estudante0313@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(322, 7, 'estudante0314@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(323, 7, 'estudante0315@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(324, 7, 'estudante0316@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(325, 7, 'estudante0317@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(326, 7, 'estudante0318@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(327, 7, 'estudante0319@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(328, 7, 'estudante0320@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(329, 7, 'estudante0321@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(330, 7, 'estudante0322@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(331, 7, 'estudante0323@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(332, 7, 'estudante0324@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(333, 7, 'estudante0325@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(334, 7, 'estudante0326@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(335, 7, 'estudante0327@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(336, 7, 'estudante0328@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(337, 7, 'estudante0329@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(338, 7, 'estudante0330@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(339, 7, 'estudante0331@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(340, 7, 'estudante0332@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(341, 7, 'estudante0333@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(342, 7, 'estudante0334@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(343, 7, 'estudante0335@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(344, 7, 'estudante0336@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(345, 7, 'estudante0337@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(346, 7, 'estudante0338@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(347, 7, 'estudante0339@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(348, 7, 'estudante0340@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(349, 7, 'estudante0341@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(350, 7, 'estudante0342@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(351, 7, 'estudante0343@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(352, 7, 'estudante0344@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(353, 7, 'estudante0345@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(354, 7, 'estudante0346@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(355, 7, 'estudante0347@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(356, 7, 'estudante0348@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(357, 7, 'estudante0349@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(358, 7, 'estudante0350@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(359, 7, 'estudante0351@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(360, 7, 'estudante0352@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(361, 7, 'estudante0353@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(362, 7, 'estudante0354@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(363, 7, 'estudante0355@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(364, 7, 'estudante0356@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(365, 7, 'estudante0357@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(366, 7, 'estudante0358@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(367, 7, 'estudante0359@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(368, 7, 'estudante0360@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(369, 7, 'estudante0361@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(370, 7, 'estudante0362@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(371, 7, 'estudante0363@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(372, 7, 'estudante0364@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(373, 7, 'estudante0365@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(374, 7, 'estudante0366@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(375, 7, 'estudante0367@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(376, 7, 'estudante0368@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(377, 7, 'estudante0369@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(378, 7, 'estudante0370@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(379, 7, 'estudante0371@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(380, 7, 'estudante0372@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(381, 7, 'estudante0373@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(382, 7, 'estudante0374@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(383, 7, 'estudante0375@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(384, 7, 'estudante0376@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(385, 7, 'estudante0377@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(386, 7, 'estudante0378@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(387, 7, 'estudante0379@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(388, 7, 'estudante0380@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(389, 7, 'estudante0381@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(390, 7, 'estudante0382@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(391, 7, 'estudante0383@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(392, 7, 'estudante0384@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(393, 7, 'estudante0385@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(394, 7, 'estudante0386@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(395, 7, 'estudante0387@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(396, 7, 'estudante0388@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(397, 7, 'estudante0389@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(398, 7, 'estudante0390@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(399, 7, 'estudante0391@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(400, 7, 'estudante0392@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(401, 7, 'estudante0393@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(402, 7, 'estudante0394@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(403, 7, 'estudante0395@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(404, 7, 'estudante0396@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(405, 7, 'estudante0397@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(406, 7, 'estudante0398@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(407, 7, 'estudante0399@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(408, 7, 'estudante0400@ojj.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:34:39', NULL),
(421, 7, 'petelson@gmail.com', '$2a$12$ihBeyqxRDfpZcR/x4I91/eW8aAIDQmp5LdAlG0.UGvH003vzjZsQa', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:40:17', NULL),
(423, 7, 'miguel@gmail.com', '$2a$12$k52aYQziofpwT1A5vy8GEuvEkJopGHE4kF2Z4dlknuN1uDubT.A5u', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:44:35', NULL),
(424, 1, 'admin', 'Admin@123', 'ATIVO', 0, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, '2026-06-09 02:44:05'),
(425, 2, 'funcionario', 'Funcionario@123', 'ATIVO', 0, NULL, NULL, NULL, NULL, NULL),
(426, 3, 'estudante', 'Estudante@123', 'ATIVO', 0, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, '2026-06-21 20:13:17'),
(427, 7, 'sebastiao@gmail.com', '$2a$12$WamdkYyBFUmoI7IWlY8h2OoOJ0/SJOj0PhUrTLewmKxnNZU9nhpm.', 'ATIVO', 0, NULL, NULL, NULL, '2026-06-06 14:48:34', NULL),
(428, 7, 'mariano@gmail.com', '$2a$12$Av7G.YHPKlxfcFMCYg24J.BjnGE9VvqALmPXNhN8/uHizky.cbvrS', NULL, 0, NULL, NULL, NULL, '2026-06-06 15:37:57', NULL);

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
  MODIFY `id_estudante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT de tabela `frequencia`
--
ALTER TABLE `frequencia`
  MODIFY `id_frequencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `historico_academico`
--
ALTER TABLE `historico_academico`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;

--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `operacao_log`
--
ALTER TABLE `operacao_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_plano_curricular_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

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
