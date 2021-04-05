--
-- 1 - Création des utilisateurs
--

CREATE USER 'util1'@'loalhost' IDENTIFIED BY '0000';
CREATE USER 'util2'@'loalhost' IDENTIFIED BY '0001';
CREATE USER 'util3'@'loalhost' IDENTIFIED BY '0002';

--
-- 2 - PRIVILEGES
--

GRANT ALL PRIVILEGES ON gescom.*
TO 'util1'@'loalhost';

GRANT SELECT ON gescom.*
TO 'util2'@'loalhost';

GRANT SELECT ON gescom.suppliers
TO 'util3'@'loalhost';