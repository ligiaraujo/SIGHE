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
-- Copiando dados para a tabela sighe.constmed: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `constmed` DISABLE KEYS */;
INSERT INTO `constmed` (`idCons`, `nome`, `matricula`, `curso`, `espMed`, `horario`) VALUES
	(4, 'Ligia', '20111064010628', 'Informatica', 'Médico Clínico Geral', '16h30');
/*!40000 ALTER TABLE `constmed` ENABLE KEYS */;

-- Copiando dados para a tabela sighe.esporte: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `esporte` DISABLE KEYS */;
INSERT INTO `esporte` (`idEsporte`, `nome`, `matricula`, `horario`, `tipoEsporte`, `qtdBolas`, `turno`) VALUES
	(10, 'Ligia Maria', '20111064010628', '14h00', 'VÃ´lei', '1', 'Tarde');
/*!40000 ALTER TABLE `esporte` ENABLE KEYS */;

-- Copiando dados para a tabela sighe.laboratorio: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` (`idLaboratorio`, `nome`, `matricula`, `tipoLaboratorio`, `horario`) VALUES
	(10, 'Ligia Maria', '20111111111111', 'Biologia', '15h30');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;

-- Copiando dados para a tabela sighe.refeicao: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `refeicao` DISABLE KEYS */;
INSERT INTO `refeicao` (`idRefeicao`, `nome`, `matricula`, `tipoRefeicao`, `justificativa`) VALUES
	(4, 'Ligia Maria', '20111064010628', 'Jantar', 'TCC');
/*!40000 ALTER TABLE `refeicao` ENABLE KEYS */;

-- Copiando dados para a tabela sighe.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `tipoUsuario`, `senha`, `nome`, `matricula`, `dataNasc`, `email`, `telefone`, `cpf`, `sexo`) VALUES
	(1, 'Aluno', '12345', 'Ligia Maria de Araujo Moura', '20111064010628', '1995-09-15', 'maria_ligia16@hotmail.com', '(84) 9117-5093', '017.594.214-56', 'Feminino'),
	(3, 'Aluno', 'wisleyh', 'Wisley Hudson Soares Silva', '20101064010400', '1994-10-26', 'wisleyhudson@outlook.com', '(84) 9457-1645', '098.700.564-23', 'Masculino');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
