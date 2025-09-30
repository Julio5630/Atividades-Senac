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
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes` (
  `id_participante` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_participante`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` VALUES (1,'Ana Silva','ana.silva@email.com'),(2,'Bruno Santos','bruno.santos@email.com'),(3,'Carla Oliveira','carla.oliveira@email.com'),(4,'Daniel Pereira','daniel.pereira@email.com'),(5,'Erica Costa','erica.costa@email.com'),(6,'Felipe Almeida','felipe.almeida@email.com'),(7,'Giovana Rocha','giovana.rocha@email.com'),(8,'Hugo Lima','hugo.lima@email.com'),(9,'Isabela Fernandes','isabela.fernandes@email.com'),(10,'João Ribeiro','joao.ribeiro@email.com'),(11,'Kelly Souza','kelly.souza@email.com'),(12,'Lucas Martins','lucas.martins@email.com'),(13,'Mariana Nogueira','mariana.nogueira@email.com'),(14,'Nelson Vieira','nelson.vieira@email.com'),(15,'Olivia Barros','olivia.barros@email.com'),(16,'Pedro Gomes','pedro.gomes@email.com'),(17,'Quiteria Dantas','quiteria.dantas@email.com'),(18,'Rafael Barbosa','rafael.barbosa@email.com'),(19,'Sofia Castro','sofia.castro@email.com'),(20,'Thiago Pires','thiago.pires@email.com'),(21,'Ursula Mendes','ursula.mendes@email.com'),(22,'Vicente Duarte','vicente.duarte@email.com'),(23,'Wagner Esteves','wagner.esteves@email.com'),(24,'Xenia Ferreira','xenia.ferreira@email.com'),(25,'Yago Rodrigues','yago.rodrigues@email.com'),(26,'Zelia Vasconcelos','zelia.vasconcelos@email.com'),(27,'Alice Silva','alice.silva2@email.com'),(28,'Breno Santos','breno.santos2@email.com'),(29,'Cecília Oliveira','cecilia.oliveira2@email.com'),(30,'Davi Pereira','davi.pereira2@email.com'),(31,'Elisa Costa','elisa.costa2@email.com'),(32,'Fernando Almeida','fernando.almeida2@email.com'),(33,'Gabriela Rocha','gabriela.rocha2@email.com'),(34,'Henrique Lima','henrique.lima2@email.com'),(35,'Ingrid Fernandes','ingrid.fernandes2@email.com'),(36,'Júlio Ribeiro','julio.ribeiro2@email.com'),(37,'Larissa Souza','larissa.souza2@email.com'),(38,'Marcelo Martins','marcelo.martins2@email.com'),(39,'Natália Nogueira','natalia.nogueira2@email.com'),(40,'Osvaldo Vieira','osvaldo.vieira2@email.com'),(41,'Patrícia Barros','patricia.barros2@email.com'),(42,'Quirino Gomes','quirino.gomes2@email.com'),(43,'Renata Barbosa','renata.barbosa2@email.com'),(44,'Sérgio Castro','sergio.castro2@email.com'),(45,'Tainá Pires','taina.pires2@email.com'),(46,'Ubiratan Mendes','ubiratan.mendes2@email.com'),(47,'Valéria Duarte','valeria.duarte2@email.com'),(48,'Wellington Esteves','wellington.esteves2@email.com'),(49,'Yasmin Ferreira','yasmin.ferreira2@email.com'),(50,'Zeca Rodrigues','zeca.rodrigues2@email.com'),(51,'Amélia Vasconcelos','amelia.vasconcelos2@email.com'),(52,'Beatriz Alves','beatriz.alves@email.com'),(53,'Cássio Bernardes','cassio.bernardes@email.com'),(54,'Diana Cruz','diana.cruz@email.com'),(55,'Eduardo Diniz','eduardo.diniz@email.com'),(56,'Flávia Elias','flavia.elias@email.com'),(57,'Guilherme Franco','guilherme.franco@email.com'),(58,'Helena Guedes','helena.guedes@email.com'),(59,'Ícaro Hermínio','icaro.herminio@email.com'),(60,'Janaína Ivo','janaina.ivo@email.com'),(61,'Kauã Jesus','kaua.jesus@email.com'),(62,'Laura Klein','laura.klein@email.com'),(63,'Miguel Lopes','miguel.lopes@email.com'),(64,'Noemi Matos','noemi.matos@email.com'),(65,'Otávio Neves','otavio.neves@email.com'),(66,'Priscila Ornellas','priscila.ornellas@email.com'),(67,'Queiroz Pinho','queiroz.pinho@email.com'),(68,'Rodrigo Quadros','rodrigo.quadros@email.com'),(69,'Suzana Ramos','suzana.ramos@email.com'),(70,'Tadeu Rocha','tadeu.rocha@email.com'),(71,'Ulisses Sales','ulisses.sales@email.com'),(72,'Viviane Telles','viviane.telles@email.com'),(73,'Walter Uchôa','walter.uchoa@email.com'),(74,'Yara Viana','yara.viana@email.com'),(75,'Zoe Xavier','zoe.xavier@email.com'),(76,'Alvaro Zandoná','alvaro.zandona@email.com'),(77,'Bárbara Assunção','barbara.assuncao@email.com'),(78,'César Borba','cesar.borba@email.com'),(79,'Denise Camargo','denise.camargo@email.com'),(80,'Enzo Delgado','enzo.delgado@email.com'),(81,'Fabiana Esteves','fabiana.esteves@email.com'),(82,'Gustavo Freitas','gustavo.freitas@email.com'),(83,'Hélio Gonzaga','helio.gonzaga@email.com'),(84,'Irene Haddad','irene.haddad@email.com'),(85,'Joel Iunes','joel.iunes@email.com'),(86,'Karen Jardim','karen.jardim@email.com'),(87,'Léo Koury','leo.koury@email.com'),(88,'Márcia Lemos','marcia.lemos@email.com'),(89,'Newton Matarazzo','newton.matarazzo@email.com'),(90,'Olga Novaes','olga.novaes@email.com'),(91,'Paulo Oviedo','paulo.oviedo@email.com'),(92,'Quênia Paiva','quenia.paiva@email.com'),(93,'Ricardo Quinto','ricardo.quinto@email.com'),(94,'Sara Rocha','sara.rocha@email.com'),(95,'Tomás Sampaio','tomas.sampaio@email.com'),(96,'Ulla Tavares','ulla.tavares@email.com'),(97,'Vitor Uchoa','vitor.uchoa@email.com'),(98,'Wanda Vasconcelos','wanda.vasconcelos@email.com'),(99,'Yago Werner','yago.werner@email.com'),(100,'Zara Zen','zara.zen@email.com');
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 16:57:43
