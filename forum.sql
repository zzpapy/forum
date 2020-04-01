-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 01 avr. 2020 à 07:32
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL,
  `pseudo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `password`, `date`) VALUES
(1, 'zzpapy', '$2y$10$tCwzHObhirsVPPXxbzifzusdUAxMyIYkiNGKr1vO2M7tU1Rhg7XMO', NULL),
(3, 'a', '$2y$10$2rH612FmyGoaGYCCCV6X6eGGnQqxTyo7GwUemL5aDJzE5lq3VLhlG', NULL),
(6, 'user1', '$2y$10$7thxXC9eiJaoCXnoQgtCr.O.IfcwTarwOSQg3AEczU1M0q4w9CAwG', NULL),
(7, 'bob', '$2y$10$RQVvFwbPJbJ7Di/MYzPotu72MgfU5q.EeSPTiVRQXcBji4Uxph75m', NULL),
(8, 'bobo', '$2y$10$ZYwdfEiUU4NEnCwufWC8eeSfvKVAwyLMQ7WruWb6bHOUqJxZd5pVS', NULL),
(9, 'toto', '$2y$10$o1fHSDEz9AZFXspNzfpE.eitEpTQHthgS/LNHYkcqeg3Otwh/6C1C', NULL),
(10, 'compte', '$2y$10$k8E57D5ABIi4laa4EEtVweogs0hKdWmlh9lkOZ6vqimdGWKTiC.nu', NULL),
(11, 'hbhbhhbh', '$2y$10$O9V2disTzgadcu0gO/rdsO38rQEPurz8nemm.muAvKiPkuVZHmXZG', NULL),
(12, 'test', '$2y$10$6RV7oAE242DKSaxvFBWqWemm7u422egPHM9MjEWEyVx1N15rLWz/i', NULL),
(13, 'crea', '$2y$10$U1Rr4OatHrFTHtYuOehDQu9jHkl/W2zwQtG8oI1hfRoVmZzBZLYEC', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `content` text COLLATE utf8_bin,
  `membre_id` int(11) NOT NULL,
  `sujet_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id_message`, `content`, `membre_id`, `sujet_id`, `date`) VALUES
(289, 'test', 1, 72, '2020-03-30 09:04:42'),
(290, 'message 1', 1, 73, '2020-03-30 09:05:59'),
(302, 'test', 1, 74, '2020-03-30 09:50:55'),
(303, 'yugtygygguuguyfyufctudxdyrxsyrdrtuc', 1, 73, '2020-03-30 09:52:32'),
(342, 'v', 1, 78, '2020-03-30 12:30:16'),
(343, 'a', 1, 79, '2020-03-30 12:36:37'),
(344, 'b', 1, 79, '2020-03-30 12:36:48'),
(345, 'y', 1, 79, '2020-03-30 12:37:03'),
(350, 'test', 1, 83, '2020-03-31 12:17:53'),
(351, 'test', 1, 83, '2020-03-31 12:18:04'),
(373, 'a', 1, 81, '2020-03-31 12:45:40'),
(374, 'u', 1, 81, '2020-03-31 12:56:36'),
(375, 't', 1, 81, '2020-03-31 12:56:39'),
(376, 't', 1, 81, '2020-03-31 12:57:09'),
(377, 'y', 1, 85, '2020-03-31 13:01:40'),
(379, 'j', 1, 85, '2020-03-31 13:19:22'),
(380, 'y', 1, 85, '2020-03-31 13:19:37'),
(381, 'test', 1, 85, '2020-03-31 16:35:57');

-- --------------------------------------------------------

--
-- Structure de la table `submess`
--

CREATE TABLE `submess` (
  `id_submess` int(11) NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `message_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `submess`
--

INSERT INTO `submess` (`id_submess`, `content`, `message_id`, `membre_id`, `date`) VALUES
(12, 'comment 1', 290, 1, '2020-03-30 07:06:09'),
(13, 'comment 2', 290, 1, '2020-03-30 07:06:22'),
(17, 'jnjjnjnjjnj', 303, 1, '2020-03-30 07:52:39'),
(28, 'n', 344, 1, '2020-03-30 10:36:55'),
(29, 'n', 343, 1, '2020-03-30 10:36:59'),
(30, 'j', 342, 1, '2020-03-31 06:53:53'),
(31, 'test', 381, 13, '2020-04-01 04:43:26');

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE `sujet` (
  `id_sujet` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `sujet`
--

INSERT INTO `sujet` (`id_sujet`, `titre`, `membre_id`, `date`) VALUES
(72, 'test2', 1, '2020-03-30 09:04:01'),
(73, 'essai1', 1, '2020-03-30 09:05:45'),
(74, 'test', 1, '2020-03-30 09:08:49'),
(75, 'un autre sujet de merde', 1, '2020-03-30 10:12:34'),
(76, 'test', 1, '2020-03-30 12:19:56'),
(77, 'tttttt', 1, '2020-03-30 12:20:16'),
(78, 'a', 1, '2020-03-30 12:25:38'),
(79, 'tutiazpdbvaz', 1, '2020-03-30 12:33:51'),
(81, 'test', 1, '2020-03-31 08:04:55'),
(82, 'e', 1, '2020-03-31 12:09:38'),
(83, 'e', 1, '2020-03-31 12:10:03'),
(84, 'u', 1, '2020-03-31 12:40:37'),
(85, 'iuhur_fhergiezghhzegi', 1, '2020-03-31 12:40:49');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_user` (`membre_id`),
  ADD KEY `id_sujet` (`sujet_id`);

--
-- Index pour la table `submess`
--
ALTER TABLE `submess`
  ADD PRIMARY KEY (`id_submess`),
  ADD KEY `id_user` (`membre_id`),
  ADD KEY `submess_ibfk_1` (`message_id`);

--
-- Index pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`id_sujet`),
  ADD KEY `id_user` (`membre_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT pour la table `submess`
--
ALTER TABLE `submess`
  MODIFY `id_submess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sujet_id`) REFERENCES `sujet` (`id_sujet`) ON DELETE CASCADE;

--
-- Contraintes pour la table `submess`
--
ALTER TABLE `submess`
  ADD CONSTRAINT `submess_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id_message`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
