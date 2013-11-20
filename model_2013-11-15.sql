# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.1.49)
# Base de données: model
# Temps de génération: 2013-11-15 17:23:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table Adresse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Adresse`;

CREATE TABLE `Adresse` (
  `id_adresse` int(11) NOT NULL,
  `num_voie` int(11) DEFAULT NULL,
  `nom_voie` varchar(30) DEFAULT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `pays` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table CategorieAge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CategorieAge`;

CREATE TABLE `CategorieAge` (
  `id_categorie_age` int(11) NOT NULL,
  `libelle_categorie_age` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_categorie_age`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table CategoriePoids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CategoriePoids`;

CREATE TABLE `CategoriePoids` (
  `id_categorie_poids` int(11) NOT NULL,
  `libelle_categorie_poids` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_categorie_poids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Club
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Club`;

CREATE TABLE `Club` (
  `id_club` int(11) NOT NULL,
  `nom_club` varchar(30) DEFAULT NULL,
  `presentation_club` varchar(1000) DEFAULT NULL,
  `prix_cotisation_club` int(11) DEFAULT NULL,
  `date_creation_club` date DEFAULT NULL,
  `id_adresse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_club`),
  KEY `fk_club` (`id_adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Competition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Competition`;

CREATE TABLE `Competition` (
  `id_evenement` int(11) NOT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Discipline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Discipline`;

CREATE TABLE `Discipline` (
  `id_discipline` int(11) NOT NULL,
  `libelle_discipline` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_discipline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table DisciplineEntraineur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DisciplineEntraineur`;

CREATE TABLE `DisciplineEntraineur` (
  `id_personne` int(11) NOT NULL DEFAULT '0',
  `id_discipline` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_personne`,`id_discipline`),
  KEY `fk_discipline` (`id_discipline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Entrainement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Entrainement`;

CREATE TABLE `Entrainement` (
  `id_entrainement` int(11) NOT NULL,
  `duree_entrainement` int(11) DEFAULT NULL,
  `id_horaire` int(11) DEFAULT NULL,
  `id_discipline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entrainement`),
  KEY `fk_entrainement` (`id_horaire`),
  KEY `id_discipline` (`id_discipline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table EntrainementEntraineur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EntrainementEntraineur`;

CREATE TABLE `EntrainementEntraineur` (
  `id_personne` int(11) NOT NULL DEFAULT '0',
  `id_entrainement` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entrainement`,`id_personne`),
  KEY `fk_entraineur` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Entraineur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Entraineur`;

CREATE TABLE `Entraineur` (
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Evenement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Evenement`;

CREATE TABLE `Evenement` (
  `id_evenement` int(11) NOT NULL,
  `date_evenement` date DEFAULT NULL,
  `libelle_evenement` varchar(30) DEFAULT NULL,
  `id_adresse_evenement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_evenement`),
  KEY `pk_evenement` (`id_adresse_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Grade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Grade`;

CREATE TABLE `Grade` (
  `id_grade` int(11) NOT NULL,
  `libelle_grade` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Heure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Heure`;

CREATE TABLE `Heure` (
  `id_heure` int(11) NOT NULL,
  `heure` int(11) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_heure`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Horaire
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Horaire`;

CREATE TABLE `Horaire` (
  `id_jour` int(11) NOT NULL DEFAULT '0',
  `id_heure` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jour`,`id_heure`),
  KEY `fk_horaire_heure` (`id_heure`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Jour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Jour`;

CREATE TABLE `Jour` (
  `id_jour` int(11) NOT NULL,
  `libelle_jour` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_jour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Licencie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Licencie`;

CREATE TABLE `Licencie` (
  `id_personne` int(11) NOT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `num_licencie` int(11) DEFAULT NULL,
  `poids` float DEFAULT NULL,
  `id_categorie_age` int(11) DEFAULT NULL,
  `id_categorie_poids` int(11) DEFAULT NULL,
  `etudiant` tinyint(1) DEFAULT NULL,
  `id_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `id_categorie_age` (`id_categorie_age`),
  KEY `id_categorie_poids` (`id_categorie_poids`),
  KEY `id_grade` (`id_grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Membre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Membre`;

CREATE TABLE `Membre` (
  `id_personne` int(11) NOT NULL,
  `date_debut_activite` date DEFAULT NULL,
  `date_fin_activite` date DEFAULT NULL,
  `id_licencie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `id_licencie` (`id_licencie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Partenaire
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Partenaire`;

CREATE TABLE `Partenaire` (
  `id_partenaire` int(11) NOT NULL,
  `libelle_partenaire` varchar(100) DEFAULT NULL,
  `lien_partenaire` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_partenaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ParticipationCompetition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ParticipationCompetition`;

CREATE TABLE `ParticipationCompetition` (
  `id_evenement` int(11) NOT NULL DEFAULT '0',
  `id_personne` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_evenement`,`id_personne`),
  KEY `pk_participation_licencie` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ParticipationSortie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ParticipationSortie`;

CREATE TABLE `ParticipationSortie` (
  `id_personne` int(11) NOT NULL DEFAULT '0',
  `id_sortie` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_personne`,`id_sortie`),
  KEY `fk_particpation_sortie_sortie` (`id_sortie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ParticipationStage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ParticipationStage`;

CREATE TABLE `ParticipationStage` (
  `id_personne` int(11) NOT NULL DEFAULT '0',
  `id_stage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_personne`,`id_stage`),
  KEY `fk_particpation_stage_stage` (`id_stage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Personne
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Personne`;

CREATE TABLE `Personne` (
  `id_personne` int(11) NOT NULL,
  `nom_personne` varchar(30) DEFAULT NULL,
  `prenom_personne` varchar(30) DEFAULT NULL,
  `date_naissance_personne` date DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table Photo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Photo`;

CREATE TABLE `Photo` (
  `id_photo` int(11) NOT NULL,
  `libelle_photo` varchar(100) DEFAULT NULL,
  `lien_photo` varchar(300) DEFAULT NULL,
  `id_evenement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Resultat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Resultat`;

CREATE TABLE `Resultat` (
  `id_resultat` int(11) NOT NULL,
  `place_resultat` int(11) DEFAULT NULL,
  `id_competition` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_resultat`),
  KEY `id_competition` (`id_competition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ResultatEquipe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResultatEquipe`;

CREATE TABLE `ResultatEquipe` (
  `id_resultat` int(11) NOT NULL,
  PRIMARY KEY (`id_resultat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ResultatEquipeLicencie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResultatEquipeLicencie`;

CREATE TABLE `ResultatEquipeLicencie` (
  `id_resultat` int(11) NOT NULL DEFAULT '0',
  `id_personne` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_resultat`,`id_personne`),
  KEY `fk_resultat_personne` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ResultatIndividuel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResultatIndividuel`;

CREATE TABLE `ResultatIndividuel` (
  `id_resultat` int(11) NOT NULL,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_resultat`),
  KEY `fk_resultat_personne` (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Secretaire
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Secretaire`;

CREATE TABLE `Secretaire` (
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Sortie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sortie`;

CREATE TABLE `Sortie` (
  `id_evenement` int(11) NOT NULL,
  `prix_licencie` float DEFAULT NULL,
  `prix_parent` float DEFAULT NULL,
  `prix_exterieur` float DEFAULT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Stage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Stage`;

CREATE TABLE `Stage` (
  `id_evenement` int(11) NOT NULL,
  `prix_licencie` float DEFAULT NULL,
  `prix_parent` float DEFAULT NULL,
  `prix_exterieur` float DEFAULT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Tresorier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Tresorier`;

CREATE TABLE `Tresorier` (
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table Video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Video`;

CREATE TABLE `Video` (
  `id_video` int(11) NOT NULL,
  `libelle_video` varchar(100) DEFAULT NULL,
  `lien_video` varchar(300) DEFAULT NULL,
  `id_evenement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_video`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
