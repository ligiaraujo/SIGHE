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


-- Copiando estrutura para tabela sighe.consulta
CREATE TABLE IF NOT EXISTS `consulta` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) DEFAULT NULL,
  `medico` varchar(50) DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idConsulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.consulta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.ginasio
CREATE TABLE IF NOT EXISTS `ginasio` (
  `idGinasio` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) DEFAULT NULL,
  `tipoEsporte` varchar(50) DEFAULT NULL,
  `qtdBolas` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGinasio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.ginasio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ginasio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ginasio` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.laboratorio
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `matriculaAluno` varchar(50) DEFAULT NULL,
  `matriculaProfessor` varchar(50) DEFAULT NULL,
  `aprovacao` tinyint(4) DEFAULT NULL,
  `laboratorio` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.laboratorio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.refeicao
CREATE TABLE IF NOT EXISTS `refeicao` (
  `idRefeicao` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `justificativa` varchar(100) DEFAULT NULL,
  `data` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idRefeicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.refeicao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `refeicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `refeicao` ENABLE KEYS */;


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
  `curso` varchar(50) DEFAULT NULL,
  `setor` varchar(50) DEFAULT NULL,
  `adm` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.usuario: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `tipoUsuario`, `senha`, `nome`, `matricula`, `dataNasc`, `email`, `telefone`, `cpf`, `sexo`, `curso`, `setor`, `adm`) VALUES
	(1, 'Aluno', '123', 'Wisley Hudson', '20101', NULL, 'wisley@gmail.com', NULL, '1111111000', 'Masculino', 'Informática', 'null', 0),
	(2, 'Professor', '321', 'Auguto', '20102', NULL, NULL, NULL, NULL, 'Masculino', 'Informática', NULL, 0),
	(3, 'Funcionário', 'qwe', 'Augustinho', '20103', NULL, 'null', NULL, '99999', NULL, 'null', 'null', 1),
	(4, 'Aluno', '000', 'Lígia Maria', '20111', '2015-04-14', 'ligia@maria.com', '00000000', '0000000000', 'Feminino', 'Informática', NULL, 0),
	(5, 'Aluno', 'ewq', 'Edson', '342545645', '2015-04-15', 'wisley@gmail.com', '(44) 4444-4444', '444.444.444-44', 'Feminino', 'Energias Renováveis', NULL, 0),
	(6, 'Professor', 'kk', 'joao', '3335', '2015-04-13', 'edmbike@gmail.com', '(22) 2222-2222', '988.888.888-88', 'Masculino', 'Física', NULL, 0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
