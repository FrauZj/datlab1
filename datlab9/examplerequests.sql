--1) перевірка юзерів які беруть участь у проектах
SELECT p.name AS project_name, u.name AS user_name
FROM Project p
JOIN Project_User pu ON p.project_id = pu.project_id
JOIN User u ON pu.user_id = u.user_id;

--2) перевірка усіх задач з автором
SELECT p.name AS project_name, t.title AS task_title, u.name AS author_name, t.status
FROM Task t
JOIN Project p ON t.project_id = p.project_id
JOIN User u ON t.author_id = u.user_id;

--3) перевірка виконавців
SELECT t.title AS task_title, u.name AS executor_name
FROM Task t
JOIN Task_User tu ON t.task_id = tu.task_id
JOIN User u ON tu.user_id = u.user_id;

--4) файли з проектами
SELECT p.name AS project_name, f.file_url
FROM File f
JOIN Project p ON f.project_id = p.project_id;

--5) файли які прив'язані до задач
SELECT t.title AS task_title, f.file_url
FROM File f
JOIN Task t ON f.task_id = t.task_id;
