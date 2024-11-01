-- 1. Seleziona tutti gli utenti e calcolane l'età
SELECT username, 
       YEAR(CURDATE()) - YEAR(birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birthdate, '%m%d')) AS age
FROM users;