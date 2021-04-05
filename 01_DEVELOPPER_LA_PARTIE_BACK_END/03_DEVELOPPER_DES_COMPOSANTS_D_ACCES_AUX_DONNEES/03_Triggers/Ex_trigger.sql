--
-- EXERCICE 02
--

--
-- /// ATTENTION CE SCRIPT A ÉTÉ CONÇU EN FONCTION DE MA BASE DE DONNÉES \\\
--

--
-- Création de la table commander_articles dans ma BDD gescom
--

USE gescom_afpa;

DROP TABLE IF EXISTS commander_articles;
CREATE TABLE commander_articles
(
    codart int UNSIGNED NOT NULL,
    qte int UNSIGNED NOT NULL,
    date DATE NOT NULL,

    FOREIGN KEY(codart) REFERENCES products(pro_id)
)ENGINE=InnoDB;


--
-- Création du déclencheur
--

DELIMITER $$

    CREATE TRIGGER `after_products_update`
    AFTER UPDATE ON gescom_afpa.products
    FOR EACH ROW

    BEGIN

        IF NEW.pro_stock_alert > NEW.pro_stock AND NEW.pro_id = 8  THEN -- Nous nous interessons au pro_id = 8 pour l'exercice

            INSERT INTO gescom_afpa.commander_articles (codart, qte, `date`)

            VALUES (NEW.pro_id, (NEW.pro_stock_alert - NEW.pro_stock), CURDATE());

        END IF;
        
    END $$

DELIMITER ;
