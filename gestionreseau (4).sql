-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 28 mai 2024 à 15:54
-- Version du serveur :  10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionreseau`
--

-- --------------------------------------------------------

--
-- Structure de la table `cadenas`
--

CREATE TABLE `cadenas` (
  `id_cadenas` int(11) NOT NULL,
  `etat_cadenas` enum('ouvert','ferme') NOT NULL,
  `date_mise_a_jour` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `cadenas`
--

INSERT INTO `cadenas` (`id_cadenas`, `etat_cadenas`, `date_mise_a_jour`) VALUES
(1, 'ouvert', '2024-04-05 10:46:04'),
(2, 'ferme', '2024-04-05 10:46:04');

-- --------------------------------------------------------

--
-- Structure de la table `humidite`
--

CREATE TABLE `humidite` (
  `id_humidite` int(11) NOT NULL,
  `Valeur` float NOT NULL,
  `date_mesure` datetime DEFAULT current_timestamp(),
  `lieu` varchar(100) DEFAULT NULL,
  `appareil_mesure` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `humidite`
--

INSERT INTO `humidite` (`id_humidite`, `Valeur`, `date_mesure`, `lieu`, `appareil_mesure`) VALUES
(2, 15, '2024-04-05 10:47:20', 'S2', 'Hygromètre');

-- --------------------------------------------------------

--
-- Structure de la table `incidents`
--

CREATE TABLE `incidents` (
  `id_incident` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `nom` varchar(55) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email2` varchar(255) NOT NULL,
  `incident_type` varchar(255) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `etat` varchar(50) NOT NULL,
  `incident_description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `date & heure` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `incidents`
--

INSERT INTO `incidents` (`id_incident`, `email`, `pass`, `nom`, `prenom`, `email2`, `incident_type`, `poste`, `etat`, `incident_description`, `photo`, `date & heure`) VALUES
(195, 'io\'c@terz', '(g', '(y', 'y-yh', 'grddrg@autdfzta.rt', 'panne', '', '', '--h', '', '2024-04-05 07:36:17'),
(207, 'aimanlyon@gmail.com', 'sdssd', 'dfffff', 'fdddddddd', 'aimanlyon@gmail.com', '', '', 'normal', '', '', '2024-05-28 14:41:46'),
(208, 'sabri@gmail.coms', 'dsssssssssss12', 'dsssss', 'dsssssss', 'dsssssssss@gllksd.com', '', '', 'normal', '', '', '2024-05-28 14:42:52'),
(209, 'amine@uyfedf.dez', 'dd\"dzed', 'amine', 'mojit', 'dezg@zedygze.sxz', 'panne', 'En6-P1', 'faible', 'ezded\"e', '', '2024-05-28 14:44:16'),
(210, 'rerte@yahlgsr.com', 'drd', '(\"y(y', 'd\'rd', 'irgfzg@gmail.com', 'Demande installation logiciel', 'En6-P3', 'normal', 'dr\'dr\'d', 'a.PNG', '2024-05-28 14:44:56'),
(211, 'rerte@yahlgsr.com', 'drd', '(\"y(y', 'd\'rd', 'irgfzg@gmail.com', 'Demande installation logiciel', 'En6-P3', 'normal', 'dr\'dr\'d', 'a.PNG', '2024-05-28 14:47:37'),
(212, 'amine@uyfedf.dez', 'fdsf', 'amine', 'mojit', 'dezg@zedygze.sxz', 'panne', 'En6-P1', 'faible', 'ezded\"e', 'a.PNG', '2024-05-28 14:47:55');

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

CREATE TABLE `interventions` (
  `id_intervention` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `interventions`
--

INSERT INTO `interventions` (`id_intervention`, `id_ticket`) VALUES
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `machines`
--

CREATE TABLE `machines` (
  `id_machine` int(11) NOT NULL,
  `nom_machine` varchar(255) NOT NULL,
  `id_intervention` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `machines`
--

INSERT INTO `machines` (`id_machine`, `nom_machine`, `id_intervention`, `id_salle`) VALUES
(1, 'Machine1', 0, 1),
(2, 'Machine2', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `nom_salle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom_salle`) VALUES
(1, 'Salle A'),
(2, 'Salle B');

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

CREATE TABLE `serveur` (
  `id_serveur` int(11) NOT NULL,
  `id_humidite` int(11) NOT NULL,
  `id_temperature` int(11) NOT NULL,
  `id_cadenas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `serveur`
--

INSERT INTO `serveur` (`id_serveur`, `id_humidite`, `id_temperature`, `id_cadenas`) VALUES
(1, 0, 0, 2147483647),
(2, 0, 0, 2147483647);

-- --------------------------------------------------------

--
-- Structure de la table `temperature`
--

CREATE TABLE `temperature` (
  `id_temperature` int(11) NOT NULL,
  `Valeur` float NOT NULL,
  `date_mesure` datetime DEFAULT current_timestamp(),
  `lieu` varchar(100) DEFAULT NULL,
  `appareil_mesure` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `temperature`
--

INSERT INTO `temperature` (`id_temperature`, `Valeur`, `date_mesure`, `lieu`, `appareil_mesure`) VALUES
(1, 24, '2024-04-05 10:47:20', 'S1', 'Thermomètre'),
(2, 22, '2024-04-05 10:47:20', 'S2', 'Thermomètre');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_incident` int(11) DEFAULT NULL,
  `id_machine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `id_incident`, `id_machine`) VALUES
(1, 195, 1),
(2, NULL, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cadenas`
--
ALTER TABLE `cadenas`
  ADD PRIMARY KEY (`id_cadenas`),
  ADD KEY `id_cadenas` (`id_cadenas`);

--
-- Index pour la table `humidite`
--
ALTER TABLE `humidite`
  ADD PRIMARY KEY (`id_humidite`),
  ADD KEY `id_humidite` (`id_humidite`);

--
-- Index pour la table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id_incident`);

--
-- Index pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id_intervention`),
  ADD KEY `ID_ticket` (`id_ticket`),
  ADD KEY `id_intervention` (`id_intervention`),
  ADD KEY `id_intervention_2` (`id_intervention`);

--
-- Index pour la table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id_machine`),
  ADD KEY `id_salle` (`id_salle`),
  ADD KEY `id_machine` (`id_machine`),
  ADD KEY `id_machine_2` (`id_machine`),
  ADD KEY `id_machine_3` (`id_machine`),
  ADD KEY `id_intervention` (`id_intervention`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Index pour la table `serveur`
--
ALTER TABLE `serveur`
  ADD PRIMARY KEY (`id_serveur`),
  ADD KEY `id_humidite` (`id_humidite`,`id_temperature`,`id_cadenas`);

--
-- Index pour la table `temperature`
--
ALTER TABLE `temperature`
  ADD PRIMARY KEY (`id_temperature`),
  ADD KEY `id_temperature` (`id_temperature`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_incident` (`id_incident`),
  ADD KEY `id_machine` (`id_machine`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cadenas`
--
ALTER TABLE `cadenas`
  MODIFY `id_cadenas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `humidite`
--
ALTER TABLE `humidite`
  MODIFY `id_humidite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id_incident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id_intervention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `machines`
--
ALTER TABLE `machines`
  MODIFY `id_machine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `serveur`
--
ALTER TABLE `serveur`
  MODIFY `id_serveur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `temperature`
--
ALTER TABLE `temperature`
  MODIFY `id_temperature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `machines_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_incident`) REFERENCES `incidents` (`id_incident`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`id_machine`) REFERENCES `machines` (`id_machine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
