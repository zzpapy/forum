-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 26 mars 2020 à 08:14
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
-- Structure de la table `submess`
--

CREATE TABLE `submess` (
  `id_submess` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `message_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `submess`
--


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `submess`
--
ALTER TABLE `submess`
  ADD PRIMARY KEY (`id_submess`),
  ADD KEY `id_user` (`membre_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `submess`
--
ALTER TABLE `submess`
  MODIFY `id_submess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `submess`
--
ALTER TABLE `submess`
  ADD CONSTRAINT `submess_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id_message`);
  ADD CONSTRAINT `submess_ibfk_2` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
