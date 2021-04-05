--
-- EXERCICE 02 - Lst_Ruh_Orders
--

DELIMITER |

CREATE PROCEDURE Lst_Rush_Orders (IN p_rush VARCHAR(30))

BEGIN
	SELECT *
    FROM orders
    WHERE ord_status = p_rush;
END |

DELIMITER ;


-- appel

CALL Lst_Rush_Orders('commande urgente')


