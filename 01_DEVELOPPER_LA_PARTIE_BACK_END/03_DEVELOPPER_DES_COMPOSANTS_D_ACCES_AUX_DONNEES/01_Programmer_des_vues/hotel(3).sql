-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : lun. 05 avr. 2021 à 18:45
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotel`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `listeClient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listeClient` ()  BEGIN
    SELECT * FROM client;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `cha_id` int NOT NULL AUTO_INCREMENT,
  `cha_hot_id` int NOT NULL,
  `cha_numero` int NOT NULL,
  `cha_capacite` int NOT NULL,
  `cha_type` int NOT NULL,
  PRIMARY KEY (`cha_id`),
  KEY `cha_hot_id` (`cha_hot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`cha_id`, `cha_hot_id`, `cha_numero`, `cha_capacite`, `cha_type`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 3, 1),
(3, 1, 3, 2, 1),
(4, 1, 101, 1, 1),
(5, 1, 102, 2, 1),
(6, 1, 103, 3, 1),
(7, 1, 201, 2, 1),
(8, 1, 202, 7, 1),
(9, 1, 203, 1, 1),
(10, 2, 1, 2, 1),
(11, 2, 2, 2, 1),
(12, 2, 3, 1, 1),
(13, 2, 101, 2, 1),
(14, 2, 102, 1, 1),
(15, 2, 103, 3, 1),
(16, 2, 201, 2, 1),
(17, 2, 202, 4, 1),
(18, 2, 203, 4, 1),
(19, 3, 1, 3, 1),
(20, 3, 2, 1, 1),
(21, 3, 3, 2, 1),
(22, 3, 101, 2, 1),
(23, 3, 102, 2, 1),
(24, 3, 103, 2, 1),
(25, 3, 201, 2, 1),
(26, 3, 202, 4, 1),
(27, 3, 203, 4, 1),
(28, 4, 1, 4, 1),
(29, 4, 2, 2, 1),
(30, 4, 3, 4, 1),
(31, 4, 101, 1, 1),
(32, 4, 102, 2, 1),
(33, 4, 103, 2, 1),
(34, 4, 201, 2, 1),
(35, 4, 202, 2, 1),
(36, 4, 203, 3, 1),
(37, 5, 1, 3, 1),
(38, 5, 2, 2, 1),
(39, 5, 3, 2, 1),
(40, 5, 101, 1, 1),
(41, 5, 102, 4, 1),
(42, 5, 103, 1, 1),
(43, 5, 201, 2, 1),
(44, 5, 202, 4, 1),
(45, 5, 203, 4, 1),
(46, 6, 1, 1, 1),
(47, 6, 2, 1, 1),
(48, 6, 3, 1, 1),
(49, 6, 101, 1, 1),
(50, 6, 102, 1, 1),
(51, 6, 103, 1, 1),
(52, 6, 201, 1, 1),
(53, 6, 202, 1, 1),
(54, 6, 203, 1, 1),
(55, 7, 1, 1, 1),
(56, 7, 2, 5, 1),
(57, 7, 3, 5, 1),
(58, 7, 101, 5, 1),
(59, 7, 102, 5, 1),
(60, 7, 103, 5, 1),
(61, 7, 201, 5, 1),
(62, 7, 202, 5, 1),
(63, 7, 203, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_nom` varchar(50) DEFAULT NULL,
  `cli_prenom` varchar(50) DEFAULT NULL,
  `cli_adresse` varchar(50) DEFAULT NULL,
  `cli_ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cli_id`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_ville`) VALUES
