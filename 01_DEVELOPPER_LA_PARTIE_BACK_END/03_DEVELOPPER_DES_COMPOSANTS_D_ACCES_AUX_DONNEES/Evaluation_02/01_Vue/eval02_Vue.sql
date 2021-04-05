--
-- VUE
--
-- Créez une vue qui affiche le catalogue produits. L'id, la référence et le nom des produits, 
-- ainsi que l'id et le nom de la catégorie doivent apparaître. 
--


DROP VIEW IF EXISTS v_catalogue_produits;

CREATE VIEW v_catalogue_produits AS
    SELECT pro_id AS 'Id', 
           pro_ref AS 'Référence produit', 
           pro_name AS 'Nom du produit', 
           cat_id AS 'Id catégorie', 
           cat_name AS 'Nom de la catégorie'
    FROM products 
    INNER JOIN categories 
    ON products.pro_cat_id = categories.cat_id 
    ORDER BY 1;


-- affichage de la vue 


SELECT * FROM v_catalogue_produits;