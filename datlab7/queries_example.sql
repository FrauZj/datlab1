--1) граб усіх артиклів з 1 категорії
SELECT title, content, published_at, author
FROM Articles
JOIN Categories ON Articles.category_id = Categories.category_id
WHERE Categories.name = 'Технології';


--2) граб усіх коментів з 1 артиклю
SELECT Comments.user_name, Comments.content, Comments.commented_at
FROM Comments
JOIN Articles ON Comments.article_id = Articles.article_id
WHERE Articles.title = 'Останнє в ШІ';

--3) граб рейтингів
SELECT Ratings.article_id, Ratings.rating, Ratings.ip_address
FROM Ratings
WHERE Ratings.rating >= 1;

--4) приклад комментаря
INSERT INTO Comments (article_id, user_name, content)
VALUES ((SELECT article_id FROM Articles WHERE title = 'Круті моменти футбол 2025'), 'Новий Юзер', 'вааааааааааааааааау!!!!!');

--5) приклад додавання відгуку
INSERT INTO Ratings (article_id, rating, ip_address)
VALUES ((SELECT article_id FROM Articles WHERE title = 'Останнє в ШІ'), 5, '192.168.1.909')
ON DUPLICATE KEY UPDATE rating = VALUES(rating);


