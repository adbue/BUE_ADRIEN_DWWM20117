--
-- EXERCICE 02 - Lst_Suppliers
--

DELIMITER $$

CREATE PROCEDURE Lst_Suppliers ()

BEGIN
	SELECT suppliers.sup_name AS 'Nom du fournisseur', orders_details.* 
    FROM suppliers
    JOIN products
    ON suppliers.sup_id = products.pro_sup_id
    JOIN orders_details
    ON products.pro_id = orders_details.ode_pro_id
    ORDER BY 1;
END $$

DELIMITER ;


-- appel

--
-- CALL Lst_Suppliers()
--


