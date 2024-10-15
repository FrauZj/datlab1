-- 1. Кількість населення в кожному регіоні
SELECT r.name AS region_name, SUM(c.population) AS total_population

FROM cities c

JOIN regions r ON c.region = r.uuid

GROUP BY r.name;

-- 2. Регіони та кількість населення, де кількість міст ≥ 10
SELECT r.name AS region_name, COUNT(c.id) AS city_count, SUM(c.population) AS total_population

FROM cities c

JOIN regions r ON c.region = r.uuid

GROUP BY r.name

HAVING COUNT(c.id) >= 10;

-- 3. Третя п'ятірка міст за населенням в регіонах з кількістю областей ≥ 5
SELECT c.name AS city_name, c.population

FROM cities c

JOIN regions r ON c.region = r.uuid

WHERE r.area_quantity >= 5

ORDER BY c.population DESC

LIMIT 10 OFFSET 40;
-- 4. Назви регіонів та населення, враховуючи міста з населенням > 300,000
SELECT r.name AS region_name, SUM(c.population) AS total_population

FROM cities c

JOIN regions r ON c.region = r.uuid

WHERE c.population > 300000

GROUP BY r.name;

-- 5. Назва та населення міст в регіонах з кількістю областей ≤ 5 та населенням не в діапазоні 150,000 - 500,000
SELECT c.name AS city_name, c.population

FROM cities c

JOIN regions r ON c.region = r.uuid

WHERE r.area_quantity <= 5 AND (c.population < 150000 OR c.population > 500000);
