-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 27 mars 2020 à 13:34
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
-- Base de données : `cinema`
--
CREATE DATABASE IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `cinema`;

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id`, `nom`, `prenom`, `date`) VALUES
(1, 'de niro', 'robert', '1976-03-20'),
(2, 'pace', 'gregory', '1976-03-20');

-- --------------------------------------------------------

--
-- Structure de la table `bataille`
--

CREATE TABLE `bataille` (
  `ID_BATAILLE` int(11) NOT NULL,
  `ID_LIEU` int(11) NOT NULL,
  `NOM_BATAILLE` varchar(32) DEFAULT NULL,
  `DATE_BATAILLE` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `sortie` date DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `synopsis` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `realisateur` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `genre` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `sortie`, `duree`, `synopsis`, `realisateur`, `genre`) VALUES
(1, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(2, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(3, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(4, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(5, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(6, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(7, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2'),
(8, 'titanic', '2020-03-11', 120, 'naufrage', '2', '2');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `casting` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`, `casting`) VALUES
(1, 'comedie', NULL),
(2, 'policier', NULL),
(3, 'aventure', NULL),
(4, '2', NULL),
(5, '2', NULL),
(6, '2', NULL),
(7, '2', NULL),
(8, '2', NULL),
(9, '2', NULL),
(10, '2', NULL),
(11, '2', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `date` date DEFAULT NULL,
  `film` varchar(256) COLLATE utf8_bin DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`id`, `nom`, `prenom`, `date`, `film`) VALUES
