-- Create roles (note: MySQL 8.0+ supports roles)
CREATE ROLE db_admin;
CREATE ROLE schema_editor;
CREATE ROLE data_entry;
CREATE ROLE report_viewer;
CREATE ROLE guest_user;

-- Grant privileges to each role
GRANT ALL PRIVILEGES ON bookstore.* TO db_admin;

GRANT CREATE, ALTER, DROP ON bookstore.* TO schema_editor;

GRANT INSERT, UPDATE, DELETE ON bookstore.* TO data_entry;

GRANT SELECT ON bookstore.* TO report_viewer;

-- For guest_user, only allow limited read access (example: only books and authors)
GRANT SELECT ON bookstore.books TO guest_user;
GRANT SELECT ON bookstore.authors TO guest_user;

-- Optional: Create users and assign roles (customize usernames/passwords)
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'EditorPass123!';
CREATE USER 'entry_user'@'localhost' IDENTIFIED BY 'EntryPass123!';
CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'ReportPass123!';
CREATE USER 'guest'@'localhost' IDENTIFIED BY 'GuestPass123!';

-- Assign roles to users
GRANT db_admin TO 'admin_user'@'localhost';
GRANT schema_editor TO 'editor_user'@'localhost';
GRANT data_entry TO 'entry_user'@'localhost';
GRANT report_viewer TO 'report_user'@'localhost';
GRANT guest_user TO 'guest'@'localhost';

-- Activate roles when users log in
SET DEFAULT ROLE ALL TO 'admin_user'@'localhost';
SET DEFAULT ROLE ALL TO 'editor_user'@'localhost';
SET DEFAULT ROLE ALL TO 'entry_user'@'localhost';
SET DEFAULT ROLE ALL TO 'report_user'@'localhost';
SET DEFAULT ROLE ALL TO 'guest'@'localhost';
