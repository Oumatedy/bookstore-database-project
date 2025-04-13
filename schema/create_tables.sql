CREATE DATABASE BookStoreDB;
USE BookStoreDB;


--
-- tables
-- 1. book: A list of all books available in the store.
-- 2. book_author: A table to manage the many-to-many relationship between books and authors.
-- 3. author: A list of all authors.
-- 4. book_language: A list of the possible languages of books.
-- 5. publisher: A list of publishers for books.
-- 6. Customer: A list of the bookstore's customers.
-- 7. customer_address: A list of addresses for customers. Each customer can have multiple addresses.
-- 8. address_status: A list of statuses for an address (e.g., current, old).
-- 9. address: A list of all addresses in the system.
-- 10. country: A list of countries where the addresses are located.
-- 11. cust_order: A list of orders placed by customers.
-- 12. order_line: A list of books that are part of each order.
-- 13. shipping_method: A list of possible shipping methods for an order.
-- 14. order_history: A record of the history of an order (e.g., ordered, cancelled, delivered).
-- 15. order_status: A list of possible statuses for an order (e.g., pending, shipped, delivered). 
-- 


-- 1. country (referenced by address)
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL
);


-- 2. address (references country)
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);


-- 3. address_status (used by customer_address & publisher_address)
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    address_status_name VARCHAR(50) NOT NULL
);


-- 4. publisher (references address)
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(100),
    phone VARCHAR(20),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);


-- 5. publisher_address (references publisher, address, address_status)
CREATE TABLE publisher_address (
    publisher_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (publisher_id, address_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);


-- 6. book_language (referenced by book)
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(255) NOT NULL
);


-- 7. author (referenced by book_author)
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    nationality VARCHAR(50),
    author_email VARCHAR(100) NOT NULL
);


-- 8. book (references publisher, book_language)
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    ISBN VARCHAR(255) UNIQUE,
    publisher_id INT,
    published_year YEAR,
    language_id INT NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);


-- 9. book_author (references book, author)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);


-- 10. customer (references address)
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);


-- 11. customer_address (references customer, address, address_status)
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);


-- 12. shipping_method (referenced by cust_order)
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(8,2) NOT NULL
);


-- 13. order_status (used in cust_order and order_history)
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    order_status_name VARCHAR(50) NOT NULL
);


-- 14. cust_order (references customer, shipping_method, order_status)
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    shipping_method_id INT,
    order_status_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);


-- 15. order_line (references cust_order, book)
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price_per_book DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(14, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);


-- 16. order_history (references cust_order, order_status)
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    order_status_id INT,
    changed_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);


-- Show the tables (optional)
SHOW TABLES;

--
