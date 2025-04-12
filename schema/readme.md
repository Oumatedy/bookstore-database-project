# Bookstore Schema Documentation

This document provides a detailed breakdown of the tables used in the Bookstore database schema. Each section includes an explanation of the entity and a table of the fields stored in the database.

---

<strong>📚 book</strong>

A list of all books available in the store.

| Column Name    | Data Type      | Description                                     |
|----------------|----------------|-------------------------------------------------|
| book_id        | INT            | Unique ID for the book (Primary Key)           |
| book_name      | VARCHAR(255)   | The title of the book                          |
| ISBN           | VARCHAR(255)   | The ISBN of the book                           |
| publisher_id   | INT            | Links to the publisher table (Foreign Key)     |
| published_year | YEAR           | The year the book was published                |
| language_id    | INT            | Links to the book_language table (Foreign Key) |
| price          | DECIMAL(8,2)   | The price of the book                          |
| stock_quantity | INT            | Quantity of the book that is in stock          |



---

<strong>🧾 book_author (Many-to-Many)</strong>

Manages the relationship between books and authors.

| Column Name | Data Type | Description                                 |
|-------------|-----------|---------------------------------------------|
| book_id     | INT       | Links to the book table (Foreign Key)       |
| author_id   | INT       | Links to the author table (Foreign Key)     |



---


<strong>✍️ author</strong>

A list of all authors.

| Column Name    | Data Type     | Description                              |
|----------------|---------------|------------------------------------------|
| author_id      | INT           | Unique ID for the author (Primary Key)   |
| author_name    | VARCHAR(255)  | The name of the author                   |
| nationality    | VARCHAR(50)   | Nationality of the author                |
| author_email   | VARCHAR(100)  | The email of the author                  |



---


<strong>🌐 book_language</strong>

Languages that books can be published in.

| Column Name    | Data Type     | Description                              |
|----------------|---------------|------------------------------------------|
| language_id    | INT           | Unique ID for the language (Primary Key) |
| language_name  | VARCHAR(255)  | The name of the language                 |



---


<strong>🏢 publisher</strong>

A list of book publishers.

| Column Name    | Data Type     | Description                               |
|----------------|---------------|-------------------------------------------|
| publisher_id   | INT           | Unique ID for the publisher (Primary Key) |
| publisher_name | VARCHAR(255)  | The name of the publisher                 |
| contact_email  | VARCHAR(100)  | Email of the publisher                    |
| phone          | VARCHAR(20)   | Phone number of the publisher             |
| address_id     | INT           | Links to the address table (Foreign Key)  |



---


<strong>🏢 publisher_address</strong>

Maps publishers to their addresses.

| Column Name      | Data Type | Description                                      |
|------------------|-----------|--------------------------------------------------|
| publisher_id      | INT       | Links to the publisher table (Foreign Key)       |
| address_id        | INT       | Links to the address table (Foreign Key)         |
| address_status_id | INT       | Links to the address_status table (Foreign Key)  |



---


<strong>👤 customer</strong>

Customers of the bookstore.

| Column Name    | Data Type     | Description                                |
|----------------|---------------|--------------------------------------------|
| customer_id    | INT           | Unique ID for the customer (Primary Key)   |
| customer_name  | VARCHAR(255)  | The name of the customer                   |
| contact_email  | VARCHAR(100)  | Email of the customer                      |
| phone          | VARCHAR(20)   | Phone number of the customer               |
| address_id     | INT           | Links to the address table (Foreign Key)   |



---


<strong>📫 customer_address</strong>

One customer can have multiple addresses.

| Column Name      | Data Type | Description                                      |
|------------------|-----------|--------------------------------------------------|
| customer_id       | INT       | Links to the customer table (Foreign Key)        |
| address_id        | INT       | Links to the address table (Foreign Key)         |
| address_status_id | INT       | Links to the address_status table (Foreign Key)  |



---


<strong>🏷️ address_status</strong>

Status for an address (e.g., current, old).

| Column Name         | Data Type     | Description                                    |
|---------------------|---------------|------------------------------------------------|
| address_status_id   | INT           | Unique ID for the address’ status (Primary Key)|
| address_status_name | VARCHAR(50)   | The name of the status                         |



---


<strong>🏠 address</strong>

All physical addresses stored in the system.

| Column Name | Data Type     | Description                                           |
|-------------|---------------|-------------------------------------------------------|
| address_id  | INT           | Unique ID for the address (Primary Key)              |
| street      | VARCHAR(255)  | The street where the customer or publisher is located|
| city        | VARCHAR(50)   | The city                                             |
| postal_code | VARCHAR(20)   | The postal code                                      |
| country_id  | INT           | Links to the country table (Foreign Key)             |



---


<strong>🌍 country</strong>

Countries for addresses.

| Column Name  | Data Type     | Description                          |
|--------------|---------------|--------------------------------------|
| country_id   | INT           | Unique ID for the country (Primary Key) |
| country_name | VARCHAR(50)   | The name of the country              |



---


<strong>🛒 customer_order</strong>

Orders placed by customers.

| Column Name        | Data Type     | Description                                    |
|--------------------|---------------|------------------------------------------------|
| order_id           | INT           | Unique ID for the order (Primary Key)         |
| customer_id        | INT           | Links to the customer table (Foreign Key)     |
| order_date         | DATE          | The date the order was placed                 |
| shipping_method_id | INT           | Links to shipping_method table (Foreign Key)  |
| order_status_id    | INT           | Links to order_status table (Foreign Key)     |
| total_amount       | DECIMAL(10,2) | The total cost of the order                   |



---


<strong>📦 order_line</strong>

Books that are part of each order.

| Column Name    | Data Type       | Description                                      |
|----------------|------------------|--------------------------------------------------|
| order_line_id  | INT              | Unique ID for the order line (Primary Key)       |
| order_id       | INT              | Links to the cust_order table (Foreign Key)      |
| book_id        | INT              | Links to the book table (Foreign Key)            |
| quantity       | INT              | The number of books bought                       |
| price_per_book | DECIMAL(10,2)    | Price per book at time of order                  |
| total_price    | DECIMAL(14,2)    | Total price of all books in the order            |



---


<strong>🚚 shipping_method</strong>

Ways an order can be shipped.

| Column Name        | Data Type     | Description                                      |
|--------------------|---------------|--------------------------------------------------|
| shipping_method_id | INT           | Unique ID for the shipping method (Primary Key)  |
| method_name        | VARCHAR(50)   | The name of the shipping method                  |
| cost               | DECIMAL(8,2)  | The cost of using the shipping method            |



---


<strong>📜 order_history</strong>

Status history of an order.

| Column Name     | Data Type   | Description                                     |
|-----------------|-------------|-------------------------------------------------|
| history_id      | INT         | Unique ID for the order history (Primary Key)  |
| order_id        | INT         | Links to the cust_order table (Foreign Key)    |
| order_status_id | INT         | Links to order_status table (Foreign Key)      |
| changed_on      | DATETIME    | Date and time of the status change             |



---


<strong>📘 order_status</strong>

Possible statuses for an order (e.g., pending, delivered).

| Column Name        | Data Type     | Description                                      |
|--------------------|---------------|--------------------------------------------------|
| order_status_id    | INT           | Unique ID for the status (Primary Key)          |
| order_status_name  | VARCHAR(50)   | The name of the order status                    |


