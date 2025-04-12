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
- **book**
- **book_author**
- **author**
- **book_language**
- **publisher**
- **customer**
- **customer_address**
- **address_status**
- **address**
- **country**
- **cust_order**
- **order_line**
- **shipping_method**
- **order_history**
- **order_status**

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
- **Tedy Ouma**
- **Otachi Bosibori**
- **Celestine Waithera**

---
Feel free to contribute, and make improvements to enhance this bookstore system!