(1, 'Doe', 'John', '', 'LA'),
(2, 'Homme', 'Josh', '', 'Palm Desert'),
(3, 'Paul', 'Weller', '', 'Londre'),
(4, 'White', 'Jack', '', 'Detroit'),
(5, 'Claypool', 'Les', '', 'San Francisco'),
(6, 'Squire', 'Chris', '', 'Londre'),
(7, 'Wood', 'Ronnie', '', 'Londre');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `hot_id` int NOT NULL AUTO_INCREMENT,
  `hot_sta_id` int NOT NULL,
  `hot_nom` varchar(50) NOT NULL,
  `hot_categorie` int NOT NULL,
  `hot_adresse` varchar(50) NOT NULL,
  `hot_ville` varchar(50) NOT NULL,
  PRIMARY KEY (`hot_id`),
  KEY `hot_sta_id` (`hot_sta_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`hot_id`, `hot_sta_id`, `hot_nom`, `hot_categorie`, `hot_adresse`, `hot_ville`) VALUES
(1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo'),
(2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo'),
(3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten'),
(4, 2, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou'),
(5, 2, 'RR Hotel', 5, 'place du bas', 'Bretou'),
(6, 2, 'La Brique', 2, 'place du haut', 'Bretou'),
(7, 3, 'Le Beau Rivage', 3, 'place du centre', 'Toras');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_cha_id` int NOT NULL,
  `res_cli_id` int NOT NULL,
  `res_date` datetime NOT NULL,
  `res_date_debut` datetime NOT NULL,
  `res_date_fin` datetime NOT NULL,
  `res_prix` decimal(6,2) NOT NULL,
  `res_arrhes` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `res_cha_id` (`res_cha_id`),
  KEY `res_cli_id` (`res_cli_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`res_id`, `res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`) VALUES
(1, 1, 1, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '2400.00', '800.00'),
(2, 2, 2, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '3400.00', '100.00'),
(3, 1, 3, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '400.00', '50.00'),
(4, 2, 4, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '7200.00', '1800.00'),
(5, 3, 5, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '1400.00', '450.00'),
(6, 4, 6, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '2400.00', '780.00'),
(7, 4, 6, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '500.00', '80.00'),
(8, 4, 1, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '40.00', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `sta_id` int NOT NULL AUTO_INCREMENT,
  `sta_nom` varchar(50) NOT NULL,
  `sta_altitude` int DEFAULT NULL,
  PRIMARY KEY (`sta_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `station`
--

INSERT INTO `station` (`sta_id`, `sta_nom`, `sta_altitude`) VALUES
(1, 'La Montagne', 2500),
(2, 'Le Sud', 200),
(3, 'La Plage', 10);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_chambres_hotel_station`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_chambres_hotel_station`;
CREATE TABLE IF NOT EXISTS `v_chambres_hotel_station` (
`cha_numero` int
,`hot_nom` varchar(50)
,`sta_nom` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_chambre_hotel`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_chambre_hotel`;
CREATE TABLE IF NOT EXISTS `v_chambre_hotel` (
`INDEX` int
,`N° chambre` int
,`Hôtels` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_hotel_station`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_hotel_station`;
CREATE TABLE IF NOT EXISTS `v_hotel_station` (
`Hôtels` varchar(50)
,`Stations` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_reservations_clients`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_reservations_clients`;
CREATE TABLE IF NOT EXISTS `v_reservations_clients` (
`res_id` int
,`cli_nom` varchar(50)
,`cli_prenom` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_reservation_client_hotel`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_reservation_client_hotel`;
CREATE TABLE IF NOT EXISTS `v_reservation_client_hotel` (
`Index` int
,`Début` datetime
,`Fin` datetime
,`client` varchar(101)
,`hot_nom` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_chambres_hotel_station`
--
DROP TABLE IF EXISTS `v_chambres_hotel_station`;

DROP VIEW IF EXISTS `v_chambres_hotel_station`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chambres_hotel_station`  AS  select `chambre`.`cha_numero` AS `cha_numero`,`hot_nom` AS `hot_nom`,`station`.`sta_nom` AS `sta_nom` from ((`chambre` join `hotel` on((`chambre`.`cha_hot_id` = `hot_id`))) join `station` on((`hot_sta_id` = `station`.`sta_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_chambre_hotel`
--
DROP TABLE IF EXISTS `v_chambre_hotel`;

DROP VIEW IF EXISTS `v_chambre_hotel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chambre_hotel`  AS  select `chambre`.`cha_id` AS `INDEX`,`chambre`.`cha_numero` AS `N° chambre`,`hot_nom` AS `Hôtels` from (`chambre` join `hotel` on((`chambre`.`cha_hot_id` = `hot_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_hotel_station`
--
DROP TABLE IF EXISTS `v_hotel_station`;

DROP VIEW IF EXISTS `v_hotel_station`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hotel_station`  AS  select `hot_nom` AS `Hôtels`,`station`.`sta_nom` AS `Stations` from (`hotel` join `station` on((`hot_sta_id` = `station`.`sta_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_reservations_clients`
--
DROP TABLE IF EXISTS `v_reservations_clients`;

DROP VIEW IF EXISTS `v_reservations_clients`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reservations_clients`  AS  select `reservation`.`res_id` AS `res_id`,`client`.`cli_nom` AS `cli_nom`,`client`.`cli_prenom` AS `cli_prenom` from (`reservation` join `client` on((`reservation`.`res_cli_id` = `client`.`cli_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_reservation_client_hotel`
--
DROP TABLE IF EXISTS `v_reservation_client_hotel`;

DROP VIEW IF EXISTS `v_reservation_client_hotel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reservation_client_hotel`  AS  select `reservation`.`res_id` AS `Index`,`reservation`.`res_date_debut` AS `Début`,`reservation`.`res_date_fin` AS `Fin`,concat(`client`.`cli_nom`,' ',`client`.`cli_prenom`) AS `client`,`hot_nom` AS `hot_nom` from (((`reservation` join `client` on((`reservation`.`res_cli_id` = `client`.`cli_id`))) join `chambre` on((`reservation`.`res_cha_id` = `chambre`.`cha_id`))) join `hotel` on((`chambre`.`cha_hot_id` = `hot_id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
