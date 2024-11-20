CREATE DATABASE IF NOT EXISTS metromap4;
USE metromap4;

-- Таблиця для міст, у яких знаходяться метрополітени
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблиця для ліній метро
CREATE TABLE `lines` (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    line_name VARCHAR(100) NOT NULL,
    color VARCHAR(20),
    city_id INT NOT NULL
);

-- Таблиця для станцій метро
CREATE TABLE stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    line_id INT NOT NULL,
    position_on_line INT NOT NULL,
    FOREIGN KEY (line_id) REFERENCES `lines` (line_id) ON DELETE CASCADE
);

-- Таблиця для зв’язків між станціями (включаючи переходи)
CREATE TABLE connections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    station_from INT NOT NULL,
    line_from INT NOT NULL,
    station_to INT NOT NULL,
    line_to INT NOT NULL,
    connection_type ENUM('direct', 'transfer') NOT NULL,
    FOREIGN KEY (station_from) REFERENCES stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (line_from) REFERENCES `lines`(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_to) REFERENCES stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (line_to) REFERENCES `lines`(line_id) ON DELETE CASCADE,
    UNIQUE (station_from, line_from, station_to, line_to)
);


-- Вставка демонстраційних даних

-- Місто
INSERT INTO cities (city_name) VALUES ('Kharkiv');

-- Лінії метро
INSERT INTO `lines` (line_name, color, city_id) VALUES
('Холодногірсько-Заводська', 'Red', 1),
('Салтівська', 'Blue', 1),
('Олексіївська', 'Green', 1);

-- Станції метро
INSERT INTO stations (station_name, line_id, position_on_line) VALUES 
('Холодна Гора', 1, 1),
('Південний Вокзал', 1, 2),
('Центральний Ринок', 1, 3),
('Майдан Конституції', 1, 4),
('Проспект Гагаріна', 1, 5),
('Спортивна', 1, 6),
('Завод імені Малишева', 1, 7),
('Турбоатом', 1, 8),
('Палац Спорту', 1, 9),
('Армійська', 1, 10),
('Ім. О.С. Масельського', 1, 11),
('Тракторний Завод', 1, 12),
('Індустріальна', 1, 13),

('Героїв Праці', 2, 1),
('Студентська', 2, 2),
('Академіка Павлова', 2, 3),
('Академіка Барабашова', 2, 4),
('Київська', 2, 5),
('Пушкінська', 2, 6),
('Університет', 2, 7),
('Історичний музей', 2, 8),

('Перемога', 3, 1),
('Олексіївська', 3, 2),
('23 Серпня', 3, 3),
('Ботанічний сад', 3, 4),
('Наукова', 3, 5),
('Держпром', 3, 6),
('Архітектора Бекетова', 3, 7),
('Захисників України', 3, 8),
('Метробудівників', 3, 9);

-- Зв’язки між станціями 
INSERT INTO connections (station_from, line_from, station_to, line_to, connection_type) VALUES 
(1, 1, 2, 1, 'direct'),
(2, 1, 3, 1, 'direct'),
(3, 1, 4, 1, 'direct'),
(4, 1, 5, 1, 'direct'),
(5, 1, 6, 1, 'direct'),
(6, 1, 7, 1, 'direct'),
(7, 1, 8, 1, 'direct'),
(8, 1, 9, 1, 'direct'),
(9, 1, 10, 1, 'direct'),
(10, 1, 11, 1, 'direct'),
(11, 1, 12, 1, 'direct'),
(12, 1, 13, 1, 'direct'),
 
(14, 2, 15, 2, 'direct'),
(15, 2, 16, 2, 'direct'),
(16, 2, 17, 2, 'direct'),
(17, 2, 18, 2, 'direct'),
(18, 2, 19, 2, 'direct'),
(19, 2, 20, 2, 'direct'),
(20, 2, 21, 2, 'direct'),

(22, 3, 23, 3, 'direct'),
(23, 3, 24, 3, 'direct'),
(24, 3, 25, 3, 'direct'),
(25, 3, 26, 3, 'direct'),
(26, 3, 27, 3, 'direct'),
(27, 3, 28, 3, 'direct'),
(28, 3, 29, 3, 'direct'),
(29, 3, 30, 3, 'direct'),

(4, 1, 21, 2, 'transfer'),
(20, 2, 26, 3, 'transfer'),
(30, 3, 6, 1, 'transfer');
