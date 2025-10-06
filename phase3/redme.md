# Phase 3: Relational Querying and Multi-Table Analysis

---

## 🚀 Project Overview

This repository documents **Phase 3** of the project, marking a critical transition from single-table operations (Phase 2) to **relational analysis**. This phase focuses on demonstrating mastery of various **SQL JOIN types** to link data across the entire `Government_relief_department` schema.

The goal is to extract meaningful insights by combining information from multiple tables—such as linking citizens to the aid they received, or connecting relief programs to their fund allocations and the officers managing them.

## 🎯 Phase Goals

The primary objectives achieved in Phase 3 were:

1.  **Data Integration:** Successfully querying and aggregating data across multiple related tables.
2.  **JOIN Mastery:** Implementing **Inner, Left, Right, and Full (simulated) JOINs** to handle different data relationship scenarios.
3.  **Advanced Grouping:** Using the **`GROUP BY`** clause with multiple joined columns.
4.  **Conditional Filtering:** Applying the **`HAVING`** clause for post-aggregation filtering.
5.  **Analytical Querying:** Writing and executing **50 situation-based queries** that require multi-table retrieval.

---

## 🧠 Key SQL Concepts Demonstrated

The included `phase333.sql` script (as part of the overall project submission) showcases complex queries essential for a relational database:

### Relational Operations (JOINs)
* **INNER JOIN:** Finding records that exist in *both* tables (e.g., all citizens who have received aid).
* **LEFT JOIN (or LEFT OUTER JOIN):** Finding all records from the *left* table and the matching records from the right (e.g., all relief programs and their fund allocations, if any).
* **RIGHT JOIN (or RIGHT OUTER JOIN):** Finding all records from the *right* table and the matching records from the left (less common, but used to show all available aid items and the citizens who received them).

### Advanced Aggregation
* **`GROUP BY`:** Grouping results based on non-aggregated columns (e.g., grouping aid distribution data by both `citizen_id` and `program_id`).
* **`HAVING`:** Filtering groups based on aggregated values (e.g., finding officers who manage more than two programs).

### Other Core Functions
* **Subqueries:** Used in `WHERE` and `SELECT` clauses for dynamic condition checking.
* **Data Functions:** Continued use of `SUM()`, `COUNT()`, `AVG()`, `MAX()`, and `MIN()` on joined datasets.

## 📂 Repository Contents

| File Name | Description |
| :--- | :--- |
| **`phase3.sql`** | The comprehensive SQL script containing the database definition (DDL), data insertion (DML), and all 50 situation-based multi-table analytical queries for Phase 3. |
| `README.md` (This file) | Project overview and documentation for Phase 3. |

## ⚙️ Setup and Usage

To run the full database implementation and analysis for Phase 3:

1.  **Prerequisites:** Ensure you have a MySQL, MariaDB, or compatible SQL server installed.
2.  **Execution:**
    * Connect to your SQL server (e.g., using MySQL Workbench, DBeaver, or command line).
    * Execute the entire contents of the **`phase333.sql`** file.
3.  **Verification:** The script will create the database, define all 25 tables, populate the data, and then run all 50 complex relational queries, demonstrating the analytical capabilities of the database.
