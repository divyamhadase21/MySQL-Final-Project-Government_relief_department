# Phase 1: Database Design & Initial Implementation

---

## 💡 Project Overview

This repository documents **Phase 1** of the project: the foundational design and implementation of the **Government Relief Department Database**. This phase establishes the entire relational schema required to manage and track citizen welfare, relief programs, fund allocations, and disaster events.

The core goal of Phase 1 was to translate the conceptual data model into a functioning database structure, ensuring proper normalization and integrity from the start.

## 🎯 Phase Goals

The primary objectives successfully achieved in Phase 1 were:

1.  **Database Creation:** Creating the primary database, `Government_relief_department`.
2.  **Schema Definition:** Designing and implementing a robust schema comprising **25 individual tables**.
3.  **Attribute Design:** Ensuring each of the 25 tables includes a minimum of **10 relevant attributes**.
4.  **Initial Data Population:** Inserting a minimum of **20 initial records** into each table to test the schema integrity and basic operations.
5.  **Basic SQL Demonstration:** Showcasing mastery of fundamental Data Definition Language (DDL) and Data Manipulation Language (DML) commands.

---

## 🛠️ Database Schema Summary

The database is built around managing core entities involved in government relief operations. The full schema definition includes **25 interconnected tables**.

| Key Entity | Related Tables | Purpose |
| :--- | :--- | :--- |
| **Citizens** | `citizens`, `locations` | Managing citizen profiles and their geographical data. |
| **Programs & Events** | `relief_programs`, `disaster_events` | Cataloging all official relief initiatives and natural/man-made events. |
| **Finance & Aid** | `fund_allocations`, `aid_distribution` | Tracking budget approvals and the distribution of physical aid items. |
| **Personnel** | `government_officers`, `departments` | Storing details of government staff managing the operations. |

### Example Core Tables:
* **citizens:** Stores detailed information about beneficiaries (`national_id`, `contact_number`, `location_id`).
* **relief\_programs:** Lists all government schemes and their status.
* **disaster\_events:** Logs critical event data (`event_type`, `severity_level`, `location_id`).
* **fund\_allocations:** Records budget flow (`amount_allocated`, `fiscal_year`).

## 💻 SQL Operations Demonstrated

The `phase1.sql` script includes all necessary commands to set up the database from scratch and manage its structure:

| Command Type | SQL Keywords Used |
| :--- | :--- |
| **Data Definition Language (DDL)** | `CREATE DATABASE`, `CREATE TABLE`, `DROP TABLE`, `DROP DATABASE` |
| **Data Manipulation Language (DML)** | `INSERT INTO` (for data population), `SELECT`, `TRUNCATE TABLE` |

## ⚙️ Setup and Usage

To fully implement the database structure and load the initial test data:

1.  **Prerequisites:** Ensure you have a MySQL, MariaDB, or compatible SQL server installed.
2.  **Execution:**
    * Connect to your SQL server (e.g., using MySQL Workbench, DBeaver, or command line).
    * Execute the entire contents of the **`phase1.sql`** file.
3.  **Result:** The script will create the `Government_relief_department` database, define all 25 tables with their attributes, and insert the required initial records.
