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

SELECT `courses`.`name`,`degrees`.`id` AS 'ID Degree',`teachers`.`name`AS 'Teacher Name',`teachers`.`surname`AS 'Teacher Surname'
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- Soluzione con GROUP BY
SELECT `teachers`.`name`, `teachers`.`surname`, `departments`.`name` AS 'department_name'
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `degree_id`
JOIN `departments` ON `departments`.`id` = `department_id`
WHERE `departments`.`name`= 'Dipartimento di Matematica'
GROUP BY `teachers`.`name`, `teachers`.`surname`,`departments`.`name`;

-- Soluzione con DISTINCT

SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `departments`.`name` AS 'department_name'
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `degree_id`
JOIN `departments` ON `departments`.`id` = `department_id`
WHERE `departments`.`name`= 'Dipartimento di Matematica';


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT `students`.`name`, `students`.`surname`, `courses`.`name`, 
COUNT(`exam_student`.`vote`) AS 'numero_tentativi', 
MAX(`exam_student`.`vote`) AS 'voto_massimo'
FROM `students`
JOIN `exam_student`
ON `exam_student`.`id` = `students`.`id`
JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `voto_massimo` >= 18;