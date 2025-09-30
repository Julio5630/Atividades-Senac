-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: eventos
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
-- Table structure for table `palestras`
--

DROP TABLE IF EXISTS `palestras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palestras` (
  `id_palestra` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `nome_palestrante` varchar(255) NOT NULL,
  `duracao_minutos` int NOT NULL,
  PRIMARY KEY (`id_palestra`),
  KEY `fk_palestras_eventos` (`id_evento`),
  CONSTRAINT `fk_palestras_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palestras`
--

LOCK TABLES `palestras` WRITE;
/*!40000 ALTER TABLE `palestras` DISABLE KEYS */;
INSERT INTO `palestras` VALUES (1,1,'Dr. Elias Gomes',60),(2,1,'Dra. Sofia Mendes',45),(3,2,'Eng. Carlos Braga',90),(4,2,'Maria Clara Pires',60),(5,3,'Prof. Renato Costa',50),(6,3,'Ana Paula Lima',50),(7,4,'João Marcelo Silva',75),(8,5,'Dr. Ricardo Nogueira',40),(9,5,'Elena Alves',55),(10,6,'Luciana Santos',60),(11,6,'Pedro Henrique',45),(12,7,'Marcos Oliveira',90),(13,7,'Juliana Reis',90),(14,8,'Prof. Sérgio Barros',60),(15,8,'Gabriela Dantas',40),(16,9,'Guilherme Rocha',50),(17,10,'Fábio Viana',30),(18,11,'Dr. Lucas Ribeiro',60),(19,11,'Dra. Patrícia Gomes',45),(20,12,'Eng. Rodrigo Dias',90),(21,13,'Cristina Soares',50),(22,13,'Alexandre Ferraz',50),(23,14,'André Torres',75),(24,15,'Larissa Costa',40),(25,15,'Daniel Vilar',55),(26,16,'Márcia Ferreira',60),(27,16,'Roberto Cintra',45),(28,17,'Vitor Hugo',90),(29,18,'Camila Prado',90),(30,18,'Gustavo Martins',60),(31,19,'Prof. Helena Mendes',40),(32,19,'Tiago Souza',50),(33,20,'Bianca Azevedo',30),(34,21,'Dra. Mônica Castro',60),(35,22,'Wagner Junior',45),(36,22,'Elaine Vasconcelos',90),(37,23,'Felipe Queiroz',50),(38,23,'Isabel Ramos',50),(39,24,'Mauro Diniz',75),(40,25,'Nelson Fontes',40),(41,25,'Olga Peixoto',55),(42,26,'Paulo Quirino',60),(43,26,'Quiteria Rocha',45),(44,27,'Prof. Roberto Silva',90),(45,28,'Sara Teixeira',90),(46,28,'Tomás Ulisses',60),(47,29,'Vanda Xavier',40),(48,30,'Yuri Zeca',50),(49,30,'Alice Bastos',30),(50,31,'Breno Campos',60),(51,32,'Carla Duarte',45),(52,33,'Denis Elias',90),(53,34,'Ester Freitas',50),(54,34,'Fabio Guedes',50),(55,35,'Gisele Horta',75),(56,36,'Henrique Ivo',40),(57,36,'Inês Jesus',55),(58,37,'Jonas Klein',60),(59,37,'Kátia Lopes',45),(60,38,'Luiz Moura',90),(61,38,'Marta Neves',90),(62,39,'Noel Ornellas',60),(63,39,'Oswaldo Pires',40),(64,40,'Pâmela Quadros',50),(65,40,'Quirino Ramos',30),(66,41,'Ricardo Santos',60),(67,42,'Silvana Teixeira',45),(68,43,'Túlio Ulisses',90),(69,44,'Valéria Vasconcelos',50),(70,44,'Wagner Xavier',50),(71,45,'Yara Zeca',75),(72,46,'Álvaro Alves',40),(73,46,'Bárbara Borba',55),(74,47,'Cássio Camargo',60),(75,47,'Diana Delgado',45),(76,48,'Eduardo Elias',90),(77,48,'Flávia Franco',90),(78,49,'Guilherme Guedes',60),(79,49,'Helena Horta',40),(80,50,'Ícaro Ivo',50),(81,50,'Janaína Jesus',30),(82,1,'Fernando Souza',60),(83,2,'Gabriel Antunes',45),(84,3,'Hélio Medeiros',90),(85,4,'Isadora Neres',60),(86,5,'Jeferson Pires',50),(87,6,'Kátia Quintela',50),(88,7,'Leonardo Rangel',75),(89,8,'Mirella Soares',40),(90,9,'Nicole Tavares',55),(91,10,'Orlando Uchoa',60),(92,11,'Paloma Viana',45),(93,12,'Quênia Xavier',90),(94,13,'Raul Yago',90),(95,14,'Sandra Zeca',60),(96,15,'Tadeu Almeida',40),(97,16,'Úrsula Braga',50),(98,17,'Valter Caldeira',30),(99,18,'Wilson Diniz',60),(100,19,'Xenia Freire',45),(101,20,'Yago Guedes',90),(102,21,'Zilda Hermínio',50),(103,22,'Aldo Ivo',50),(104,23,'Bia Jesus',75),(105,24,'César Klein',40),(106,25,'Dora Lopes',55),(107,26,'Elias Moura',60),(108,27,'Fani Neves',45),(109,28,'Geraldo Ornellas',90),(110,29,'Heloísa Pires',90),(111,30,'Igor Quadros',60),(112,31,'Júlia Ramos',40),(113,32,'Klaus Santos',50),(114,33,'Lívia Teixeira',30),(115,34,'Mauro Ulisses',60),(116,35,'Nádia Viana',45),(117,36,'Otto Xavier',90),(118,37,'Pietra Yuri',50),(119,38,'Quito Zeca',50),(120,39,'Rafaela Borges',75),(121,40,'Samuel Cunha',40),(122,41,'Tatiana Duarte',55),(123,42,'Uriel Esteves',60),(124,43,'Vera França',45),(125,44,'Wesley Guedes',90),(126,45,'Ximena Horta',90),(127,46,'Yago Iunes',60),(128,47,'Zuleica Jorge',40),(129,48,'Adriano Klein',50),(130,49,'Bruna Lopes',30),(131,50,'Carlos Matos',60);
/*!40000 ALTER TABLE `palestras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 16:57:42
