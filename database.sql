CREATE DATABASE library_db;
USE library_db;


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    quantity INT NOT NULL
);
CREATE TABLE issue_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    username VARCHAR(50),
    book_id INT,
    book_name VARCHAR(100),
    request_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Requested','Approved','Rejected') DEFAULT 'Requested',

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
CREATE TABLE issued_books (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT,
    user_id INT,
    username VARCHAR(50),
    book_id INT,
    book_name VARCHAR(100),
    issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_status ENUM('Issued','Returned') DEFAULT 'Issued',

    FOREIGN KEY (request_id) REFERENCES issue_requests(request_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE login_activity (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    username VARCHAR(50),
    login_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE returned_books (
  return_id INT AUTO_INCREMENT PRIMARY KEY,
  issue_id INT,
  user_id INT,
  book_id INT,
  issue_date DATETIME,
  return_date DATETIME
);

SELECT * FROM users;
SELECT * FROM issued_books;
SELECT * FROM issue_requests;
SELECT * FROM returned_books;
SELECT * FROM books;
SELECT * FROM login_activity;
