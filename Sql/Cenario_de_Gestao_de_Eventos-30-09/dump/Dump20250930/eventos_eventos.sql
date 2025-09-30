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
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `data_evento` date NOT NULL,
  `vagas_totais` int NOT NULL,
  `vagas_disponiveis` int NOT NULL,
  PRIMARY KEY (`id_evento`),
  CONSTRAINT `chk_vagas_nao_negativas` CHECK ((`vagas_disponiveis` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Conferência de IA 2025','Auditório Principal','2025-04-10',500,350),(2,'Workshop de Devops Prático','Sala 201','2025-05-20',150,50),(3,'Fórum de Cibersegurança','Centro de Convenções','2025-06-01',800,780),(4,'Seminário de Banco de Dados NoSQL','Sala de Reuniões A','2025-07-15',100,10),(5,'Feira de Tecnologia Sustentável','Pavilhão de Exposições','2025-08-05',1200,1150),(6,'Encontro de UX/UI Designers','Sala 305','2025-09-12',200,195),(7,'Hackathon de Inovação','Espaço Colaborativo','2025-10-25',100,0),(8,'Congresso Internacional de Software','Grande Teatro','2025-11-03',1500,1450),(9,'Meetup de Python e Django','Sala de Aula 1','2025-12-08',80,75),(10,'Lançamento de Produto Tech','Sala VIP','2026-01-20',50,45),(11,'Web Summit Local','Centro de Eventos B','2026-02-14',1000,900),(12,'Treinamento em Cloud Computing','Sala de Treinamento','2026-03-22',75,60),(13,'Simpósio de IoT','Auditório Azul','2026-04-05',300,290),(14,'Jornada de Engenharia de Dados','Sala 404','2026-05-18',120,110),(15,'Encontro de Startups','Incubadora Tech','2026-06-30',400,350),(16,'Conferência de JavaScript','Auditório Principal','2026-07-10',600,450),(17,'Workshop de Produtividade','Sala 102','2026-08-01',90,85),(18,'Semana de Game Design','Lab de Criação','2026-09-19',110,100),(19,'Fórum de Tecnologias Emergentes','Centro de Exposições C','2026-10-15',700,680),(20,'Meetup de Rust Language','Sala de Reuniões B','2026-11-29',60,58),(21,'Cúpula de Liderança Tech','Sala Presidencial','2026-12-10',40,35),(22,'Maratona de Programação','Ginásio de Esportes','2027-01-05',200,150),(23,'Encontro de Mulheres na Tech','Auditório Verde','2027-02-08',250,240),(24,'Bootcamp de Full Stack','Sala de Treinamento B','2027-03-17',50,20),(25,'Conferência de Realidade Virtual','Espaço 3D','2027-04-24',350,340),(26,'Workshop de SEO e Marketing Digital','Sala 101','2027-05-07',80,70),(27,'Seminário de Computação Quântica','Laboratório Avançado','2027-06-18',30,30),(28,'Feira de Robótica','Pavilhão de Ciências','2027-07-29',1000,950),(29,'Meetup de Elixir','Sala de Coworking','2027-08-14',40,38),(30,'Congresso de Mobile Development','Auditório Laranja','2027-09-01',450,420),(31,'Fórum de Open Source','Sala Comunitária','2027-10-10',180,170),(32,'Jantar de Networking Tech','Restaurante Exclusivo','2027-11-05',50,50),(33,'Apresentação de Teses em TI','Sala de Defesas','2027-12-15',60,55),(34,'Retrospectiva Anual de Tecnologia','Auditório Principal','2028-01-02',500,490),(35,'Curso Rápido de Git e GitHub','Sala 202','2028-02-19',70,65),(36,'Simpósio de Bioinformática','Laboratório de Biologia','2028-03-25',130,120),(37,'Encontro de Administradores de Redes','Sala de Servidores','2028-04-09',90,80),(38,'Workshop de Kubernetes','Sala 301','2028-05-14',110,100),(39,'Conferência de Ethical Hacking','Auditório Preto','2028-06-21',300,250),(40,'Feira de Empregos em TI','Pavilhão Principal','2028-07-07',1500,1400),(41,'Seminário de Machine Learning','Sala 401','2028-08-18',200,180),(42,'Meetup de PHP','Sala de Programação','2028-09-23',60,50),(43,'Fórum de Inclusão Digital','Auditório Social','2028-10-04',400,390),(44,'Treinamento de Liderança Ágil','Sala de Coaching','2028-11-11',80,75),(45,'Jornada de AR/VR','Espaço Imersivo','2028-12-05',150,140),(46,'Conferência de Big Data','Grande Auditório D','2029-01-15',700,650),(47,'Workshop de Design Thinking','Sala de Criação','2029-02-28',90,85),(48,'Simpósio de Blockchain','Sala de Teses','2029-03-10',200,195),(49,'Encontro de Analistas de Sistemas','Sala 103','2029-04-20',120,115),(50,'Hackathon de Saúde Digital','Laboratório Médico','2029-05-05',100,90);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
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
