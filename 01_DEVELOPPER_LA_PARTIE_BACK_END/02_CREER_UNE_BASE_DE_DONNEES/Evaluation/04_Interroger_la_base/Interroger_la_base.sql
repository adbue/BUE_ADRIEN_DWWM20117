-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus.


SELECT CONCAT(emp_lastname, ' ', emp_firstname), emp_children
FROM employees
WHERE emp_children > 0
ORDER BY emp_children DESC;


-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.


SELECT cus_lastname, cus_firstname, cus_countries_id 
FROM customers 
WHERE cus_countries_id != 'FR';


-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.


SELECT cus_city, cus_countries_id, cou_name
FROM customers 
INNER JOIN countries
ON customers.cus_countries_id = countries.cou_id
ORDER BY 1;


-- Q4. Afficher le nom des clients dont les fiches ont été modifiées


SELECT cus_lastname, cus_update_date
FROM customers
WHERE cus_update_date IS NOT NULL;


-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. 
-- Pouvez-vous l'aider ?


SELECT * 
FROM customers
WHERE cus_city LIKE '%divos%';


-- Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit.


SELECT pro_id, pro_name, pro_price
FROM products
WHERE pro_price = 
	(SELECT MIN(pro_price) FROM products);


-- Q7. Lister les produits qui n'ont jamais été vendus


SELECT pro_id, pro_ref ,pro_name
FROM products 
WHERE pro_id NOT IN 
    (SELECT ode_pro_id FROM orders_details);


-- Q8. Afficher les produits commandés par Madame Pikatchien.


SELECT pro_id, pro_ref, pro_name, cus_id, ord_id, ode_id
FROM products

INNER JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
INNER JOIN customers
ON orders.ord_cus_id = customers.cus_id

WHERE cus_id =
	(SELECT cus_id FROM customers WHERE cus_lastname = 'Pikatchien');


-- Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.


SELECT cat_id, cat_name, pro_name
FROM categories
INNER JOIN products
ON categories.cat_id = products.pro_cat_id
ORDER BY 2;


-- Q10. Afficher l'organigramme hiérarchique (nom et prénom et poste des employés) du magasin de Compiègne, classer par ordre alphabétique. 
-- Afficher le nom et prénom des employés, éventuellement le poste (si vous y parvenez).


SELECT CONCAT(e1.emp_lastname, ' ',e1.emp_firstname) AS 'Employé',
CONCAT(e2.emp_lastname, ' ',e2.emp_firstname) AS 'Supérieur'
FROM employees e1
INNER JOIN employees e2
ON e1.emp_superior_id = e2.emp_id
WHERE e1.emp_sho_id = 3
ORDER BY e1.emp_lastname;


-- FONCTIONS D'AGRÉGATION


-- Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, 
-- le numéro de commande et de ligne de commande.


SELECT ode_discount, pro_id, pro_name, ord_id, ode_id
FROM products
JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
WHERE ode_discount = 
    (SELECT MAX(ode_discount) FROM orders_details);


-- Q13. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'


SELECT COUNT(*)
FROM customers
WHERE cus_countries_id = 'CA';


-- Q16. Afficher le détail des commandes de 2020.


SELECT orders_details.*, ord_order_date
FROM orders_details
JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
WHERE ord_order_date LIKE ('2020%');


--  Q17. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.


SELECT DISTINCT suppliers.*
FROM suppliers

INNER JOIN products
ON suppliers.sup_id = products.pro_sup_id
INNER JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id

WHERE pro_id IN 
    (SELECT ode_pro_id FROM orders_details);


-- Q18. Quel est le chiffre d'affaires de 2020 ?


SELECT ROUND(SUM(ode_quantity * (ode_unit_price-(ode_unit_price *(ode_discount /100)))),2) AS "Chiffre d'affaires 2020"
FROM orders_details, orders
WHERE ode_ord_id = ord_id
AND ord_order_date LIKE ('2020%');


-- Q19. Quel est le panier moyen ?





-- Q20. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client).


SELECT ord_id, cus_lastname, ord_order_date,
ROUND(ode_quantity * (ode_unit_price-(ode_unit_price *(ode_discount /100))),2) AS 'Total'
FROM customers

JOIN orders
ON orders.ord_cus_id = customers.cus_id
JOIN orders_details
ON orders.ord_id = orders_details.ode_ord_id

GROUP BY ord_id, cus_lastname, ord_order_date

ORDER BY 4 DESC;


-- Les besoins de mise à jour


-- Q22. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%.


UPDATE `products` SET pro_name = 'Camper', pro_price = (SELECT (pro_price * 0.9))
WHERE pro_ref = 'barb004';


-- Q23. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols.


UPDATE `products` SET pro_price= (SELECT (pro_price * 1.011))
WHERE pro_cat_id = (SELECT cat_id FROM categories WHERE cat_name = 'parasols');


-- Q24. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Vous devez utilisez une sous-requête sans indiquer de valeurs de clés.


DELETE FROM `products` WHERE pro_cat_id = 
    (SELECT cat_id FROM categories WHERE cat_name = 'Tondeuses électriques')
        AND pro_id NOT IN (SELECT ode_pro_id FROM orders_details);