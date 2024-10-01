-- 1. Отримати список міст України, які закінчуються на 'ськ'
SELECT name
FROM cities
WHERE name LIKE '%ськ';

-- 2. Отримати список міст України, у назві яких є 'донец'
SELECT name
FROM cities
WHERE name LIKE '%донец%';

-- 3. Отримати список міст з населенням більше ніж 100 000 з назвою у вигляді НАЗВА_МІСТА (РЕГІОН). Результат відсортувати за алфавітом
SELECT CONCAT(name, ' (', region, ')') AS city_info
FROM cities
WHERE population > 100000
ORDER BY name ASC;

-- 4. Отримати перші 10 міст України (за населенням) та додати до запиту обчислюване поле у вигляді відсотка від загального населення країни (40 000 000)
SELECT name, population, ROUND((population/40000000)*100, 2) AS percentage_of_total_population
FROM cities
ORDER BY population DESC
LIMIT 10;

-- 5. Отримати список міст України, у яких населення більше чи дорівнює 0.1% від загального населення України (40 000 000). Список має бути у форматі НАЗВА_МІСТА - ПРОЦЕНТ_НАСЕЛЕННЯ %. Результат відсортувати за процентом населення.
SELECT CONCAT(name,' - ', ROUND((population/40000000)*100,2),'%') AS city_population_percentage
FROM cities
WHERE population >= 40000
ORDER BY (population / 40000000.0) * 100 ASC;