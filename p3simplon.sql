-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 06 juil. 2020 à 23:58
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `p3simplon`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

CREATE TABLE `apprenant` (
  `id` int(4) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `apprenant`
--

INSERT INTO `apprenant` (`id`, `nom`, `prenom`, `telephone`, `email`) VALUES
(1, 'Dieye', 'Moustapha', '784758011', 'moustaphadieye96@gmail.com'),
(2, 'BA', 'Aissata', '772956579', 'aissata.ba0903@gmail.com'),
(3, 'NDIAYE', 'Ababacar Diene', '774580193', 'abdind93@gmail.com'),
(4, 'DIAW', 'Samba', '771464446', 'sambadiawrt@gmail.com'),
(5, 'MBALLO', 'Ousmane', '771979043', 'ousmanemballo576@gmail.com'),
(6, 'FALL', 'Maréme', '773454993', 'fallmena09@gmail.com'),
(7, 'DIATTA', 'Noël Jérémie', '772860551', 'jeremynoeldiatta@gmail.com'),
(8, 'DIOP', 'Mor', '774313550', 'mordip06@gmail.com'),
(9, 'MBOW', 'Cheikh', '773881896', 'cheikh2mbow@gmail.com'),
(10, 'CISSE', 'Aissatou', '772360279', 'aissatoucisse351@gmail.com'),
(11, 'AKHYAR', 'Moussa', '771381498', 'amrane93.mb@gmail.com'),
(12, 'FALL', 'Serigne Fallou', '773452692', 'fallfallou37@gmail.com'),
(13, 'SARR', 'Abdoulaye', '773096782', 'sarrabdoulayeyakhine7@gmail.com'),
(14, 'SOW', 'Fama', '771450031', 'sofama1997@gmail.com'),
(15, 'DIOUF', 'MARIAMA', '773042478', 'mariama1.diouf@gmail.com'),
(16, 'DIENE', 'Moussa', '771390927', 'mosila2138@gmail.com'),
(17, 'NIANG', 'Marame', '775025524', 'thiatatou@gmail.com'),
(18, 'SOW', 'Abdourahmane', '783077632', 'soowzididi84@gmail.com'),
(19, 'GADIAGA', 'Mafatime', '771064335', 'mafatimegadiaga@gmail.com'),
(20, 'DIOP', 'Mor', '773511003', 'mordioptaiba@gmail.com'),
(21, 'NDOYE', 'Papa Mbaye', '775923408', 'papisndoye218@gmail.com'),
(22, 'EDGAR', 'Emmanuel', '776711361', 'mmnledgar@gmail.com'),
(23, 'SAGNA', 'Judith Lisette ', '781780454', 'sagnajudith@gmail.com'),
(24, 'NIANG', 'Abdou', '776957616', 'abdouniangyeumbeul@gmail.com'),
(25, 'RAJAONA', 'Marie Perle', '775107722', 'hantamp@gmail.com'),
(26, 'GUEYE', 'Mohamed', '778834583', 'orbitturner@gmail.com'),
(27, 'Sy', 'Coumba', '775235100', 'sycoumba193@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
