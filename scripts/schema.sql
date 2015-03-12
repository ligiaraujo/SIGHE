-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.22-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para sighe
CREATE DATABASE IF NOT EXISTS `sighe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sighe`;


-- Copiando estrutura para tabela sighe.constmed
CREATE TABLE IF NOT EXISTS `constmed` (
  `idCons` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `espMed` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela sighe.esporte
CREATE TABLE IF NOT EXISTS `esporte` (
  `idEsporte` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `tipoEsporte` varchar(50) DEFAULT NULL,
  `qtdBolas` varchar(50) DEFAULT NULL,
  `turno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEsporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela sighe.laboratorio
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `tipoLaboratorio` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela sighe.refeicao
CREATE TABLE IF NOT EXISTS `refeicao` (
  `idRefeicao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `tipoRefeicao` varchar(50) DEFAULT NULL,
  `justificativa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRefeicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela sighe.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `dataNasc` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
