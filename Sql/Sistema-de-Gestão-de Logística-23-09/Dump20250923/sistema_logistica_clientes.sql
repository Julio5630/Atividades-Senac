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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contato` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pagamento` enum('ativo','inadimplente','em_analise') COLLATE utf8mb4_unicode_ci DEFAULT 'ativo',
  PRIMARY KEY (`cnpj`),
  KEY `idx_clientes_cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('00.000.000/0001-01','Transportes Alfa SA','contato@alfa.com.br | (11) 9999-0001','ativo'),('11.111.111/0001-11','Logistica Brasil LTDA','financeiro@logbrasil.com','inadimplente'),('22.222.222/0001-22','Mercado Norte Distribuidora','contato@mercadonorte.com','ativo'),('33.333.333/0001-33','SuperVarejo S.A.','financeiro@supervarejo.com','ativo'),('44.444.444/0001-44','Distribuidora Rio Sul','vendas@riosul.com.br','em_analise'),('55.555.555/0001-55','EletroHome Comércio','contato@eletrohome.com','ativo'),('66.666.666/0001-66','Construtora Delta','fiscal@deltaconstr.com','inadimplente'),('77.777.777/0001-77','Farmacia Central Ltda','contato@farmacentral.com','ativo'),('88.888.888/0001-88','Oficina AutoCenter','financeiro@autocenter.com','ativo'),('99.999.999/0001-99','Loja Techshop','contato@techshop.com','ativo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
