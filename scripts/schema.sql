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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.consulta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`idConsulta`, `matricula`, `medico`, `hora`, `data`) VALUES
	(8, '20103', 'Médico Clínico Geral', '55h55', '2015-05-05'),
	(9, '20101', 'Psicólogo', '13h00', '2015-05-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.ginasio: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ginasio` DISABLE KEYS */;
INSERT INTO `ginasio` (`idGinasio`, `matricula`, `tipoEsporte`, `qtdBolas`, `horario`, `data`) VALUES
	(1, '20101', 'Handball', '2', '14h30 às 16h00', '2015-05-11'),
	(2, '20101', 'Vôlei', '1', '00h00 às 12h33', '2015-05-05'),
	(3, '20101', 'Handball', '2', '00h00 às 09h99', '2015-05-11'),
	(6, '20103', 'Vôlei', '1', '11h11 às 12h22', '2015-05-19'),
	(7, '20101', 'Handball', '2', '10h00 às 11h00', '2015-05-04');
/*!40000 ALTER TABLE `ginasio` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.laboratorio
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `matriculaAluno` varchar(50) DEFAULT NULL,
  `matriculaProfessor` varchar(50) DEFAULT NULL,
  `aprovacao` varchar(50) DEFAULT NULL,
  `laboratorio` varchar(50) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `turno` varchar(50) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.laboratorio: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` (`idLaboratorio`, `matriculaAluno`, `matriculaProfessor`, `aprovacao`, `laboratorio`, `horario`, `turno`, `data`) VALUES
	(2, '20101', '20102', '-', 'Química', '5º, 6º', 'Manhã', '2015-05-12'),
	(9, '20103', '20102', '-', 'Manutenção', '2º', 'Manhã', '2015-05-03'),
	(10, '20103', '3335', '-', 'Informática III', '1º, 2º, 3º, 4º, 5º, 6º', 'Manhã', '2015-05-05'),
	(11, '20101', '20102', '-', 'Redes', '1º', 'Tarde', '2015-05-10');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.refeicao
CREATE TABLE IF NOT EXISTS `refeicao` (
  `idRefeicao` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `justificativa` varchar(100) DEFAULT NULL,
  `data` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idRefeicao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.refeicao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `refeicao` DISABLE KEYS */;
INSERT INTO `refeicao` (`idRefeicao`, `matricula`, `tipo`, `justificativa`, `data`) VALUES
	(1, '20101', 'Jantar', ' TCC.', '2015-05-04'),
	(7, '20101', 'Almoço', ' Reunião de grupo.', '2015-05-03');
/*!40000 ALTER TABLE `refeicao` ENABLE KEYS */;


-- Copiando estrutura para tabela sighe.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `dataNasc` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela sighe.usuario: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `tipo`, `nome`, `matricula`, `senha`, `dataNasc`, `email`, `telefone`, `cpf`, `sexo`, `curso`, `funcao`) VALUES
	(1, 'Aluno', 'Wisley Hudson Soares Silva', '20101', '123', '2015-04-14', 'wisley@gmail.com', '(22) 2222-2222', '000.000.000-00', 'Masculino', 'Informática', '-'),
	(2, 'Professor', 'Augusto', '20102', '321', '2015-04-14', 'augusto@gmail.com', '(22) 2222-2222', '444.444.444-44', 'Masculino', 'Informática', '-'),
	(3, 'Funcionário', 'Augustinho', '20103', 'qwe', '2015-04-14', 'augustinho@gmail.com', '(22) 2222-2222', '000.222.444-22', 'Masculino', '-', 'Administrador'),
	(4, 'Aluno', 'Lígia Maria', '20111', '000', '2015-04-14', 'ligia@maria.com', '(22) 2222-2222', '000.000.000-00', 'Feminino', 'Informática', '-'),
	(5, 'Aluno', 'Edson', '342545645', '000', '2015-04-15', 'wisley@gmail.com', '(44) 4444-4444', '444.444.444-44', 'Feminino', 'Energias Renováveis', '-'),
	(6, 'Professor', 'João', '3335', '000', '2015-04-13', 'joao@gmail.com', '(09) 0909-0909', '988.888.888-88', 'Masculino', 'Física', '-'),
	(7, 'Aluno', 'novoAluno', '00001', '1', '1994-05-31', '1@gmail.com', '(00) 0000-0000', '000.000.000-00', 'Feminino', 'Física', '-'),
	(8, 'Professor', 'novoProfessor', '00002', '1', '1998-05-18', '1@gmail.com', '(77) 7777-7777', '333.333.333-33', 'Masculino', 'Eletrotécnica', '-'),
	(9, 'Funcionário', 'Lúcia', '00003', '1', '1986-01-13', 'p@gmail.com', '(55) 5555-5555', '000.000.000-00', 'Masculino', '-', 'Gerente de Ginásio'),
	(10, 'Funcionário', 'Abrantes', '0004', '1', '2015-05-26', 'wisley@gmail.com', '(88) 8888-8888', '000.000.000-00', 'Feminino', '-', 'Gerente de Refeição');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
