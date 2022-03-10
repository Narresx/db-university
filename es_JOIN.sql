-- Traccia:

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami


-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT * 
FROM `students`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT *
FROM `courses`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
JOIN `departments`
ON `departments`.`id` = `department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT *
FROM `courses`
JOIN `course_teacher`
ON `courses`. `id` = `course_id`
JOIN `teachers`
ON `teachers`.`id`= `teacher_id`
WHERE `teachers`.`id`= 44 ;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT *
FROM `students`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
JOIN `departments`
ON `departments`.`id` = `department_id`
JOIN `courses`
ON `courses`.`id` = `departments`.`id`
ORDER BY `students`.`surname`ASC;


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT * 
FROM `degrees`
JOIN `courses`
ON `courses`.`id` = `degree_id`
JOIN `course_teacher`
ON `courses`. `id` = `course_id`
JOIN `teachers`
ON `teachers`.`id` = `teacher_id`
