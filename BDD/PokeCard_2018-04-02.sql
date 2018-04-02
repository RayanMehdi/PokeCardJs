# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.38)
# Base de données: PokeCard
# Temps de génération: 2018-04-02 21:31:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table Exchanges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Exchanges`;

CREATE TABLE `Exchanges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userSrc` varchar(255) DEFAULT NULL,
  `idPokemonSrc` int(11) DEFAULT NULL,
  `idPokemonDest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userSrc` (`userSrc`),
  CONSTRAINT `exchanges_ibfk_1` FOREIGN KEY (`userSrc`) REFERENCES `User` (`tokenFB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Exchanges` WRITE;
/*!40000 ALTER TABLE `Exchanges` DISABLE KEYS */;

INSERT INTO `Exchanges` (`id`, `userSrc`, `idPokemonSrc`, `idPokemonDest`)
VALUES
	(1,'12EFDSQF',2,9);

/*!40000 ALTER TABLE `Exchanges` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `tokenFB` varchar(255) NOT NULL DEFAULT '',
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tokenFB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`tokenFB`, `firstName`, `lastName`)
VALUES
	('12EFDSQF','RAYAN','MEHDI');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table UsersPokemon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UsersPokemon`;

CREATE TABLE `UsersPokemon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pokemonId` int(11) DEFAULT NULL,
  `userToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userToken` (`userToken`),
  CONSTRAINT `userspokemon_ibfk_1` FOREIGN KEY (`userToken`) REFERENCES `User` (`tokenFB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `UsersPokemon` WRITE;
/*!40000 ALTER TABLE `UsersPokemon` DISABLE KEYS */;

INSERT INTO `UsersPokemon` (`id`, `pokemonId`, `userToken`)
VALUES
	(1,2,'12EFDSQF'),
	(2,57,'12EFDSQF'),
	(3,463,'12EFDSQF'),
	(5,300,'12EFDSQF');

/*!40000 ALTER TABLE `UsersPokemon` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
