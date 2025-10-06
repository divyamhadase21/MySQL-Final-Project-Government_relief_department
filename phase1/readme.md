# ⚙️ Phase -2: Advanced Querying and Relational Integrity (SQL DQL/DDL)

This repository contains the advanced SQL scripts for Phase -2 of the **Government Relief Department Database**. Building upon the comprehensive schema established in Phase -1 (25 tables, 10+ attributes each), this phase focuses on **relational integrity, data manipulation, and complex querying** to extract meaningful insights from the data.

---

## 🎯 Phase Objectives & Features

The primary objective of this phase is to move beyond simple data storage and prove the functionality and integrity of the database through sophisticated SQL operations.

### Key Achievements in Phase -2:

* **Advanced Data Retrieval (DQL):** Implementation of 50+ detailed situation-based `SELECT` queries per major table (e.g., `citizens`, `relief_programs`, `disaster_events`, `aid_distribution`, `locations`, etc.).
* **Relational Integrity:** Extensive use of **Foreign Key constraints** to enforce relationships between tables, often utilizing **`ON DELETE CASCADE`** and **`ON UPDATE CASCADE`** to ensure data consistency.
* **Complex Query Techniques:** Demonstrating proficiency in advanced SQL features:
    * **Joins:** Extensive use of `INNER JOIN` and `LEFT JOIN` across multiple tables (e.g., joining `relief_programs` with `officers` and `locations`).
    * **Subqueries:** Use of nested `SELECT` statements (e.g., finding programs with the maximum duration or citizens registered before a certain group).
    * **Views & CTEs:** Creation of **Views** (e.g., `active_programs`, `full_program_info`) for simplified access, and **Common Table Expressions (CTEs)** for complex, temporary result sets (e.g., calculating program duration or ranking).
    * **Window Functions:** Utilization of functions like `ROW_NUMBER()` and `COUNT(*) OVER (PARTITION BY...)` for analytical reporting.
* **Data Manipulation and Definition (DML/DDL):** Practical implementation of `CREATE`, `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`, `DROP`, and `ALTER TABLE` commands for real-world scenarios, including adding/modifying constraints and columns.

---

## 📂 Highlighted Query Examples

The script contains a diverse array of queries showcasing various SQL concepts:

| Table | Query Description | SQL Concept Demonstrated |
| :--- | :--- | :--- |
| **citizens** | Finding the 5 oldest registered citizens. | `ORDER BY` + `LIMIT` |
| **relief_programs** | Counting the total number of programs by their current `status`. | `GROUP BY` + `COUNT(*)` |
| **relief_programs** | Joining program details with the handling officer's name and designation. | `INNER JOIN` |
| **disaster_events** | Calculating the total `economic_loss` for all 'Flood' events. | `SUM()` + `WHERE` |
| **inventory_items** | Creating a **View** to monitor high-quantity hygiene items. | `CREATE VIEW` |
| **budget_plans** | Using a `CASE` statement to label a plan's budget as 'High', 'Medium', or 'Low'. | `CASE` Expression |

---

## 🚀 Setup and Execution

### Prerequisites
* A running SQL server instance (compatible with MySQL/PostgreSQL syntax is ideal).
* The database structure from **Phase -1** must be created first (although this script includes all necessary DDL/DML for selected tables).

### Running the Script

1.  **Clone this repository** or download the `project phase2.sql` file.
2.  Open your SQL client and connect to the database.
3.  **Execute the entire `project phase2.sql` script.**

> **Note:** The script will first define the necessary tables (if not already present), insert sample data, and then run a sequence of DDL, DML, and DQL operations, including table alterations and complex queries. It is designed for demonstration purposes, and some commands like `TRUNCATE` and `DROP` are included but commented out for safety, or run at the end of a block before re-creation.
