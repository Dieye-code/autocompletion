-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 06 juil. 2020 à 13:04
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
-- Base de données : `groupe2BP`
--
CREATE DATABASE IF NOT EXISTS `groupe2BP` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `groupe2BP`;

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

CREATE TABLE `affectation` (
  `id` int(11) NOT NULL,
  `dateAffectation` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `idAgence` int(11) DEFAULT NULL,
  `idEmployee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `clientMoral`
--

CREATE TABLE `clientMoral` (
  `id` int(11) NOT NULL,
  `raisonSocial` varchar(50) DEFAULT NULL,
  `adresse` varchar(75) DEFAULT NULL,
  `nom` varchar(75) DEFAULT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clientMoral`
--

INSERT INTO `clientMoral` (`id`, `raisonSocial`, `adresse`, `nom`, `numero`, `telephone`, `email`, `login`, `password`) VALUES
(1, 'SA', 'Mbao', 'MballoTech', 'NOO4578', '776543212', NULL, 'mballo', 'passer'),
(2, 'SA', 'Thies', 'NVT', 'N0657897', '338765432', NULL, 'nvt', 'passer'),
(3, 'ONG', 'Dakar', 'Simplon', 'N006790A', '338796543', NULL, 'simplon', 'auf'),
(14, 'SA', 'Pire', 'CBS', 'N0876543', '339876543', NULL, 'cbms', 'passer'),
(15, 'SA', 'Allemadie', 'SGBS', 'N00121314', '338765432', NULL, 'sgbs', 'passer'),
(16, 'SA', 'Thies', 'SGBS', 'N009876', '339876543', NULL, 'sgbs', 'passer');

-- --------------------------------------------------------

--
-- Structure de la table `clientPhysique`
--

CREATE TABLE `clientPhysique` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `nci` varchar(20) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `salaire` decimal(15,2) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `idTypeClient` int(11) DEFAULT NULL,
  `idClientMoral` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clientPhysique`
--

INSERT INTO `clientPhysique` (`id`, `nom`, `prenom`, `nci`, `telephone`, `adresse`, `salaire`, `profession`, `email`, `login`, `password`, `idTypeClient`, `idClientMoral`) VALUES
(1, 'Dieye', 'Moustapha', '1234567890987', '777777777', 'Medina', '1500000.00', 'Developpeur', NULL, 'dieye', 'passer', 2, 1),
(8, 'Diop', 'Mor', '1234567890987', '766666666', 'Medina', '600000.00', 'Developpeur', NULL, 'mor', 'diop', 2, 14),
(10, 'Ndiaye', 'Aliou', '1234567890965', '776778877', 'Fass', NULL, NULL, NULL, 'ndiaye', 'passer', 1, NULL),
(12, 'Gueye', 'Mouhamed', '1234567898765', '777777777', 'Yeumbeul', '1500000.00', 'Developpeur', NULL, 'momo', 'passer', 2, 16),
(13, 'Mballo', 'Ousmane', '1234567765345', '776543212', 'Parcelle', '800000.00', 'chefdeprojet', NULL, 'ousmane', 'passer', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `numero` varchar(30) DEFAULT NULL,
  `clerib` varchar(55) DEFAULT NULL,
  `solde` decimal(15,2) DEFAULT NULL,
  `etat` varchar(30) DEFAULT NULL,
  `dateDeboc` date DEFAULT NULL,
  `dateCreat` date DEFAULT NULL,
  `dateFermetureTemp` date DEFAULT NULL,
  `dateReouverture` date DEFAULT NULL,
  `idClientPhysique` int(11) DEFAULT NULL,
  `idClientMoral` int(11) DEFAULT NULL,
  `idTypeCompte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `numero`, `clerib`, `solde`, `etat`, `dateDeboc`, `dateCreat`, `dateFermetureTemp`, `dateReouverture`, `idClientPhysique`, `idClientMoral`, `idTypeCompte`) VALUES
