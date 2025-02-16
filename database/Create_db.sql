-- 1. Создаём базу данных
CREATE DATABASE client_centricity;

-- Подключаемся к базе
\c client_centricity;

-- 2. Таблица уровней внедрения (федеральный, субъекты, РОИВ)
CREATE TABLE levels (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- 3. Таблица направлений работ (например, "Нормативное обеспечение")
CREATE TABLE directions (
    id SERIAL PRIMARY KEY,
    level_id INT REFERENCES levels(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT
);

-- 4. Таблица мероприятий (конкретные работы внутри направления)
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    direction_id INT REFERENCES directions(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT
);

-- 5. Таблица документов и методик
CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    task_id INT REFERENCES tasks(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    link TEXT NOT NULL
);
