--
-- EXERCICE DATABASE Oto
--


DROP DATABASE IF EXISTS `Oto`;
CREATE DATABASE IF NOT EXISTS `Oto`;

USE `Oto`;

--
-- Création table 'service'
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service`
(
    `ser_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `ser_nom` varchar(30) NOT NULL,

    PRIMARY KEY(`ser_id`)
)ENGINE=InnoDB;


--
-- Création table 'fonction'
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction`
(
    `fon_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `fon_nom` varchar(30) NOT NULL,
    `fon_salaire_brut_annuel` float(5,2) UNSIGNED NOT NULL,

    PRIMARY KEY (`fon_id`)
)ENGINE=InnoDB;


--
-- Création table 'employes'
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes`
(
    `emp_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `emp_nom` varchar(30) NOT NULL,
    `emp_prenom` varchar(30) NOT NULL,
    `emp_fon_id` int NOT UNSIGNED NULL,
    `emp_ser_id` int NOT UNSIGNED NULL,
    `emp_genre` ENUM('Homme', 'Femme', 'Ne se prononce pas') NOT NULL,
    `emp_date_naissance` DATE NOT NULL,
    `emp_adresse` varchar(30) NOT NULL,
    `emp_code_postal` int(5) UNSIGNED NOT NULL,
    `emp_ville` varchar(20) NOT NULL,
    `emp_telephone` int(10) UNSIGNED NOT NULL,
    `emp_mail` varchar(60) NOT NULL,
    `emp_date_embauche` DATE NOT NULL,
    `emp_anciennete` tinyint(2) UNSIGNED NULL,
    `emp_date_depart` DATE NULL,
    
    PRIMARY KEY (`emp_id`),
    FOREIGN KEY (`emp_fon_id`) REFERENCES `fonction`(`fon_id`),
    FOREIGN KEY (`emp_ser_id`) REFERENCES `fonction`(`ser_id`)
)ENGINE=InnoDB;

--
-- Création table 'categorie_accessoires'
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie`
(
    `cat_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `cat_nom` varchar(50) NOT NULL,
    `cat_parent_id` int UNSIGNED NOT NULL

    PRIMARY KEY (`cat_id`),
    FOREIGN KEY (`cat_parent_id`) REFERENCES `categorie`(`cat_id`)
)ENGINE=InnoDB;

--
-- Création table 'vehicules'
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules`
(
    `veh_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `veh_reference` varchar(6) NOT NULL,
    `veh_marque` varchar(30) NOT NULL,
    `veh_modele` varchar(30) NOT NULL,
    `veh_cat_id` int UNSIGNED NOT NULL,
    `veh_description` varchar(500) NOT NULL,
    `veh_carburant` varchar (15) NOT NULL,
    `veh_puissance_fiscal` int UNSIGNED NOT NULL,
    `veh_annee` DATE NOT NULL,
    `veh_couleur` varchar(30) NOT NULL,
    `veh_etat` ENUM('neuf','occasion'),
    `veh_kilometre` int UNSIGNED NULL,
    `veh_date_ajout` DATE NULL,
    `veh_date_modif` DATETIME NULL,
    `veh_presence_catalogue` BOOLEAN

    PRIMARY KEY (`veh_id`),
    FOREIGN KEY (`veh_cat_id`) REFERENCES `categorie`(`cat_id`)

)ENGINE=InnoDB;


--
-- Création table 'accessoires'
--

DROP TABLE IF EXISTS `accessoires`;
CREATE TABLE IF NOT EXISTS `accessoires`
(
    `acc_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `acc_cat_id` int NOT NULL,
    `acc_reference` varchar(10) NOT NULL,
    `acc_marque` varchar(50) NOT NULL,
    `acc_modele` varchar(50) NOT NULL,
    `acc_description` varchar(500) NOT NULL,
    `acc_prix_unit_ht` float(5,2) NOT NULL,
    `acc_stock_physique` int UNSIGNED NOT NULL,
    `acc_stock_alerte` int UNSIGNED NOT NULL,
    `acc_date_ajout` DATE NULL,
    `acc_date_modif` DATETIME NULL,
    `acc_presence_catalogue` BOOLEAN

    PRIMARY KEY (`acc_id`),
    FOREIGN KEY (`acc_cat_id`) REFERENCES `categorie`(`cat_id`)

)ENGINE=InnoDB;


--
-- Création table 'options'
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options`
(
    `opt_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `opt_nom` int NOT NULL,

    PRIMARY KEY (`opt_id`)
)ENGINE=InnoDB;


--
-- Création table 'clients'
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients`
(
    `cli_id` int AUTO_INCREMENT UNSIGNED NOT NULL,
    `cli_nom` varchar(30) NOT NULL,
    `cli_prenom` varchar(30) NOT NULL,
    `cli_adresse` varchar(30) NOT NULL,
    `cli_code_postal` int(5) UNSIGNED NOT NULL,
    `cli_ville` varchar(20) NOT NULL,
    `cli_telephone` int(10) UNSIGNED NOT NULL,
    `cli_mail` varchar(60) NOT NULL,
    `cli_emp_id` int NOT NULL,

    
    PRIMARY KEY (`cli_id`),
    FOREIGN KEY (`cli_emp_id`) REFERENCES `employes`(`emp_id`)
    
)ENGINE=InnoDB;


