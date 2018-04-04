# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.5.5-10.1.26-MariaDB)
# Base de données: PokeCard
# Temps de génération: 2018-04-04 14:31:51 +0000
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
	('10215483476469823','Rayan Mehdi','Rayan Mehdi'),
	('1503212166473385','Alexandre Kessler','Alexandre Kessler'),
	('testToken','Rayan','MEHDI'),
	('testTooken','Rayyan','MEHDI');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table UsersPokemon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UsersPokemon`;

CREATE TABLE `UsersPokemon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pokemonId` int(11) DEFAULT NULL,
  `tokenFB` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userToken` (`tokenFB`),
  CONSTRAINT `userspokemon_ibfk_1` FOREIGN KEY (`tokenFB`) REFERENCES `User` (`tokenFB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `UsersPokemon` WRITE;
/*!40000 ALTER TABLE `UsersPokemon` DISABLE KEYS */;

INSERT INTO `UsersPokemon` (`id`, `pokemonId`, `tokenFB`)
VALUES
	(6,233,'testToken'),
	(7,873,'testToken'),
	(8,387,'testToken'),
	(9,825,'testToken'),
	(10,545,'testToken'),
	(11,539,'testToken'),
	(12,805,'testTooken'),
	(13,340,'testTooken'),
	(14,252,'testTooken'),
	(15,315,'testTooken'),
	(16,266,'testTooken'),
	(17,915,'testTooken'),
	(30,665,'1503212166473385'),
	(31,502,'1503212166473385'),
	(32,332,'1503212166473385'),
	(33,312,'1503212166473385'),
	(34,683,'1503212166473385'),
	(35,635,'1503212166473385'),
	(36,532,'10215483476469823'),
	(37,349,'10215483476469823'),
	(38,305,'10215483476469823'),
	(39,947,'10215483476469823'),
	(40,810,'10215483476469823'),
	(41,842,'10215483476469823');

/*!40000 ALTER TABLE `UsersPokemon` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
