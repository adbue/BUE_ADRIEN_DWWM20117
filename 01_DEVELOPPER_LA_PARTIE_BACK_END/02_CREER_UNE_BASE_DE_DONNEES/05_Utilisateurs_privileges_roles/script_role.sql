--
-- 1 - Création des RÔLES + Privilèges
--

CREATE ROLE 'r_gescom_admin'@'localhost', 'r_gescom_select'@'localhost', 'r_gescom_affsuplliers'@'localhost';

 GRANT ALL PRIVILEGES ON gescom.* TO 'r_gescom_admin'@'localhost';
 GRANT SELECT ON gescom.* TO 'r_gescom_select'@'localhost';
 GRANT SELECT ON gescom.suppliers TO 'r_gescom_affsuplliers'@'localhost';

--
-- 2 - Creation des utilisateurs
--

CREATE USER IF NOT EXISTS 'util1'@'localhost' IDENTIFIED BY '0000';
CREATE USER IF NOT EXISTS 'util2'@'localhost' IDENTIFIED BY '0000';
CREATE USER IF NOT EXISTS 'util3'@'localhost' IDENTIFIED BY '0000';

--
-- 3 - Attribution des RÔLES
--

GRANT 'r_gescom_admin'@'localhost' TO 'util1'@'localhost'; 
GRANT 'r_gescom_select'@'localhost' TO 'util2'@'localhost';
GRANT 'r_gescom_affsuplliers'@'localhost' TO 'util3'@'localhost';


--
-- 4 -Activation des ROLES 
--

SET DEFAULT ROLE 'r_gescom_admin' TO 'util1'@'localhost';
SET DEFAULT ROLE 'r_gescom_select' TO 'util2'@'localhost';
SET DEFAULT ROLE 'r_gescom_affsuplliers' TO 'util3'@'localhost';