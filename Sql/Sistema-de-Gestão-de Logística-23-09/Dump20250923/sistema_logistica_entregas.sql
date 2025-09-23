-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_logistica
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motorista_cnh` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `veiculo_placa` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rota_id` int DEFAULT NULL,
  `data_saida` datetime DEFAULT NULL,
  `previsao` datetime DEFAULT NULL,
  `entrega_real` datetime DEFAULT NULL,
  `status` enum('planejada','em_andamento','concluida','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'planejada',
  `registrado_por` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entregas_cliente` (`cliente_cnpj`),
  KEY `fk_entregas_motorista` (`motorista_cnh`),
  KEY `fk_entregas_veiculo` (`veiculo_placa`),
  KEY `fk_entregas_rota` (`rota_id`),
  KEY `fk_entregas_registrado_por` (`registrado_por`),
  KEY `idx_entregas_status_data` (`status`,`data_saida`),
  CONSTRAINT `fk_entregas_cliente` FOREIGN KEY (`cliente_cnpj`) REFERENCES `clientes` (`cnpj`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_entregas_motorista` FOREIGN KEY (`motorista_cnh`) REFERENCES `motoristas` (`cnh`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_entregas_registrado_por` FOREIGN KEY (`registrado_por`) REFERENCES `funcionarios_adm` (`matricula`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_entregas_rota` FOREIGN KEY (`rota_id`) REFERENCES `rotas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_entregas_veiculo` FOREIGN KEY (`veiculo_placa`) REFERENCES `veiculos` (`placa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,'00.000.000/0001-01','CNH-0001','ABC1D23',1,'2025-09-01 06:00:00','2025-09-01 12:00:00','2025-09-01 11:30:00','concluida','MATR-001'),(2,'11.111.111/0001-11','CNH-0002','BCD2E34',2,'2025-08-10 07:00:00','2025-08-11 03:00:00',NULL,'em_andamento','MATR-002'),(3,'22.222.222/0001-22','CNH-0003','CDE3F45',3,'2025-07-15 09:00:00','2025-07-15 12:00:00','2025-07-15 13:30:00','concluida','MATR-003'),(4,'33.333.333/0001-33','CNH-0004','DEF4G56',4,'2025-09-10 04:00:00','2025-09-10 14:00:00',NULL,'em_andamento','MATR-001'),(5,'44.444.444/0001-44','CNH-0005','EFG5H67',5,'2025-08-01 05:00:00','2025-08-02 19:00:00','2025-08-02 20:30:00','concluida','MATR-002'),(6,'55.555.555/0001-55','CNH-0006','FGH6I78',6,'2025-09-11 10:00:00','2025-09-11 19:00:00',NULL,'em_andamento','MATR-003'),(7,'66.666.666/0001-66','CNH-0007','GHI7J89',7,'2025-06-20 08:00:00','2025-06-20 10:00:00','2025-06-20 10:00:00','concluida','MATR-004'),(8,'77.777.777/0001-77','CNH-0008','HIJ8K90',8,'2025-07-02 05:30:00','2025-07-02 11:30:00','2025-07-02 12:45:00','concluida','MATR-001'),(9,'88.888.888/0001-88','CNH-0001','ABC1D23',1,'2025-09-12 06:00:00','2025-09-12 12:00:00',NULL,'em_andamento','MATR-003'),(10,'99.999.999/0001-99','CNH-0002','BCD2E34',2,'2025-05-10 07:00:00','2025-05-11 03:00:00','2025-05-11 01:50:00','concluida','MATR-002'),(11,'00.000.000/0001-01','CNH-0003','CDE3F45',3,'2025-04-15 09:00:00','2025-04-15 12:00:00','2025-04-15 12:05:00','concluida','MATR-002'),(12,'11.111.111/0001-11','CNH-0004','DEF4G56',4,'2025-03-18 04:00:00','2025-03-18 14:00:00','2025-03-18 15:30:00','concluida','MATR-001'),(13,'22.222.222/0001-22','CNH-0005','EFG5H67',5,'2025-02-01 05:00:00','2025-02-02 19:00:00','2025-02-02 21:00:00','concluida','MATR-001'),(14,'33.333.333/0001-33','CNH-0006','FGH6I78',6,'2025-05-11 10:00:00','2025-05-11 19:00:00','2025-05-11 19:45:00','concluida','MATR-004'),(15,'44.444.444/0001-44','CNH-0007','GHI7J89',7,'2025-09-14 08:00:00','2025-09-14 10:00:00',NULL,'em_andamento','MATR-002'),(16,'55.555.555/0001-55','CNH-0008','HIJ8K90',8,'2025-01-02 05:30:00','2025-01-02 11:30:00','2025-01-02 11:00:00','concluida','MATR-003'),(17,'66.666.666/0001-66','CNH-0001','ABC1D23',1,'2025-09-05 06:00:00','2025-09-05 12:00:00',NULL,'em_andamento','MATR-001'),(18,'77.777.777/0001-77','CNH-0002','BCD2E34',2,'2025-07-20 07:00:00','2025-07-21 03:00:00','2025-07-21 04:10:00','concluida','MATR-002'),(19,'88.888.888/0001-88','CNH-0003','CDE3F45',3,'2025-08-20 09:00:00','2025-08-20 12:00:00','2025-08-20 11:59:00','concluida','MATR-004');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 16:59:16
