-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour forum
CREATE DATABASE IF NOT EXISTS `forum` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `forum`;

-- Listage de la structure de la table forum. membre
CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_membre`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table forum.membre : ~8 rows (environ)
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` (`id_membre`, `pseudo`, `password`, `date`) VALUES
	(1, 'zzpapy', '$2y$10$tCwzHObhirsVPPXxbzifzusdUAxMyIYkiNGKr1vO2M7tU1Rhg7XMO', NULL),
	(7, 'bob', '$2y$10$RQVvFwbPJbJ7Di/MYzPotu72MgfU5q.EeSPTiVRQXcBji4Uxph75m', NULL),
	(8, 'bobo', '$2y$10$ZYwdfEiUU4NEnCwufWC8eeSfvKVAwyLMQ7WruWb6bHOUqJxZd5pVS', NULL),
	(9, 'toto', '$2y$10$o1fHSDEz9AZFXspNzfpE.eitEpTQHthgS/LNHYkcqeg3Otwh/6C1C', NULL),
	(10, 'compte', '$2y$10$k8E57D5ABIi4laa4EEtVweogs0hKdWmlh9lkOZ6vqimdGWKTiC.nu', NULL),
	(11, 'hbhbhhbh', '$2y$10$O9V2disTzgadcu0gO/rdsO38rQEPurz8nemm.muAvKiPkuVZHmXZG', NULL),
	(12, 'test', '$2y$10$6RV7oAE242DKSaxvFBWqWemm7u422egPHM9MjEWEyVx1N15rLWz/i', NULL),
	(13, 'crea', '$2y$10$U1Rr4OatHrFTHtYuOehDQu9jHkl/W2zwQtG8oI1hfRoVmZzBZLYEC', NULL);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;

-- Listage de la structure de la table forum. message
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_bin,
  `membre_id` int(11) NOT NULL,
  `sujet_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `id_user` (`membre_id`),
  KEY `id_sujet` (`sujet_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sujet_id`) REFERENCES `sujet` (`id_sujet`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table forum.message : ~3 rows (environ)
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`id_message`, `content`, `membre_id`, `sujet_id`, `date`) VALUES
	(409, 'enculé de message signalé', 1, 97, '2020-04-01 13:45:56'),
	(410, 'd', 1, 97, '2020-04-01 13:52:28'),
	(411, 'signal', 1, 97, '2020-04-01 15:18:07');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Listage de la structure de la table forum. signalement
CREATE TABLE IF NOT EXISTS `signalement` (
  `id_signalement` int(11) NOT NULL AUTO_INCREMENT,
  `membre_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_signalement`) USING BTREE,
  KEY `signalement_ibfk_2` (`message_id`),
  KEY `signalement_ibfk_1` (`membre_id`),
  CONSTRAINT `signalement_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`) ON DELETE CASCADE,
  CONSTRAINT `signalement_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `message` (`id_message`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table forum.signalement : ~3 rows (environ)
/*!40000 ALTER TABLE `signalement` DISABLE KEYS */;
INSERT INTO `signalement` (`id_signalement`, `membre_id`, `message_id`, `date`) VALUES
	(1, 1, 410, '2020-04-01 17:26:01'),
	(3, 1, 409, '2020-04-01 17:26:01'),
	(4, 1, 411, '2020-04-01 17:26:01');
/*!40000 ALTER TABLE `signalement` ENABLE KEYS */;

-- Listage de la structure de la table forum. submess
CREATE TABLE IF NOT EXISTS `submess` (
  `id_submess` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_bin NOT NULL,
  `message_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_submess`),
  KEY `id_user` (`membre_id`),
  KEY `submess_ibfk_1` (`message_id`),
  CONSTRAINT `submess_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id_message`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table forum.submess : ~0 rows (environ)
/*!40000 ALTER TABLE `submess` DISABLE KEYS */;
/*!40000 ALTER TABLE `submess` ENABLE KEYS */;

-- Listage de la structure de la table forum. sujet
CREATE TABLE IF NOT EXISTS `sujet` (
  `id_sujet` int(11) NOT NULL AUTO_INCREMENT,
  `titre` text COLLATE utf8_bin NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sujet`),
  KEY `id_user` (`membre_id`),
  CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table forum.sujet : ~1 rows (environ)
/*!40000 ALTER TABLE `sujet` DISABLE KEYS */;
INSERT INTO `sujet` (`id_sujet`, `titre`, `membre_id`, `date`) VALUES
	(97, 'sujet test admin signalement', 1, '2020-04-01 13:45:44');
/*!40000 ALTER TABLE `sujet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
