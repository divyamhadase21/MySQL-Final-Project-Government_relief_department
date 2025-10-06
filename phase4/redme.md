# Phase 4: Advanced Database Programming and Automation

---

## 🚀 Project Overview

This repository documents **Phase 4**, the penultimate stage of the project. Building upon the relational analysis of Phase 3, this phase focuses on **database programming, automation, and advanced analytical capabilities**.

The core objective was to implement sophisticated SQL constructs like **Stored Procedures, Functions, and Triggers** to ensure data integrity, automate routine tasks, and simplify complex operations. This phase also introduces **Window Functions** for in-depth comparative analysis.

## 🎯 Phase Goals

The primary objectives achieved in Phase 4 were:

1.  **Automation (Triggers):** Implement database **Triggers** to automatically maintain data consistency (e.g., updating remaining funds on change).
2.  **Encapsulation (Procedures/Functions):** Create **Stored Procedures** and **Functions** to encapsulate business logic and simplify complex operations for end-users.
3.  **Advanced Analysis (Window Functions):** Utilize **Window Functions** (`RANK`, `ROW_NUMBER`, `NTILE`, `SUM OVER`) for advanced comparative and cumulative reporting.
4.  **Administrative Tasks:** Demonstrate essential administrative skills including transaction management (`COMMIT`, `ROLLBACK`) and `UPDATE`/`DELETE` operations.
5.  **Comprehensive Querying:** Writing and executing **50 situation-based queries** demonstrating these advanced techniques.

---

## 🧠 Key SQL Programming Concepts Demonstrated

The included `phase 4.sql` script showcases a powerful set of tools for enterprise-level database management, primarily using the `Budget_Allocation` table as an example.

### Database Automation & Integrity (Triggers)
* **`BEFORE INSERT` Trigger:** Automatically calculating and setting the `remaining_amount` before a new allocation record is inserted.
* **`AFTER UPDATE` Trigger:** Logging changes to key fields (like `used_amount`) into a separate audit table (`Budget_Allocation_Log`).

### Logic Encapsulation (Procedures & Functions)
* **Stored Procedure (`Get_Allocation_Details`):** Accepting input parameters (`allocation_id`) to return a specific record, demonstrating secure and simplified data retrieval.
* **Stored Function (`Calculate_Usage_Percentage`):** Returning a calculated value (percentage of used funds) that can be called directly within a `SELECT` statement.

### Advanced Analytical Reporting (Window Functions)
* **Ranking:** Using `RANK() OVER` to rank departments based on their allocated amounts.
* **Partitioning:** Using `ROW_NUMBER() OVER PARTITION BY` to sequentially number records within groups (e.g., allocations per fiscal year).
* **Tiling:** Using `NTILE(4)` to divide departments into quartiles based on allocated amount.
* **Cumulative Sum:** Using `SUM(column) OVER` to calculate running totals for funds.

### Transaction Control
* Demonstrating the use of **`START TRANSACTION`**, **`COMMIT`**, and **`ROLLBACK`** to manage data changes safely.

## 📂 Repository Contents

| File Name | Description |
| :--- | :--- |
| **`phase 4.sql`** | The complete SQL script containing all **Stored Procedures, Functions, Triggers, Window Functions**, and the 50 situation-based queries for Phase 4. |
| `README.md` (This file) | Project overview and documentation for Phase 4. |

## ⚙️ Setup and Usage

To run the full implementation and execute the advanced programming constructs:

1.  **Prerequisites:** Ensure you have a MySQL, MariaDB, or compatible SQL server installed.
2.  **Execution:**
    * Connect to your SQL server (e.g., using MySQL Workbench or command line).
    * Execute the entire contents of the **`phase 4.sql`** file.
3.  **Verification:** The script will define the database, populate the tables, create the Triggers, Procedures, and Functions, and then execute all 50 advanced analytical queries and administrative commands.
