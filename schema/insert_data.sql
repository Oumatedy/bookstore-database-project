-- ==============================
-- Data Insertion
-- ==============================

USE BookStoreDB;

-- 1. Countries
INSERT INTO country (country_name) VALUES
('Kenya'), ('Uganda'), ('Tanzania'), ('Nigeria'), ('South Africa'),
('Rwanda'), ('Ethiopia'), ('Ghana'), ('Zambia'), ('Zimbabwe');

-- 2. Addresses
INSERT INTO address (street, city, postal_code, country_id) VALUES
-- Publisher addresses
('123 Nairobi St.', 'Nairobi', '00100', 1),
('45 Kampala Rd.', 'Kampala', '20101', 2),
('89 Dar es Salaam Ave.', 'Dar es Salaam', '45678', 3),
('22 Lagos Blvd.', 'Lagos', '23401', 4),
('56 Cape Town Crescent', 'Cape Town', '8000', 5),
('99 Kigali Crescent', 'Kigali', '0110', 6),
('77 Addis Ababa Rd.', 'Addis Ababa', '1000', 7),
('101 Accra St.', 'Accra', '02010', 8),
('12 Lusaka Rd.', 'Lusaka', '10101', 9),
('345 Harare Dr.', 'Harare', '00200', 10),
('14 Kilimani Rd', 'Nairobi', '00101', 1),
('89 Kimathi St', 'Nakuru', '20100', 1),
('32 Nile Ave', 'Kampala', '20102', 2),
('12 Uhuru St', 'Arusha', '11213', 3),
('55 Victoria St', 'Entebbe', '30011', 2);

-- 3. Address Statuses
INSERT INTO address_status (address_status_name) VALUES
('Active'), ('Inactive'), ('Pending'), ('Archived');

-- 4. Publishers
INSERT INTO publisher (publisher_name, contact_email, phone, address_id) VALUES
('Chang-Fisher', 'contact@changfisher.com', '+254111111111', 1),
('Gomez LLC', 'info@gomezllc.com', '+254222222222', 2),
('Allen and Sons', 'support@allenandsons.com', '+254333333333', 3),
('African Voices Press', 'info@africanvoices.com', '+254733444555', 11),
('Safari Books Ltd', 'support@safaribooks.co.ke', '+254700111222', 12),
('Nile Publishing House', 'contact@nilepublishers.ug', '+256788333444', 13),
('Kilimanjaro Press', 'hello@kilipress.tz', '+255655666777', 14),
('Congo Basin Books', 'admin@congobooks.cd', '+243811222333', 15),
('Sahara Media Group', 'info@saharamg.com', '+213555444333', 5),
('Cape Coast Publishers', 'support@capecoastpub.gh', '+233244555666', 8);

-- 5. Publisher Addresses
INSERT INTO publisher_address (publisher_id, address_id, address_status_id) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 11, 1), (5, 12, 1),
(6, 13, 1), (7, 14, 1), (8, 15, 1), (9, 5, 1), (10, 8, 1);

-- 6. Languages
INSERT INTO book_language (language_name) VALUES
('English'), ('French'), ('Swahili'), ('Portuguese'), ('Arabic');

-- 7. Authors
INSERT INTO author (author_name, nationality, author_email) VALUES
('Ngugi wa Thiong''o', 'Kenyan', 'ngugi@kenya.com'),
('Chinua Achebe', 'Nigerian', 'achebe@nigeria.com'),
('Abdulrazak Gurnah', 'Tanzanian', 'gurnah@abdulrazak.com'),
('J.M. Coetzee', 'South African', 'jmcoetzee@coetzee.com'),
('Wole Soyinka', 'Nigerian', 'wole@wole.com');

-- 8. Books
INSERT INTO book (book_name, ISBN, publisher_id, published_year, language_id, price, stock_quantity) VALUES
('Decolonising the Mind', '978-0-435-08100-1', 1, 1986, 1, 15.99, 10),
('Things Fall Apart', '978-0-435-08100-2', 2, 1958, 1, 18.50, 5),
('Maps', '978-0-435-08100-3', 3, 1986, 1, 13.75, 8),
('The Man Died', '978-0-435-08100-4', 4, 1972, 1, 20.00, 6),
('The Beautyful Ones Are Not Yet Born', '978-0-435-08100-5', 5, 1968, 1, 22.50, 4);

-- 9. Book Authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- 10. Customers
INSERT INTO customer (customer_name, contact_email, phone, address_id) VALUES
('Alice Achieng', 'alice@example.com', '+254711111111', 1),
('Brian Otieno', 'brian@example.com', '+254722222222', 2),
('Carol Wanjiku', 'carol@example.com', '+254733333333', 3),
('David Muthoni', 'david@example.com', '+254744444444', 4);

-- 11. Customer Addresses
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1);

-- 12. Shipping Methods
INSERT INTO shipping_method (method_name, cost) VALUES
('Standard', 3.99), ('Express', 7.99), ('Overnight', 12.99);

-- 13. Order Statuses (continued)
INSERT INTO order_status (order_status_name) VALUES
('Pending'), ('Shipped'), ('Delivered'), ('Cancelled');

-- 14. Orders
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id, total_amount) VALUES
(1, '2025-04-01', 1, 1, 31.98), 
(2, '2025-04-02', 2, 2, 18.50),
(3, '2025-04-03', 1, 3, 13.75), 
(4, '2025-04-04', 3, 1, 22.50);

-- 15. Order Lines
INSERT INTO order_line (order_id, book_id, quantity, price_per_book, total_price) VALUES
(1, 1, 2, 15.99, 31.98), 
(2, 2, 1, 18.50, 18.50),
(3, 3, 1, 13.75, 13.75), 
(4, 4, 1, 20.00, 20.00);

-- 16. Order History
INSERT INTO order_history (order_id, order_status_id, changed_on) VALUES
(1, 1, '2025-04-01 10:00:00'), 
(1, 2, '2025-04-02 11:00:00'), 
(1, 3, '2025-04-03 12:00:00'),
(2, 1, '2025-04-02 09:30:00'), 
(2, 2, '2025-04-03 10:30:00'), 
(2, 3, '2025-04-04 11:00:00'),
(3, 1, '2025-04-03 11:15:00'), 
(3, 2, '2025-04-04 12:15:00'), 
(3, 3, '2025-04-05 13:00:00'),
(4, 1, '2025-04-04 09:00:00'), 
(4, 2, '2025-04-05 10:00:00'), 
(4, 3, '2025-04-06 11:00:00');