(2, 'C001', 'C001', '2000.00', 'actif', NULL, '2020-06-30', NULL, NULL, 8, NULL, 2),
(3, 'Coo1', 'Coo1', '10000.00', 'actif', NULL, '2020-06-30', NULL, NULL, 10, NULL, 1),
(8, 'Coo1', 'Coo1', '7000.00', 'actif', NULL, '2020-06-30', NULL, NULL, NULL, 14, 1),
(10, 'C002', 'C002', '1745000.00', 'actif', NULL, '2020-06-30', NULL, NULL, NULL, 2, 1),
(11, 'C005', 'C005', '1490000.00', 'actif', '2022-10-11', '2020-07-01', NULL, NULL, NULL, 3, 4),
(14, '105', '105', '105000.00', 'actif', NULL, '2020-07-02', NULL, NULL, 8, NULL, 2),
(19, 'C00GT', 'C00GT', '5000000.00', 'actif', NULL, '2020-07-02', NULL, NULL, 12, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `compttransaction`
--

CREATE TABLE `compttransaction` (
  `idCompte` int(11) NOT NULL,
  `idTransaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `cni` varchar(20) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `fraisbancaire`
--

CREATE TABLE `fraisbancaire` (
  `id` int(11) NOT NULL,
  `montant` decimal(15,2) DEFAULT NULL,
  `dateFrais` date DEFAULT NULL,
  `idCompte` int(11) DEFAULT NULL,
  `idTypeFrais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id` int(11) NOT NULL,
  `dateStatut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `idProfil` int(11) DEFAULT NULL,
  `idEmployee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `montantTrans` double DEFAULT NULL,
  `idTypeTransaction` int(11) DEFAULT NULL,
  `dateTransaction` varchar(15) DEFAULT NULL,
  `idEmployee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `typeClient`
--

CREATE TABLE `typeClient` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeClient`
--

INSERT INTO `typeClient` (`id`, `libelle`) VALUES
(1, 'non salarie'),
(2, 'salarie');

-- --------------------------------------------------------

--
-- Structure de la table `typeCompte`
--

CREATE TABLE `typeCompte` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeCompte`
--

INSERT INTO `typeCompte` (`id`, `libelle`) VALUES
(1, 'Simple et Xeewel'),
(2, 'Courant'),
(4, 'Bloque');

-- --------------------------------------------------------

--
-- Structure de la table `typeFrais`
--

CREATE TABLE `typeFrais` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `montant` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeFrais`
--

INSERT INTO `typeFrais` (`id`, `libelle`, `montant`) VALUES
(1, 'Agios', '10000'),
(2, 'Frais ouverture', '5000'),
(7, 'Frais Blocage', '15000');

-- --------------------------------------------------------

--
-- Structure de la table `typeTransaction`
--

CREATE TABLE `typeTransaction` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmployee` (`idEmployee`),
  ADD KEY `idAgence` (`idAgence`);

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clientMoral`
--
ALTER TABLE `clientMoral`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clientPhysique`
--
ALTER TABLE `clientPhysique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTypeClient` (`idTypeClient`),
  ADD KEY `idClientMoral` (`idClientMoral`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClientPhysique` (`idClientPhysique`),
  ADD KEY `idClientMoral` (`idClientMoral`),
  ADD KEY `idTypeCompte` (`idTypeCompte`);

--
-- Index pour la table `compttransaction`
--
ALTER TABLE `compttransaction`
  ADD PRIMARY KEY (`idCompte`,`idTransaction`),
  ADD KEY `idTransaction` (`idTransaction`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fraisbancaire`
--
ALTER TABLE `fraisbancaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCompte` (`idCompte`),
  ADD KEY `idTypeFrais` (`idTypeFrais`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProfil` (`idProfil`),
  ADD KEY `idEmployee` (`idEmployee`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTypeTransaction` (`idTypeTransaction`),
  ADD KEY `idEmployee` (`idEmployee`);

--
-- Index pour la table `typeClient`
--
ALTER TABLE `typeClient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typeCompte`
--
ALTER TABLE `typeCompte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typeFrais`
--
ALTER TABLE `typeFrais`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typeTransaction`
--
ALTER TABLE `typeTransaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affectation`
--
ALTER TABLE `affectation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `agence`
--
ALTER TABLE `agence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clientMoral`
--
ALTER TABLE `clientMoral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `clientPhysique`
--
ALTER TABLE `clientPhysique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fraisbancaire`
--
ALTER TABLE `fraisbancaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typeClient`
--
ALTER TABLE `typeClient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `typeCompte`
--
ALTER TABLE `typeCompte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `typeFrais`
--
ALTER TABLE `typeFrais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `typeTransaction`
--
ALTER TABLE `typeTransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `affectation_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `affectation_ibfk_2` FOREIGN KEY (`idAgence`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `clientPhysique`
--
ALTER TABLE `clientPhysique`
  ADD CONSTRAINT `clientPhysique_ibfk_1` FOREIGN KEY (`idTypeClient`) REFERENCES `typeClient` (`id`),
  ADD CONSTRAINT `clientPhysique_ibfk_2` FOREIGN KEY (`idClientMoral`) REFERENCES `clientMoral` (`id`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`idClientPhysique`) REFERENCES `clientPhysique` (`id`),
  ADD CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`idClientMoral`) REFERENCES `clientMoral` (`id`),
  ADD CONSTRAINT `compte_ibfk_3` FOREIGN KEY (`idTypeCompte`) REFERENCES `typeCompte` (`id`);

--
-- Contraintes pour la table `compttransaction`
--
ALTER TABLE `compttransaction`
  ADD CONSTRAINT `compttransaction_ibfk_1` FOREIGN KEY (`idCompte`) REFERENCES `compte` (`id`),
  ADD CONSTRAINT `compttransaction_ibfk_2` FOREIGN KEY (`idTransaction`) REFERENCES `transaction` (`id`);

--
-- Contraintes pour la table `fraisbancaire`
--
ALTER TABLE `fraisbancaire`
  ADD CONSTRAINT `fraisbancaire_ibfk_1` FOREIGN KEY (`idCompte`) REFERENCES `compte` (`id`),
  ADD CONSTRAINT `fraisbancaire_ibfk_2` FOREIGN KEY (`idTypeFrais`) REFERENCES `typeFrais` (`id`);

--
-- Contraintes pour la table `statut`
--
ALTER TABLE `statut`
  ADD CONSTRAINT `statut_ibfk_1` FOREIGN KEY (`idProfil`) REFERENCES `profil` (`id`),
  ADD CONSTRAINT `statut_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`id`);

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`idTypeTransaction`) REFERENCES `typeTransaction` (`id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`id`);
--
-- Base de données : `p3simplon`
--
CREATE DATABASE IF NOT EXISTS `p3simplon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `p3simplon`;

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
--
-- Base de données : `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Déchargement des données de la table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"angular\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Déchargement des données de la table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('groupe2BP', 1, 'model');

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"p3simplon\",\"table\":\"apprenant\"},{\"db\":\"groupe2BP\",\"table\":\"clientPhysique\"},{\"db\":\"groupe2BP\",\"table\":\"compte\"},{\"db\":\"groupe2BP\",\"table\":\"clientMoral\"},{\"db\":\"groupe2BP\",\"table\":\"typeCompte\"},{\"db\":\"groupe2BP\",\"table\":\"typeClient\"},{\"db\":\"groupe2BP\",\"table\":\"typeFrais\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Déchargement des données de la table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('groupe2BP', 'affectation', 1, 144, 162),
('groupe2BP', 'agence', 1, 45, 42),
('groupe2BP', 'clientMoral', 1, 102, 1243),
('groupe2BP', 'clientPhysique', 1, 499, 1102),
('groupe2BP', 'compte', 1, 456, 781),
('groupe2BP', 'compttransaction', 1, 440, 595),
('groupe2BP', 'employee', 1, 467, 9),
('groupe2BP', 'fraisbancaire', 1, 776, 667),
('groupe2BP', 'profil', 1, 909, 228),
('groupe2BP', 'statut', 1, 746, 32),
('groupe2BP', 'transaction', 1, 454, 429),
('groupe2BP', 'typeClient', 1, 843, 1120),
('groupe2BP', 'typeCompte', 1, 858, 856),
('groupe2BP', 'typeFrais', 1, 858, 432),
('groupe2BP', 'typeTransaction', 1, 97, 394);

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Déchargement des données de la table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'p3simplon', 'apprenant', '{\"sorted_col\":\"`apprenant`.`id` ASC\"}', '2020-07-06 09:31:04');

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-07-06 10:24:37', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
