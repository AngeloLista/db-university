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