(1, 'tarantino', 'quentin', '1970-01-01', '[]'),
(2, 'estwood', 'clint', '1962-04-25', '8');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `casting` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`, `casting`) VALUES
(1, 'jamesbond', NULL),
(2, 'indiana jones', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bataille`
--
ALTER TABLE `bataille`
  ADD PRIMARY KEY (`ID_BATAILLE`),
  ADD KEY `FK_SE_DEROULE` (`ID_LIEU`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de données : `cloud`
--
CREATE DATABASE IF NOT EXISTS `cloud` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `cloud`;

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

CREATE TABLE `bloc` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `text` varchar(1080) COLLATE utf8_bin NOT NULL,
  `date` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `bloc`
--

INSERT INTO `bloc` (`id`, `author`, `text`, `date`) VALUES
(12, 8, 'Test', '16-05-19 16:14'),
(14, 1, '', '19-05-19 02:36'),
(15, 1, '', '21-05-19 04:20'),
(16, 1, '', '23-05-19 01:51');

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

CREATE TABLE `cat` (
  `id` int(11) NOT NULL,
  `doc` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `cat`
--

INSERT INTO `cat` (`id`, `doc`, `title`) VALUES
(54, 148, 'Divers'),
(52, 146, 'TRAD MK'),
(50, 144, 'TRAD MK'),
(33, 127, 'TRAD MK'),
(34, 128, 'Divers'),
(26, 120, 'TRAD MK'),
(53, 147, 'TRAD MK'),
(330, 398, 'documents'),
(59, 153, 'TRAD MK'),
(214, 280, 'Divers'),
(61, 155, 'TRAD MK'),
(269, 0, 'tutu'),
(100, 160, 'TRAD MK'),
(99, 159, 'TRAD MK'),
(338, 406, 'TRAD MK'),
(169, 229, 'TRAD MK'),
(170, 230, 'TRAD MK'),
(171, 231, 'Divers'),
(172, 232, 'Divers'),
(173, 233, 'TRAD MK'),
(174, 234, 'Divers'),
(215, 281, 'TRAD MK'),
(143, 203, 'TRAD MK'),
(268, 0, 'tutu'),
(218, 284, 'TRAD MK'),
(340, 408, 'TRAD MK'),
(220, 286, 'TRAD MK'),
(221, 287, 'Divers'),
(341, 409, 'developpement'),
(224, 290, 'Divers'),
(225, 291, 'TRAD MK'),
(238, 304, 'Divers'),
(316, 384, 'TRAD_MK'),
(236, 302, 'TRAD MK'),
(315, 383, 'TRAD_MK'),
(234, 300, 'Divers'),
(235, 301, 'TRAD MK'),
(336, 404, 'TRAD_MK'),
(334, 402, 'TRAD_MK'),
(335, 403, 'Divers'),
(258, 0, 'tutu'),
(333, 401, 'TRAD_MK'),
(314, 382, 'TRAD MK'),
(260, 0, 'tutu'),
(307, 375, 'TRAD MK'),
(305, 373, 'TRAD MK'),
(306, 374, 'TRAD MK'),
(339, 407, 'TRAD_MK'),
(347, 415, 'TRAD MK'),
(346, 414, 'Divers'),
(345, 413, 'Divers'),
(348, 416, 'TRAD_MK'),
(349, 417, 'Divers'),
(350, 418, 'TRAD MK'),
(351, 419, 'TRAD MK'),
(352, 420, 'Divers'),
(353, 421, 'Divers'),
(354, 422, 'TRAD MK'),
(355, 423, 'TRAD MK'),
(356, 424, 'Divers'),
(357, 425, 'TRAD MK'),
(358, 426, 'Divers'),
(359, 427, 'TRAD MK'),
(360, 428, 'TRAD MK'),
(361, 429, 'TRAD MK'),
(362, 430, 'TRAD MK'),
(363, 431, 'Divers'),
(364, 432, 'Divers'),
(365, 433, 'TRAD MK'),
(366, 434, 'TRAD MK'),
(367, 435, 'TRAD MK'),
(368, 436, 'TRAD_MK'),
(369, 437, 'TRAD MK'),
(370, 438, 'TRAD_MK'),
(371, 439, 'TRAD_MK'),
(372, 440, 'TRAD MK'),
(373, 441, 'Divers'),
(374, 442, 'TRAD MK'),
(375, 443, 'Divers'),
(376, 444, 'Divers'),
(379, 447, 'TRAD MK'),
(378, 446, 'TRAD_MK'),
(380, 448, 'TRAD_MK'),
(382, 450, 'documents'),
(385, 453, 'Codes'),
(386, 0, 'Codes'),
(387, 0, 'Codes'),
(388, 0, 'Codes'),
(389, 0, 'Codes'),
(390, 0, 'Codes'),
(391, 0, 'Codes'),
(392, 0, 'Codes'),
(393, 0, 'Codes'),
(394, 0, 'Codes'),
(395, 0, 'Codes'),
(396, 0, 'Codes'),
(397, 0, 'Codes'),
(398, 0, 'Codes'),
(399, 0, 'Codes'),
(404, 459, 'Codes');

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `mess` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `date` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `size` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `size_plus` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `chat`
--

INSERT INTO `chat` (`id`, `user`, `mess`, `date`, `size`, `size_plus`) VALUES
(1, 'zzpapy', 'coucou donc voilà le chat est au point', '09-05-19 12:06', '68', '419'),
(2, 'zzpapy', 'avec possibilité de mettre des emoji😁', '09-05-19 12:06', '', ''),
(3, 'zzpapy', '😘', '09-05-19 12:07', '', ''),
(4, 'zzpapy', '😃', '09-05-19 12:08', '', ''),
(5, 'zzpapy', 'test😖', '09-05-19 12:08', '', ''),
(6, 'zzpapy', 'test😋', '09-05-19 12:08', '', ''),
(7, 'zzpapy', 'je test en core et encore pour voir si ça bug avec des longues phrases on verra 🤔', '09-05-19 12:16', '', ''),
(8, 'zzpapy', '😊😊😊😊😊', '09-05-19 12:16', '', ''),
(9, 'zzpapy', '😁', '09-05-19 12:17', '', ''),
(10, 'zzpapy', 'ok donc maintenant il est au point😂', '09-05-19 12:19', '', ''),
(11, 'zzpapy', 'tu as remarqué que tu peux lire l\'historique maintenant ?', '09-05-19 12:20', '', ''),
(12, 'zzpapy', '😀', '09-05-19 14:15', '', ''),
(13, 'zzpapy', '🌊', '09-05-19 16:04', '', ''),
(14, 'zzpapy', '😃', '09-05-19 16:59', '', ''),
(15, 'zzpapy', '😊', '09-05-19 17:01', '', ''),
(16, '', '😂', '09-05-19 17:03', '', ''),
(17, '', '😃', '09-05-19 17:03', '', ''),
(18, '', 'test', '09-05-19 17:03', '', ''),
(19, 'zzpapy', '😃', '09-05-19 17:04', '', ''),
(20, 'zzpapy', 'test', '09-05-19 17:04', '', ''),
(21, 'zzpapy', '😉', '09-05-19 17:44', '', ''),
(22, 'manu', 'Coucou je file au théâtre mais oui j\'avais remarqué et t\'ai écrit plien de mots mais aucun n\'est passé visiblement...', '09-05-19 18:05', '', ''),
(23, 'manu', 'là c\'est passé :))', '09-05-19 18:06', '', ''),
(24, 'manu', 'je te disais trop fort bravo !!', '09-05-19 18:06', '', ''),
(25, 'manu', 'ici ça clignote juste le temps où j\'écris...', '09-05-19 18:06', '', ''),
(26, 'manu', 'Et aussi tout ce qui précède tes tests d\'ajourd\'hui n\'est plus visible mais j\'imagine c\'est noraml à cause que c\'est une nouvelle configuration (sûrement pas les bons mots mais tu vois ce que je veux dire :)', '09-05-19 18:07', '', ''),
(27, 'manu', 'ohlala j\'écris n\'importe comment pardon je dois me préparer pour pas être à la bourre des bacioni grossi di grazie ', '09-05-19 18:08', '', ''),
(28, 'manu', 'en revanche emoji sont forme de petis rectangles avec des espèces de chiffres dedans...', '09-05-19 18:09', '', ''),
(29, 'zzpapy', 'ça c à cause de ton mac essay sur le pc de arnaud', '09-05-19 18:15', '', ''),
(30, 'zzpapy', 'esseye aussi de cliquer sur un des symboles et envoie pour ce que ça donne', '09-05-19 18:15', '', ''),
(31, 'zzpapy', '👂🏼', '09-05-19 18:17', '', ''),
(32, 'zzpapy', '😊😉', '09-05-19 18:31', '', ''),
(33, 'toto', '☹', '09-05-19 18:43', '', ''),
(34, 'toto', '😊', '09-05-19 18:50', '', ''),
(35, 'manu', 'Eh ben sur mon tel ça marche :))', '09-05-19 21:04', '', ''),
(36, 'manu', 'Enfin je vois tes emojis', '09-05-19 21:04', '', ''),
(37, 'manu', 'Avec Arnaud compliqué de se croiser pr l\'instant emploi du temps un peu serré il a même pas pu encore voir le site... mais ça va venir ! ', '09-05-19 21:05', '', ''),
(38, 'manu', 'Bacioni 😘😘!!', '09-05-19 21:05', '', ''),
(39, 'manu', 'Ahah ca Marche !', '09-05-19 21:05', '', ''),
(40, 'zzpapy', 'test', '10-05-19 10:32', '', ''),
(41, 'zzpapy', 'test', '10-05-19 11:01', '', ''),
(42, 'toto', '😃', '10-05-19 11:01', '', ''),
(43, 'zzpapy', '', '10-05-19 11:01', '', ''),
(44, 'zzpapy', '', '10-05-19 11:01', '', ''),
(45, 'zzpapy', '', '10-05-19 11:01', '', ''),
(46, 'zzpapy', 'ça clignotte plus', '10-05-19 11:02', '', ''),
(47, 'zzpapy', '😊😊😊😛', '10-05-19 11:02', '', ''),
(48, 'zzpapy', 'test', '10-05-19 12:59', '', ''),
(49, 'zzpapy', '😂', '10-05-19 13:00', '', ''),
(50, 'zzpapy', '😊', '10-05-19 13:02', '', ''),
(51, 'zzpapy', 'test', '10-05-19 13:07', '', ''),
(52, 'zzpapy', 'j\'ai changé la police je trouve celle-ci plus claire...', '10-05-19 13:14', '', ''),
(53, 'zzpapy', 'test', '10-05-19 14:55', '', ''),
(54, 'zzpapy', 'test', '10-05-19 14:56', '', ''),
(55, 'zzpapy', 'coucou', '10-05-19 14:57', '', ''),
(56, 'zzpapy', 'tutu', '10-05-19 14:58', '', ''),
(57, 'zzpapy', 'titi', '10-05-19 14:59', '', ''),
(58, 'zzpapy', 'uuuuuu', '10-05-19 15:00', '', ''),
(59, 'zzpapy', 'kkkkkk', '10-05-19 15:01', '59', ''),
(60, 'zzpapy', 'et maintenant', '10-05-19 15:03', '60', ''),
(61, 'zzpapy', 'test', '10-05-19 15:04', '', ''),
(62, 'zzpapy', 'coucou', '10-05-19 15:05', '', ''),
(63, 'zzpapy', '😃', '10-05-19 15:10', '', ''),
(64, 'zzpapy', '😂', '10-05-19 15:11', '', ''),
(65, 'zzpapy', '😂', '10-05-19 15:12', '', ''),
(66, 'zzpapy', 'coucou', '10-05-19 15:16', '', ''),
(67, 'zzpapy', 'tutu', '10-05-19 15:18', '', ''),
(68, 'zzpapy', 'aaa', '10-05-19 15:28', '', ''),
(69, 'test', 'essai stock ', '10-05-19 15:48', '', ''),
(70, 'test', 'totottutut', '10-05-19 15:49', '', ''),
(71, 'test', 'tr', '10-05-19 15:49', '', ''),
(72, 'test', 'yggygygygyg', '10-05-19 15:54', '', ''),
(73, 'test', 'jjiijiji', '10-05-19 15:54', '', ''),
(74, 'test', 'uhefuazhfuzeuh', '10-05-19 16:03', '', ''),
(75, 'test', 'h_rhrzhghgi', '10-05-19 16:03', '', ''),
(76, 'test', 'niraiernz', '10-05-19 16:03', '', ''),
(77, 'test', 'testtutut', '10-05-19 16:25', '', ''),
(78, 'test', 'zdzadaz', '10-05-19 16:25', '', ''),
(79, 'test', 'test vert', '10-05-19 16:28', '', ''),
(80, 'test', 'yezyfzegfgz', '10-05-19 16:49', '', ''),
(81, 'test', 'testtest', '10-05-19 16:57', '', ''),
(82, 'test', 'toto', '10-05-19 16:58', '', ''),
(83, 'test', 'uhqzfh', '10-05-19 17:05', '', ''),
(84, 'test', 'test', '10-05-19 17:07', '', ''),
(85, 'test', 'ygryzerygye', '10-05-19 17:19', '', ''),
(86, 'test', 'test', '10-05-19 17:33', '', ''),
(87, 'zzpapy', 'eee', '10-05-19 17:34', '', ''),
(88, 'test', 'tutu', '10-05-19 17:37', '', ''),
(89, 'zzpapy', 'ytgtgy', '10-05-19 17:52', '', ''),
(90, 'test', 'test', '10-05-19 18:08', '', ''),
(91, 'zzpapy', 'yuefyue', '10-05-19 18:11', '', ''),
(92, 'zzpapy', 'test', '10-05-19 18:12', '', ''),
(93, 'zzpapy', 'tets', '10-05-19 18:15', '', ''),
(94, 'test', 'test', '10-05-19 18:15', '', ''),
(95, 'test', 'test', '10-05-19 18:16', '', ''),
(96, 'test', 'ygzfzefgzgu', '10-05-19 18:24', '', ''),
(97, 'zzpapy', 'donc aujourd\'hui j\'ai bien travaillé', '10-05-19 18:37', '', ''),
(98, 'zzpapy', '', '10-05-19 18:37', '', ''),
(99, 'zzpapy', '', '10-05-19 18:37', '', ''),
(100, 'zzpapy', 'le chat ne clignotte plus', '10-05-19 18:37', '', ''),
(101, 'zzpapy', '', '10-05-19 18:37', '', ''),
(102, 'zzpapy', '', '10-05-19 18:37', '', ''),
(103, 'zzpapy', '', '10-05-19 18:37', '', ''),
(104, 'zzpapy', 'comme je penses tu l\'as constaté, j\'ai mis aussi les notifications des nouveaux messages en direct', '10-05-19 18:38', '', ''),
(105, 'zzpapy', 'enfin j\'ai fait un peu de style ', '10-05-19 18:39', '', ''),
(106, 'zzpapy', 'changer la police je trouve ça plus clair', '10-05-19 18:39', '', ''),
(107, 'zzpapy', 'et un peu de style sur le chat', '10-05-19 18:40', '', ''),
(108, 'zzpapy', 'maintenant je vais me boire une bière😋🍺', '10-05-19 18:41', '', ''),
(109, 'zzpapy', '😘', '10-05-19 18:41', '', ''),
(110, 'test', 're test apparement y a un bug', '10-05-19 18:44', '', ''),
(111, 'zzpapy', 'test', '10-05-19 18:44', '', ''),
(112, 'zzpapy', 'et maintenant', '10-05-19 18:45', '', ''),
(113, 'zzpapy', 'ça marche ouf en fai si le chat est ouvert tu n\'auras de notif', '10-05-19 18:46', '', ''),
(114, 'zzpapy', 'dernier petit essai', '10-05-19 18:46', '', ''),
(115, 'test', 'test', '10-05-19 18:48', '', ''),
(116, 'zzpapy', '😉', '10-05-19 18:58', '', ''),
(117, 'zzpapy', 'j\'ai aussifait truc qui fait que si tu ne travail pas pendant plus de 10min tu seras déconnectée du site donc rafraîchis tjrs ta page quand tu te remets dessus 😉', '10-05-19 19:09', '', ''),
(118, 'test', '🤔', '10-05-19 19:37', '', ''),
(119, 'zzpapy', 're🤔', '10-05-19 19:40', '', ''),
(120, 'zzpapy', 're🤔', '10-05-19 19:40', '', ''),
(121, 'test', 'test', '10-05-19 19:43', '', ''),
(122, 'zzpapy', '😁', '10-05-19 19:44', '', ''),
(123, 'zzpapy', '😁', '10-05-19 19:44', '', ''),
(124, 'zzpapy', '😁', '10-05-19 19:45', '', ''),
(125, 'zzpapy', '😂', '10-05-19 19:51', '', ''),
(126, 'manu', 'SAlut petit frère je vois tout ça maintenant !', '11-05-19 00:43', '', ''),
(127, 'manu', 'Oui très très bien la police, ça \"repose\" plus les yeux', '11-05-19 00:44', '', ''),
(128, 'manu', '😀😂😉☺🤗😲😤👮', '11-05-19 00:44', '', ''),
(129, 'manu', 'Et des emojis pour la route :))', '11-05-19 00:44', '', ''),
(130, 'manu', 'et grave comment ça cligo,te plus !!', '11-05-19 00:45', '', ''),
(131, 'zzpapy', 'attend j\'ai fait une connerie je t\'ai déconnecté reconnecte toi', '11-05-19 00:45', '', ''),
(132, 'manu', 'Et j\'ai aussi vu les notifs merciii !', '11-05-19 00:45', '', ''),
(133, 'manu', 'Des gros bisous fin de journée ici... (petit enregistrement et hop :))', '11-05-19 00:45', '', ''),
(134, 'zzpapy', '😘', '11-05-19 00:47', '', ''),
(135, 'manu', 'Ben me suis déconnectée reconnectée mais j\'ai l\'impression que j\'étais en ligne tout à l\'heure...', '11-05-19 00:47', '', ''),
(136, 'zzpapy', 'oui pour toi mais pas pour las bas de donnée c\'est comme si j\'avais piraté😂', '11-05-19 00:48', '', ''),
(137, 'manu', 'Ah... je vois à peu près le principe même si pas trop \"dans le précis\" :)) un bacione di buona notte ! (PS. tes emojis sont tjs des rectangles avec des chiffres dedans (aussi bien messagess envoyés que reçus mais c\'est pas très grave : je crois que mon ord', '11-05-19 00:52', '', ''),
(138, 'test', '😂', '11-05-19 18:03', '', ''),
(139, 'test', '😂', '11-05-19 18:04', '', ''),
(140, 'test', '😃', '11-05-19 18:04', '', ''),
(141, 'test', '😂', '11-05-19 18:17', '', ''),
(142, 'test', '😂', '11-05-19 18:19', '', ''),
(143, 'test', '😘', '11-05-19 18:34', '', ''),
(144, 'test', '😅', '11-05-19 18:41', '', ''),
(145, 'test', '😂', '11-05-19 18:44', '', ''),
(146, 'manu', 'Je vois que le chat a pas pris la fin de mon texte hier...', '12-05-19 03:27', '', ''),
(147, 'manu', 'J\'avais écrit que mon ordi je crois qu\'il a jamais eu d\'emojis :)) trop vieux', '12-05-19 03:28', '', ''),
(148, 'manu', 'Bacioni fini pour aujourd\'hui docs enregistrés :))', '12-05-19 03:28', '', ''),
(149, 'manu', 'PS. quand même y\'a un bouton test en haut à droite, c\'est quoi...? ', '12-05-19 03:29', '', ''),
(150, 'manu', 'Question du soir bonsoir bacione !', '12-05-19 03:29', '', ''),
(151, 'zzpapy', 'Comme son nom l\'indique test ;)', '12-05-19 10:13', '', ''),
(152, 'zzpapy', '', '12-05-19 10:13', '', ''),
(153, 'zzpapy', 'test', '12-05-19 11:44', '', ''),
(154, 'zzpapy', 'toto', '12-05-19 11:51', '', ''),
(155, 'test', 'ff', '12-05-19 11:56', '', ''),
(156, 'test', 'aaa', '12-05-19 12:01', '', ''),
(157, 'test', 'Rrr', '12-05-19 12:02', '', ''),
(158, 'test', 'Rrg', '12-05-19 12:03', '', ''),
(159, 'test', 'Tot', '12-05-19 12:08', '', ''),
(160, 'test', 'coucou', '12-05-19 12:09', '', ''),
(161, 'test', 'et maintenant', '12-05-19 12:10', '', ''),
(162, 'zzpapy', 'coucou', '12-05-19 12:15', '', ''),
(163, 'zzpapy', 'toto', '12-05-19 12:15', '', ''),
(164, 'test', 'G', '12-05-19 12:15', '', ''),
(165, 'zzpapy', 'toto', '12-05-19 12:16', '', ''),
(166, 'test', 'et maintenant', '12-05-19 12:18', '', ''),
(167, 'test', 'coucou', '12-05-19 12:19', '', ''),
(168, 'test', 'C', '12-05-19 12:23', '', ''),
(169, 'test', 'et maintenant', '12-05-19 12:23', '', ''),
(170, 'test', 'coucou', '12-05-19 12:24', '', ''),
(171, 'test', 'aaa', '12-05-19 12:25', '', ''),
(172, 'test', 'E', '12-05-19 12:25', '', ''),
(173, 'test', 'et maintenant', '12-05-19 12:26', '', ''),
(174, 'zzpapy', 'coucou', '12-05-19 12:26', '', ''),
(175, 'test', 'fzezefzzzzsw', '12-05-19 12:27', '', ''),
(176, 'zzpapy', 'coucou', '12-05-19 12:32', '', ''),
(177, 'zzpapy', 'coucou', '12-05-19 12:32', '', ''),
(178, 'test', 'et maintenant', '12-05-19 12:33', '', ''),
(179, 'manu', 'gygg', '12-05-19 12:33', '', ''),
(180, 'zzpapy', 'tutu', '12-05-19 12:34', '', ''),
(181, 'zzpapy', 'donc maintenant normalement tu as xhwebaka qui t\'annonces l\'arrivée d\'un message', '12-05-19 12:35', '', ''),
(182, 'zzpapy', 'et normalement si tu utilise mozzilla ou chrome comme navigateur, tu pourras voir les emoji', '12-05-19 12:36', '', ''),
(183, 'zzpapy', '', '12-05-19 12:36', '', ''),
(184, 'zzpapy', 'parce que en fait c\'est le navigateur safari qui ne sait pas interprété le code des emojis 😉', '12-05-19 12:37', '', ''),
(185, 'zzpapy', '😂', '12-05-19 12:38', '', ''),
(186, 'test', 'et maintenant', '12-05-19 13:07', '', ''),
(187, 'test', 'T', '12-05-19 13:07', '', ''),
(188, 'test', 'coucou', '12-05-19 13:07', '', ''),
(189, 'zzpapy', '😉', '12-05-19 14:18', '', ''),
(190, 'zzpapy', 'Y', '12-05-19 14:19', '', ''),
(191, 'zzpapy', 'et maintenant', '12-05-19 14:24', '', ''),
(192, 'zzpapy', 'toto', '12-05-19 14:25', '', ''),
(193, 'zzpapy', 'toto', '12-05-19 14:25', '', ''),
(194, 'zzpapy', 'toto', '12-05-19 14:25', '', ''),
(195, 'zzpapy', 'et maintenant', '12-05-19 14:39', '', ''),
(196, 'test', 'coucou', '12-05-19 17:35', '', ''),
(197, 'test', 'Test', '12-05-19 18:20', '', ''),
(198, 'test', 'Test', '12-05-19 18:43', '', ''),
(199, 'zzpapy', 'test', '12-05-19 18:43', '', ''),
(200, 'test', 'coucou', '12-05-19 19:03', '', ''),
(201, 'test', 'J', '12-05-19 19:03', '', ''),
(202, 'test', 'et maintenant', '12-05-19 19:04', '', ''),
(203, 'zzpapy', 'coucou', '12-05-19 19:04', '', ''),
(204, 'zzpapy', 'toto', '12-05-19 19:04', '', ''),
(205, 'zzpapy', '', '12-05-19 19:05', '', ''),
(206, 'test', 'coucou', '12-05-19 19:05', '', ''),
(207, 'zzpapy', 'test', '12-05-19 19:06', '', ''),
(208, 'zzpapy', 'coucou', '12-05-19 19:06', '', ''),
(209, 'test', 'coucou', '12-05-19 19:06', '', ''),
(210, 'zzpapy', 'test', '12-05-19 19:06', '', ''),
(211, 'zzpapy', 'test', '12-05-19 19:07', '', ''),
(212, 'zzpapy', '', '12-05-19 19:08', '', ''),
(213, 'test', '', '12-05-19 19:08', '', ''),
(214, 'zzpapy', 'en fait c\'est mario bross qui annoce les message', '12-05-19 19:09', '', ''),
(215, 'zzpapy', '', '12-05-19 19:10', '', ''),
(216, 'zzpapy', 'toto', '12-05-19 19:12', '', ''),
(217, 'test', 'To', '12-05-19 19:12', '', ''),
(218, 'test', '', '12-05-19 19:12', '', ''),
(219, 'zzpapy', 'f', '12-05-19 19:13', '', ''),
(220, 'test', '', '12-05-19 19:15', '', ''),
(221, 'test', '', '12-05-19 19:16', '', ''),
(222, 'test', '', '12-05-19 19:21', '', ''),
(223, 'test', '', '12-05-19 19:22', '', ''),
(224, 'zzpapy', 'e', '12-05-19 19:23', '', ''),
(225, 'zzpapy', '', '12-05-19 19:27', '', ''),
(226, 'zzpapy', '', '12-05-19 19:27', '', ''),
(227, 'test', 'et maintenant', '12-05-19 19:28', '', ''),
(228, 'zzpapy', '', '12-05-19 19:29', '', ''),
(229, 'zzpapy', '', '12-05-19 19:30', '', ''),
(230, 'zzpapy', '', '12-05-19 19:32', '', ''),
(231, 'zzpapy', '', '12-05-19 19:32', '', ''),
(232, 'zzpapy', '', '12-05-19 19:32', '', ''),
(233, 'zzpapy', '', '12-05-19 19:33', '', ''),
(234, 'zzpapy', 'test', '12-05-19 19:34', '', ''),
(235, 'zzpapy', '', '12-05-19 19:34', '', ''),
(236, 'zzpapy', '', '12-05-19 19:35', '', ''),
(237, 'zzpapy', 'toto', '12-05-19 19:35', '', ''),
(238, 'zzpapy', '', '12-05-19 19:36', '', ''),
(239, 'zzpapy', '', '12-05-19 19:36', '', ''),
(240, 'zzpapy', '', '12-05-19 19:37', '', ''),
(241, 'test', '', '12-05-19 19:38', '', ''),
(242, 'test', '', '12-05-19 19:39', '', ''),
(243, 'zzpapy', '', '12-05-19 19:39', '', ''),
(244, 'zzpapy', 'toto', '12-05-19 19:42', '', ''),
(245, 'test', '', '12-05-19 19:42', '', ''),
(246, 'test', '', '12-05-19 19:44', '', ''),
(247, 'zzpapy', '', '12-05-19 19:44', '', ''),
(248, 'zzpapy', '', '12-05-19 19:44', '', ''),
(249, 'test', '', '12-05-19 19:46', '', ''),
(250, 'test', '', '12-05-19 19:55', '', ''),
(251, 'test', 'test', '12-05-19 19:55', '', ''),
(252, 'test', '', '12-05-19 19:55', '', ''),
(253, 'test', '', '12-05-19 19:58', '', ''),
(254, 'test', '', '12-05-19 19:58', '', ''),
(255, 'test', '', '12-05-19 19:58', '', ''),
(256, 'test', '', '12-05-19 19:59', '', ''),
(257, 'test', '', '12-05-19 19:59', '', ''),
(258, 'test', '', '12-05-19 20:00', '', ''),
(259, 'test', '', '12-05-19 20:00', '', ''),
(260, 'zzpapy', 'toto', '12-05-19 20:01', '', ''),
(261, 'zzpapy', '', '12-05-19 20:16', '', ''),
(262, 'test', '', '12-05-19 20:16', '', ''),
(263, 'zzpapy', '', '12-05-19 20:17', '', ''),
(264, 'zzpapy', '', '12-05-19 20:32', '', ''),
(265, 'zzpapy', 'tu es là', '12-05-19 20:40', '', ''),
(266, 'manu', 'J\'y suis mais pas d\'emoji...', '12-05-19 20:41', '', ''),
(267, 'zzpapy', 'et tu entends pas un  son qd tu rçois un message', '12-05-19 20:42', '', ''),
(268, 'manu', 'j\'avais pas le son...', '12-05-19 20:43', '', ''),
(269, 'zzpapy', 'et maintenant', '12-05-19 20:43', '', ''),
(270, 'manu', 'ah ça a fait un gros son qd j\'ai envoyé !', '12-05-19 20:43', '', ''),
(271, 'manu', 'oui !', '12-05-19 20:43', '', ''),
(272, 'zzpapy', 'c\'est chwebacca', '12-05-19 20:44', '', ''),
(273, 'manu', ':))) trop joli !', '12-05-19 20:44', '', ''),
(274, 'zzpapy', '', '12-05-19 20:44', '', ''),
(275, 'zzpapy', 'tu kiffes', '12-05-19 20:44', '', ''),
(276, 'manu', 'yes !! ', '12-05-19 20:45', '', ''),
(277, 'bondgirl', 'hello', '12-05-19 20:45', '', ''),
(278, 'bondgirl', 'Manù c\'est Marie!!!', '12-05-19 20:46', '', ''),
(279, 'manu', 'ohoh qui es-tu bondgirl ??', '12-05-19 20:46', '', ''),
(280, 'manu', 'ah ben voilà :)) !!! salut bondgirl !!', '12-05-19 20:46', '', ''),
(281, 'manu', 'ça va en ce dimanche soir ?!', '12-05-19 20:48', '', ''),
(282, 'bondgirl', 'oui ça va bien', '12-05-19 20:49', '', ''),
(283, 'bondgirl', 'Baptiste nous a fait a manger', '12-05-19 20:49', '', ''),
(284, 'bondgirl', 'des boulettes et des patates😋', '12-05-19 20:49', '', ''),
(285, 'manu', 'Trop bien !! Bon apétit les amis alors une grosse bise à Baptiste !', '12-05-19 20:50', '', ''),
(286, 'zzpapy', 'ça marche trop bien 😀', '12-05-19 20:50', '', ''),
(287, 'manu', 'Ici c\'est Arnaud qui a fait le repas : patates :)) et rôti de porc avec des choux, j\'ai ma petite assiette devant l\'ordi aussi', '12-05-19 20:51', '', ''),
(288, 'bondgirl', 'nickel!!!!', '12-05-19 20:51', '', ''),
(289, 'zzpapy', 'il a pas essayé encore ...', '12-05-19 20:51', '', ''),
(290, 'bondgirl', 'Bon Ap\'', '12-05-19 20:51', '', ''),
(291, 'manu', 'Ben non il a pas encore essayé parce que moi je suis devant l\'ordi et lui il gère tout le quotidien, école, conservatoire, répétitions etc... duc oup on ne s\'est pas posés encore ensemble pour que je lui montre le site', '12-05-19 20:53', '', ''),
(292, 'zzpapy', 'ah ok', '12-05-19 20:53', '', ''),
(293, 'manu', 'ouais c\'est un peu chaud le planning à la maison... ', '12-05-19 20:54', '', ''),
(294, 'test', 'Test', '12-05-19 20:58', '', ''),
(295, 'bondgirl', 'test bis', '12-05-19 20:59', '', ''),
(296, 'manu', 'euh test ter...', '12-05-19 20:59', '', ''),
(297, 'bondgirl', 'j\'envoie un truc', '12-05-19 21:00', '', ''),
(298, 'manu', 'Ok...', '12-05-19 21:00', '', ''),
(299, 'zzpapy', 're test', '12-05-19 21:00', '', ''),
(300, 'zzpapy', '', '12-05-19 21:01', '', ''),
(301, 'bondgirl', 'on vient de changer de son', '12-05-19 21:01', '', ''),
(302, 'zzpapy', 'c r2d2', '12-05-19 21:01', '', ''),
(303, 'manu', 'ah j\'ai pas trop vu la différence...', '12-05-19 21:01', '', ''),
(304, 'zzpapy', '', '12-05-19 21:01', '', ''),
(305, 'zzpapy', '', '12-05-19 21:01', '', ''),
(306, 'zzpapy', '', '12-05-19 21:01', '', ''),
(307, 'manu', 'non, je maintiens pas de différence chez moi...', '12-05-19 21:01', '', ''),
(308, 'zzpapy', 'rafraichie le page', '12-05-19 21:02', '', ''),
(309, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(310, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(311, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(312, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(313, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(314, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(315, 'manu', 'merde si ça se trouve c\'est même pas chewbaca que j\'entends...', '12-05-19 21:02', '', ''),
(316, 'manu', 'a y est', '12-05-19 21:02', '', ''),
(317, 'manu', 'Ah ah oui !!', '12-05-19 21:02', '', ''),
(318, 'zzpapy', 'c moins agressif', '12-05-19 21:03', '', ''),
(319, 'manu', 'ça c\'est encore plus mignon je préfère', '12-05-19 21:03', '', ''),
(320, 'manu', 'Oui exact !', '12-05-19 21:03', '', ''),
(321, 'zzpapy', 'si tu cliques sur le snoms actifs tu l\'info dernière connexion ', '12-05-19 21:04', '', ''),
(322, 'zzpapy', 'tu as ', '12-05-19 21:04', '', ''),
(323, 'manu', 'j\'arrive à cliquer que sur toi', '12-05-19 21:06', '', ''),
(324, 'zzpapy', 'clic sur moi et aprés sur les autres test', '12-05-19 21:10', '', ''),
(325, 'manu', 'ça marche sur toi et sur moi', '12-05-19 21:12', '', ''),
(326, 'zzpapy', '', '12-05-19 21:15', '', ''),
(327, 'zzpapy', 'ok jvais regarder', '12-05-19 21:15', '', ''),
(328, 'zzpapy', 'c\'est bon j\'ai compris', '12-05-19 21:16', '', ''),
(329, 'zzpapy', 'bon ap', '12-05-19 21:21', '', ''),
(330, 'manu', 'yep, a y est fini de mange je m\'y remets je me déconnecte et vous fais des gros bisous de bon ap aussi et de bonne soirée (je \"reviens\" sur le site pour enregistere en fin de taf...)', '12-05-19 21:22', '', ''),
(331, 'zzpapy', 'bonne nuit', '12-05-19 21:24', '', ''),
(332, 'manu', 'Buona notte (je peux même pas envoyer un bisou avec mon vieil ordi :(( tant pis je le dis : bisous !', '12-05-19 21:28', '', ''),
(333, 'zzpapy', '', '12-05-19 21:32', '', ''),
(334, 'test', 'Bonjour😁', '13-05-19 11:30', '', ''),
(335, 'zzpapy', 'Test', '13-05-19 13:41', '', ''),
(336, 'zzpapy', 'tutu', '13-05-19 13:41', '', ''),
(337, 'zzpapy', 'Test', '13-05-19 13:42', '', ''),
(338, 'bondgirl', 'Test', '13-05-19 13:44', '', ''),
(339, 'bondgirl', '', '13-05-19 13:44', '', ''),
(340, 'zzpapy', 'coucou', '13-05-19 13:45', '', ''),
(341, 'zzpapy', 'Bonne nuit', '13-05-19 23:04', '', ''),
(342, 'manu', 'Oups coucou ben voilà me connecte à c\'te heure... enregistrment des nouveaux docs...', '14-05-19 03:33', '', ''),
(343, 'manu', 'J\'espère vous dormez bien... Je vous fais un gros bisou de belle journée :))', '14-05-19 03:34', '', ''),
(344, 'test', 'Test', '14-05-19 12:45', '', ''),
(345, 'zzpapy', 'bonjour', '15-05-19 10:38', '', ''),
(346, 'test', 'Test', '15-05-19 10:42', '', ''),
(347, 'zzpapy', 're bonjour je sais pas si tu as vu, mais je t\'ai créé un bloc-notes. En haut à droite 😀', '15-05-19 12:33', '', ''),
(348, 'zzpapy', 'A droite sur le pc', '15-05-19 17:53', '', ''),
(349, 'zzpapy', 'A gauche sur le tel', '15-05-19 17:54', '', ''),
(350, 'zzpapy', 'finalement c à gauche sur le pc', '15-05-19 19:59', '', ''),
(351, 'test', 'Coucou', '16-05-19 12:38', '', ''),
(352, 'zzpapy', 'tgtgtgtgt', '16-05-19 12:38', '', ''),
(353, 'test', 'Essai', '16-05-19 14:55', '', ''),
(354, 'zzpapy', 're essi', '16-05-19 14:55', '', ''),
(355, 'zzpapy', 'Donc comme je disais plus haut je t\'ai créé un bloc_notes', '16-05-19 15:13', '', ''),
(356, 'zzpapy', 'prendre des notes et les effacées', '16-05-19 15:13', '', ''),
(357, 'zzpapy', 'Aprés, un pey plus technique je stock sur un disque dur externe maintenant, d\'où l\'espace dispo plus important (173 giga actuellement)', '16-05-19 15:15', '', ''),
(358, 'zzpapy', 'par contre je voudrais quetu fasses des test de stockages et de téléchargements, d\'effacement et de création de dossiers , afin de vérifier que tout tourne correctement', '16-05-19 15:16', '', ''),
(359, 'test', 'Test', '16-05-19 16:43', '', ''),
(360, 'test', '3', '16-05-19 16:43', '', ''),
(361, 'zzpapy', 'je t\'ai créer un agenda aussi...', '18-05-19 13:50', '', ''),
(362, 'zzpapy', 'bon ya un décalage ds l\'affichage style si tu clic sur 7h30 il te l\'affiche à 8h ', '18-05-19 16:08', '', ''),
(363, 'zzpapy', '', '18-05-19 16:08', '', ''),
(364, 'zzpapy', 'je vais résoudre...', '18-05-19 16:08', '', ''),
(365, 'zzpapy', 'Tu es la', '18-05-19 18:55', '', ''),
(366, 'zzpapy', 'Coucou', '18-05-19 18:58', '', ''),
(367, 'manu', 'La première version du pdf (qui ne me sert pas donc car il y a eu des modifs de texte depuis) à été enregistrée !', '18-05-19 19:34', '', ''),
(368, 'manu', 'Ça a pris une demi-heure (ce qui fait que je n\'ai pas pu réondre à ton mesage chat : quand il télécharge je ne peux pas accéder au chat)', '18-05-19 19:35', '', ''),
(369, 'manu', 'Des baci !', '18-05-19 19:35', '', ''),
(370, 'manu', 'Puis téléchargé sur mon ordi, ça fonctionne aussi ! Apparemment otut va bien !!', '18-05-19 19:37', '', ''),
(371, 'zzpapy', 'Ok baci', '18-05-19 19:43', '', ''),
(372, 'manu', 'Buona notte ', '19-05-19 02:36', '', ''),
(373, 'zzpapy', 'Ok', '19-05-19 11:02', '', ''),
(374, 'manu', 'Ouaouh beaucop plus visibles les docs sur la page : merci !!! je vois bien les petites améliorations jour après jour :)) ', '21-05-19 04:19', '', ''),
(375, 'manu', 'Bon j\'enregistre et je me couche parce que là j\'en peux plus...Des bisosu', '21-05-19 04:20', '', ''),
(376, 'manu', 'Pfff j\'écris tordu...', '21-05-19 04:20', '', ''),
(377, 'zzpapy', 'Bonjour, sais pas si t\'as vu,je t\'ai mis une horloge;)', '21-05-19 10:12', '', ''),
(378, 'zzpapy', 'j\'ai mis un le bouton de téléchargement direct sur le titre du fichier...', '21-05-19 10:13', '', ''),
(379, 'zzpapy', 'j\'ai aussi fait en sorte qu si tu crées un dossier avec des espaces il te rajoute un \"_\" pour éviter tout problèmes de récuperation...', '21-05-19 10:14', '', ''),
(380, 'zzpapy', '', '21-05-19 10:14', '', ''),
(381, 'zzpapy', 'concernant l\'agenda: avant tout marche encore sur le mobile', '21-05-19 10:15', '', ''),
(382, 'zzpapy', 'sur le pc pour enregistrer tu vas ds l\'onglet day tu cherches ton jour tu clic sur l\'heure et d\'enregistre...', '21-05-19 10:16', '', ''),
(383, 'zzpapy', 'par à l\'affichage tu noteras qu\'il décale d\'une demi heure mystère je cherche des solutions', '21-05-19 10:17', '', ''),
(384, 'zzpapy', 'Dérnier truc tu déplacer la fenêtre chat en cliquant dessus', '21-05-19 10:18', '', ''),
(385, 'zzpapy', '😘', '21-05-19 10:18', '', ''),
(386, 'zzpapy', 'test', '21-05-19 11:31', '', ''),
(387, 'zzpapy', 'bon bein finalement j\'ai retapé dans le style dis moi si ça te va🙄', '21-05-19 16:59', '', ''),
(388, 'zzpapy', 'bein bonne nuit', '21-05-19 22:27', '', ''),
(389, 'manu', 'Ciao petit frère merci pour ce fond qu\'est trop trop beau j\'adore, il est tard j\'en peux plus et ça m\'apaise :))', '22-05-19 03:50', '', ''),
(390, 'manu', 'En revanche le bleu ciel du chat fait un peu mal aux yeux je préférais l\'autre police et couleur...', '22-05-19 03:51', '', ''),
(391, 'manu', 'Génial l\'horloge !!', '22-05-19 03:51', '', ''),
(392, 'manu', 'Pour le déplacement chat ça j\'avias déjà vu (au moins un truc :)', '22-05-19 03:52', '', ''),
(393, 'manu', 'En revanche suis trop speed pour essayer déjà boloc notes et agenda (sera semaine prochaine enfin début juin, je croise grave les doigts)', '22-05-19 03:53', '', ''),
(394, 'manu', 'Mais merci merci tous les jours c\'est plus joli et agréable à utiliser !', '22-05-19 03:54', '', ''),
(395, 'manu', 'Bon, j\'enregistre et je me couche ☺', '22-05-19 03:54', '', ''),
(396, 'manu', 'Ben voilà c\'est le seul émoji que j\'ai (avec son copain qu\'est pas content...)', '22-05-19 03:54', '', ''),
(397, 'manu', 'Bacione', '22-05-19 03:55', '', ''),
(398, 'zzpapy', 'j\'ai bloqué le déplacement du chat, ça buger sur le tel', '23-05-19 17:28', '', ''),
(399, 'zzpapy', 'bonne nuit☺', '23-05-19 21:15', '', ''),
(400, 'manu', 'ça va très bien comme ça :)) et le noir dans le chat, oui, c\'est plus reposant que le joli bleu ciel... :))', '23-05-19 23:27', '', ''),
(401, 'manu', 'Et l\'image du site elle est grave reposnate merci c\'est tout à fait ça (et ça frérot, c\'est du créatif j\'peux te dire !!!)', '23-05-19 23:28', '', ''),
(402, 'manu', 'Je sauvegarde et je me couche (demain fin enregistrement textes en gros à l\'heure où je me couche (j\'exagère mais faut que je me recale :)', '23-05-19 23:29', '', ''),
(403, 'manu', 'Bonne nuit ☺', '23-05-19 23:29', '', ''),
(404, 'zzpapy', 'Bonjour pas compris fin enregistrement etc...', '24-05-19 08:41', '', ''),
(405, 'zzpapy', 'je t\'ai fait un formulaire de modification de mot de passe(en à gauche)', '24-05-19 11:06', '', ''),
(406, 'zzpapy', 'je pens e que si tu t\'es connectée tu n\'as pu avoir accès au chat j\'avais pas capté qu\'il était bloqué dsl', '25-05-19 14:25', '', ''),
(407, 'manu', 'Coucou pas de problème pour le chat ! Merci formulaire modif (m\'ocuceprais de cela plus tard mais en même temps ça me va ce code !)', '26-05-19 00:43', '', ''),
(408, 'manu', 'L\'enregistrement, c\'est des textes (théâtre roman discours) que j\'ai enregistrés dans un studio avec la personne qui m\'a engagée et c\'est pour Nathan (support audio bouquins 2de/1ère je crois...)', '26-05-19 00:45', '', ''),
(409, 'manu', 'ça fait des sous et c\'est génial à faire : tu dis un discours de Simone Veil, des pages de roma sublimes, les plus grands rôles du répertoire classique, bref le pied !', '26-05-19 00:46', '', ''),
(410, 'manu', 'Mais là suis grave dnas le caca avec mes trads beaucoup beaucoup de boulot encore et je devrais rendre des trucs ce début de semaine (après-demain quoi...) et quasi tout début juin, chaud patate mais c\'est quand même très intéressant', '26-05-19 00:47', '', ''),
(411, 'manu', 'Alors je suis coincée à mon bureau, jusqu\'à nouvel ordre :))', '26-05-19 00:47', '', ''),
(412, 'manu', 'Et des gros bisous parce qu\'entre ce matin 10h et maitenant j\'ai dormi 4h, alors ça va un coup mais là j\'ai quand même envie de dormir ☺', '26-05-19 00:50', '', ''),
(413, 'manu', 'Sogni d\'oro à vous * ', '26-05-19 00:50', '', ''),
(414, 'zzpapy', '😃', '10-01-20 09:56', '', ''),
(415, 'zzpapy', 'ttttt', '14-01-20 11:18', NULL, NULL),
(416, 'zzpapy', 'test chat ', '14-01-20 11:19', NULL, NULL),
(417, 'zzpapy', 'hbhbhbhbhbbh', '14-01-20 11:19', NULL, NULL),
(418, 'zzpapy', 'zefzezfze', '14-01-20 11:19', NULL, NULL),
(419, 'zzpapy', 'zoinoioezooj', '14-01-20 17:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doc`
--

CREATE TABLE `doc` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_bin NOT NULL,
  `chemin` varchar(256) COLLATE utf8_bin NOT NULL,
  `chemin_stock` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(256) COLLATE utf8_bin NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `doc`
--

INSERT INTO `doc` (`id`, `title`, `chemin`, `chemin_stock`, `date`, `author`) VALUES
(53, '19-04-28_13_33_5bis2.Percorrere D.Mangin.docx', './uploads/19-04-28_13_33_5bis2.Percorrere D.Mangin.docx', '', '28-04-19 13:33', 1),
(55, '6bis.Pages de 01-Equipements_transports-2(dessin couleur La Défense).pdf', './uploads/6bis.Pages de 01-Equipements_transports-2(dessin couleur La Défense).pdf', '', '28-04-19 13:54', 1),
(69, 'Apprendere Faracce Azzerboni_FR.docx', './uploads/Apprendere Faracce Azzerboni_FR.docx', '', '29-04-19 01:09', 1),
(70, '1bisMK_maquette_Cohen.pdf', './uploads/1bisMK_maquette_Cohen.pdf', '', '29-04-19 09:22', 1),
(120, 'Apprendere Faracce Azzerboni_300419FR.docx', './uploads/Apprendere Faracce Azzerboni_300419FR.docx', '', '30-04-19 17:11', 1),
(127, '19-04-30_20_57_Apprendere Faracce Azzerboni_300419FR.docx', './uploads/19-04-30_20_57_Apprendere Faracce Azzerboni_300419FR.docx', '', '30-04-19 20:57', 1),
(128, '19-04-30_21_02_2bis.Apprendere Azzerboni format doc 0704.docx', './uploads/19-04-30_21_02_2bis.Apprendere Azzerboni format doc 0704.docx', '', '30-04-19 21:02', 1),
(144, '19-05-01_15_16_attest_pole.docx', './uploads/19-05-01_15_16_attest_pole.docx', '', '01-05-19 15:16', 1),
(146, 'MK_Coppo_Completo_22.02.2019 (1).pdf', './uploads/MK_Coppo_Completo_22.02.2019 (1).pdf', '', '01-05-19 18:01', 1),
(147, 'Apprendere Parigi Roma_FR.docx', './uploads/Apprendere Parigi Roma_FR.docx', '', '02-05-19 00:06', 1),
(148, '19-05-02_00_07_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/19-05-02_00_07_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '02-05-19 00:07', 1),
(153, '19-05-02_19_51_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/19-05-02_19_51_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '02-05-19 19:51', 1),
(155, '19-05-02_19_55_Apprendere Parigi Roma_FR.docx', './uploads/19-05-02_19_55_Apprendere Parigi Roma_FR.docx', '', '02-05-19 19:55', 1),
(159, '19-05-05_20_11_Apprendere Faracce Azzerboni_050519FR.docx', './uploads/19-05-05_20_11_Apprendere Faracce Azzerboni_050519FR.docx', '', '05-05-19 20:11', 1),
(160, '19-05-05_22_33_Apprendere Parigi Roma_FR.docx', './uploads/19-05-05_22_33_Apprendere Parigi Roma_FR.docx', '', '05-05-19 22:33', 1),
(203, 'Apprendere Faracce Azzerboni_070519FR.docx', './uploads/Apprendere Faracce Azzerboni_070519FR.docx', '', '07-05-19 16:14', 1),
(229, '19-05-07_23_48_Apprendere Parigi Roma_FR.docx', './uploads/19-05-07_23_48_Apprendere Parigi Roma_FR.docx', '', '07-05-19 23:48', 1),
(230, '19-05-08_01_19_Apprendere Parigi Roma_FR.docx', './uploads/19-05-08_01_19_Apprendere Parigi Roma_FR.docx', '', '08-05-19 01:19', 1),
(231, 'Lex trad.docx', './uploads/Lex trad.docx', '', '08-05-19 01:19', 1),
(232, 'Notes pour Marie:questions Maïa trad Ema 060419.docx', './uploads/Notes pour Marie:questions Maïa trad Ema 060419.docx', '', '08-05-19 01:20', 1),
(233, '19-05-08_01_21_Apprendere Parigi Roma_FR.docx', './uploads/19-05-08_01_21_Apprendere Parigi Roma_FR.docx', '', '08-05-19 01:21', 1),
(234, '19-05-08_01_22_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/19-05-08_01_22_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '08-05-19 01:22', 1),
(280, '19-05-09_01_39_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/19-05-09_01_39_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '09-05-19 01:39', 1),
(281, 'Apprendere Parigi Roma_0805FR.docx', './uploads/Apprendere Parigi Roma_0805FR.docx', '', '09-05-19 01:40', 1),
(284, 'Apprendere Parigi Roma_0905FR.docx', './uploads/Apprendere Parigi Roma_0905FR.docx', '', '09-05-19 18:04', 1),
(286, 'Apprendere Parigi Roma_1005FR.docx', './uploads/Apprendere Parigi Roma_1005FR.docx', '', '11-05-19 00:48', 1),
(287, '_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '11-05-19 00:49', 1),
(290, '_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '12-05-19 03:25', 1),
(291, '_Apprendere Parigi Roma_1005FR.docx', './uploads/_Apprendere Parigi Roma_1005FR.docx', '', '12-05-19 03:26', 1),
(292, '_Apprendere Parigi Roma_1005FR.docx', './uploads/_Apprendere Parigi Roma_1005FR.docx', '', '13-05-19 00:54', 1),
(294, '_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '13-05-19 00:56', 1),
(295, '3bis.didascalie PARIS ROME.25.03.2019.docx', './uploads/3bis.didascalie PARIS ROME.25.03.2019.docx', '', '13-05-19 00:57', 1),
(300, '_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '14-05-19 03:34', 1),
(301, '_Apprendere Faracce Azzerboni_070519FR.docx', './uploads/_Apprendere Faracce Azzerboni_070519FR.docx', '', '14-05-19 03:35', 1),
(302, 'Apprendere Parigi Roma_1305FR.docx', './uploads/Apprendere Parigi Roma_1305FR.docx', '', '14-05-19 03:35', 1),
(304, '_3bis.Apprendere Parigi Roma 25.03. 2019.docx', './uploads/_3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '14-05-19 03:37', 1),
(373, 'Apprendere Parigi Roma_1805FR.docx', '/media/pi/HD/test_upload/Apprendere Parigi Roma_1805FR.docx', '', '19-05-19 02:33', 1),
(374, 'DIDASCALIE_PARIS_ROME_1805FR.docx', '/media/pi/HD/test_upload/DIDASCALIE_PARIS_ROME_1805FR.docx', '', '19-05-19 02:34', 1),
(375, '11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/11.FNAC_La_Défense_revu.docx', '', '19-05-19 02:34', 1),
(382, 'Brigitte HS ital_2005.docx', '/media/pi/HD/test_upload/Brigitte HS ital_2005.docx', '', '21-05-19 04:21', 1),
(383, '21-05-19_04:22_11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/21-05-19_04:22_11.FNAC_La_Défense_revu.docx', '', '21-05-19 04:22', 1),
(384, '21-05-19_04:23_Apprendere Parigi Roma_1805FR.docx', '/media/pi/HD/test_upload/21-05-19_04:23_Apprendere Parigi Roma_1805FR.docx', '', '21-05-19 04:23', 1),
(398, 'cv_G_Pace.docx', '/media/pi/HD/test_upload/cv_G_Pace.docx', '', '21-05-19 13:46', 3),
(401, '22-05-19_03:55_Apprendere Parigi Roma_1805FR.docx', '/media/pi/HD/test_upload/22-05-19_03:55_Apprendere Parigi Roma_1805FR.docx', '', '22-05-19 03:55', 1),
(402, '22-05-19_03:56_Brigitte HS ital_2005.docx', '/media/pi/HD/test_upload/22-05-19_03:56_Brigitte HS ital_2005.docx', '', '22-05-19 03:56', 1),
(403, '3bis.Apprendere Parigi Roma 25.03. 2019.docx', '/media/pi/HD/test_upload/3bis.Apprendere Parigi Roma 25.03. 2019.docx', '', '22-05-19 03:56', 1),
(404, '22-05-19_03:57_11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/22-05-19_03:57_11.FNAC_La_Défense_revu.docx', '', '22-05-19 03:57', 1),
(406, 'Brigitte HS ital_2205.docx', '/media/pi/HD/test_upload/Brigitte HS ital_2205.docx', '', '23-05-19 01:50', 1),
(407, '23-05-19_01:50_11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/23-05-19_01:50_11.FNAC_La_Défense_revu.docx', '', '23-05-19 01:50', 1),
(408, 'Brigitte HS ital_2305.docx', '/media/pi/HD/test_upload/Brigitte HS ital_2305.docx', '', '23-05-19 23:30', 1),
(409, 'code alexa.py', '/media/pi/HD/test_upload/code alexa.py', '', '24-05-19 11:48', 3),
(413, '11682708.PDF', '/media/pi/HD/test_upload/11682708.PDF', '', '24-05-19 18:04', 8),
(414, '25-05-19_10:21_11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/25-05-19_10:21_11.FNAC_La_Défense_revu.docx', '', '25-05-19 10:21', 1),
(415, 'Brigitte HS ital_2405.docx', '/media/pi/HD/test_upload/Brigitte HS ital_2405.docx', '', '25-05-19 10:21', 1),
(416, '25-05-19_10:22_Apprendere Parigi Roma_1805FR.docx', '/media/pi/HD/test_upload/25-05-19_10:22_Apprendere Parigi Roma_1805FR.docx', '', '25-05-19 10:22', 1),
(417, '26-05-19_00:41_11.FNAC_La_Défense_revu.docx', '/media/pi/HD/test_upload/26-05-19_00:41_11.FNAC_La_Défense_revu.docx', '', '26-05-19 00:41', 1),
(418, 'Brigitte HS ital_2505.docx', '/media/pi/HD/test_upload/Brigitte HS ital_2505.docx', '', '26-05-19 00:41', 1),
(419, 'Brigitte H-S_2705.docx', '/media/pi/HD/test_upload/Brigitte H-S_2705.docx', '', '28-05-19 00:37', 1),
(420, 'Modifs Apprendere Azzerboni MàJ2705.docx', '/media/pi/HD/test_upload/Modifs Apprendere Azzerboni MàJ2705.docx', '', '28-05-19 00:38', 1),
(421, 'ModifsFNAC_MàJ2705.docx', '/media/pi/HD/test_upload/ModifsFNAC_MàJ2705.docx', '', '28-05-19 00:38', 1),
(422, 'Brigitte H-S_2805.docx', '/media/pi/HD/test_upload/Brigitte H-S_2805.docx', '', '29-05-19 01:48', 1),
(423, 'Didacalie_Fnac_2805.docx', '/media/pi/HD/test_upload/Didacalie_Fnac_2805.docx', '', '29-05-19 01:49', 1),
(424, 'Modifsdéf2Fnac_2705.docx', '/media/pi/HD/test_upload/Modifsdéf2Fnac_2705.docx', '', '29-05-19 01:50', 1),
(425, 'Apprendere Farace Azzerboni_290519FR.docx', '/media/pi/HD/test_upload/Apprendere Farace Azzerboni_290519FR.docx', '', '29-05-19 03:21', 1),
(426, '29-05-19_03:23_Modifs Apprendere Azzerboni MàJ2705.docx', '/media/pi/HD/test_upload/29-05-19_03:23_Modifs Apprendere Azzerboni MàJ2705.docx', '', '29-05-19 03:23', 1),
(427, 'Apprendere Farace Azzerboni_FR.docx', '/media/pi/HD/test_upload/Apprendere Farace Azzerboni_FR.docx', '', '30-05-19 02:26', 1),
(428, 'FNAC_La_Défense_REVU.docx', '/media/pi/HD/test_upload/FNAC_La_Défense_REVU.docx', '', '30-05-19 02:27', 1),
(429, 'Didacalie_Fnac_LaDéfense.docx', '/media/pi/HD/test_upload/Didacalie_Fnac_LaDéfense.docx', '', '30-05-19 02:27', 1),
(430, 'Notes pour DÉF TOUS DOCS.docx', '/media/pi/HD/test_upload/Notes pour DÉF TOUS DOCS.docx', '', '30-05-19 02:27', 1),
(431, 'Modifs_ital_Azzerboni_déf2905.docx', '/media/pi/HD/test_upload/Modifs_ital_Azzerboni_déf2905.docx', '', '30-05-19 02:28', 1),
(432, 'Modifsdéf2Fnac_2905.docx', '/media/pi/HD/test_upload/Modifsdéf2Fnac_2905.docx', '', '30-05-19 02:29', 1),
(433, 'Parigi_Roma_DéfPartie13105.docx', '/media/pi/HD/test_upload/Parigi_Roma_DéfPartie13105.docx', '', '31-05-19 01:14', 1),
(434, 'Apprendere_Parigi_Roma_3105.docx', '/media/pi/HD/test_upload/Apprendere_Parigi_Roma_3105.docx', '', '31-05-19 10:42', 1),
(435, 'Paris_Rome_Partie2_prMichel.docx', '/media/pi/HD/test_upload/Paris_Rome_Partie2_prMichel.docx', '', '31-05-19 10:42', 1),
(436, '31-05-19_10:44_DIDASCALIE_PARIS_ROME_1805FR.docx', '/media/pi/HD/test_upload/31-05-19_10:44_DIDASCALIE_PARIS_ROME_1805FR.docx', '', '31-05-19 10:44', 1),
(437, 'L\'invention_dans_le_sang_JLCohen_IT.docx', '/media/pi/HD/test_upload/L\'invention_dans_le_sang_JLCohen_IT.docx', '', '01-06-19 12:50', 1),
(438, '02-06-19_05:47_L\'invention_dans_le_sang_JLCohen_IT.docx', '/media/pi/HD/test_upload/02-06-19_05:47_L\'invention_dans_le_sang_JLCohen_IT.docx', '', '02-06-19 05:47', 1),
(439, '02-06-19_05:47_Notes pour DÉF TOUS DOCS.docx', '/media/pi/HD/test_upload/02-06-19_05:47_Notes pour DÉF TOUS DOCS.docx', '', '02-06-19 05:47', 1),
(440, 'L\'invention_dans_le_sang_JLCohen0206_IT.docx', '/media/pi/HD/test_upload/L\'invention_dans_le_sang_JLCohen0206_IT.docx', '', '03-06-19 01:19', 1),
(441, '1bis. L\'invention dans le sang JLCohen.docx', '/media/pi/HD/test_upload/1bis. L\'invention dans le sang JLCohen.docx', '', '03-06-19 01:19', 1),
(442, 'Fonte Pliniana Marina0306.docx', '/media/pi/HD/test_upload/Fonte Pliniana Marina0306.docx', '', '03-06-19 09:22', 1),
(443, '5bis1.Percorrere. jean paul robert -1-.docx', '/media/pi/HD/test_upload/5bis1.Percorrere. jean paul robert -1-.docx', '', '04-06-19 03:17', 1),
(444, '5bis.didascalie PERCORRERE .20.03.2019docx.docx', '/media/pi/HD/test_upload/5bis.didascalie PERCORRERE .20.03.2019docx.docx', '', '04-06-19 03:17', 1),
(446, '04-06-19_04:28_L\'invention_dans_le_sang_JLCohen_IT.docx', '/media/pi/HD/test_upload/04-06-19_04:28_L\'invention_dans_le_sang_JLCohen_IT.docx', '', '04-06-19 04:28', 1),
(447, 'Percorrere_D_Mangin.docx', '/media/pi/HD/test_upload/Percorrere_D_Mangin.docx', '', '04-06-19 17:56', 1),
(448, '04-06-19_20:04_Percorrere_D_Mangin.docx', '/media/pi/HD/test_upload/04-06-19_20:04_Percorrere_D_Mangin.docx', '', '04-06-19 20:04', 1),
(450, 'Service de retours.pdf', '/media/pi/HD/test_upload/Service de retours.pdf', '', '07-07-19 14:31', 3),
(453, 'index.php', '/media/pi/HD/test_upload/index.php', '', '11-01-20 12:48', 3),
(459, 'crea_user.phtml', './media/pi/HD/test_upload/crea_user.phtml', NULL, '11-01-20 16:27', 3);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `start_event`, `end_event`, `user_id`) VALUES
(1, 'hihihihih', '2019-05-07 00:00:00', '2019-05-08 00:00:00', 0),
(3, 'test', '2019-05-09 00:00:00', '2019-05-10 00:00:00', 0),
(17, 'bfuyzeyufyfyuhrz', '2019-05-15 00:00:00', '2019-05-16 00:00:00', 8),
(18, 'hryufhaziufhrazeuhfuza', '2019-05-01 00:00:00', '2019-05-02 00:00:00', 8),
(19, 'jojiojoijojojoj', '2019-04-28 00:00:00', '2019-04-29 00:00:00', 8),
(20, 'test', '2019-05-18 06:30:00', '2019-05-18 07:00:00', 3),
(23, 'efzefzzz', '2019-05-18 11:30:00', '2019-05-18 12:00:00', 3),
(26, 'iuiufhefhiezh', '2019-05-02 00:00:00', '2019-05-03 00:00:00', 8),
(27, 'test', '2019-05-15 11:00:00', '2019-05-15 11:30:00', 3),
(33, 'h', '2019-05-13 07:30:00', '2019-05-13 08:00:00', 3),
(34, '2', '2019-05-14 00:30:00', '2019-05-14 01:00:00', 3),
(39, 'hihiiuhihi', '2019-05-12 23:30:00', '2019-05-13 00:00:00', 3),
(40, 'jij', '2019-05-12 23:00:00', '2019-05-12 23:30:00', 3),
(42, 'h', '2019-05-18 06:30:00', '2019-05-18 07:00:00', 3),
(43, 'test', '2019-05-09 00:00:00', '2019-05-10 00:00:00', 3),
(44, 'test', '2019-05-19 06:00:00', '2019-05-19 06:30:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `partage`
--

CREATE TABLE `partage` (
  `id` int(11) NOT NULL,
  `user_admin` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `toto` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `partage`
--

INSERT INTO `partage` (`id`, `user_admin`, `name`, `toto`) VALUES
(1, 3, '', 'developpement');

-- --------------------------------------------------------

--
-- Structure de la table `relgroup`
--

CREATE TABLE `relgroup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `relgroup`
--

INSERT INTO `relgroup` (`id`, `user_id`, `group_id`) VALUES
(1, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(256) COLLATE utf8_bin NOT NULL,
  `pass` varchar(256) COLLATE utf8_bin NOT NULL,
  `admin` int(11) NOT NULL,
  `access` int(11) NOT NULL,
  `connect` int(11) NOT NULL DEFAULT '0',
  `date_connect` varchar(256) COLLATE utf8_bin NOT NULL,
  `last_connect` varchar(256) COLLATE utf8_bin NOT NULL,
  `size` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `pass`, `admin`, `access`, `connect`, `date_connect`, `last_connect`, `size`) VALUES
(1, 'manu', '$2y$10$F2Q1Ybjo09xaGof2cKqozO1LRDlcpOjcWBiu7/oQh/.u4iIsuJw8G', 1, 1, 1, '2020-01-14 11:21:44', '2020-01-12 11:13:31', '418'),
(3, 'zzpapy', '$2y$10$2gF6AY3UGBhc5rm9m7dttO6zgG9hdJQi3MNFxPrwW9.LN2eA7qOw.', 1, 1, 1, '2020-01-14 17:07:17', '2020-01-14 10:03:37', '417'),
(6, 'arnaud', '$2y$10$AlF/BjM9R9K98xXtf5hewOUrnve2mcHE921E5TA8wiSEhNQmECPYK', 1, 1, 0, '0', '0', ''),
(7, 'bondgirl', '$2y$10$E66tlB9DJLRAxQeWj5IDLe2IWnafPRJd7h7wHEZu6cgpGMPjg5szO', 1, 1, 0, '2019-05-13 13:44:18', '2019-05-13 13:43:34', '340'),
(8, 'test', '$2y$10$Wn.bvYZT0T0JTbLWiD0WruX7fbu.A9y.h5uqE6JsxNJChcGdBmJ4G', 1, 1, 0, '2019-05-26 10:56:05', '2019-05-26 10:51:36', '406'),
(10, 'emplois', '$2y$10$ZWtGMKsoI3Qvddn05R6BmeNol/f96uD5q376MR./p3OBAPqsXuQwe', 1, 1, 0, '2019-06-24 12:10:18', '2019-06-24 11:56:44', ''),
(11, 'dedalus', '$2y$10$Q5NkRy7/VGMD5nbJdbaA3OS1JnaG20zZlBhIaUk0mj409AdMLUP2e', 1, 1, 0, '', '', ''),
(12, 'digitics', '$2y$10$0M.K77y1RqSH6GAu7FyVB.Peg8gPgufZlKkGLxsjDu.SLstjnNoPu', 1, 1, 0, '2019-06-24 12:21:44', '', ''),
(13, 'reymann', '$2y$10$le2InnJA5XRzSEKJWDjMpOjbetAXy.R5fgPY91PX9rsxqkGY.xR1S', 1, 1, 0, '', '', ''),
(14, 'infra', '$2y$10$AQgoGaQVzqvAX0cHmiSxQuNMVOzOZDS7fU9iV1STkA9yYdX91ACcS', 1, 1, 0, '', '', ''),
(15, 'oci_postul', '$2y$10$l9H5O3rGFxCkUGpiUsswHu8aVNi7gik0TncZygBlq5E3QnVXGqFIS', 1, 1, 0, '2019-06-28 11:41:14', '2019-06-28 10:01:04', ''),
(16, 'creditmut', '$2y$10$K10x776L8wQnAxLpQEq6wOQuady/Mu9POzKcN/1TNoXnxnDv1YyFm', 1, 1, 0, '', '', ''),
(17, 'alten_est', '$2y$10$/eN4CxCZxLy1KqXuafHD7.r.ebHpdSb/iuj.2c4y95OF8HXp.LTbe', 1, 1, 0, '', '', ''),
(18, 'rev_rh', '$2y$10$gTm.uaf8HZBlXMGC.p6e0OX13SIWCJQEEI3n1E88i.vG2FR4NpsRe', 1, 1, 0, '', '', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bloc`
--
ALTER TABLE `bloc`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doc`
--
ALTER TABLE `doc`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partage`
--
ALTER TABLE `partage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `relgroup`
--
ALTER TABLE `relgroup`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bloc`
--
ALTER TABLE `bloc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT pour la table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT pour la table `doc`
--
ALTER TABLE `doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `partage`
--
ALTER TABLE `partage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `relgroup`
--
ALTER TABLE `relgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Base de données : `combats`
--
CREATE DATABASE IF NOT EXISTS `combats` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `combats`;

-- --------------------------------------------------------

--
-- Structure de la table `perso`
--

CREATE TABLE `perso` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `degats` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `perso`
--

INSERT INTO `perso` (`id`, `nom`, `degats`) VALUES
(6, 'tata', 5),
(5, 'toto', 5),
(4, 'regerzger', 25),
(7, 'tutu', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `perso`
--
ALTER TABLE `perso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `perso`
--
ALTER TABLE `perso`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Base de données : `contact`
--
CREATE DATABASE IF NOT EXISTS `contact` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `contact`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(256) COLLATE utf8_bin NOT NULL,
  `mail` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `mess` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `nom`, `prenom`, `date`, `mail`, `tel`, `mess`) VALUES
(1, 'pace', 'gregory', '23-01-20 16:27', 'gregory.pace@hotmail.fr', '0667371303', 'yugyugygygyuguyggygugyuygyug'),
(18, 'pace', 'gregory', '27-01-20 14:05', 'gregory.pace@hotmail.fr', '0667371303', 'huhuyhuhuhu'),
(19, 'pace', 'gregory', '27-01-20 14:07', 'gregory.pace@hotmail.fr', '0667371303', 'huhuyhuhuhu'),
(20, 'pace', 'gregory', '27-01-20 14:08', 'gregory.pace@hotmail.fr', '0667371303', 'huhuyhuhuhu'),
(21, 'pace', 'gregory', '27-01-20 14:11', 'gregory.pace@hotmail.fr', '0667371303', 'huhuyhuhuhu'),
(22, 'pace', 'gregory', '27-01-20 14:28', 'gregory.pace@hotmail.fr', '0667371303', 'huhuyhuhuhu'),
(46, 'iuherferhf', 'uhizezhhfeirhgi', '10-02-20 17:16:56', 'uhreihergihreigher', 'uzehfierhfeirghierh', 'erihfuierghuerhgerhgehgiz'),
(47, 'j', 'j', '10-02-20 18:39:57', 'j', 'j', 'j\r\n'),
(48, 'j', 'j', '10-02-20 18:43:32', 'j', 'j', 'j'),
(49, 'pace', 'gregory', '10-02-20 18:45:25', 'gregory.pace@hotmail.fr', '0667371303', 'jknfdkjfdknbkjsdnbkjfdslnbjkdfnsjbknjfnbjdfnbljkdfnbjdfnbsdjknfbjnfbjksnfbjknsds'),
(50, 'j', 'j', '10-02-20 18:46:32', 'j', 'j', 'j');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Base de données : `forum`
--
CREATE DATABASE IF NOT EXISTS `forum` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `forum`;

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
--
-- Base de données : `gaulois`
--
CREATE DATABASE IF NOT EXISTS `gaulois` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `gaulois`;

-- --------------------------------------------------------

--
-- Structure de la table `bataille`
--

CREATE TABLE `bataille` (
  `ID_BATAILLE` int(11) NOT NULL,
  `ID_LIEU` int(11) NOT NULL,
  `NOM_BATAILLE` varchar(32) DEFAULT NULL,
  `DATE_BATAILLE` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bataille`
--

INSERT INTO `bataille` (`ID_BATAILLE`, `ID_LIEU`, `NOM_BATAILLE`, `DATE_BATAILLE`) VALUES
(0, 4, 'Bataille gauloise', '0050-07-09'),
(1, 2, 'Babaorum', '0050-09-15'),
(2, 1, 'Laudanum', '0050-12-05'),
(3, 6, 'Booldechwingum', '0050-12-02'),
(4, 4, 'Cohorte III', '0050-09-01'),
(5, 0, 'Cohorte VI', '0050-06-03'),
(6, 7, 'Legion XII', '0050-10-08'),
(7, 1, 'Mercenaires', '0050-05-31'),
(8, 5, 'Vikings', '0050-07-29'),
(9, 5, 'Gladiateurs', '0050-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `boit`
--

CREATE TABLE `boit` (
  `ID_POTION` int(11) NOT NULL,
  `ID_VILLAGEOIS` int(11) NOT NULL,
  `DATE_BU` date NOT NULL DEFAULT '0000-00-00',
  `DOSE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boit`
--

INSERT INTO `boit` (`ID_POTION`, `ID_VILLAGEOIS`, `DATE_BU`, `DOSE`) VALUES
(0, 16, '0050-06-27', 35),
(1, 13, '0050-12-31', 9),
(2, 24, '0050-08-19', 49),
(3, 15, '0050-07-04', 6),
(4, 2, '0050-04-12', 36),
(5, 10, '0050-10-29', 20),
(6, 19, '0050-05-19', 48),
(7, 4, '0050-12-13', 47),
(8, 17, '0050-05-29', 40),
(9, 8, '0050-09-02', 8),
(10, 32, '0050-07-20', 33),
(11, 33, '0050-01-01', 25),
(12, 34, '0050-01-10', 43),
(13, 26, '0050-04-27', 28),
(14, 14, '0050-01-02', 37),
(15, 31, '0050-02-01', 10),
(16, 11, '0050-10-15', 21),
(17, 3, '0050-06-04', 1),
(18, 21, '0050-12-03', 29),
(19, 6, '0050-04-10', 30),
(8, 3, '0050-02-01', 50),
(7, 2, '0050-01-01', 20),
(7, 2, '0050-02-01', 21),
(7, 3, '0050-01-10', 25),
(7, 5, '0050-07-01', 40),
(7, 8, '0050-07-23', 30);

-- --------------------------------------------------------

--
-- Structure de la table `casque`
--

CREATE TABLE `casque` (
  `ID_CASQUE` int(11) NOT NULL,
  `ID_TYPE_CASQUE` int(11) NOT NULL,
  `NOM_CASQUE` varchar(32) DEFAULT NULL,
  `COUT_CASQUE` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `casque`
--

INSERT INTO `casque` (`ID_CASQUE`, `ID_TYPE_CASQUE`, `NOM_CASQUE`, `COUT_CASQUE`) VALUES
(0, 0, 'Maximum', 865),
(1, 0, 'Centurion', 498),
(2, 2, 'Spartacus', 2110),
(3, 2, 'Corinthien ', 765),
(4, 0, 'Imperial Gallic', 895),
(5, 1, 'Troyen', 795),
(6, 2, 'Elendil', 3128),
(7, 1, 'Spartiate', 1187),
(8, 0, 'Centurion officier', 1098),
(9, 0, 'Romain', 660);

-- --------------------------------------------------------

--
-- Structure de la table `compose`
--

CREATE TABLE `compose` (
  `ID_POTION` int(11) NOT NULL,
  `ID_INGREDIENT` int(11) NOT NULL,
  `QTE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compose`
--

INSERT INTO `compose` (`ID_POTION`, `ID_INGREDIENT`, `QTE`) VALUES
(0, 0, 23),
(0, 1, 40),
(0, 2, 68),
(0, 3, 18),
(0, 5, 63),
(0, 7, 13),
(0, 8, 50),
(0, 11, 64),
(0, 12, 7),
(0, 14, 38),
(0, 16, 2),
(0, 18, 17),
(0, 21, 11),
(0, 23, 21),
(0, 27, 51),
(0, 28, 77),
(1, 8, 98),
(1, 12, 7),
(1, 23, 1),
(2, 14, 49),
(2, 19, 4),
(2, 27, 51),
(3, 0, 95),
(3, 5, 3),
(3, 28, 77),
(4, 20, 34),
(4, 24, 86),
(4, 26, 5),
(5, 7, 2),
(5, 9, 25),
(6, 7, 13),
(6, 8, 2),
(6, 27, 57),
(7, 2, 68),
(7, 25, 48),
(7, 28, 5),
(8, 1, 33),
(8, 3, 18),
(8, 10, 3),
(9, 4, 52),
(9, 22, 2),
(10, 10, 68),
(10, 24, 1),
(11, 1, 3),
(11, 18, 77),
(12, 0, 23),
(12, 3, 65),
(12, 25, 5),
(13, 6, 23),
(13, 14, 38),
(13, 29, 2),
(14, 6, 2),
(14, 7, 17),
(14, 23, 21),
(15, 11, 97),
(15, 14, 1),
(15, 21, 11),
(16, 1, 40),
(16, 11, 3),
(16, 29, 10),
(17, 8, 50),
(17, 12, 1),
(17, 17, 70),
(18, 5, 92),
(18, 19, 15),
(18, 27, 4),
(19, 11, 64),
(19, 13, 43),
(19, 21, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `ID_INGREDIENT` int(11) NOT NULL,
  `NOM_INGREDIENT` varchar(32) DEFAULT NULL,
  `COUT_INGREDIENT` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`ID_INGREDIENT`, `NOM_INGREDIENT`, `COUT_INGREDIENT`) VALUES
(0, 'petits pois', 0.5),
(1, 'Haricots verts', 1),
(2, 'Queue de crevette', 7),
(3, 'Brin d\'herbe', 0.5),
(4, 'Ecrevisse', 10),
(5, 'Feuille épinard', 9),
(6, 'Oeuf de caviar', 6),
(7, 'Oeil de boeuf', 4),
(8, 'Huitre', 9),
(9, 'Ver de terre', 1),
(10, 'Cl d\'eau distilléeI', 2),
(11, 'Noix St Jacques', 12),
(12, 'Grenouille', 7),
(13, 'Carotte', 5),
(14, 'Courgette', 3),
(15, 'Prune', 3),
(16, 'Cl d\'eau férigineuse', 6),
(17, 'Joue de truite', 12),
(18, 'Cl D\'alcool', 3),
(19, 'Feuille de vigne', 4),
(20, 'Pomme', 11),
(21, 'Salamandre', 10),
(22, 'Homard', 12),
(23, 'Queue de cochon', 6),
(24, 'Myrtille', 5),
(25, 'Escargot', 6),
(26, 'Feuille de salade', 8),
(27, 'Cerise', 2),
(28, 'Citron vert', 4),
(29, 'Navet', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `ID_LIEU` int(11) NOT NULL,
  `NOM_LIEU` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`ID_LIEU`, `NOM_LIEU`) VALUES
(0, 'Village gaulois'),
(1, 'Babaorum'),
(2, 'Laudanum'),
(3, 'Oposum'),
(4, 'Champs de Nioutechnologix'),
(5, '3e chene a droite de la carriere'),
(6, 'En mer'),
(7, 'Grottes');

-- --------------------------------------------------------

--
-- Structure de la table `peut`
--

CREATE TABLE `peut` (
  `ID_POTION` int(11) NOT NULL,
  `ID_VILLAGEOIS` int(11) NOT NULL,
  `A_LE_DROIT` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `peut`
--

INSERT INTO `peut` (`ID_POTION`, `ID_VILLAGEOIS`, `A_LE_DROIT`) VALUES
(1, 1, 0),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `potion`
--

CREATE TABLE `potion` (
  `ID_POTION` int(11) NOT NULL,
  `NOM_POTION` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `potion`
--

INSERT INTO `potion` (`ID_POTION`, `NOM_POTION`) VALUES
(0, 'Magique'),
(1, 'Rajeunissement II'),
(2, 'Santé'),
(3, 'Rajeunissement'),
(4, 'Soupe'),
(5, 'Vitesse'),
(6, 'Invisibilité'),
(7, 'Assouplissement'),
(8, 'Force'),
(9, 'Intelligence'),
(10, 'Assouplissement II'),
(11, 'Potion I'),
(12, 'Potion II'),
(13, 'Potion III'),
(14, 'Potion IV'),
(15, 'Potion V'),
(16, 'Potion VI'),
(17, 'Potion VII'),
(18, 'Potion VIII'),
(19, 'Potion IX');

-- --------------------------------------------------------

--
-- Structure de la table `prise_casque`
--

CREATE TABLE `prise_casque` (
  `ID_CASQUE` int(11) NOT NULL,
  `ID_VILLAGEOIS` int(11) NOT NULL,
  `ID_BATAILLE` int(11) NOT NULL,
  `QTE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prise_casque`
--

INSERT INTO `prise_casque` (`ID_CASQUE`, `ID_VILLAGEOIS`, `ID_BATAILLE`, `QTE`) VALUES
(0, 5, 5, 8),
(0, 14, 5, 15),
(0, 19, 2, 5),
(0, 38, 1, 8),
(1, 4, 6, 12),
(1, 11, 0, 16),
(1, 18, 9, 5),
(1, 31, 1, 5),
(2, 2, 1, 4),
(2, 2, 7, 3),
(2, 13, 5, 7),
(2, 30, 8, 3),
(3, 0, 7, 5),
(3, 11, 1, 7),
(3, 16, 7, 8),
(3, 32, 3, 3),
(4, 6, 9, 8),
(4, 22, 0, 4),
(4, 25, 5, 8),
(4, 37, 4, 4),
(5, 9, 3, 3),
(5, 10, 8, 10),
(5, 24, 0, 5),
(5, 34, 8, 7),
(6, 8, 4, 3),
(6, 21, 2, 9),
(6, 22, 6, 12),
(6, 35, 6, 1),
(7, 9, 3, 6),
(7, 10, 2, 7),
(7, 13, 6, 11),
(7, 33, 4, 9),
(8, 7, 9, 12),
(8, 10, 4, 8),
(8, 19, 8, 7),
(8, 27, 9, 11),
(9, 20, 0, 6),
(9, 23, 3, 10),
(9, 24, 7, 11),
(9, 38, 2, 7),
(1, 2, 1, 3),
(1, 40, 1, 4),
(1, 1, 1, 30),
(3, 6, 4, 0),
(8, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `ID_SPECIALITE` int(11) NOT NULL,
  `NOM_SPECIALITE` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`ID_SPECIALITE`, `NOM_SPECIALITE`) VALUES
(0, 'Guerrier'),
(1, 'Porteur de Mehnir'),
(2, 'Barde'),
(3, 'Druide'),
(4, 'Espion'),
(5, 'Villageois'),
(6, 'Artisan'),
(7, 'Marchand');

-- --------------------------------------------------------

--
-- Structure de la table `type_casque`
--

CREATE TABLE `type_casque` (
  `ID_TYPE_CASQUE` int(11) NOT NULL,
  `NOM_TYPE_CASQUE` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_casque`
--

INSERT INTO `type_casque` (`ID_TYPE_CASQUE`, `NOM_TYPE_CASQUE`) VALUES
(0, 'Romain'),
(1, 'Grec'),
(2, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `villageois`
--

CREATE TABLE `villageois` (
  `ID_VILLAGEOIS` int(11) NOT NULL,
  `ID_LIEU` int(11) NOT NULL,
  `ID_SPECIALITE` int(11) NOT NULL,
  `NOM` varchar(32) DEFAULT NULL,
  `ADRESSE` varchar(32) DEFAULT NULL,
  `IMAGE` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `villageois`
--

INSERT INTO `villageois` (`ID_VILLAGEOIS`, `ID_LIEU`, `ID_SPECIALITE`, `NOM`, `ADRESSE`, `IMAGE`) VALUES
(1, 0, 1, 'Obelix', '', 'Obelix.jpg'),
(2, 0, 0, 'Abraracourcix', '', 'Abraracourcix.jpg'),
(4, 0, 5, 'Agecanonix', '', 'Agecanonix.gif'),
(9, 0, 3, 'Panoramix', '', 'Panoramix.jpg'),
(12, 0, 2, 'Assurancetourix', '', 'Assurancetourix.jpg'),
(21, 0, 6, 'Cetautomatix', '', 'Cetautomatix.jpg'),
(40, 0, 0, 'Asterix', 'cote carrieres', 'Asterix.jpg'),
(3, 6, 4, 'Acidenitrix', '', 'Acidenitrix.jpg'),
(5, 4, 7, 'Alambix', '', 'Alambix.jpg'),
(6, 1, 0, 'Allegorix', '', 'indisponible.jpg'),
(7, 1, 6, 'Amerix', '', 'Amerix.jpg'),
(8, 1, 3, 'Amnesix', '', 'Amnesix.jpg'),
(10, 6, 0, 'Analgesix', '', 'Analgesix.jpg'),
(11, 5, 7, 'Antibiotix', '', 'Antibiotix.jpg'),
(13, 1, 0, 'Aplusbegalix', '', 'Aplusbegalix.jpg'),
(14, 5, 5, 'Appatix', '', 'indisponible.jpg'),
(15, 5, 7, 'Arrierboutix', '', 'indisponible.jpg'),
(16, 6, 5, 'Asthmatix', '', 'indisponible.jpg'),
(17, 2, 0, 'Astronomix', '', 'Astronomix.jpg'),
(18, 2, 0, 'Aventurepix', '', 'indisponible.jpg'),
(19, 4, 6, 'Carferrix', '', 'Carferrix.jpg'),
(20, 1, 5, 'Catedralgotix', '', 'Catedralgotix.jpg'),
(22, 6, 5, 'Choucroutgarnix', '', 'indisponible.jpg'),
(23, 4, 0, 'Tournedix', '', 'Tournedix.jpg'),
(24, 2, 3, 'Diagnostix', '', 'Diagnostix.jpg'),
(25, 1, 5, 'Dithyrambix', '', 'indisponible.jpg'),
(26, 6, 0, 'Herettix', '', 'indisponible.jpg'),
(27, 4, 0, 'Industrichimix', '', 'indisponible.jpg'),
(28, 7, 6, 'Mineralogix', '', 'indisponible.jpg'),
(29, 6, 4, 'Zerozerosix', '', 'Zerozerosix.jpg'),
(30, 2, 7, 'Ordralfabetix', '', 'Ordralfabetix.jpg'),
(31, 1, 7, 'Orthopedix', '', 'Orthopedix.jpg'),
(32, 1, 6, 'Petisuix', '', 'Petisuix.jpg'),
(33, 5, 0, 'Plantaquatix', '', 'Plantaquatix.jpg'),
(34, 1, 0, 'Pneumatix', '', 'Pneumatix.jpg'),
(35, 7, 0, 'Porquepix', '', 'indisponible.jpg'),
(36, 6, 7, 'Pronostix', '', 'indisponible.jpg'),
(37, 3, 0, 'Quatredeuxsix', '', 'Quatredeuxsix.jpg'),
(38, 6, 5, 'Salamix', '', 'Salamix.jpg'),
(39, 4, 7, 'Selfservix', '', 'indisponible.jpg'),
(53, 0, 6, 'Lentix', 'Lutece', 'lentix.gif'),
(50, 0, 5, 'Goudurix', 'Bord de la plage', 'Goudurix.jpg'),
(52, 0, 7, 'Plaintcontrix', 'Lutece', 'Plaintcontrix.jpg'),
(51, 0, 3, 'Barometrix', 'Foret', 'Barometrix.jpg'),
(54, 0, 7, 'Taxesurleprix', 'Lutece', 'taxesurleprix.jpg'),
(55, 0, 0, 'Tragicomix', 'Lutece', 'Tragicomix.gif');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bataille`
--
ALTER TABLE `bataille`
  ADD PRIMARY KEY (`ID_BATAILLE`),
  ADD KEY `FK_SE_DEROULE` (`ID_LIEU`);

--
-- Index pour la table `boit`
--
ALTER TABLE `boit`
  ADD PRIMARY KEY (`ID_POTION`,`ID_VILLAGEOIS`,`DATE_BU`),
  ADD KEY `FK_BOIT2` (`ID_VILLAGEOIS`);

--
-- Index pour la table `casque`
--
ALTER TABLE `casque`
  ADD PRIMARY KEY (`ID_CASQUE`),
  ADD KEY `FK_APPARTIENT` (`ID_TYPE_CASQUE`);

--
-- Index pour la table `compose`
--
ALTER TABLE `compose`
  ADD PRIMARY KEY (`ID_POTION`,`ID_INGREDIENT`),
  ADD KEY `FK_COMPOSE2` (`ID_INGREDIENT`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ID_INGREDIENT`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`ID_LIEU`);

--
-- Index pour la table `peut`
--
ALTER TABLE `peut`
  ADD PRIMARY KEY (`ID_POTION`,`ID_VILLAGEOIS`),
  ADD KEY `FK_PEUT2` (`ID_VILLAGEOIS`);

--
-- Index pour la table `potion`
--
ALTER TABLE `potion`
  ADD PRIMARY KEY (`ID_POTION`);

--
-- Index pour la table `prise_casque`
--
ALTER TABLE `prise_casque`
  ADD PRIMARY KEY (`ID_CASQUE`,`ID_VILLAGEOIS`,`ID_BATAILLE`),
  ADD KEY `FK_PRISE_CASQUE2` (`ID_VILLAGEOIS`),
  ADD KEY `FK_PRISE_CASQUE3` (`ID_BATAILLE`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`ID_SPECIALITE`);

--
-- Index pour la table `type_casque`
--
ALTER TABLE `type_casque`
  ADD PRIMARY KEY (`ID_TYPE_CASQUE`);

--
-- Index pour la table `villageois`
--
ALTER TABLE `villageois`
  ADD PRIMARY KEY (`ID_VILLAGEOIS`),
  ADD KEY `FK_HABITE` (`ID_LIEU`),
  ADD KEY `FK_SPECIALISE` (`ID_SPECIALITE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `villageois`
--
ALTER TABLE `villageois`
  MODIFY `ID_VILLAGEOIS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- Base de données : `periodic-table`
--
CREATE DATABASE IF NOT EXISTS `periodic-table` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `periodic-table`;
--
-- Base de données : `personnages`
--
CREATE DATABASE IF NOT EXISTS `personnages` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `personnages`;

-- --------------------------------------------------------

--
-- Structure de la table `perso`
--

CREATE TABLE `perso` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `forcePerso` int(255) DEFAULT NULL,
  `degats` int(255) DEFAULT NULL,
  `niveau` int(255) DEFAULT NULL,
  `experience` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `perso`
--

INSERT INTO `perso` (`id`, `nom`, `forcePerso`, `degats`, `niveau`, `experience`) VALUES
(1, 'Victor', 5, 0, 1, 0),
(2, NULL, NULL, NULL, NULL, NULL),
(3, 'Victor', 5, 0, 1, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `perso`
--
ALTER TABLE `perso`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `perso`
--
ALTER TABLE `perso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de données : `stage`
--
CREATE DATABASE IF NOT EXISTS `stage` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `stage`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `poste` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `date` varchar(256) COLLATE utf8_bin NOT NULL,
  `content` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `adresse` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `contact` varchar(256) COLLATE utf8_bin NOT NULL,
  `email` varchar(256) COLLATE utf8_bin NOT NULL,
  `tel` varchar(256) COLLATE utf8_bin NOT NULL,
  `activite` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(256) COLLATE utf8_bin NOT NULL,
  `date_reponse` varchar(256) COLLATE utf8_bin NOT NULL,
  `reponse` varchar(256) COLLATE utf8_bin NOT NULL,
  `doc` varchar(256) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `test`;

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

INSERT INTO `message` (`id_message`, `content`, `membre_id`, `sujet_id`, `date`) VALUES
(100, 'ubefruyeabbfuyez', 1, 2, '2020-03-25 20:50:33'),
(101, 'erferfzefze', 1, 2, '2020-03-25 20:50:40'),
(102, 'ergergergzergze', 1, 17, '2020-03-26 07:24:41'),
(103, 'ergergergzergze', 1, 17, '2020-03-26 07:27:07'),
(104, 'yhyhyyh', 1, 1, '2020-03-26 07:29:04'),
(105, '', 1, 17, '2020-03-26 07:30:29'),
(106, 'yhyhyyh', 1, 1, '2020-03-26 07:31:21'),
(107, 'a', 1, 13, '2020-03-26 07:31:36'),
(108, 'd', 1, 13, '2020-03-26 07:34:05'),
(109, 'c', 1, 13, '2020-03-26 07:34:09'),
(110, 'test nouveau', 5, 1, '2020-03-26 07:57:06'),
(111, 'test', 1, 1, '2020-03-26 08:57:34'),
(112, 'test', 1, 1, '2020-03-26 08:59:21'),
(113, 'test', 1, 1, '2020-03-26 08:59:30'),
(114, 'test', 1, 1, '2020-03-26 08:59:57'),
(115, 'test', 1, 1, '2020-03-26 09:00:08'),
(116, 'test', 1, 1, '2020-03-26 09:01:15'),
(117, 'test', 1, 1, '2020-03-26 09:01:50'),
(118, 'test', 1, 1, '2020-03-26 09:02:58'),
(119, 'test', 1, 1, '2020-03-26 09:03:37'),
(120, 'test', 1, 1, '2020-03-26 09:08:21'),
(121, 'test', 1, 1, '2020-03-26 09:11:51'),
(122, 'test', 1, 1, '2020-03-26 09:11:54'),
(123, 'test', 1, 1, '2020-03-26 09:12:07'),
(124, 'test', 1, 1, '2020-03-26 09:12:40'),
(125, 'test', 1, 1, '2020-03-26 09:13:52'),
(126, 'test', 1, 1, '2020-03-26 09:18:02'),
(127, 'test', 1, 1, '2020-03-26 09:26:01'),
(128, 'test', 5, 1, '2020-03-26 09:39:40'),
(129, 'a', 3, 1, '2020-03-26 11:02:56'),
(130, 'ffffffff', 3, 1, '2020-03-26 11:04:31'),
(131, 'test avant sub 2', 1, 12, '2020-03-26 11:27:51'),
(132, 'test avant sub', 3, 10, '2020-03-26 12:26:33'),
(133, 'test avant sub', 3, 10, '2020-03-26 12:26:38');

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

INSERT INTO `sujet` (`id_sujet`, `titre`, `membre_id`, `date`) VALUES
(1, 'test', 1, NULL),
(2, 'toto', 1, NULL),
(9, 'test', 1, NULL),
(10, 'test', 1, NULL),
(11, 'test', 1, NULL),
(12, 'essai', 1, '2020-03-25'),
(13, 'essai', 1, '2020-03-25'),
(14, 'rrrrrr', 1, '2020-03-25'),
(15, 'rrrrrr', 1, '2020-03-25'),
(16, 'tttttttt', 1, '2020-03-26'),
(17, 'tttttttt', 1, '2020-03-26');

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
  MODIFY `id_submess` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
--
-- Base de données : `vehicules`
--
CREATE DATABASE IF NOT EXISTS `vehicules` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `vehicules`;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `origine` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom`, `origine`) VALUES
(1, 'Renault', 'France'),
(2, 'Porsche', 'Allemagne'),
(3, 'BMW', 'Allemagne'),
(4, 'FIAT', 'italie'),
(5, 'hyundai', 'coree'),
(6, 'ferrari', 'italie'),
(7, 'lamborghini', 'italie'),
(8, 'volkswagen', 'allemagne'),
(9, 'audi', 'allemagne'),
(10, 'tesla', 'suede');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id_vehicule` int(11) NOT NULL,
  `couleurs` json DEFAULT NULL,
  `immat` varchar(7) COLLATE utf8_bin NOT NULL,
  `modele` varchar(50) COLLATE utf8_bin NOT NULL,
  `nb_portes` int(1) DEFAULT NULL,
  `motorisation` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `marque_id` int(11) DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id_vehicule`, `couleurs`, `immat`, `modele`, `nb_portes`, `motorisation`, `marque_id`, `photo`) VALUES
(63, '[\"rouge\"]', 'et777qq', 'clio', 5, 'sp', 1, ''),
(65, '[\"#ffff00\", \"#ff0000\", \"#000000\", \"#000000\", \"#000000\", \"#000000\", \"#ffff00\", \"#ffff00\", \"#ffff80\"]', 'et777ii', 'panda', 5, 'sp', 4, 'public/images/panda.jpg'),
(66, '[\"#800080\", null]', 'et777oo', 'punto', 5, 'sp', 4, 'public/images/punto.jpg'),
(67, '[\"#000000\", \"#0000ff\"]', 'et777hh', 'scenic', 5, 'sp', 1, 'public/images/scenic.jpg'),
(70, '[\"#000080\", \"#00ff00\"]', 'et777ss', 'cayen', 5, 'sp', 4, 'https://s3-eu-west-1.amazonaws.com/staticeu.izmocars.com/toolkit/commonassets/2017/17fiat/17fiatpandalounge5ha3fbc/17fiatpandalounge5ha3fbc_pixGallery/_gallerypix/fiat_pandalounge5ha3fbc_angularfront.jpg'),
(71, '[\"#008000\", \"#804000\"]', 'et777ki', 'cayen', 5, 'sp', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Porsche_Cayenne_S_%2892A%29_%E2%80%93_Frontansicht%2C_10._Oktober_2011%2C_W%C3%BClfrath.jpg/280px-Porsche_Cayenne_S_%2892A%29_%E2%80%93_Frontansicht%2C_10._Oktober_2011%2C_W%C3%BClfrath.jpg'),
(72, '[\"#0000ff\", \"#00ff40\"]', 'et777uo', '325', 5, 'sp', 3, 'https://images.caradisiac.com/logos/5/4/2/1/155421/S0-La-p-tite-sportive-du-lundi-BMW-325-ti-68675.jpg'),
(73, '[\"#400040\", \"#00ff00\"]', 'et777ju', '525', 5, 'sp', 3, 'https://pict1.reezocar.com/images/480/gebrauchtwagen.at/RZCGBWATC115BD31A032/BMW-SERIE-5-00.jpg'),
(74, '[\"#ff0000\", \"#ff0000\"]', 'et777ff', '488', 2, 'sp', 6, 'https://cdn-s-www.estrepublicain.fr/images/CAE066E2-94CE-4BDC-AC19-3D057B7D8E51/NW_raw/la-488-pista-c-est-la-version-quot-circuit-quot-de-la-488-gtb-une-petite-serie-extraordinairement-performante-photo-ferrari-1573844469.jpg'),
(76, '[\"#ff0000\", \"#00ff00\"]', 'et777wd', '488', 2, 'sp', 6, 'https://cdn-s-www.estrepublicain.fr/images/CAE066E2-94CE-4BDC-AC19-3D057B7D8E51/NW_raw/la-488-pista-c-est-la-version-quot-circuit-quot-de-la-488-gtb-une-petite-serie-extraordinairement-performante-photo-ferrari-1573844469.jpg'),
(77, '[\"#000000\", \"#000000\"]', 'zz777rp', 'cayen', 5, 'sp', 5, 'https://cdn-s-www.estrepublicain.fr/images/CAE066E2-94CE-4BDC-AC19-3D057B7D8E51/NW_raw/la-488-pista-c-est-la-version-quot-circuit-quot-de-la-488-gtb-une-petite-serie-extraordinairement-performante-photo-ferrari-1573844469.jpg'),
(80, '[\"#000000\", \"#000000\"]', 'ot777ru', 'panda', 5, 'sp', 4, 'public/images/chat.jpeg'),
(83, '[\"#000000\", \"#000000\"]', 'et557rr', 'tipo', 5, 'sp', 4, 'https://images.caradisiac.com/logos/8/4/5/7/248457/S0-fiat-punto-le-dernier-exemplaire-est-sorti-de-l-usine-170153.jpg'),
(84, '[\"#000000\", \"#000000\"]', 'et717ru', 'clio', 5, 'sp', 1, 'public/images/clio.jpg'),
(85, '[\"#000080\", \"#008000\"]', 'ab555tf', 'clio', 5, 'sp', 1, 'public/images/clio.jpg'),
(86, '[\"#000000\", \"#000000\"]', 'gg777uu', 'quntach', 2, 'sp', 7, 'https://cdn.motor1.com/images/mgl/JpN2K/s1/lamborghini-countach-render-by-jimmy-nahlous.jpg'),
(91, '[\"#008000\", \"#ffff00\"]', 'ff888uu', 'golf', 5, 'sp', 8, 'https://img.autoplus.fr/news/2018/08/23/1530283/b3b28098f719718d2cc982f1-1350-900.jpg?r'),
(92, '[\"#000000\", \"#008000\", \"#ffff00\"]', 'ff888uz', 'golf', 5, 'sp', 8, 'https://img.autoplus.fr/news/2018/08/23/1530283/b3b28098f719718d2cc982f1-1350-900.jpg?r'),
(94, '[\"#008000\", \"#ffff00\"]', 'ff888uj', 'golf', 5, 'sp', 8, 'https://img.autoplus.fr/news/2018/08/23/1530283/b3b28098f719718d2cc982f1-1350-900.jpg?r'),
(96, '[\"#ff0000\", \"#ff0000\"]', 'ff888uk', 'golf', 5, 'sp', 8, 'https://img.autoplus.fr/news/2018/08/23/1530283/b3b28098f719718d2cc982f1-1350-900.jpg?r'),
(97, '[\"#004000\", \"#000000\"]', 'oo999hh', 'cayen', 5, 'sp', 2, 'public/images/388923_2019_Porsche_Cayenne.jpg'),
(99, '[\"#000000\", \"#000000\"]', 'bb444ff', 'X', 5, 'sp', 5, 'https://m.hyundai.fr/m/images/modeles/12-gamme-nouveau-tucson.png'),
(101, '[\"#000000\"]', 'ff888kk', '', 5, 'sp', 5, 'https://img.autoplus.fr/news/2019/11/21/1544359/750b5697b2b0bc00d89214f5-1200-800.jpg'),
(103, '[\"#000000\", \"#ff0000\"]', 'ff888kl', '', 5, 'sp', 5, 'https://img.autoplus.fr/news/2019/11/21/1544359/750b5697b2b0bc00d89214f5-1200-800.jpg'),
(105, '[\"#000000\"]', 'ff888km', '', 5, 'sp', 5, 'https://img.autoplus.fr/news/2019/11/21/1544359/750b5697b2b0bc00d89214f5-1200-800.jpg'),
(107, '[\"#000000\"]', 'ff888ki', '', 5, 'sp', 5, 'https://img.autoplus.fr/news/2019/11/21/1544359/750b5697b2b0bc00d89214f5-1200-800.jpg'),
(108, '[\"#000000\"]', 'bb444fu', 'X', 5, 'sp', 5, 'https://m.hyundai.fr/m/images/modeles/12-gamme-nouveau-tucson.png'),
(110, '[\"#0000ff\", \"#ffff00\"]', 'bb444fx', 'X', 5, 'sp', 5, 'https://m.hyundai.fr/m/images/modeles/12-gamme-nouveau-tucson.png'),
(116, '[\"#000000\"]', 'bb444zz', 'X', 5, 'sp', 5, 'https://m.hyundai.fr/m/images/modeles/12-gamme-nouveau-tucson.png'),
(118, '[\"#000000\", \"#ffff00\", \"#ffff00\", \"#ffffff\"]', 'yu654re', 'kwid', 5, 'sp', 1, 'https://www.largus.fr/images/images/renault-kwid-2019-06.jpg?width=612&quality=80'),
(120, '[\"#ffffff\", \"#ffff00\", \"#0000ff\"]', 'oo999zz', 'arkana', 5, 'sp', 1, 'https://img.autoplus.fr/news/2018/08/29/1530470/93aa98e4d510d76750d1b2cb-1200-800.jpg'),
(122, '[\"#ffff00\", \"#ff8040\", \"#80ff00\"]', 'hh999oo', 'zoe', 5, 'sp', 1, 'https://www.automobile-propre.com/wp-content/uploads/2019/04/nouvelle-zoe-ft.jpg'),
(124, '[\"#ff0000\", \"#ffff00\"]', 'hh999oa', 'zoe plus', 5, 'sp', 1, 'https://www.automobile-propre.com/wp-content/uploads/2019/04/nouvelle-zoe-ft.jpg'),
(126, '[\"#ffff00\", \"#ff8040\", \"#00ff00\"]', 'hh999ob', 'zoe plus', 5, 'sp', 1, 'https://www.automobile-propre.com/wp-content/uploads/2019/04/nouvelle-zoe-ft.jpg'),
(128, '[\"#ff0000\"]', 'ex777uu', 'cayen', 5, 'sp', 2, 'https://static.lpnt.fr/images/2019/06/07/18911520lpw-18911523-article-jpg_6265227_660x281.jpg'),
(131, '[\"#ff0000\"]', 'ex777ux', 'cayen', 5, 'sp', 2, 'public/images/388923_2019_Porsche_Cayenne.jpg'),
(133, '[\"#000000\"]', 'AA444fx', 'panda', 5, 'sp', 4, ''),
(135, '[\"#000000\"]', 'AZ444fx', 'panda', 5, 'sp', 4, ''),
(138, '[\"#000000\"]', 'AZ444gg', 'panda', 5, 'sp', 4, 'public/images/388923_2019_Porsche_Cayenne.jpg'),
(140, '[\"#000000\"]', 'gg888yy', '80', 5, 'diesel', 9, 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Audi_80_B3_front_20071227.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id_vehicule`),
  ADD UNIQUE KEY `immat` (`immat`),
  ADD KEY `FK_vehicule_marque` (`marque_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id_vehicule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `FK_vehicule_marque` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id_marque`);
--
-- Base de données : `voiture`
--
CREATE DATABASE IF NOT EXISTS `voiture` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `voiture`;

-- --------------------------------------------------------

--
-- Structure de la table `auto`
--

CREATE TABLE `auto` (
  `ID_VOITURE` int(11) NOT NULL,
  `PLAQUE` varchar(15) COLLATE utf8_bin NOT NULL,
  `NB_PORTES` int(11) NOT NULL,
  `ID_MODELE` int(11) NOT NULL,
  `ID_MOTEUR` int(11) NOT NULL,
  `path_img` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `auto`
--

INSERT INTO `auto` (`ID_VOITURE`, `PLAQUE`, `NB_PORTES`, `ID_MODELE`, `ID_MOTEUR`, `path_img`) VALUES
(1, 'AB-446-CD', 5, 4, 1, NULL),
(2, 'EX-336-RX', 5, 5, 2, NULL),
(3, 'EX-337-RX', 5, 6, 3, NULL),
(4, 'AB-337-CD', 3, 6, 2, NULL),
(5, 'et-666-te', 5, 5, 4, NULL),
(6, 'et-666-ti', 5, 5, 2, NULL),
(7, 'et-666-ti', 5, 5, 1, NULL),
(8, 'et-666-te', 5, 4, 1, NULL),
(9, 'et-666-te', 5, 4, 1, NULL),
(10, 'AA-666-te', 5, 4, 2, NULL),
(11, 'AA-666-te', 5, 4, 2, NULL),
(12, 'AA-666-te', 5, 4, 2, NULL),
(13, 'AA-666-te', 5, 4, 2, NULL),
(14, 'AA-666-te', 5, 4, 2, NULL),
(15, 'AA-666-ZZ', 5, 6, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE `couleur` (
  `ID_COULEUR` int(11) NOT NULL,
  `NOM_COULEUR` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`ID_COULEUR`, `NOM_COULEUR`) VALUES
(1, 'bleu'),
(2, 'gris'),
(3, 'rouge'),
(4, 'jaune'),
(5, 'violet');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `ID_MARQUE` int(11) NOT NULL,
  `NOM_MARQUE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_ORIGINE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`ID_MARQUE`, `NOM_MARQUE`, `ID_ORIGINE`) VALUES
(3, 'mercedes', 1),
(4, 'FIAT', 2),
(5, 'peugeot', 3);

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE `modele` (
  `ID_MODELE` int(11) NOT NULL,
  `NOM_MODELE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_MARQUE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`ID_MODELE`, `NOM_MODELE`, `ID_MARQUE`) VALUES
(4, 'GLE 500', 3),
(5, 'PANDA', 4),
(6, '208', 5);

-- --------------------------------------------------------

--
-- Structure de la table `moteur`
--

CREATE TABLE `moteur` (
  `ID_MOTEUR` int(11) NOT NULL,
  `TYPE_MOTEUR` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `moteur`
--

INSERT INTO `moteur` (`ID_MOTEUR`, `TYPE_MOTEUR`) VALUES
(1, 'hybrid'),
(2, 'SP'),
(3, 'DIESEL'),
(4, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

CREATE TABLE `origine` (
  `ID_ORIGINE` int(11) NOT NULL,
  `NOM_ORIGINE` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`ID_ORIGINE`, `NOM_ORIGINE`) VALUES
(1, 'D'),
(2, 'IT'),
(3, 'FR');

-- --------------------------------------------------------

--
-- Structure de la table `voiture_couleur`
--

CREATE TABLE `voiture_couleur` (
  `ID_COULEUR` int(11) NOT NULL,
  `ID_VOITURE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `voiture_couleur`
--

INSERT INTO `voiture_couleur` (`ID_COULEUR`, `ID_VOITURE`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(2, 2),
(4, 2),
(5, 2),
(2, 3),
(5, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`ID_VOITURE`),
  ADD KEY `VOITURE_MODELE_FK` (`ID_MODELE`),
  ADD KEY `VOITURE_MOTEUR0_FK` (`ID_MOTEUR`);

--
-- Index pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`ID_COULEUR`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`ID_MARQUE`),
  ADD KEY `MARQUE_ORIGINE_FK` (`ID_ORIGINE`);

--
-- Index pour la table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`ID_MODELE`),
  ADD KEY `MODELE_MARQUE_FK` (`ID_MARQUE`);

--
-- Index pour la table `moteur`
--
ALTER TABLE `moteur`
  ADD PRIMARY KEY (`ID_MOTEUR`);

--
-- Index pour la table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`ID_ORIGINE`);

--
-- Index pour la table `voiture_couleur`
--
ALTER TABLE `voiture_couleur`
  ADD PRIMARY KEY (`ID_COULEUR`,`ID_VOITURE`),
  ADD KEY `VOITURE_COULEUR_VOITURE0_FK` (`ID_VOITURE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auto`
--
ALTER TABLE `auto`
  MODIFY `ID_VOITURE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `couleur`
--
ALTER TABLE `couleur`
  MODIFY `ID_COULEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `ID_MARQUE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `modele`
--
ALTER TABLE `modele`
  MODIFY `ID_MODELE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `moteur`
--
ALTER TABLE `moteur`
  MODIFY `ID_MOTEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `origine`
--
ALTER TABLE `origine`
  MODIFY `ID_ORIGINE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `VOITURE_MODELE_FK` FOREIGN KEY (`ID_MODELE`) REFERENCES `modele` (`ID_MODELE`),
  ADD CONSTRAINT `VOITURE_MOTEUR0_FK` FOREIGN KEY (`ID_MOTEUR`) REFERENCES `moteur` (`ID_MOTEUR`);

--
-- Contraintes pour la table `marque`
--
ALTER TABLE `marque`
  ADD CONSTRAINT `MARQUE_ORIGINE_FK` FOREIGN KEY (`ID_ORIGINE`) REFERENCES `origine` (`ID_ORIGINE`);

--
-- Contraintes pour la table `modele`
--
ALTER TABLE `modele`
  ADD CONSTRAINT `MODELE_MARQUE_FK` FOREIGN KEY (`ID_MARQUE`) REFERENCES `marque` (`ID_MARQUE`);

--
-- Contraintes pour la table `voiture_couleur`
--
ALTER TABLE `voiture_couleur`
  ADD CONSTRAINT `VOITURE_COULEUR_COULEUR_FK` FOREIGN KEY (`ID_COULEUR`) REFERENCES `couleur` (`ID_COULEUR`),
  ADD CONSTRAINT `VOITURE_COULEUR_VOITURE0_FK` FOREIGN KEY (`ID_VOITURE`) REFERENCES `auto` (`ID_VOITURE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
