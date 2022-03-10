------ JOIN ------


-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM `students`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia'

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
JOIN `departments`
ON `department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di neuroscienze'

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)`
SELECT *
FROM `course_teacher`
JOIN `courses`
ON `course_id` = `courses`.`id`
WHERE `teacher_id` = 44

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nom
SELECT `students`.`surname` AS 'Cognome',`students`.`name` AS 'Nome', `degrees`.`name` AS 'Corso di Laurea', `departments`.`name` AS 'Dipartimento'
FROM `students`
JOIN `degrees`
ON `degree_id` = `degrees`.`id`
JOIN `departments`
ON `department_id` = `departments`.`id`
ORDER BY `students`.`surname` ASC, `students`.`name` ASC

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'Corso di Laurea', `courses`.`name` AS 'Corso', `teachers`.`name` AS 'Nome Insegnante', `teachers`.`surname` AS 'Cognome Insegnante'
FROM `degrees`
JOIN `courses`
ON `degree_id` = `degrees`.`id`
JOIN `course_teacher`
ON `course_id` = `courses`.`id`
JOIN `teachers`
ON `teacher_id` = `teachers`.`id`
ORDER BY `courses`.`name` ASC

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`, `teachers`.`phone`, `teachers`.`email`, `teachers`.`office_address`, `teachers`.`office_number`, `departments`.`name` AS 'Nome Dipartimento'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'