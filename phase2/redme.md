# Phase 2: Advanced Data Manipulation, Constraints, and Basic Analysis

---

## 🚀 Project Overview

This repository documents **Phase 2** of the project, building directly upon the foundational schema established in Phase 1. This phase focuses on enhancing the database's integrity, demonstrating advanced data manipulation techniques, and performing initial situational analysis using **50 condition-based queries**.

This phase showcases proficiency in using built-in SQL functions, conditional logic, and simple administrative commands (like creating views and backups).

## 🎯 Phase Goals

The primary objectives achieved in this phase were:

1.  **Reinforce DDL/DML:** Continue implementing and populating the **25-table schema** with robust data (minimum **20 records** per table).
2.  **Function Mastery:** Demonstrate the use of various **built-in SQL functions** (e.g., math, string, date/time).
3.  **Conditional Logic:** Implement logic using `CASE` and `IFNULL` statements for data categorization.
4.  **Data Integrity:** Introduce basic data integrity measures (e.g., `UNIQUE` constraints).
5.  **Initial Analysis:** Write and execute **50 situation-based condition queries** to analyze data within a single table (non-joined queries).

---

## 🧠 Key SQL Concepts Demonstrated

The included `project phase2.sql` script focuses heavily on practical application of functions and basic analysis for the `Government_relief_department` database, particularly for the **`Budget_Allocation`** table.

### Advanced DML & Functions

* **Mathematical Operations:** `SUM()`, `AVG()`, `ROUND()`.
* **String Manipulation:** `CHAR_LENGTH()`, `UPPER()`, `LOWER()`.
* **Date/Time Functions:** `DATE_ADD()`, `DATE_SUB()`, `MONTH()`, `YEAR()`.
* **Conditional Logic:**
    * `CASE` statement for creating custom categories (e.g., Budget Usage Status).
    * `IFNULL()` for handling missing data.
* **Basic Analysis:** Using `GROUP BY`, `ORDER BY`, and `LIMIT` to find averages, counts, and extreme values (e.g., getting the fiscal year with the most allocations).

### Database Administration & Integrity

* **Constraints:** Adding a `UNIQUE` constraint to enforce data integrity (e.g., ensuring no duplicate department/fiscal year pairs).
* **Views:** Creating a **View** (`Active_Allocations`) to simplify access to frequently queried data.
* **Backup:** Creating a simple **table backup** (`Budget_Allocation_Backup`) for safety.
* **Indexing:** Creating an **Index** to optimize query performance on frequently searched columns.

## 📂 Repository Contents

| File Name | Description |
| :--- | :--- |
| **`project phase2.sql`** | The complete SQL script containing the database structure, data insertion, all built-in function demonstrations, and the 50 conditional analytical queries. |
| `README.md` (This file) | Project overview and documentation for Phase 2. |

## ⚙️ Setup and Usage

To run the database and execute the analysis:

1.  **Prerequisites:** Ensure you have a MySQL, MariaDB, or compatible SQL server installed.
2.  **Execution:**
    * Connect to your SQL server (e.g., using MySQL Workbench, DBeaver, or command line).
    * Execute the entire contents of the **`project phase2.sql`** file.
3.  **Verification:** The script will define the database, populate the tables, modify structures (constraints/indexes), and run all 50 analytical queries, providing the foundational analysis results.
