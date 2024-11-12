CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
--зв'язка юзерів з проектами
CREATE TABLE Project_User (
    project_id INT REFERENCES Project(project_id) ON DELETE CASCADE,
    user_id INT REFERENCES User(user_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, user_id)
);
-- таски
CREATE TABLE Task (
    task_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES Project(project_id) ON DELETE CASCADE,
    author_id INT REFERENCES User(user_id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- виконавці
CREATE TABLE Task_User (
    task_id INT REFERENCES Task(task_id) ON DELETE CASCADE,
    user_id INT REFERENCES User(user_id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, user_id)
);

-- для файлів
CREATE TABLE File (
    file_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES Project(project_id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(task_id) ON DELETE CASCADE,
    file_url VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (project_id IS NOT NULL OR task_id IS NOT NULL)
);
