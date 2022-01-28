-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 28 jan. 2022 à 14:25
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rembours_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande_remboursement`
--

CREATE TABLE `demande_remboursement` (
  `id` int(11) NOT NULL,
  `date_saisie` datetime NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `commentaire` varchar(200) NOT NULL,
  `id_type_frais` int(11) NOT NULL,
  `id_delegue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demande_remboursement`
--

INSERT INTO `demande_remboursement` (`id`, `date_saisie`, `montant`, `commentaire`, `id_type_frais`, `id_delegue`) VALUES
(1, '2021-07-06 16:17:34', '12', 'frais de repas', 1, 4),
(2, '2021-07-08 11:04:28', '500', 'Invitation du responsable du CHU d\'Amiens', 3, 1),
(3, '2021-07-08 11:16:46', '650', '3 nuits lors du colloque de Nice sur les addictions', 2, 1),
(4, '2021-11-16 20:57:08', '502', 'Nuit d\'hôtel lors de la conférence du 05/05/2020', 2, 4),
(5, '2021-11-16 20:57:28', '125', 'Invitation de la secrétaire médical du Dr Virtigo', 3, 4),
(6, '2021-11-22 15:12:20', '200', 'Hotel', 2, 1),
(7, '2021-11-24 14:10:20', '100', 'Hotel', 2, 4),
(8, '2022-01-05 13:23:43', '150', 'Test', 1, 4),
(9, '2022-01-28 13:09:43', '150', 'Visite', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `fonctionnalite`
--

CREATE TABLE `fonctionnalite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(75) NOT NULL,
  `libelle_menu_parent` varchar(50) NOT NULL,
  `libelle_menu_enfant` varchar(50) NOT NULL,
  `lien_menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonctionnalite`
--

INSERT INTO `fonctionnalite` (`id`, `libelle`, `libelle_menu_parent`, `libelle_menu_enfant`, `lien_menu`) VALUES
(1, 'Modification du mot de passe', 'Utilisateur', 'Changer mot de passe', 'modifMdp'),
(2, 'Consultation des demandes de remboursement', 'Demande Remboursement', 'Voir demandes', 'consultTousRembour'),
(3, 'Modification d\'une demande de remboursement', 'Demande Remboursement', 'Modifier une demande', 'modifDemRembListeForm'),
(4, 'Ajout d\'un utilisateur', 'Utilisateur', 'Ajouter utilisateur', 'ajoutUtilisateurForm'),
(5, 'Saisie d\'une demande de remboursement de frais', 'Demande Remboursement', 'Ajouter demande', 'ajoutDemRembForm'),
(6, 'Consultation de son profil', 'Utilisateur', 'Voir mon profil', 'consultProfil'),
(7, 'Consultation des demandes de l\'utilisateur connecté', 'Demande Remboursement', 'Voir mes demandes', 'consultMesDemRemb'),
(8, 'Ajout d\'une visite chez le medecin', 'Visite Medecin', 'Ajout d\'une visite chez le médecin', 'ajoutVisiteForm'),
(9, 'Consultation des visites chez les médecins', 'Visite Medecin', 'Voir les visites chez les médecins', 'consultVisiteListe'),
(10, 'Ajout d\'un medecin', 'Medecin', 'Ajout medecin', 'ajoutMedecinForm'),
(11, 'Modification d\'une visite chez le médecin', 'Visite Medecin', 'Modifier une visite', 'modifVisiteListeForm');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`) VALUES
(1, 'Ambroise', 'Paré'),
(2, 'Xavier', 'Bichat'),
(3, 'Jean-Martin', 'Charcot'),
(4, 'Albert', 'Calmette'),
(5, 'Emile', 'Roux'),
(6, 'Dennel', 'Fabien');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id`, `libelle`) VALUES
(1, 'Délégué'),
(2, 'Responsable comptabilité'),
(3, 'Responsable délégué'),
(4, 'Administrateur'),
(5, 'Responsable informatique');

-- --------------------------------------------------------

--
-- Structure de la table `profil_fonct`
--

CREATE TABLE `profil_fonct` (
  `id_profil` int(11) NOT NULL,
  `id_fonct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profil_fonct`
--

INSERT INTO `profil_fonct` (`id_profil`, `id_fonct`) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 6),
(2, 9),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(11, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type_frais`
--

CREATE TABLE `type_frais` (
  `id` int(11) NOT NULL,
  `libelle` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_frais`
--

INSERT INTO `type_frais` (`id`, `libelle`) VALUES
(1, 'repas'),
(2, 'nuit d\'hôtel'),
(3, 'repas (invitation client)');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(35) NOT NULL,
  `prenom` varchar(35) NOT NULL,
  `pseudo` varchar(35) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `id_profil` int(11) NOT NULL,
  `id_dern_util_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `pseudo`, `mot_de_passe`, `id_profil`, `id_dern_util_modif`) VALUES
(1, 'Aressi', 'Yvan', 'rbtay562', '$2y$10$D0xfm7DFo1IaM0QRUy4aaegu8EoOIdrcVtmwQP0gjHUIhLPqcErnq', 1, 3),
(2, 'Lisilon', 'Pierre', 'rbtlp788', '$2y$10$UviHJr/38HipyN86Ph8SM.BPhsmTGY4qbHUac35B7c9QqxWWRHtoG', 2, 3),
(3, 'Lebos', 'Jade', 'rbtlj621', '$2y$10$GouM0EjMMp4B67B8DQEVEu6yxItMwFKzFb5y8r3i0EiwoTH0FvS/6', 4, 3),
(4, 'Lejaune', 'Paul', 'rbtio150', '$2y$10$i6lJb3qhPCuxLwht6FgRr.AZZ1qxfdyLHWU.WbHVE0mb4JP75XwmW', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE `visite` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `commentaires` varchar(200) NOT NULL,
  `id_medecin` int(11) NOT NULL,
  `id_delegue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visite`
--

INSERT INTO `visite` (`id`, `date`, `commentaires`, `id_medecin`, `id_delegue`) VALUES
(1, '2021-11-25 10:09:35', 'entorse cheville', 2, 1),
(2, '2021-11-25 10:09:58', 'fièvre', 4, 1),
(3, '2021-11-25 10:10:31', 'mal de gorge', 1, 1),
(4, '2022-01-05 10:58:41', 'Viste pour le dos', 5, 1),
(5, '2022-01-28 14:37:31', 'Test', 4, 1),
(6, '2022-01-28 14:42:03', 'Viste pour le dos', 6, 1),
(7, '2022-01-28 15:06:39', 'Test', 6, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande_remboursement`
--
ALTER TABLE `demande_remboursement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fonctionnalite`
--
ALTER TABLE `fonctionnalite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profil_fonct`
--
ALTER TABLE `profil_fonct`
  ADD PRIMARY KEY (`id_profil`,`id_fonct`);

--
-- Index pour la table `type_frais`
--
ALTER TABLE `type_frais`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_visites_medecins` (`id_medecin`),
  ADD KEY `Fk_id_delegue_visites_medecins` (`id_delegue`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande_remboursement`
--
ALTER TABLE `demande_remboursement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `fonctionnalite`
--
ALTER TABLE `fonctionnalite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_frais`
--
ALTER TABLE `type_frais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `visite`
--
ALTER TABLE `visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `Fk_id_delegue_visites_medecins` FOREIGN KEY (`id_delegue`) REFERENCES `fonctionnalite` (`id`),
  ADD CONSTRAINT `Fk_visites_medecins` FOREIGN KEY (`id_medecin`) REFERENCES `medecin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
