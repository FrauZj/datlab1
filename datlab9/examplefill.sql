INSERT INTO Project (name, description) VALUES 
    ('Проект1', 'опис1'),
    ('Проект2', 'опис2');

INSERT INTO User (name, email) VALUES 
    ('Михайло', 'miha@example.com'),
    ('Нікита', 'nik@example.com'),
    ('Вова', 'vova@example.com');

-- користувачі до проектів
INSERT INTO Project_User (project_id, user_id) VALUES 
    (1, 1), 
    (1, 2), 
    (2, 2), 
    (2, 3); 

INSERT INTO Task (project_id, author_id, title, description, due_date, status) VALUES 
    (1, 1, '1 таск для 1 проекту', 'опис', '2024-12-01', 'Очікує розробки'),
    (1, 2, '2 таск для 1 проекту', 'опис2', '2024-12-15', 'У процессі'),
    (2, 2, '1 таск для 2 проекту', 'опис але 2', '2024-11-20', 'Завершено');

-- виконавці до задач
INSERT INTO Task_User (task_id, user_id) VALUES 
    (1, 1), -- михайло на 1
    (1, 2), -- нікита на 1
    (2, 2), -- нікита робить таск 2
    (3, 3); -- вова робить 1 для 2 проекту

-- файли які поєднані з задачами
INSERT INTO File (project_id, file_url) VALUES 
    (1, 'https://example.com/example.pdf'); 

INSERT INTO File (task_id, file_url) VALUES 
    (1, 'https://example.com/task1_ex.pdf'), 
    (2, 'https://example.com/task2_ex.pdf'); 
