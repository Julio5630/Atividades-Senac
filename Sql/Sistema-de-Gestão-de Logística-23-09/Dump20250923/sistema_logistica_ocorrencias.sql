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
-- Table structure for table `ocorrencias`
--

DROP TABLE IF EXISTS `ocorrencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entrega_id` int NOT NULL,
  `tipo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `data_ocorrencia` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ocorrencias_entrega` (`entrega_id`),
  CONSTRAINT `fk_ocorrencias_entrega` FOREIGN KEY (`entrega_id`) REFERENCES `entregas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias`
--

LOCK TABLES `ocorrencias` WRITE;
/*!40000 ALTER TABLE `ocorrencias` DISABLE KEYS */;
INSERT INTO `ocorrencias` VALUES (1,2,'atraso','Trânsito intenso na rodovia; previsão de atraso','2025-08-10 14:30:00'),(2,4,'problema_mecanico','Falha na bomba de combustível','2025-09-10 08:15:00'),(3,5,'acidente','Colisão traseira leve; sem vítimas','2025-08-02 17:30:00'),(4,9,'roubo','Carga violada durante parada não autorizada','2025-09-12 08:45:00'),(5,14,'problema_mecanico','Pneu estourado, substituição necessária','2025-03-18 09:00:00'),(6,16,'atraso','Obras na pista provocaram desvio','2025-01-02 06:30:00'),(7,11,'atraso','Fila de embarque no terminal','2025-04-15 10:05:00'),(8,17,'acidente','Capotamento leve; carga avariada','2025-09-05 09:20:00'),(9,19,'extravio','Volume extraviado entre baldeação','2025-08-20 10:40:00'),(10,6,'atraso','Condições climáticas adversas','2025-09-11 15:00:00');
/*!40000 ALTER TABLE `ocorrencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 16:59:17
