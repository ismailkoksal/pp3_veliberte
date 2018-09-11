-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 11 sep. 2018 à 15:44
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_ppe3_veliberte`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `numA` int(3) NOT NULL AUTO_INCREMENT,
  `loginA` varchar(50) NOT NULL,
  `motDePasseA` varchar(50) NOT NULL,
  `nomA` varchar(50) NOT NULL,
  `prenomA` varchar(50) NOT NULL,
  `adresseRueA` varchar(50) NOT NULL,
  `cpA` int(6) NOT NULL,
  `villeA` varchar(50) NOT NULL,
  `telA` varchar(14) NOT NULL,
  `carteIdentite` tinyint(1) NOT NULL,
  `paiementCaution` tinyint(1) NOT NULL,
  PRIMARY KEY (`numA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`numA`, `loginA`, `motDePasseA`, `nomA`, `prenomA`, `adresseRueA`, `cpA`, `villeA`, `telA`, `carteIdentite`, `paiementCaution`) VALUES
(1, '', '', 'ARCHANBAULT', 'Fabrice', '3 rue des Lilas', 22440, 'PLOUFRAGAN', '06/22/18/34/40', 0, 0),
(2, '', '', 'PICHARD', 'Antoine', '2 place de la Mairie', 22440, 'PLOUFRAGAN', '06/76/87/99/06', 0, 0),
(3, '', '', 'ARCHANBAULT', 'Julie', '15 rue de l\'Eglise St Jean', 22000, 'SAINT BRIEUC', '07/89/23/43/33', 0, 0),
(4, '', '', 'GUERRAND', 'Emilie', '23B rue de la croix verte', 22000, 'Saint Brieuc', '06/90/23/43/11', 0, 0),
(5, '', '', 'ZACH', 'Jules', '3 place de la Nourrigue', 22222, 'KERDIREC', '02/22/23/55/33', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `borne`
--

DROP TABLE IF EXISTS `borne`;
CREATE TABLE IF NOT EXISTS `borne` (
  `codeB` int(3) NOT NULL AUTO_INCREMENT,
  `nomB` varchar(20) NOT NULL,
  `numRueB` int(2) DEFAULT NULL,
  `nomrueB` varchar(50) NOT NULL,
  `latitudeB` float NOT NULL,
  `longitudeB` float NOT NULL,
  PRIMARY KEY (`codeB`),
  UNIQUE KEY `nomUnique` (`nomB`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `borne`
--

INSERT INTO `borne` (`codeB`, `nomB`, `numRueB`, `nomrueB`, `latitudeB`, `longitudeB`) VALUES
(1, 'Bretagne', 5, 'Avenue de Bretagne', 48.4926, -2.79421),
(2, 'Mairie', 22, 'rue de la Mairie', 48.489, -2.79415),
(3, 'Leclerc', NULL, 'Centre commercial du Carpont', 48.4998, -2.77825),
(4, 'Eglise', 4, 'place de l\'église', 48.4887, -2.79239),
(5, 'Complexe Sportif', 13, 'rue de Merlet', 48.489, -2.81142);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `numV` int(11) NOT NULL AUTO_INCREMENT,
  `etatV` char(1) NOT NULL DEFAULT 'R',
  PRIMARY KEY (`numV`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='table vehicule contenant tous les véhicules';

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`numV`, `etatV`) VALUES
(1, 'R'),
(2, 'D'),
(3, 'D'),
(4, 'R'),
(5, 'R'),
(6, 'R'),
(7, 'R'),
(8, 'R'),
(9, 'R'),
(10, 'D'),
(11, 'D');

-- --------------------------------------------------------

--
-- Structure de la table `velo`
--

DROP TABLE IF EXISTS `velo`;
CREATE TABLE IF NOT EXISTS `velo` (
  `numV` int(11) NOT NULL,
  `latitudeV` float NOT NULL,
  `longitudeV` float NOT NULL,
  PRIMARY KEY (`numV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table vélo contenant que les vélos classiques';

--
-- Déchargement des données de la table `velo`
--

INSERT INTO `velo` (`numV`, `latitudeV`, `longitudeV`) VALUES
(1, 48.4813, -2.81484),
(2, 48.4991, -2.79788),
(8, 48.4994, -2.77808),
(9, 48.4937, -2.80056),
(10, 48.4887, -2.79238),
(11, 48.4872, -2.80078);

-- --------------------------------------------------------

--
-- Structure de la table `veloelectrique`
--

DROP TABLE IF EXISTS `veloelectrique`;
CREATE TABLE IF NOT EXISTS `veloelectrique` (
  `numV` int(11) NOT NULL,
  `numB` int(11) NOT NULL,
  PRIMARY KEY (`numV`),
  KEY `lientableBorne` (`numB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table contenant que les vélos électriques';

--
-- Déchargement des données de la table `veloelectrique`
--

INSERT INTO `veloelectrique` (`numV`, `numB`) VALUES
(3, 1),
(5, 1),
(7, 1),
(4, 2),
(6, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `velo`
--
ALTER TABLE `velo`
  ADD CONSTRAINT `HéritageVéloVéhicule` FOREIGN KEY (`numV`) REFERENCES `vehicule` (`numV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `veloelectrique`
--
ALTER TABLE `veloelectrique`
  ADD CONSTRAINT `HeritageveloElectriqueVehicule` FOREIGN KEY (`numV`) REFERENCES `vehicule` (`numV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lientableBorne` FOREIGN KEY (`numB`) REFERENCES `borne` (`codeB`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
