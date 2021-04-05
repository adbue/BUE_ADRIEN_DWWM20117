--
-- Procédures stockées
--
-- Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture 
-- en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.
--

--
-- Création procédure stockée avec paramètre entrant (p_id_order)
--

DELIMITER $$

CREATE PROCEDURE gescom_afpa.facture(IN p_id_order INT)

BEGIN

    SELECT ord_id AS 'N° Facture', ord_order_date AS 'Date de commande', ord_reception_date AS 'Date de livraison',
           CONCAT(cus_lastname,' ', cus_firstname) AS 'Nom du client', 
           CONCAT(cus_address, ' ', cus_zipcode, ' ', cus_city) AS 'Adresse de facturation',
           cus_countries_id AS 'Pays',
           pro_name AS 'Nom du produit', pro_ref AS 'Référence du produit', cat_name AS 'Catégorie', 
           pro_color AS 'Couleur',
           ode_unit_price AS 'Prix unitaire HT', ode_quantity AS 'Quantité', ode_discount AS 'Remise',
           ROUND(orders_details.ode_quantity*(orders_details.ode_unit_price - (orders_details.ode_unit_price * orders_details.ode_discount / 100)), 2)  AS 'TOTAL HT',
           ROUND(orders_details.ode_quantity*(orders_details.ode_unit_price - (orders_details.ode_unit_price * orders_details.ode_discount / 100)) * 1.2, 2)  AS 'TOTAL TTC (TVA20)'

    FROM countries
    JOIN customers
    ON countries.cou_id = customers.cus_countries_id   
    JOIN orders
    ON customers.cus_id = orders.ord_cus_id 
    JOIN orders_details
    ON orders.ord_id = orders_details.ode_ord_id 
    JOIN products
    ON orders_details.ode_pro_id = products.pro_id
    JOIN categories
    ON products.pro_cat_id = categories.cat_id
    
    WHERE ord_id = p_id_order;

END $$
DELIMITER ;

-- Pour afficher un résultat => commande SQL -> CALL facture(*ord_id*)

