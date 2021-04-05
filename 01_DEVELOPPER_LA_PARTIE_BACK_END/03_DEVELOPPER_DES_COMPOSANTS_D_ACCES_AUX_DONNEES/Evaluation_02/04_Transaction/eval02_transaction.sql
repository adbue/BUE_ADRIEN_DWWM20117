--
-- Transactions
--
-- Amity HANAH, Manageuse au sein du magasin d'Arras, vient de prendre sa retraite. Il a été décidé,
-- après de nombreuses tractations, de confier son poste au pépiniériste le plus ancien en poste dans ce magasin.
-- Ce dernier voit alors son salaire augmenter de 5% et ses anciens collègues pépiniéristes passent sous sa 
-- direction.
--
-- Ecrire la transaction permettant d'acter tous ces changements en base des données.
--
-- La base de données ne contient actuellement que des employés en postes. Il a été choisi de garder 
-- en base une liste des anciens collaborateurs de l'entreprise parti en retraite. Il va donc vous falloir 
-- ajouter une ligne dans la table posts pour référencer les employés à la retraite.
--
-- Décrire les opérations qui seront à réaliser sur la table posts.
--
-- Ecrire les requêtes correspondant à ces opéarations.
--
-- Ecrire la transaction
--

--
-- /// AVANT DE COMMENCER \\\
--
-- Trouver le plus pépiniériste le plus ancien en poste chez JardiALL (ARRAS)
--
/* 
SELECT emp_id, emp_lastname, emp_firstname, emp_enter_date, emp_pos_id, pos_libelle
FROM employees
INNER JOIN posts
ON employees.emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste'
AND emp_sho_id = 2 
ORDER BY 4;
 */
--
-- RÉSULTAT = 
--
-- 10-HILLARY Dorian 2002-03-10
--
-- Subordonnés = 57-MALIK Keiko, 20-YETTA Ahmed, 103-PALMER Mia et 44-ISAAC Christine.



USE gescom_afpa;

START TRANSACTION;


-- Il a été choisi de garder en base une liste des anciens collaborateurs de l'entreprise parti en retraite.
-- Il va donc vous falloir ajouter une ligne dans la table posts pour référencer les employés à la retraite.

INSERT INTO posts (pos_libelle) VALUES('Ancien Collaborateur(/trice)');


-- Changement de poste pour HANNAH Amity


UPDATE employees SET emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle = 'Ancien Collaborateur(/trice)') WHERE emp_lastname = 'HANNAH';


-- Il a été décidé, après de nombreuses tractations, de confier son poste au pépiniériste le plus ancien en poste dans ce magasin. 
-- Ce dernier voit alors son salaire augmenter de 5% 


SELECT @minDate := MIN(emp_enter_date) FROM employees
WHERE emp_sho_id = 2 AND emp_pos_id = 14;

SELECT @id :=emp_id FROM employees 
WHERE emp_enter_date = @minDate AND emp_sho_id = 2 AND emp_pos_id = 14;

UPDATE employees 
SET emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle = 'Manager(/geuse)'),
    emp_salary = emp_salary * 1.05
WHERE emp_id = @id;


-- ses anciens collègues pépiniéristes passent sous sa direction. 


UPDATE employees
SET emp_superior_id = @id
WHERE emp_sho_id = 2 AND emp_pos_id= 14;


COMMIT;
