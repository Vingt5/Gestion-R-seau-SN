-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 09 avr. 2024 à 12:00
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion réseau`
--

-- --------------------------------------------------------

--
-- Structure de la table `etatcadenas`
--

DROP TABLE IF EXISTS `etatcadenas`;
CREATE TABLE IF NOT EXISTS `etatcadenas` (
  `id_etat` int NOT NULL AUTO_INCREMENT,
  `etat` enum('ouvert','ferme') NOT NULL,
  `date_mise_a_jour` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_etat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etatcadenas`
--

INSERT INTO `etatcadenas` (`id_etat`, `etat`, `date_mise_a_jour`) VALUES
(1, 'ouvert', '2024-04-05 10:46:04'),
(2, 'ferme', '2024-04-05 10:46:04');

-- --------------------------------------------------------

--
-- Structure de la table `humidite`
--

DROP TABLE IF EXISTS `humidite`;
CREATE TABLE IF NOT EXISTS `humidite` (
  `id_humidite` int NOT NULL AUTO_INCREMENT,
  `Valeur` float NOT NULL,
  `date_mesure` datetime DEFAULT CURRENT_TIMESTAMP,
  `lieu` varchar(100) DEFAULT NULL,
  `appareil_mesure` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_humidite`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `humidite`
--

INSERT INTO `humidite` (`id_humidite`, `Valeur`, `date_mesure`, `lieu`, `appareil_mesure`) VALUES
(2, 15, '2024-04-05 10:47:20', 'S2', 'Hygromètre');

-- --------------------------------------------------------

--
-- Structure de la table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `nom` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email2` varchar(255) NOT NULL,
  `incident_type` varchar(255) NOT NULL,
  `poste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incident_description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `date & heure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `incidents`
--

INSERT INTO `incidents` (`id`, `email`, `pass`, `nom`, `prenom`, `email2`, `incident_type`, `poste`, `incident_description`, `photo`, `date & heure`) VALUES
(195, 'io\'c@terz', '(g', '(èèy', 'yèèyhè-yh', 'grddrg@autdfzta.rt', 'panne', '', '-è-èh', '', '2024-04-05 07:36:17'),
(196, 'rerte@yahlgsr.com', 'fefefeff', 'fefef', 'fesf', 'effefef@grhseg.ferg', 'panne', '', 'fef', '', '2024-04-05 07:38:52'),
(197, 'derzef@itef.ce', 'fzefz', '', '', '', '', '', '', '', '2024-04-05 07:42:36'),
(193, 'efrett@hfehf.vrg', 'geerfezf', 'fefefegg', 'efefgege', 'irfaneprosn@gmail.com', 'Demande installation logiciel', '', 'fefeffggrrrg', 'Capture.PNG', '2024-04-05 06:30:06'),
(192, 'io\'c@terz', 'refef', 'fefef', 'efef', 'irfaneprosn@gmail.com', 'panne', '', 'fefeff', 'Capture.PNG', '2024-04-05 06:23:38'),
(198, 'irfaneprosn@gmail.com', 'yh(h(', 'mario', 'irfane', 'irfaneprosn@gmail.com', 'Demande installation logiciel', '', 'hgezrgegergergeg', '', '2024-04-08 12:32:21'),
(199, 'rerte@yahlgsr.com', 'g--', '(\"y(y', 'y((\'ryzy', 'grddrg@autdfzta.rt', 'Demande installation logiciel', '', 'gg-hg-g', '', '2024-04-08 12:36:07'),
(200, 'rerte@yahlgsr.com', 'g--', '(\"y(y', 'y((\'ryzy', 'grddrg@autdfzta.rt', 'Demande installation logiciel', 'En6-P4', 'gg-hg-g', '', '2024-04-08 12:37:37'),
(201, 'io\'c@terz', 'rfrf', 'frf', 'ftf', 'grddrg@autdfzta.rt', 'panne', 'En6-P10', 'tftftftf', '', '2024-04-08 12:37:53'),
(202, 'io\'c@terz', 'rfrf', 'frf', 'ftf', 'grddrg@autdfzta.rt', 'panne', 'En6-P10', '', 'Capture.PNG', '2024-04-08 13:01:46'),
(203, 'io\'c@terz', 'rfrf', 'frf', 'ftf', 'grddrg@autdfzta.rt', 'panne', 'En6-P10', '', 'Capture.PNG', '2024-04-08 13:02:35'),
(204, 'io\'c@terz', 'rfrf', 'frf', 'ftf', 'grddrg@autdfzta.rt', 'panne', 'En6-P10', '', 'Capture.PNG', '2024-04-08 13:02:38'),
(205, 'irfytfcrr@yaygcfg.ftf', 'ytyyt', 'mario', 'irfane', 'grddrg@autdfzta.rt', 'Demande installation logiciel', 'En6-P2', 'drdrdr', 'Capture.PNG', '2024-04-08 13:06:28'),
(206, 'irfytfcrr@yaygcfg.ftf', 'ytyyt', 'mario', 'irfane', 'grddrg@autdfzta.rt', 'Demande installation logiciel', 'En6-P2', 'drdrdr', 'Capture.PNG', '2024-04-08 13:07:33');

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
CREATE TABLE IF NOT EXISTS `interventions` (
  `ID_intervention` int NOT NULL AUTO_INCREMENT,
  `ID_ticket` int DEFAULT NULL,
  `Date_intervention` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Description_intervention` text,
  `ID_utilisateur_intervenant` int DEFAULT NULL,
  PRIMARY KEY (`ID_intervention`),
  KEY `ID_ticket` (`ID_ticket`),
  KEY `ID_utilisateur_intervenant` (`ID_utilisateur_intervenant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `interventions`
--

INSERT INTO `interventions` (`ID_intervention`, `ID_ticket`, `Date_intervention`, `Description_intervention`, `ID_utilisateur_intervenant`) VALUES
(3, 2, '2024-04-05 08:48:26', 'probléme réseau', 2);

-- --------------------------------------------------------

--
-- Structure de la table `machines`
--

DROP TABLE IF EXISTS `machines`;
CREATE TABLE IF NOT EXISTS `machines` (
  `ID_machine` int NOT NULL AUTO_INCREMENT,
  `Nom_machine` varchar(100) NOT NULL,
  `id_salle` int NOT NULL,
  `État` enum('en fonctionnement','en panne','en maintenance') NOT NULL,
  `id_intervention` int NOT NULL,
  `Dernière_intervention` date DEFAULT NULL,
  PRIMARY KEY (`ID_machine`),
  KEY `État` (`État`),
  KEY `id_salle` (`id_salle`),
  KEY `id_intervention` (`id_intervention`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `machines`
--

INSERT INTO `machines` (`ID_machine`, `Nom_machine`, `id_salle`, `État`, `id_intervention`, `Dernière_intervention`) VALUES
(4, 'P2', 0, 'en maintenance', 5, '2024-04-08');

-- --------------------------------------------------------

--
-- Structure de la table `monitoringserver`
--

DROP TABLE IF EXISTS `monitoringserver`;
CREATE TABLE IF NOT EXISTS `monitoringserver` (
  `ID_server` int NOT NULL AUTO_INCREMENT,
  `ServerName` varchar(100) NOT NULL,
  `IPAddress` varchar(15) NOT NULL,
  `Status` enum('Up','Down','Unknown') DEFAULT 'Unknown',
  `LastCheck` datetime DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`ID_server`),
  KEY `Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom`) VALUES
(1, 'en6');

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

DROP TABLE IF EXISTS `serveur`;
CREATE TABLE IF NOT EXISTS `serveur` (
  `id_serveur` int NOT NULL AUTO_INCREMENT,
  `id_humidité` int NOT NULL,
  `id_temperature` int NOT NULL,
  `id_etat` int NOT NULL,
  PRIMARY KEY (`id_serveur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
CREATE TABLE IF NOT EXISTS `temperature` (
  `id_temperature` int NOT NULL AUTO_INCREMENT,
  `Valeur` float NOT NULL,
  `date_mesure` datetime DEFAULT CURRENT_TIMESTAMP,
  `lieu` varchar(100) DEFAULT NULL,
  `appareil_mesure` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_temperature`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `temperature`
--

INSERT INTO `temperature` (`id_temperature`, `Valeur`, `date_mesure`, `lieu`, `appareil_mesure`) VALUES
(7, 16, '2024-04-05 10:50:43', 'en5', 'serveur1');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `ID_ticket` int NOT NULL AUTO_INCREMENT,
  `ID_utilisateur` int DEFAULT NULL,
  `ID_machine` int DEFAULT NULL,
  `Date_création` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Statut` enum('en attente','en cours','résolu') NOT NULL,
  `Description_problème` text,
  PRIMARY KEY (`ID_ticket`),
  KEY `ID_machine` (`ID_machine`),
  KEY `ID_utilisateur` (`ID_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `ID_utilisateur` int NOT NULL AUTO_INCREMENT,
  `date & heure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID_utilisateur`, `date & heure`, `nom`, `prenom`, `email`, `password`) VALUES
(1, '2024-03-26 12:44:44', 'sgdsfg', 'gfsr', 'gsrg@sfs.fr', 'ggsrsg'),
(10, '2024-04-05 08:42:06', 'gege', 'zzz', 'adda@gmail.com', '1234'),
(11, '2024-04-08 12:59:10', 'ben hassine', 'amine', 'aminebenhassine686@gmail.com', '123ANhh');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
