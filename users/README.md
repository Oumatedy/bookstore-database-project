# 📋 User Roles & Privileges

This document outlines the common user roles and their associated permissions for accessing the **Bookstore Database**. These roles help manage database security, control access, and ensure users have the appropriate level of interaction with the data.

---

## 👥 Common Roles

| Role Name       | Description                             |   Permissions                            |
|-----------------|-----------------------------------------|----------------------------------------- |
| `db_admin`      | Full control over the database          |  ALL privileges                          |
| `schema_editor` | Can create/alter tables and views       |  CREATE, ALTER, DROP                     |
| `data_entry`    | Can insert, update, and delete records  |  INSERT, UPDATE, DELETE                  |
| `report_viewer` | Read-only access to all data            |  SELECT only                             |
| `guest_user`    | Very limited access                     |  SELECT on specific views or tables only |

---

## 🔐 Usage Recommendations

- Assign `db_admin` role to trusted database administrators only.
- Use `schema_editor` for developers or analysts responsible for schema maintenance.
- Grant `data_entry` to users or services responsible for operational data input.
- Provide `report_viewer` access to business users or analysts needing reports.
- Limit `guest_user` to public or audit-safe read operations.

