# 🏛️ Phase -1: Government Relief Department Database (SQL Design)

This repository contains the database design and initial data population script for a **Government Relief Department Management System**. This project, designated as Phase -1, focuses entirely on developing a robust relational schema capable of tracking citizens, relief programs, disaster events, and fund allocations.

---

## 🎯 Phase Objectives

This initial phase fulfills the core requirements for designing a comprehensive database structure, adhering to the following strict specifications:

* **Database:** Creation of the `Government_relief_department` database.
* **Table Count:** Implementation of **25 distinct tables** to properly organize the data.
* **Attribute Minimum:** Each table must have a minimum of **10 attributes**.
* **Data Volume:** Insertion of a minimum of **20 sample records** into each table for demonstration (where applicable).
* **Query Coverage:** Inclusion of situation-based DDL and DML queries (`CREATE`, `INSERT`, `SELECT`, `TRUNCATE`, and `DROP`) to demonstrate functional use of the schema.

---

## 🏗️ Database Schema Overview

The database schema is organized around the core function of disaster and relief management. Key tables designed in this phase include:

| # | Table Name | Purpose |
| :--- | :--- | :--- |
| 1 | **`citizens`** | Stores personal and registration details of relief beneficiaries. |
| 2 | **`relief_programs`** | Catalog of all active, planned, or completed relief initiatives (e.g., Food Aid, Medical Camp). |
| 3 | **`disaster_events`** | Records details of natural calamities (Floods, Earthquakes, Cyclones), including severity and location. |
| 4 | **`fund_allocations`** | Tracks budget allocation, spending, and status for each relief program by fiscal year. |
| 5 | **`aid_distribution`** | Logs the distribution of specific relief items (e.g., Rice bags, Health Kits, Cash Vouchers) to citizens. |
| 6 | **`locations`** | Geographical data hierarchy (district, taluka, village, coordinates, population) for accurate relief targeting. |
| 7 | **`government_officers`** | Management of personnel responsible for program oversight and execution. |
| 25 | **`Budget_Allocation`** | Tracks department-wise allocated, used, and remaining amounts. |

*(The remaining tables cover detailed aspects like Inventory, Beneficiary Applications, Audit Trails, Donations, Media Coverage, and Shelter Centers.)*

---

## 🚀 Setup and Usage

This project uses standard SQL and can be run on most relational database management systems (RDBMS) like MySQL, PostgreSQL, or SQL Server.

### Prerequisites
* A running SQL server instance.
* A SQL client (e.g., MySQL Workbench, DBeaver, or command line interface).

### Installation

1.  **Clone the Repository (or download the SQL file):**
    ```bash
    git clone [Your-Repo-URL]
    cd [Your-Repo-Name]
    ```
2.  **Execute the Script:**
    * Open your SQL client.
    * Connect to your SQL server.
    * Execute the entire `phase1.sql` script.

    The script will perform the following actions in sequence:
    1.  `CREATE DATABASE Government_relief_department;`
    2.  `USE Government_relief_department;`
    3.  Create all 25 tables with their respective schemas.
    4.  Insert the required sample data (20 records minimum per table).
    5.  Demonstrate basic DML operations (`SELECT *`, `TRUNCATE TABLE`, `DROP TABLE`).

---

## 📂 File Structure

* `phase1.sql`: The complete database schema (DDL) and data population (DML) script for Phase -1.

---

## 🤝 Contribution

This phase sets the foundation for a larger project. Contributions or suggestions for query optimization and normalization improvements are welcome!
