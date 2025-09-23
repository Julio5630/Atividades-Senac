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
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entrega_id` int DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `forma` enum('dinheiro','cartao','boleto','pix','transferencia') COLLATE utf8mb4_unicode_ci DEFAULT 'boleto',
  `status` enum('pendente','pago','parcial','cancelado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendente',
  `data_pagamento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagamentos_cliente` (`cliente_cnpj`),
  KEY `fk_pagamentos_entrega` (`entrega_id`),
  KEY `idx_pagamentos_status_data` (`status`,`data_pagamento`),
  CONSTRAINT `fk_pagamentos_cliente` FOREIGN KEY (`cliente_cnpj`) REFERENCES `clientes` (`cnpj`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_pagamentos_entrega` FOREIGN KEY (`entrega_id`) REFERENCES `entregas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,'00.000.000/0001-01',1,1250.00,'transferencia','pago','2025-09-02 10:00:00'),(2,'11.111.111/0001-11',2,4200.00,'boleto','pendente',NULL),(3,'22.222.222/0001-22',3,980.00,'pix','pago','2025-07-16 09:00:00'),(4,'33.333.333/0001-33',4,2200.00,'cartao','parcial','2025-09-11 18:00:00'),(5,'44.444.444/0001-44',5,3000.00,'transferencia','pago','2025-08-03 11:00:00'),(6,'55.555.555/0001-55',6,750.00,'boleto','pendente',NULL),(7,'66.666.666/0001-66',7,1100.00,'pix','pago','2025-06-21 08:00:00'),(8,'77.777.777/0001-77',8,640.00,'cartao','pago','2025-07-02 13:00:00'),(9,'88.888.888/0001-88',9,2100.00,'pix','pendente',NULL),(10,'99.999.999/0001-99',10,4200.00,'transferencia','pago','2025-05-12 10:30:00'),(11,'00.000.000/0001-01',11,950.00,'pix','pago','2025-04-16 14:00:00'),(12,'11.111.111/0001-11',12,1800.00,'boleto','pago','2025-03-20 09:00:00'),(13,'22.222.222/0001-22',13,1250.00,'pix','pago','2025-02-03 12:00:00'),(14,'33.333.333/0001-33',14,500.00,'cartao','pago','2025-03-19 15:30:00');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 16:59:18
