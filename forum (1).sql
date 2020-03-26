-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 26 mars 2020 à 08:39
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

INSERT INTO `message` (`id_message`, `content`, `membre_id`, `sujet_id`, `date`) VALUES
(31, 'bhbhbhhbh', 1, 2, NULL),
(32, 'bhbhbhhbh', 1, 2, NULL),
(33, 'bhbhbhhbh', 1, 2, NULL),
(34, 'test', 1, 1, NULL),
(35, 'test', 1, 1, NULL),
(36, 'test', 1, 1, NULL),
(37, 'test', 1, 1, NULL),
(38, 'test', 1, 1, NULL),
(39, 'test', 1, 1, NULL),
(40, 'fff', 1, 1, NULL),
(41, 'essai de message sur sujet vide ', 1, 11, NULL),
(42, 'essai de message sur sujet vide ', 1, 11, NULL),
(43, 'u', 1, 11, NULL),
(44, 'j', 1, 11, NULL),
(45, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(46, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(47, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(48, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(49, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(50, 'iuebzfuazerfyeaufhzeruezyuerfuerb\r\nerferfieujrvuiezrviuheghierhgiue\r\nerveuivroebvbezv', 1, 1, NULL),
(51, 'jiuhhibbbttgregert\r\ngrtgrtegertgertgertgr\r\ngrtgrtgretgrtgrtgertg\r\ntrgretgrtegertgrtegre\r\ngrtgertgrtgrtrteerth\r\nrtgrtgrthrtehrtehrehr\r\nrhrtherthertherthertherthert\r\nrthtrh\r\nrthet\r\nreerhertherthertherth\r\nth\r\netrhtr\r\nert\r\nert\r\nh\r\nrthetrehtrhtrhrtththrether', 1, 1, NULL),
(52, 'jiuhhibbbttgregert\r\ngrtgrtegertgertgertgr\r\ngrtgrtgretgrtgrtgertg\r\ntrgretgrtegertgrtegre\r\ngrtgertgrtgrtrteerth\r\nrtgrtgrthrtehrtehrehr\r\nrhrtherthertherthertherthert\r\nrthtrh\r\nrthet\r\nreerhertherthertherth\r\nth\r\netrhtr\r\nert\r\nert\r\nh\r\nrthetrehtrhtrhrtththrether', 1, 1, NULL),
(53, 'jiuhhibbbttgregert\r\ngrtgrtegertgertgertgr\r\ngrtgrtgretgrtgrtgertg\r\ntrgretgrtegertgrtegre\r\ngrtgertgrtgrtrteerth\r\nrtgrtgrthrtehrtehrehr\r\nrhrtherthertherthertherthert\r\nrthtrh\r\nrthet\r\nreerhertherthertherth\r\nth\r\netrhtr\r\nert\r\nert\r\nh\r\nrthetrehtrhtrhrtththrether', 1, 1, NULL),
(54, 'a', 1, 1, NULL),
(55, 'a', 1, 1, NULL),
(56, 'a', 1, 1, NULL),
(57, 'a', 1, 1, NULL),
(58, 'a', 1, 1, NULL),
(59, 'jiuhhibbbttgregert\r\ngrtgrtegertgertgertgr\r\ngrtgrtgretgrtgrtgertg\r\ntrgretgrtegertgrtegre\r\ngrtgertgrtgrtrteerth\r\nrtgrtgrthrtehrtehrehr\r\nrhrtherthertherthertherthert\r\nrthtrh\r\nrthet\r\nreerhertherthertherth\r\nth\r\netrhtr\r\nert\r\nert\r\nh\r\nrthetrehtrhtrhrtththrether', 1, 1, NULL),
(60, 'test moii', 2, 1, NULL),
(61, 'e', 1, 1, NULL),
(62, 'd', 1, 1, NULL),
(63, 'f', 1, 1, NULL),
(64, 'h', 1, 1, NULL),
(65, 'e', 1, 1, NULL),
(66, 'hzebfuyzebcuy', 1, 1, NULL),
(67, 'e', 1, 1, '2020-03-25 00:00:00'),
(68, 'e', 1, 1, '2020-03-25 00:00:00'),
(69, 'e', 1, 1, '2020-03-25 00:00:00'),
(70, 'e', 1, 1, '2020-03-25 18:59:14'),
(71, 'e', 1, 1, '2020-03-25 18:59:33'),
(72, 'rt', 1, 1, '2020-03-25 19:00:11'),
(73, 'rt', 1, 1, '2020-03-25 19:01:01'),
(74, 'rt', 1, 1, '2020-03-25 19:01:17'),
(75, 'test', 1, 12, '2020-03-25 19:28:38'),
(76, 'test', 1, 12, '2020-03-25 19:28:42'),
(77, 'test', 1, 14, '2020-03-25 19:38:57'),
(78, 'test', 1, 14, '2020-03-25 19:39:01'),
(79, 'test(', 1, 14, '2020-03-25 19:39:08'),
(80, 't', 1, 15, '2020-03-25 19:40:50'),
(81, 't', 1, 15, '2020-03-25 19:40:55'),
(82, 'c', 1, 15, '2020-03-25 19:42:26'),
(83, 'c', 1, 15, '2020-03-25 19:48:22'),
(84, 'c', 1, 15, '2020-03-25 19:49:10'),
(85, 'c', 1, 15, '2020-03-25 19:49:24'),
(86, 'c', 1, 15, '2020-03-25 20:13:24'),
(87, 'c', 1, 15, '2020-03-25 20:14:03'),
(88, 'c', 1, 15, '2020-03-25 20:14:27'),
(89, 'c', 1, 15, '2020-03-25 20:16:27'),
(90, 'c', 1, 15, '2020-03-25 20:16:51'),
(91, 'c', 1, 15, '2020-03-25 20:17:22'),
(92, 'c', 1, 15, '2020-03-25 20:17:38'),
(93, 'c', 1, 15, '2020-03-25 20:19:50'),
(94, 'c', 1, 15, '2020-03-25 20:20:03'),
(95, 'c', 1, 15, '2020-03-25 20:20:56'),
(96, 'c', 1, 15, '2020-03-25 20:21:11'),
(97, 'c', 1, 15, '2020-03-25 20:21:57'),
(98, 'c', 1, 15, '2020-03-25 20:22:18'),
(99, 'c', 1, 15, '2020-03-25 20:22:30'),
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
(110, 'test nouveau', 5, 1, '2020-03-26 07:57:06');

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
(17, 'tttttttt', 1, '2020-03-26'),
(18, 'tttttttt', 1, '2020-03-26');

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
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

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
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id_membre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
