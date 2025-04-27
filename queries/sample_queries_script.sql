-- ==============================================
-- 📊 Verification/Analytical sample Queries
-- ==============================================


-- Verification Queries
SELECT * FROM book WHERE stock_quantity < 5;
SELECT * FROM cust_order WHERE total_amount > 20;

-- =====================================================
-- 📦 1. Get all orders with customer names, shipping methods, and order status
-- =====================================================
SELECT 
    o.order_id,
    c.customer_name,
    sm.method_name AS shipping_method,
    os.order_status_name,
    o.order_date,
    o.total_amount
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN shipping_method sm ON o.shipping_method_id = sm.shipping_method_id
JOIN order_status os ON o.order_status_id = os.order_status_id
ORDER BY o.order_date DESC;

-- =====================================================
-- 📚 2. Get all books with author names and publisher
-- =====================================================
SELECT 
    b.book_name,
    a.author_name,
    p.publisher_name,
    b.published_year,
    bl.language_name,
    b.price,
    b.stock_quantity
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_language bl ON b.language_id = bl.language_id
ORDER BY b.book_name;

-- =====================================================
-- 📊 3. Get total sales per book
-- =====================================================
SELECT 
    b.book_name,
    SUM(ol.quantity) AS total_quantity_sold,
    SUM(ol.total_price) AS total_revenue
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.book_id
ORDER BY total_revenue DESC;

-- =====================================================
-- 👥 4. List customers and the number of orders they’ve made
-- =====================================================
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customer c
LEFT JOIN cust_order o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;

-- =====================================================
-- 🚚 5. List addresses used by publishers (with status)
-- =====================================================
SELECT 
    p.publisher_name,
    a.street,
    a.city,
    a.postal_code,
    cs.address_status_name
FROM publisher_address pa
JOIN publisher p ON pa.publisher_id = p.publisher_id
JOIN address a ON pa.address_id = a.address_id
JOIN address_status cs ON pa.address_status_id = cs.address_status_id;

-- =====================================================
-- 🛍️ 6. Get all pending orders with order details
-- =====================================================
SELECT 
    o.order_id,
    c.customer_name,
    b.book_name,
    ol.quantity,
    ol.total_price,
    o.order_date
FROM cust_order o
JOIN order_status os ON o.order_status_id = os.order_status_id
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_line ol ON o.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
WHERE os.order_status_name = 'Pending'
ORDER BY o.order_date;

-- =====================================================
-- 🔍 7. Search books by keyword (e.g., “Mind”)
-- =====================================================
SELECT 
    book_name,
    price,
    stock_quantity
FROM book
WHERE book_name LIKE '%Mind%';
