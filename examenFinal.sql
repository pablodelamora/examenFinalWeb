-- MySQL dump 10.14  Distrib 5.5.50-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: daw_1020365
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `aline` varchar(50) NOT NULL,
  `aline2` varchar(50) DEFAULT NULL,
  `zip` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BAccounts`
--

DROP TABLE IF EXISTS `BAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BAccounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `bank` varchar(25) DEFAULT NULL,
  `bus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BAccounts`
--

LOCK TABLES `BAccounts` WRITE;
/*!40000 ALTER TABLE `BAccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `BAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bussines`
--

DROP TABLE IF EXISTS `Bussines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bussines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `socialr` varchar(25) NOT NULL,
  `id_add` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bussines`
--

LOCK TABLES `Bussines` WRITE;
/*!40000 ALTER TABLE `Bussines` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bussines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cards`
--

DROP TABLE IF EXISTS `Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cards`
--

LOCK TABLES `Cards` WRITE;
/*!40000 ALTER TABLE `Cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movements`
--

DROP TABLE IF EXISTS `Movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mov_date` date NOT NULL,
  `origin` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `type` varchar(2) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movements`
--

LOCK TABLES `Movements` WRITE;
/*!40000 ALTER TABLE `Movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `Movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personas` (
  `PersonID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `profilepic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'mike@mike.com','mike','del moral','1234',NULL),(2,'danielmonr@gmail.com','Daniel','Monzalvo','12345',NULL),(3,'pedro@gmail.com','pedro','perez','1234',NULL),(4,'rua@gmdk','Raul','Morales','1',''),(5,'a@a','jajaja','asdjsjd','1',''),(6,'pedro@gmail.com','pedro','perez','1234',''),(7,'elquesea@noeimportam','e','e','e',''),(8,'elquesea@noeimportam','e','e','e',''),(9,'jh@k','jh','jh','q',''),(10,'q@q','q','q','q',''),(11,'t@t','t','t','t','1478646723_llama.jpg'),(12,'p@p','p','p','p','1478647081_llama.jpg'),(13,'l@l','l','l','l','1478647173_llama.jpg'),(14,'juan@perez.com','Juan','Perez','1234','1478696709_Juan_PÃ©rez.jpg'),(15,'pedro@perez.com','pedro','perez','1234','1478697014_Juan_PÃ©rez.jpg'),(16,'raul@m.com','Raul','Morales','1234','1478701773_Juan_PÃ©rez.jpg');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculos`
--

DROP TABLE IF EXISTS `Vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  `placas` varchar(40) NOT NULL,
  `punto_entrada` varchar(100) NOT NULL,
  `hora_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculos`
--

LOCK TABLES `Vehiculos` WRITE;
/*!40000 ALTER TABLE `Vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exf_Persona`
--

DROP TABLE IF EXISTS `exf_Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exf_Persona` (
  `id_persona` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidoP` varchar(100) NOT NULL,
  `apellidoM` varchar(100) NOT NULL,
  `foto` blob,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exf_Persona`
--

LOCK TABLES `exf_Persona` WRITE;
/*!40000 ALTER TABLE `exf_Persona` DISABLE KEYS */;
INSERT INTO `exf_Persona` VALUES (1,'Pablo','de la Mora','Vega',NULL,'pablodelamorav@gmail.com','abc123');
/*!40000 ALTER TABLE `exf_Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exf_Platillo`
--

DROP TABLE IF EXISTS `exf_Platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exf_Platillo` (
  `id_platillo` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `calorias` int(10) NOT NULL,
  `foto` blob,
  `precio` int(10) NOT NULL,
  PRIMARY KEY (`id_platillo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exf_Platillo`
--

LOCK TABLES `exf_Platillo` WRITE;
/*!40000 ALTER TABLE `exf_Platillo` DISABLE KEYS */;
INSERT INTO `exf_Platillo` VALUES (1,'Espaguetti','Muy rico',100,NULL,150),(2,'Clamato','Bebida',150,NULL,70),(3,'QQQ','AAA',150,NULL,100);
/*!40000 ALTER TABLE `exf_Platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exf_Restaurante`
--

DROP TABLE IF EXISTS `exf_Restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exf_Restaurante` (
  `id_restaurante` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `foto` blob,
  `telefono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_restaurante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exf_Restaurante`
--

LOCK TABLES `exf_Restaurante` WRITE;
/*!40000 ALTER TABLE `exf_Restaurante` DISABLE KEYS */;
INSERT INTO `exf_Restaurante` VALUES (1,'Restaurante Pablo','Mexico',NULL,'53730674');
/*!40000 ALTER TABLE `exf_Restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exf_Ventas`
--

DROP TABLE IF EXISTS `exf_Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exf_Ventas` (
  `id_ventas` int(10) NOT NULL AUTO_INCREMENT,
  `id_persona` int(10) NOT NULL,
  `id_platillo` int(10) NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `id_persona` (`id_persona`),
  KEY `id_platillo` (`id_platillo`),
  CONSTRAINT `exf_Ventas_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `exf_Persona` (`id_persona`) ON DELETE CASCADE,
  CONSTRAINT `exf_Ventas_ibfk_2` FOREIGN KEY (`id_platillo`) REFERENCES `exf_Platillo` (`id_platillo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exf_Ventas`
--

LOCK TABLES `exf_Ventas` WRITE;
/*!40000 ALTER TABLE `exf_Ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `exf_Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-30 18:10:59
