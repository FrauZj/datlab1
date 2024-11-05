-- приклад категорій
INSERT INTO Categories (name) VALUES ('Технології');
INSERT INTO Categories (name) VALUES ('Спорт');

-- приклад артиклів 
INSERT INTO Articles (category_id, title, content, author) VALUES
(1, 'Останнє в ШІ', 'Ші дуже круте...', 'Аліса'),
(2, 'Круті моменти футбол 2025', 'Найкращі моменти футболу...', 'ААА');

-- приклад коментів
INSERT INTO Comments (article_id, user_name, content) VALUES
(1, 'Мишаня', 'вау!'),
(2, 'Ваня', 'непогано');

-- приклад рейтингів
INSERT INTO Ratings (article_id, rating, ip_address) VALUES
(1, 5, '192.168.1.1'),
(2, 4, '192.168.1.2');


