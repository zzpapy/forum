-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 26 mars 2020 à 13:39
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
(2, 'moi', '$2y$10$VOs0dzmkEa.ckGSVOr35peTeoVtlnGCG6aobeU/cxS5MSTZhcbAHO'),
(3, 'a', '$2y$10$2rH612FmyGoaGYCCCV6X6eGGnQqxTyo7GwUemL5aDJzE5lq3VLhlG'),
(5, 'nouveau', '$2y$10$bzQ2xinaj1KEHePLjGOuCORKt.KAdL2Zqa3tyYGrFJfPoSmNIzMNi');

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


--
-- Structure de la table `submess`
--

CREATE TABLE `submess` (
  `id_submess` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `message_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE `sujet` (
  `id_sujet` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `sujet`
--



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
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT pour la table `submess`
--
ALTER TABLE `submess`
  MODIFY `id_submess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
