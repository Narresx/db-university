-- Traccia:

-- 1. Contare quanti iscritti ci sono stati ogni anno
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- 3. Calcolare la media dei voti di ogni appello d'esame
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento


-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`) AS 'n_students',YEAR(`enrolment_date`) AS 'year' 
FROM `students`  
GROUP BY YEAR(`enrolment_date`);


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`id`) AS 'n_teachers',`office_address` AS 'address' 
FROM `teachers`  
GROUP BY `office_address`;


