CREATE DATABASE  IF NOT EXISTS `universidade_vanguarda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidade_vanguarda`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: universidade_vanguarda
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_alunos`
--

DROP TABLE IF EXISTS `tbl_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(100) NOT NULL,
  `cpf_aluno` varchar(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email_aluno` varchar(100) DEFAULT NULL,
  `telefone_aluno` varchar(15) DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `cpf_aluno` (`cpf_aluno`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `tbl_alunos_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tbl_cursos` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alunos`
--

LOCK TABLES `tbl_alunos` WRITE;
/*!40000 ALTER TABLE `tbl_alunos` DISABLE KEYS */;
INSERT INTO `tbl_alunos` VALUES (1,'Pedro Santos','98765432100','2001-02-25','pedro.santos@example.com','11987654330',1),(2,'Lucas Lima','87654321001','2000-08-15','lucas.lima@example.com','11987654331',2),(3,'Larissa Melo','76543210987','1999-10-30','larissa.melo@example.com','11987654332',3),(4,'Juliana Costa','65432109876','2002-04-18','juliana.costa@example.com','11987654333',1),(5,'Mariana Almeida','54321098765','2001-12-20','mariana.almeida@example.com','11987654334',4);
/*!40000 ALTER TABLE `tbl_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cursos`
--

DROP TABLE IF EXISTS `tbl_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) NOT NULL,
  `descricao` text,
  `carga_horaria` int NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cursos`
--

LOCK TABLES `tbl_cursos` WRITE;
/*!40000 ALTER TABLE `tbl_cursos` DISABLE KEYS */;
INSERT INTO `tbl_cursos` VALUES (1,'Engenharia de Software','Curso focado em desenvolvimento de software',4000),(2,'Administração','Curso de gestão e administração de empresas',3600),(3,'Direito','Curso de ciências jurídicas',4500),(4,'Medicina','Curso de ciências médicas',6000),(5,'Psicologia','Curso de ciências psicológicas',4000);
/*!40000 ALTER TABLE `tbl_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materias`
--

DROP TABLE IF EXISTS `tbl_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nome_materia` varchar(100) NOT NULL,
  `carga_horaria` int NOT NULL,
  `id_curso` int DEFAULT NULL,
  `id_professor` int DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_curso` (`id_curso`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `tbl_materias_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tbl_cursos` (`id_curso`),
  CONSTRAINT `tbl_materias_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tbl_professores` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materias`
--

LOCK TABLES `tbl_materias` WRITE;
/*!40000 ALTER TABLE `tbl_materias` DISABLE KEYS */;
INSERT INTO `tbl_materias` VALUES (1,'Introdução à Programação',80,1,1),(2,'Gestão Empresarial',60,2,2),(3,'Direito Constitucional',100,3,3),(4,'Anatomia Humana',120,4,4),(5,'Psicologia Geral',90,5,5),(6,'Banco de Dados',60,1,1),(7,'Marketing',60,2,2),(8,'Direito Penal',100,3,3),(9,'Fisiologia',120,4,4),(10,'Psicologia do Desenvolvimento',90,5,5);
/*!40000 ALTER TABLE `tbl_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matriculas`
--

DROP TABLE IF EXISTS `tbl_matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_matriculas` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int DEFAULT NULL,
  `id_turma` int DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_turma` (`id_turma`),
  CONSTRAINT `tbl_matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_alunos` (`id_aluno`),
  CONSTRAINT `tbl_matriculas_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `tbl_turmas` (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matriculas`
--

LOCK TABLES `tbl_matriculas` WRITE;
/*!40000 ALTER TABLE `tbl_matriculas` DISABLE KEYS */;
INSERT INTO `tbl_matriculas` VALUES (1,1,1,'2023-02-01'),(2,2,2,'2023-02-01'),(3,3,3,'2023-08-01'),(4,4,4,'2023-08-01'),(5,5,5,'2024-02-01'),(6,1,6,'2024-02-01'),(7,2,7,'2024-08-01'),(8,3,8,'2024-08-01'),(9,4,9,'2024-08-01'),(10,5,10,'2024-02-01');
/*!40000 ALTER TABLE `tbl_matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notas`
--

DROP TABLE IF EXISTS `tbl_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notas` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int DEFAULT NULL,
  `nota` decimal(5,2) NOT NULL,
  `data_lancamento` date DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_matricula` (`id_matricula`),
  CONSTRAINT `tbl_notas_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `tbl_matriculas` (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notas`
--

LOCK TABLES `tbl_notas` WRITE;
/*!40000 ALTER TABLE `tbl_notas` DISABLE KEYS */;
INSERT INTO `tbl_notas` VALUES (1,1,8.50,'2023-06-15'),(2,2,7.80,'2023-06-15'),(3,3,9.00,'2023-12-10'),(4,4,6.70,'2023-12-10'),(5,5,8.00,'2024-06-20'),(6,6,7.50,'2024-06-20'),(7,7,8.30,'2024-12-18'),(8,8,9.10,'2024-12-18'),(9,9,6.80,'2024-12-18'),(10,10,7.20,'2024-06-20');
/*!40000 ALTER TABLE `tbl_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_professores`
--

DROP TABLE IF EXISTS `tbl_professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_professores` (
  `id_professor` int NOT NULL AUTO_INCREMENT,
  `nome_professor` varchar(100) NOT NULL,
  `cpf_professor` varchar(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email_professor` varchar(100) DEFAULT NULL,
  `telefone_professor` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE KEY `cpf_professor` (`cpf_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_professores`
--

LOCK TABLES `tbl_professores` WRITE;
/*!40000 ALTER TABLE `tbl_professores` DISABLE KEYS */;
INSERT INTO `tbl_professores` VALUES (1,'Carlos Silva','12345678901','1980-03-15','carlos.silva@example.com','11987654321'),(2,'Maria Oliveira','23456789012','1975-07-22','maria.oliveira@example.com','11987654322'),(3,'João Pereira','34567890123','1983-05-12','joao.pereira@example.com','11987654323'),(4,'Ana Souza','45678901234','1990-09-01','ana.souza@example.com','11987654324'),(5,'Roberto Costa','56789012345','1985-11-03','roberto.costa@example.com','11987654325');
/*!40000 ALTER TABLE `tbl_professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_turmas`
--

DROP TABLE IF EXISTS `tbl_turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_turmas` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `ano` year NOT NULL,
  `semestre` tinyint NOT NULL,
  `id_materia` int DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `tbl_turmas_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `tbl_materias` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_turmas`
--

LOCK TABLES `tbl_turmas` WRITE;
/*!40000 ALTER TABLE `tbl_turmas` DISABLE KEYS */;
INSERT INTO `tbl_turmas` VALUES (1,2023,1,1),(2,2023,1,2),(3,2023,2,3),(4,2023,2,4),(5,2024,1,5),(6,2024,1,6),(7,2024,2,7),(8,2024,2,8),(9,2024,2,9),(10,2024,1,10);
/*!40000 ALTER TABLE `tbl_turmas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-04 22:12:52
