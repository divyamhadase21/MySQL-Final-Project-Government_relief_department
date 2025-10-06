# Phase 3: Advanced SQL & Database Implementation (Government Relief Department)

---

## 🚀 Project Overview

This repository documents **Phase 3** of the project, focusing on the complete implementation, population, and advanced querying of the **Government Relief Department Database**. This phase successfully transitions the data model from a theoretical design to a functional database, demonstrating proficiency in database architecture, data manipulation, and complex data analysis using SQL.

## 🎯 Phase Goals

The primary objectives for this phase were:

1.  **Database Creation:** Implement the entire relational database schema, comprising **25 tables**.
2.  **Data Population:** Insert a minimum of **20 records** into each of the 25 tables.
3.  **Documentation:** Provide clear documentation and analysis for the database structure.
4.  **Advanced Querying:** Write and execute **50 situation-based condition queries** to extract meaningful insights and demonstrate mastery of advanced SQL concepts.

---

## 🛠️ Database Schema Summary

The database is named `Government_relief_department` and is designed to manage and track various components of a government's disaster relief and citizen welfare initiatives.

| Table Name | Description | Key Attributes |
| :--- | :--- | :--- |
| **citizens** | Detailed profiles of all registered citizens. | `national_id`, `contact_number`, `location_id` |
| **relief_programs** | Catalog of all active and inactive relief initiatives. | `category`, `start_date`, `officer_id` |
| **disaster_events** | Records of all major natural/man-made disaster events. | `event_type`, `severity_level`, `location_id` |
| **fund_allocations** | Tracking of allocated and spent funds for each program. | `amount_allocated`, `fiscal_year`, `program_id` |
| **aid_distribution** | Records of relief items distributed to specific citizens. | `item_description`, `quantity`, `distribution_date` |
| **locations** | Geographical data used for linking citizens and events. | `district`, `taluka`, `pincode`, `population` |
| **government_officers** | Personnel managing programs and events. | `designation`, `department`, `email` |
| *... and 18 other supporting tables* | Data integrity and normalization across the system. | |

---

## 🧠 Key SQL Concepts Demonstrated

The included `phase333.sql` script showcases a comprehensive set of SQL capabilities, including:

### DDL & DML Operations
* `CREATE DATABASE`, `CREATE TABLE`
* `INSERT INTO` for populating data
* `TRUNCATE TABLE`, `DROP TABLE`, `DROP DATABASE`

### Advanced Querying & Analysis
* **Aggregation:** Use of `SUM()`, `COUNT()`, `MAX()`, `MIN()`, and `AVG()`.
* **Grouping & Filtering:** Implementing `GROUP BY` and applying conditional filtering with `HAVING` clauses.
* **Joins:** Implicit/Explicit joins to retrieve data across multiple related tables.
* **Subqueries:** Utilizing subqueries in the `WHERE` clause (e.g., finding the maximum remaining amount).
* **Conditional Logic:** Demonstrating flow control with the `IF()` function and the advanced `CASE` statement for custom status descriptions.
* **Built-in Functions:** Date/Time manipulation using `MONTH()` and `YEAR()`, and string pattern matching with `LIKE`.

## 📂 Repository Contents

| File Name | Description |
| :--- | :--- |
| **`phase3.sql`** | The complete SQL script containing the database definition (DDL), data insertion (DML), and all 50 situation-based advanced queries. |
| `README.md` (This file) | Project overview and documentation for Phase 5. |

## ⚙️ Setup and Usage

To run the database and queries:

1.  **Prerequisites:** Ensure you have a MySQL, MariaDB, or compatible SQL server installed.
2.  **Execution:**
    * Connect to your SQL server using a client tool (e.g., MySQL Workbench, DBeaver, or command line).
    * Execute the entire contents of the **`phase333.sql`** file.
3.  **Verification:** The script will automatically create the database, define all 25 tables, insert the initial 20+ records, and then run all 50 analytical queries, providing immediate results.

---

*This phase provides a solid foundation for any front-end application development or data analysis project built upon the Government Relief Department's data.*
