# Bookstore Database Project

## 📚 Overview
This project simulates a real-world bookstore system using MySQL. It includes the complete design and development of a relational database that supports operations such as storing book details, managing authors, handling customer orders, and tracking order history and shipping.

## 🛠️ Tools and Technologies
- **MySQL** – For building and managing the relational database
- **Draw.io** – For designing and visualizing the ERD (Entity Relationship Diagram)

## 🎯 Project Objective
To create a robust relational database for managing bookstore operations, including:
- Book and author details
- Publishers and languages
- Customers and their addresses
- Orders, shipping, and order statuses
- User roles and security settings

## ✅ Prerequisites
- Basic knowledge of SQL and MySQL
- Experience creating tables and setting up relationships
- Understanding of primary and foreign keys
- Familiarity with user management and permissions in MySQL

## 📦 Tables Included
- **book**: A list of all books available in the store.
- **book_author**: A table to manage the many-to-many relationship between books and authors.
- **author**: A list of all authors.
- **book_language**: A list of the possible languages of books.
- **publisher**: A list of publishers for books.
- **customer**: A list of the bookstore's customers.
- **customer_address**: A list of addresses for customers. Each customer can have multiple addresses.
- **publisher_address**: A list of addresses for publishers. Each publisher can have multiple addresses.
- **address_status**: A list of statuses for an address (e.g., current, old).
- **address**: A list of all addresses in the system.
- **country**: A list of countries where the addresses are located.
- **cust_order**: A list of orders placed by customers.
- **order_line**: A list of books that are part of each order.
- **shipping_method**: A list of possible shipping methods for an order.
- **order_history**: A record of the history of an order (e.g., ordered, cancelled, delivered).
- **order_status**: A list of possible statuses for an order (e.g., pending, shipped, delivered). 

## 🧩 Folder Structure
```
bookstore-database-project/
├── README.md
├── schema/
│   └── create_tables.sql
├── queries/
│   └── test_queries.sql
├── users/
│   └── user_roles.sql
├── docs/
│   └── ERD.png
```

## 🚀 How to Use
1. Clone the repo:
   ```bash
   git clone https://github.com/Oumatedy/bookstore-database-project.git
   ```
2. Open MySQL and run the `schema/create_tables.sql` file to create the database and tables.
3. Add sample data and run queries from `queries/test_queries.sql`.
4. View the schema design in `docs/ERD.png` or import the `.drawio` file into Draw.io.

## 📊 Expected Outcomes
- A normalized relational database design
- Ability to execute SQL queries for operations and insights
- Role-based access for managing security

## 👥 Contributors
- **Tedy Ouma** - [GitHub](https://github.com/Oumatedy)
- **Otachi Bosibori** - [GitHub](https://github.com/BunnyeNyash)
- **Celestine Waithera** - [GitHub](https://github.com/Celestinewanjiru)

---
Feel free to contribute, and make improvements to enhance this bookstore system!

