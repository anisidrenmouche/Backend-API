-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 06 fév. 2021 à 16:22
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `trotinette`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210203093105', '2021-02-03 09:31:21', 266),
('DoctrineMigrations\\Version20210203101322', '2021-02-03 10:13:37', 1035);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trotinette_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C84955A76ED395` (`user_id`),
  KEY `IDX_42C8495564F0FC18` (`trotinette_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `prix`, `user_id`, `trotinette_id`) VALUES
(1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `trotinette`
--

DROP TABLE IF EXISTS `trotinette`;
CREATE TABLE IF NOT EXISTS `trotinette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qrcode` longtext COLLATE utf8mb4_unicode_ci,
  `localisation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trotinette`
--

INSERT INTO `trotinette` (`id`, `qrcode`, `localisation`) VALUES
(1, '1235545664', '2.3522219,48.856614\r\n\r\n\r\n\r\n\r\n\r\n'),
(2, '123345664', '2.333333,48.866667'),
(3, '98765433456', ' 2.354695,48.866667'),
(4, '987345656', ' 2.321889,48.866667'),
(5, '9834444856', '2.342834,48.886843'),
(6, '456744856', '2.402153,48.875351'),
(7, '459984856', '2.40139,48.839898'),
(8, '4592345765', '2.328072,48.828905'),
(9, '45923456795', '2.276311,48.847589'),
(10, '45576545', '2.258808,48.862808');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'agfdgddfggfgf@hotmail.fr', '[\"User\"]', '$argon2id$v=19$m=65536,t=4,p=1$N3h2MW1lcHJFSWVGUGVOTQ$TTJ6pzgMqRkmnqfY93ZkaeUc315PnDAB0Qa6+6+COwo'),
(2, 'test@testdzq.qdqz', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dUphVEFYTmsvYkpHdUpSdg$/wLGMg4Vme46huO1E6KhgKEuEfO21397npqjeLI6Ryk'),
(3, 'anisidrenmouche@hotmail.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$aHUwdzhyazVLbkcvQ0ZnYg$ujPYDFdjoi1dlu6knunYp6+kpPBiHqueuSizyLW8fSE'),
(4, 'anisidrenmouche', '[\"roles_user\"]', '$argon2id$v=19$m=65536,t=4,p=1$NmdIeFNMWm41V0JlOVpNTg$83ywQZGAiE/OAe7KDVXz3E4SIjEcB/9w3bKkDkj3WgM');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495564F0FC18` FOREIGN KEY (`trotinette_id`) REFERENCES `trotinette` (`id`),
  ADD CONSTRAINT `FK_42C84955A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
