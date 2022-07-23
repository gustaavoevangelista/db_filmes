-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Jul-2022 às 13:25
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `filmes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ator`
--

CREATE TABLE `ator` (
  `codA` decimal(10,0) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `idade` int(11) DEFAULT NULL,
  `morada` varchar(100) DEFAULT NULL,
  `codAtu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atuacao`
--

CREATE TABLE `atuacao` (
  `codAtu` decimal(10,0) NOT NULL,
  `codF` decimal(10,0) NOT NULL,
  `codA` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custo`
--

CREATE TABLE `custo` (
  `codF` decimal(10,0) NOT NULL,
  `descricao` char(100) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme`
--

CREATE TABLE `filme` (
  `codF` decimal(10,0) NOT NULL,
  `codRea` decimal(10,0) NOT NULL,
  `nome` char(30) NOT NULL,
  `data_estreia` date DEFAULT NULL,
  `ano` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `codF` decimal(10,0) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `nome` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `realizacao`
--

CREATE TABLE `realizacao` (
  `codRea` decimal(10,0) NOT NULL,
  `codR` decimal(10,0) NOT NULL,
  `codF` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `realizador`
--

CREATE TABLE `realizador` (
  `codR` decimal(10,0) NOT NULL,
  `codRea` decimal(10,0) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `idade` decimal(10,0) DEFAULT NULL CHECK (`idade` >= 18),
  `morada` char(100) NOT NULL,
  `cc` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ator`
--
ALTER TABLE `ator`
  ADD PRIMARY KEY (`codA`),
  ADD UNIQUE KEY `codA` (`codA`),
  ADD UNIQUE KEY `codAtu` (`codAtu`);

--
-- Índices para tabela `atuacao`
--
ALTER TABLE `atuacao`
  ADD PRIMARY KEY (`codAtu`),
  ADD UNIQUE KEY `codAtu` (`codAtu`),
  ADD UNIQUE KEY `codF` (`codF`),
  ADD UNIQUE KEY `codA` (`codA`);

--
-- Índices para tabela `custo`
--
ALTER TABLE `custo`
  ADD UNIQUE KEY `codF` (`codF`);

--
-- Índices para tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`codF`),
  ADD UNIQUE KEY `codF` (`codF`),
  ADD UNIQUE KEY `codRea` (`codRea`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD UNIQUE KEY `codF` (`codF`);

--
-- Índices para tabela `realizacao`
--
ALTER TABLE `realizacao`
  ADD PRIMARY KEY (`codRea`),
  ADD UNIQUE KEY `codRea` (`codRea`),
  ADD UNIQUE KEY `codR` (`codR`),
  ADD UNIQUE KEY `codF` (`codF`);

--
-- Índices para tabela `realizador`
--
ALTER TABLE `realizador`
  ADD PRIMARY KEY (`codR`),
  ADD UNIQUE KEY `codRea` (`codRea`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `cc` (`cc`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ator`
--
ALTER TABLE `ator`
  ADD CONSTRAINT `ator_ibfk_1` FOREIGN KEY (`codAtu`) REFERENCES `atuacao` (`codAtu`);

--
-- Limitadores para a tabela `atuacao`
--
ALTER TABLE `atuacao`
  ADD CONSTRAINT `atuacao_ibfk_1` FOREIGN KEY (`codF`) REFERENCES `filme` (`codF`),
  ADD CONSTRAINT `atuacao_ibfk_2` FOREIGN KEY (`codA`) REFERENCES `ator` (`codA`);

--
-- Limitadores para a tabela `custo`
--
ALTER TABLE `custo`
  ADD CONSTRAINT `custo_ibfk_1` FOREIGN KEY (`codF`) REFERENCES `filme` (`codF`);

--
-- Limitadores para a tabela `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`codRea`) REFERENCES `realizacao` (`codRea`);

--
-- Limitadores para a tabela `genero`
--
ALTER TABLE `genero`
  ADD CONSTRAINT `genero_ibfk_1` FOREIGN KEY (`codF`) REFERENCES `filme` (`codF`);

--
-- Limitadores para a tabela `realizacao`
--
ALTER TABLE `realizacao`
  ADD CONSTRAINT `realizacao_ibfk_1` FOREIGN KEY (`codR`) REFERENCES `realizador` (`codR`),
  ADD CONSTRAINT `realizacao_ibfk_2` FOREIGN KEY (`codF`) REFERENCES `filme` (`codF`);

--
-- Limitadores para a tabela `realizador`
--
ALTER TABLE `realizador`
  ADD CONSTRAINT `realizador_ibfk_1` FOREIGN KEY (`codRea`) REFERENCES `realizacao` (`codRea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
