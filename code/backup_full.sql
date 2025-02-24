-- MySQL dump 10.13  Distrib 8.4.4, for Linux (x86_64)
--
-- Host: localhost    Database: appdb
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Artiste`
--

DROP TABLE IF EXISTS `Artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artiste` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `anneeNaiss` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artiste`
--

LOCK TABLES `Artiste` WRITE;
/*!40000 ALTER TABLE `Artiste` DISABLE KEYS */;
INSERT INTO `Artiste` VALUES (1,'Debbouze','Jamel','1975-11-18'),(2,'Tome','Lucas','1990-03-25'),(3,'Baumann','Céline','1985-09-10'),(4,'Lenoir','Julien','1982-06-14'),(5,'Mercier','Sophie','1992-12-04'),(6,'Zane','Mark','1980-02-14'),(7,'Lemoine','Elodie','1991-08-22');
/*!40000 ALTER TABLE `Artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film`
--

DROP TABLE IF EXISTS `Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `annee` date DEFAULT NULL,
  `resume` text,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film`
--

LOCK TABLES `Film` WRITE;
/*!40000 ALTER TABLE `Film` DISABLE KEYS */;
INSERT INTO `Film` VALUES (1,'Le Démentellement','2025-02-24','Un drame familial sur la déconstruction d\'une vie.','/img/le_dementellement.jpg'),(2,'Les Petits Princes (Foot)','2025-02-24','Un film sur un groupe de jeunes footballeurs.','/img/les_petits_princes_foot.jpg'),(3,'Mercato de Jamel Debbouze','2025-02-24','Une comédie sur les coulisses du mercato.','/img/mercato_de_jamel_debbouze.jpg'),(4,'Mufasa','2025-02-24','Une histoire épique sur le lion Mufasa.','/img/mufasa.webp'),(5,'Paddington au Pérou','2025-02-24','Paddington voyage au Pérou pour de nouvelles aventures.','/img/paddington_au_perou.webp'),(6,'Pourquoi j\'ai pas mangé mon père','2025-02-24','Une comédie préhistorique sur un fils qui ne mange pas son père.','/img/pourquoi_jai_pas_mange_mon_pere.jpg'),(7,'Sonic 3','2025-02-24','Les nouvelles aventures de Sonic, le hérisson supersonique.','/img/sonic_3.webp');
/*!40000 ALTER TABLE `Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film_Genre`
--

DROP TABLE IF EXISTS `Film_Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Film_Genre` (
  `idFilm` int NOT NULL,
  `idGenre` int NOT NULL,
  PRIMARY KEY (`idFilm`,`idGenre`),
  KEY `idGenre` (`idGenre`),
  CONSTRAINT `Film_Genre_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `Film` (`id`),
  CONSTRAINT `Film_Genre_ibfk_2` FOREIGN KEY (`idGenre`) REFERENCES `Genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film_Genre`
--

LOCK TABLES `Film_Genre` WRITE;
/*!40000 ALTER TABLE `Film_Genre` DISABLE KEYS */;
INSERT INTO `Film_Genre` VALUES (1,1),(4,1),(3,2),(6,2),(5,3),(7,4),(2,5);
/*!40000 ALTER TABLE `Film_Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Drame'),(2,'Comédie'),(3,'Animation'),(4,'Aventure'),(5,'Sport');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Internaute`
--

DROP TABLE IF EXISTS `Internaute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Internaute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `dateNaiss` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Internaute`
--

LOCK TABLES `Internaute` WRITE;
/*!40000 ALTER TABLE `Internaute` DISABLE KEYS */;
INSERT INTO `Internaute` VALUES (1,'bilal@gmail.com','User','One','password1','2004-12-20'),(2,'lakshan@gmail.com','User','Two','password2','2004-12-24');
/*!40000 ALTER TABLE `Internaute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jouer`
--

DROP TABLE IF EXISTS `Jouer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jouer` (
  `idArtiste` int NOT NULL,
  `idFilm` int NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idArtiste`,`idFilm`),
  KEY `idFilm` (`idFilm`),
  CONSTRAINT `Jouer_ibfk_1` FOREIGN KEY (`idArtiste`) REFERENCES `Artiste` (`id`),
  CONSTRAINT `Jouer_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `Film` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jouer`
--

LOCK TABLES `Jouer` WRITE;
/*!40000 ALTER TABLE `Jouer` DISABLE KEYS */;
INSERT INTO `Jouer` VALUES (1,3,'Jamel Debbouze'),(2,1,'Lucas Tome'),(3,2,'Céline Baumann'),(4,4,'Julien Lenoir'),(5,5,'Sophie Mercier'),(6,6,'Mark Zane'),(7,7,'Elodie Lemoine');
/*!40000 ALTER TABLE `Jouer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noter`
--

DROP TABLE IF EXISTS `Noter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Noter` (
  `idInternaute` int NOT NULL,
  `idFilm` int NOT NULL,
  `note` int DEFAULT NULL,
  PRIMARY KEY (`idInternaute`,`idFilm`),
  KEY `idFilm` (`idFilm`),
  CONSTRAINT `Noter_ibfk_1` FOREIGN KEY (`idInternaute`) REFERENCES `Internaute` (`id`),
  CONSTRAINT `Noter_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `Film` (`id`),
  CONSTRAINT `Noter_chk_1` CHECK (((`note` >= 0) and (`note` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noter`
--

LOCK TABLES `Noter` WRITE;
/*!40000 ALTER TABLE `Noter` DISABLE KEYS */;
INSERT INTO `Noter` VALUES (1,1,4),(1,3,3),(1,5,5),(1,7,5),(2,2,5),(2,4,4),(2,6,4);
/*!40000 ALTER TABLE `Noter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 13:30:23
