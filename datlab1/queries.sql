
-- Написати запит на отримання другої десятки міст України за кількістю населення
SELECT * FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;

-- Отримати список міст відсортованим за назвою в зворотньому порядку (від Я до А). Обмежити запит 30 запасами.
SELECT * FROM cities
ORDER BY name DESC
LIMIT 30;

-- Отримати список міст відсортованих за регіоном та кількістю населення (спочатку найнаселеніші міста регіону).
SELECT * FROM cities
ORDER BY region, population DESC;

-- Отримати список регіонів вказаних в таблиці
SELECT DISTINCT region FROM cities;

-- Отримати список міст відсортованих за регіоном у зворотньому порядку та за назвою у межах регіону також у зворотньому порядку
SELECT * FROM cities
ORDER BY region DESC, name DESC;
