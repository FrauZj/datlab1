-- 1.Отримати назву міста і назву регіону, де населення міста більше ніж 350,000

SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

-- 2.Отримати міста, які знаходяться у регіоні з назвою "Nord"

SELECT cities.name AS city_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';