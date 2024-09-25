-- Отримати список міст-мільйонерів України
SELECT name, population 
FROM cities
WHERE population >= 1000000;

-- Отримати список міст з регіону E та W відсортований за кількістю населення
SELECT name, population, region
FROM cities
WHERE region IN ('E', 'W')
ORDER BY population DESC;

-- Отримати список міст з населенням більше ніж 50000 з регіонів S, C та N (використовуючи оператор IN)
SELECT name, population, region
FROM cities
WHERE population > 50000
AND region IN ('S', 'C', 'N');

-- Отримати перші 20 міст (за назвою) у яких населення більше ніж 150000 але не більше ніж 350000 та які знаходяться в регіонах E,W,N
SELECT name, population, region
FROM cities
WHERE population > 150000
AND population <= 350000
AND region IN ('E', 'W', 'N')
ORDER BY name
LIMIT 20;

-- Отримати другу десятку міст за кількістю населення які не входять до регіонів E та W
SELECT name, population, region
FROM cities
WHERE region NOT IN ('E', 'W')
ORDER BY population DESC
LIMIT 10 OFFSET 10;