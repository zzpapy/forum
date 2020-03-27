-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 27 mars 2020 à 13:39
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
  `password` varchar(1000) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `password`) VALUES
(1, 'zzpapy', '$2y$10$tCwzHObhirsVPPXxbzifzusdUAxMyIYkiNGKr1vO2M7tU1Rhg7XMO'),
(3, 'a', '$2y$10$2rH612FmyGoaGYCCCV6X6eGGnQqxTyo7GwUemL5aDJzE5lq3VLhlG'),
(6, 'user1', '$2y$10$7thxXC9eiJaoCXnoQgtCr.O.IfcwTarwOSQg3AEczU1M0q4w9CAwG');

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
(172, 'youpi', 1, 52, '2020-03-26 18:07:47'),
(173, 'jhsbvoyheoyrbfoyueagoye erg er gerygeryugroy goayr garory goar ga aoyrg aozyg p hmzehOUGHMOehzmu zem ', 3, 51, '2020-03-26 18:51:08'),
(174, 'jhsbvoyheoyrbfoyueagoye erg er gerygeryugroy goayr garory goar ga aoyrg aozyg p hmzehOUGHMOehzmu zem ', 3, 51, '2020-03-26 18:51:28'),
(175, 'jhsbvoyheoyrbfoyueagoye erg er gerygeryugroy goayr garory goar ga aoyrg aozyg p hmzehOUGHMOehzmu zem ', 3, 51, '2020-03-26 18:52:08'),
(176, 'jhsbvoyheoyrbfoyueagoye erg er gerygeryugroy goayr garory goar ga aoyrg aozyg p hmzehOUGHMOehzmu zem ', 3, 51, '2020-03-26 18:52:39'),
(177, 'aaaa', 3, 51, '2020-03-26 21:22:19'),
(178, 'aaaa', 3, 51, '2020-03-26 21:22:37'),
(179, 'aaaa', 3, 51, '2020-03-26 21:23:56'),
(180, 'aaaa', 3, 51, '2020-03-26 21:24:47'),
(181, 'aaaa', 3, 51, '2020-03-26 21:25:28'),
(182, 'aaaa', 3, 51, '2020-03-26 21:26:37'),
(183, 'aaaa', 3, 51, '2020-03-26 21:27:38'),
(184, 'aaaa', 3, 51, '2020-03-26 21:29:02'),
(185, 'aaaa', 3, 51, '2020-03-26 21:30:25'),
(186, 'aaaa', 3, 51, '2020-03-26 21:31:01'),
(187, 'aaaa', 3, 51, '2020-03-26 21:31:30'),
(188, 'test', 6, 56, '2020-03-27 13:26:51'),
(189, 'a', 6, 56, '2020-03-27 13:27:33'),
(190, 'a', 6, 56, '2020-03-27 13:27:47'),
(191, 'a', 6, 56, '2020-03-27 13:28:06'),
(192, 'cei est le premier message du sujet écrit par user 1', 6, 56, '2020-03-27 13:28:55'),
(193, 'cei est le premier message du sujet écrit par user 1', 6, 56, '2020-03-27 13:29:40'),
(194, 'ceci est est second message écrit par zzpapy qui ne comprend pas pourquoi il affiche >2 fois ce message alors qu&#39;il n&#39;est stocker qu&#39;une fois en bdd', 1, 56, '2020-03-27 13:31:41');

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
(134, 'ceci est test de commentaires par zzpapy', 194, 1, '2020-03-27 12:32:04'),
(135, 'on essaye encore une fois', 194, 1, '2020-03-27 12:32:25'),
(136, 'et maintenant...', 194, 1, '2020-03-27 12:32:42'),
(137, 'voici un commentaire de user1', 194, 6, '2020-03-27 12:33:15');

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
(51, 'test1', 1, '2020-03-26 17:01:39'),
(52, 'un autre', 1, '2020-03-26 18:07:35'),
(56, 'Ceci est un nouveau sujet créer par user 1', 6, '2020-03-27 13:25:10');

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
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT pour la table `submess`
--
ALTER TABLE `submess`
  MODIFY `id_submess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sujet_id`) REFERENCES `sujet` (`id_sujet`);

--
-- Contraintes pour la table `submess`
--
ALTER TABLE `submess`
  ADD CONSTRAINT `submess_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id_message`);

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
