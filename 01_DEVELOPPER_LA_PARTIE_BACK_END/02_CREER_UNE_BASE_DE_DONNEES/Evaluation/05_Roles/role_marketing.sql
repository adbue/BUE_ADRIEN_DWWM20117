--
-- RÔLES
--

--
-- // ATTENTION \\
--
-- Pour tester si le script fonctionne, j'ai créé en plus du rôle un utilisateur :'hulkhogan'@'localhost' et mot de passe = '0'
--
-- Pour utiliser ce script, il faut l'importer puis se déconnecter et se reconnecter avec hulkhogan et mot de passe = '0'
--
-- Créez un groupe marketing qui peut ajouter, modifier et supprimer des produits et des catégories, consulter des commandes, 
-- leur détails et les clients. Ce groupe ne peut rien faire sur les autres tables. 
--




-- CRÉATION USER


CREATE USER 'hulkhogan'@'localhost' 
IDENTIFIED BY '0';


-- CRÉATION ROLE


CREATE ROLE 'r_marketing';


-- ATTRIBUTION PRIVILÈGES


GRANT SELECT, INSERT, UPDATE, DELETE ON  gescom_afpa_2020_08_18.products
TO 'r_marketing';

GRANT SELECT, INSERT, UPDATE, DELETE ON  gescom_afpa_2020_08_18.categories
TO 'r_marketing';

GRANT SELECT ON gescom_afpa_2020_08_18.orders
TO 'r_marketing';

GRANT SELECT ON gescom_afpa_2020_08_18.orders_details
TO 'r_marketing';

GRANT SELECT ON gescom_afpa_2020_08_18.customers
TO 'r_marketing';


-- AFFECTATION RÔLE


GRANT 'r_marketing'
TO 'hulkhogan'@'localhost';


-- VALIDATION

SET DEFAULT ROLE ALL TO 'hulkhogan'@'localhost';
