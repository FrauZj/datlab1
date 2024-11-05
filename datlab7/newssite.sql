-- таблиця Categories 
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE 
);

-- таблиця Articles
CREATE TABLE Articles (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author VARCHAR(100), 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- таблиця Comments 
CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT,
    user_name VARCHAR(100) NOT NULL, 
    content TEXT NOT NULL, 
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (article_id) REFERENCES Articles(article_id) ON DELETE CASCADE
);

-- Create Ratings table (Один рейтинг на один айпі ipv4)
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5), 
    ip_address VARCHAR(45) NOT NULL,
    rated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (article_id) REFERENCES Articles(article_id) ON DELETE CASCADE,
    UNIQUE (article_id, ip_address) 
);

