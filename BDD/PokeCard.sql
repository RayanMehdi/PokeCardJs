-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: PokeCard
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `Exchanges`
--

DROP TABLE IF EXISTS `Exchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchanges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userSrc` varchar(255) DEFAULT NULL,
  `idPokemonSrc` int(11) DEFAULT NULL,
  `idPokemonDest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userSrc` (`userSrc`),
  CONSTRAINT `exchanges_ibfk_1` FOREIGN KEY (`userSrc`) REFERENCES `User` (`tokenFB`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exchanges`
--

LOCK TABLES `Exchanges` WRITE;
/*!40000 ALTER TABLE `Exchanges` DISABLE KEYS */;
INSERT INTO `Exchanges` VALUES (1,'12EFDSQF',2,9);
/*!40000 ALTER TABLE `Exchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `tokenFB` varchar(255) NOT NULL DEFAULT '',
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tokenFB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('12EFDSQF','RAYAN','MEHDI'),('142dfqdfgfdgdfp82d','te23','tefst'),('142dfqp82d','te23','tefst'),('142dfqpsfd','test23','tefst'),('142dvvvvvfdgdfp82d','te23','tefst'),('2238vfdgdfp82d','te23','tefst'),('7q698489484dfqsdfqsdfqsdfqsdfqsdfqsdff54','tefsqd23','tevvvfst'),('7q698489484dsq6f54','tefsqd23','tevvvfst'),('7q698489484qsdfqsdfqsdfqsdfqsdfdsq6f54','tefsqd23','tevvvfst'),('7q698489484qsdfqsdfqsdfqsdfqsdff54','tefsqd23','tevvvfst'),('dfqsdfqfqsf','tefsqd23','tevvvfst'),('dfqsdfqfsdqsf','tefsqd23','tevvvfst'),('ff','tefsqd23','tevvvfst'),('fffrddddrs','tefsqd23','tevvvfst'),('fffrddssdfsqfqdfdddfffqdsfrs','tefsqd23','tevvvfst'),('fffrddssdfsqfqdfdddrs','tefsqd23','tevvvfst'),('fffrrs','tefsqd23','tevvvfst'),('fffs','tefsqd23','tevvvfst'),('ffs','tefsqd23','tevvvfst'),('JOGOALBION','JO','ALBION'),('tokdsfqsfdqsdfefsdggn','tefsqd23','tevvvfst'),('tokdsfqsfdqsdfegn','tefsqd23','tevvvfst'),('tokdsfqsfdqsdfen','tefsqd23','tevvvfst'),('token','te23','tefst'),('tokenFBTest','tefsqd23','tevvvfst'),('tokenFBTest8','tefsqd23','tevvvfst'),('tokenSGdgfgdfSDdfFGSdf','te23','tefst'),('tokenSGdgfgdfSDFGSdf','te23','tefst'),('tokenSGdgfgdqdfSDdfFGSdf','te23','tefst'),('tokenSGSDFGSdf','te23','tefst'),('uhiudfqpsfd','test2','tefst'),('uhiup','test','test'),('uhiupsfd','test2','test');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsersPokemon`
--

DROP TABLE IF EXISTS `UsersPokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsersPokemon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pokemonId` int(11) DEFAULT NULL,
  `tokenFB` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userToken` (`tokenFB`),
  CONSTRAINT `userspokemon_ibfk_1` FOREIGN KEY (`tokenFB`) REFERENCES `User` (`tokenFB`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsersPokemon`
--

LOCK TABLES `UsersPokemon` WRITE;
/*!40000 ALTER TABLE `UsersPokemon` DISABLE KEYS */;
INSERT INTO `UsersPokemon` VALUES (1,2,'12EFDSQF'),(2,57,'12EFDSQF'),(3,463,'12EFDSQF'),(5,300,'12EFDSQF'),(6,669,'7q698489484dsq6f54'),(7,655,'tokenFBTest'),(8,808,'tokenFBTest'),(9,167,'tokenFBTest'),(10,795,'tokenFBTest8'),(11,150,'tokenFBTest8'),(12,381,'tokenFBTest8'),(13,796,'tokenFBTest8'),(14,451,'tokenFBTest8'),(15,391,'tokenFBTest8'),(16,813,'JOGOALBION'),(17,155,'JOGOALBION'),(18,64,'JOGOALBION'),(19,291,'JOGOALBION'),(20,446,'JOGOALBION'),(21,167,'JOGOALBION');
/*!40000 ALTER TABLE `UsersPokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-03 22:41:15
