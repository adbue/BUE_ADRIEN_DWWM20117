--
-- EXERCICE 03 - CA_Supplier
--

DELIMITER $$

DROP PROCEDURE IF EXISTS CA_Supplier $$
CREATE PROCEDURE CA_Supplier ( IN p_sup_nom VARCHAR(40),
                               IN p_date INT)

--
-- CA = quantité x (prix unitaire avec remise)  
-- prix unitaire avec remise = prix unitaire - (prix unitaire x remise /100)
--

BEGIN
	SELECT suppliers.sup_name AS 'Nom du fournisseur', 
        ROUND(SUM(orders_details.ode_quantity*(orders_details.ode_unit_price - (orders_details.ode_unit_price * orders_details.ode_discount / 100))), 2) AS "Chiffre d'affaire"
    FROM suppliers

    JOIN products
    ON suppliers.sup_id = products.pro_sup_id

    JOIN orders_details
    ON products.pro_id = orders_details.ode_pro_id

    JOIN orders
    ON orders_details.ode_ord_id = orders.ord_id
    
    WHERE suppliers.sup_name = p_sup_nom
        AND orders.ord_payment_date LIKE CONCAT(p_date,"%");
END $$

DELIMITER ;


-- appel

--
-- CALL CA_Supplier('nom du fournisseur', annee)
--


