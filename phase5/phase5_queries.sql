-- =================================================================================
-- Full SQL Script for Government Relief Department
-- =================================================================================
-- This script provides a comprehensive set of SQL queries based on the user's request,
-- covering DDL, DML, DQL, Joins, Subqueries, and other advanced SQL features.
-- The database schema and initial data are based on the provided "phase1-Divya.sql" file.
-- =================================================================================

-- First, create the database
CREATE DATABASE IF NOT EXISTS Governmentreliefdepartment;
USE Governmentreliefdepartment;


-- 1. DDL (Data Definition Language) – 10 Queries


-- DDL includes commands to define and manage the database structure.

-- Query 1: Create the 'citizens' table to store beneficiary information.
CREATE TABLE citizens (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    address TEXT,
    location_id INT,
    contact_number VARCHAR(15),
    national_id VARCHAR(20),
    registration_date DATE,
    status VARCHAR(20)
);

-- Query 2: Create the 'relief_programs' table to manage different aid programs.
CREATE TABLE relief_programs (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    description TEXT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    officer_id INT,
    location_id INT,
    document_reference VARCHAR(100)
);

-- Query 3: Create the 'locations' table to store geographical data.
CREATE TABLE locations (
    id INT PRIMARY KEY,
    district VARCHAR(50),
    taluka VARCHAR(50),
    village VARCHAR(50),
    pincode VARCHAR(10),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    population INT,
    zone_type VARCHAR(20),
    status VARCHAR(20)
);

-- Query 4: Create the 'government_officers' table.
CREATE TABLE government_officers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    department VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    office_address TEXT,
    location_id INT,
    joining_date DATE,
    status VARCHAR(20)
);

-- Query 5: Create a temporary table for a special report.
-- This table will be dropped later.
CREATE TABLE TempReport (
    report_id INT PRIMARY KEY,
    report_name VARCHAR(255),
    generated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Query 6: Alter the 'citizens' table to add a new column for email.
-- This is useful for communication purposes.
ALTER TABLE citizens ADD COLUMN email VARCHAR(100);

-- Query 7: Modify the data type of a column in the 'relief_programs' table.
-- Changing 'description' to a longer text type if needed.
ALTER TABLE relief_programs MODIFY description LONGTEXT;

-- Query 8: Add a UNIQUE constraint to the 'citizens' table.
-- This ensures that every citizen has a unique national ID.
ALTER TABLE citizens ADD CONSTRAINT uq_national_id UNIQUE (national_id);

-- Query 9: Add a FOREIGN KEY constraint to link 'citizens' with 'locations'.
-- This establishes a relationship between a citizen and their location.
ALTER TABLE citizens ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations(id);

-- Query 10: Drop the temporary table created earlier.
DROP TABLE TempReport;



-- 2. DML (Data Manipulation Language) – 10 Queries

-- DML is used to manage data within tables.
-- NOTE: The following INSERT queries are samples. Run these before executing other DML/DQL.

-- Query 1: Insert a new record into the 'citizens' table.
INSERT INTO citizens (id, name, date_of_birth, gender, address, location_id, contact_number, national_id, registration_date, status, email)
VALUES (21, 'Riya Sharma', '1998-08-20', 'Female', '101 River Side, Pune', 1, '9876543210', 'ID100000021', '2023-01-15', 'Active', 'riya.s@example.com');

-- Query 2: Insert multiple records into the 'locations' table.
INSERT INTO locations (id, district, taluka, village, pincode, latitude, longitude, population, zone_type, status) VALUES
(1, 'Pune', 'Mulshi', 'Belawade', '411057', 18.505007, 73.518105, 1200, 'Rural', 'Active'),
(2, 'Mumbai', 'Andheri', 'Andheri', '400058', 19.1197, 72.8464, 1500000, 'Urban', 'Active');

-- Query 3: Insert a new record into the 'relief_programs' table.
INSERT INTO relief_programs (id, name, category, description, start_date, end_date, status, officer_id, location_id, document_reference)
VALUES (21, 'Winter Shelter Drive', 'Housing', 'Providing warm shelters during winter.', '2025-11-01', '2026-02-28', 'Planned', 101, 2, 'DOC-A021');

-- Query 4: Update the status of a citizen.
-- For example, changing a citizen's status to 'Inactive'.
UPDATE citizens SET status = 'Inactive' WHERE id = 21;

-- Query 5: Update the contact number and address for a citizen.
UPDATE citizens
SET contact_number = '9998887770', address = '25B Baker Street, Mumbai'
WHERE id = 3;

-- Query 6: Update the end date of a relief program.
-- Extending a program to serve more people.
UPDATE relief_programs SET end_date = '2025-07-30' WHERE id = 1;

-- Query 7: Update all 'Planned' programs to 'Ongoing'.
UPDATE relief_programs SET status = 'Ongoing' WHERE status = 'Planned';

-- Query 8: Delete a specific citizen record by their ID.
DELETE FROM citizens WHERE id = 21;

-- Query 9: Delete all citizens who are marked as 'Suspended'.
DELETE FROM citizens WHERE status = 'Suspended';

-- Query 10: Delete a relief program that has been completed.
DELETE FROM relief_programs WHERE id = 6 AND status = 'Completed';


-- 3. DQL (Data Query Language) – 10 Queries


-- DQL is used to fetch data from the database.

-- Query 1: Select all citizens from a specific district ('Pune').
SELECT * FROM citizens WHERE location_id IN (SELECT id FROM locations WHERE district = 'Pune');

-- Query 2: Select all relief programs and order them by their start date.
SELECT id, name, category, start_date FROM relief_programs ORDER BY start_date DESC;

-- Query 3: Count the number of citizens in each gender category.
SELECT gender, COUNT(*) AS number_of_citizens FROM citizens GROUP BY gender;

-- Query 4: Find the total population in each district.
SELECT district, SUM(population) AS total_population FROM locations GROUP BY district;

-- Query 5: Select all 'Active' relief programs in the 'Health' category.
SELECT name, start_date, end_date FROM relief_programs WHERE status = 'Active' AND category = 'Health';

-- Query 6: List citizens whose registration date is after January 1, 2021.
SELECT name, registration_date FROM citizens WHERE registration_date > '2021-01-01';

-- Query 7: Group disaster events by severity level and count them.
SELECT severity_level, COUNT(id) AS event_count FROM disaster_events GROUP BY severity_level;

-- Query 8: Display programs with their allocated and spent funds, ordered by the amount allocated.
SELECT p.name, f.amount_allocated, f.amount_spent
FROM relief_programs p
JOIN fund_allocations f ON p.id = f.program_id
ORDER BY f.amount_allocated DESC;

-- Query 9: Get the top 5 most populated locations.
SELECT village, district, population FROM locations ORDER BY population DESC LIMIT 5;

-- Query 10: Select all distinct program categories.
SELECT DISTINCT category FROM relief_programs;


-- 4. Clauses & Operators – 10 Queries

-- These queries demonstrate various SQL clauses and operators.

-- Query 1 (WHERE): Find all disaster events with 'High' severity.
SELECT name, event_type, start_date FROM disaster_events WHERE severity_level = 'High';

-- Query 2 (BETWEEN): Find fund allocations between 200,000 and 500,000.
SELECT program_id, amount_allocated FROM fund_allocations WHERE amount_allocated BETWEEN 200000 AND 500000;

-- Query 3 (LIKE): Find all citizens whose name starts with 'A'.
SELECT id, name, gender FROM citizens WHERE name LIKE 'A%';

-- Query 4 (IN): Find relief programs in the 'Food' or 'Health' categories.
SELECT name, category FROM relief_programs WHERE category IN ('Food', 'Health');

-- Query 5 (AND): Find active citizens who are male.
SELECT name, gender, status FROM citizens WHERE status = 'Active' AND gender = 'Male';

-- Query 6 (OR): Find programs that are either 'Completed' or have a budget over 500,000.
SELECT p.name, p.status, f.amount_allocated
FROM relief_programs p
JOIN fund_allocations f ON p.id = f.program_id
WHERE p.status = 'Completed' OR f.amount_allocated > 500000;

-- Query 7 (NOT): Find all citizens who are NOT from Pune.
SELECT c.name, l.district FROM citizens c JOIN locations l ON c.location_id = l.id WHERE NOT l.district = 'Pune';

-- Query 8 (ANY): Find officers whose salary is greater than ANY officer in the 'Finance' department.
-- Note: 'salary' column not present, using 'id' for demonstration.
SELECT name, department FROM government_officers
WHERE id > ANY (SELECT id FROM government_officers WHERE department = 'Finance & Planning');

-- Query 9 (ALL): Find programs with fund allocation greater than all programs in the 'Education' category.
SELECT name, category FROM relief_programs
WHERE id > ALL (SELECT id FROM relief_programs WHERE category = 'Education');

-- Query 10 (AND/OR/NOT): Find active, male citizens who are not from Mumbai and registered in 2020.
SELECT c.name, c.gender, l.district
FROM citizens c
JOIN locations l ON c.location_id = l.id
WHERE c.status = 'Active' AND c.gender = 'Male' AND (NOT l.district = 'Mumbai') AND YEAR(c.registration_date) = 2020;


-- 5. Constraints & Cascades – 10 Queries


-- Demonstrating PRIMARY KEY, FOREIGN KEY, and CASCADE actions.
-- Re-creating tables to include constraints from the start.

-- Drop existing tables if they exist to avoid errors
DROP TABLE IF EXISTS fund_allocations;
DROP TABLE IF EXISTS relief_programs;

-- Query 1 & 2 (Primary Key): Define a PRIMARY KEY in a new table.
CREATE TABLE relief_programs (
    id INT,
    name VARCHAR(100),
    category VARCHAR(50),
    -- other columns
    PRIMARY KEY (id)
);

-- Query 3, 4, 5 (Foreign Key, ON DELETE CASCADE):
-- Create a 'fund_allocations' table with a foreign key that cascades on delete.
-- If a program is deleted from 'relief_programs', all its fund allocations will be deleted automatically.
CREATE TABLE fund_allocations (
    id INT PRIMARY KEY,
    program_id INT,
    amount_allocated DECIMAL(12, 2),
    -- other columns
    CONSTRAINT fk_program
        FOREIGN KEY (program_id)
        REFERENCES relief_programs(id)
        ON DELETE CASCADE
);

-- Query 6 (ON UPDATE CASCADE):
-- When a program's ID is updated in the parent table, it's also updated here.
ALTER TABLE fund_allocations
ADD CONSTRAINT fk_program_update
FOREIGN KEY (program_id) REFERENCES relief_programs(id) ON UPDATE CASCADE;

-- Query 7 (Add CHECK constraint): Ensure citizen age is positive.
-- Note: Need 'age' column. Let's add it.
ALTER TABLE citizens ADD COLUMN age INT;
ALTER TABLE citizens ADD CONSTRAINT chk_age CHECK (age > 0);

-- Query 8 (Add DEFAULT constraint): Set a default status for new citizens.
ALTER TABLE citizens ALTER COLUMN status SET DEFAULT 'Pending';

-- Query 9 (Demonstrate ON DELETE CASCADE):
-- First, insert a parent and child record.
INSERT INTO relief_programs (id, name, category) VALUES (101, 'Test Program', 'Test');
INSERT INTO fund_allocations (id, program_id, amount_allocated) VALUES (1001, 101, 50000);

-- Now, delete the parent record. The child record in fund_allocations will also be deleted.
DELETE FROM relief_programs WHERE id = 101;
-- SELECT * FROM fund_allocations WHERE id = 1001; -- This will return an empty set.

-- Query 10 (Dropping a constraint): Remove the check constraint on age.
ALTER TABLE citizens ADD CONSTRAINT chk_age CHECK (age >= 18);


-- 6. Joins – 10 Queries

-- Joins are used to combine rows from two or more tables.

-- Query 1 (INNER JOIN): Get a list of citizens and their district names.
SELECT c.name AS citizen_name, l.district
FROM citizens c
INNER JOIN locations l ON c.location_id = l.id;

-- Query 2 (LEFT JOIN): List all relief programs and the officer in charge.
-- This will include programs that do not have an officer assigned yet.
SELECT rp.name AS program_name, go.name AS officer_name
FROM relief_programs rp
LEFT JOIN government_officers go ON rp.officer_id = go.id;

-- Query 3 (RIGHT JOIN): List all government officers and any relief program they manage.
-- This will include officers who are not managing any program.
SELECT go.name AS officer_name, rp.name AS program_name
FROM relief_programs rp
RIGHT JOIN government_officers go ON rp.officer_id = go.id;

-- Query 4 (FULL OUTER JOIN): Show all citizens and all beneficiary applications.
-- This will match them where possible but also show citizens without applications and vice versa.
-- Note: MySQL does not support FULL OUTER JOIN directly. It can be simulated with UNION.
(SELECT c.name, ba.status
FROM citizens c
LEFT JOIN beneficiary_applications ba ON c.id = ba.citizen_id)
UNION
(SELECT c.name, ba.status
FROM citizens c
RIGHT JOIN beneficiary_applications ba ON c.id = ba.citizen_id);

-- Query 5 (SELF JOIN): Find pairs of citizens living in the same location.
SELECT A.name AS Citizen1, B.name AS Citizen2, l.village
FROM citizens A, citizens B, locations l
WHERE A.id < B.id
AND A.location_id = B.location_id
AND A.location_id = l.id;

-- Query 6 (Multiple INNER JOINs): Get details on aid distribution.
-- Links citizens, programs, and locations.
SELECT c.name AS citizen, rp.name AS program, ad.item_description, l.village
FROM aid_distribution ad
JOIN citizens c ON ad.citizen_id = c.id
JOIN relief_programs rp ON ad.program_id = rp.id
JOIN locations l ON ad.location_id = l.id;

-- Query 7 (LEFT JOIN with WHERE): Find officers who are not assigned to any program.
SELECT go.name
FROM government_officers go
LEFT JOIN relief_programs rp ON go.id = rp.officer_id
WHERE rp.id IS NULL;

-- Query 8 (INNER JOIN with GROUP BY): Calculate total funds allocated per district.
SELECT l.district, SUM(fa.amount_allocated) AS total_funds
FROM fund_allocations fa
JOIN relief_programs rp ON fa.program_id = rp.id
JOIN locations l ON rp.location_id = l.id
GROUP BY l.district;

-- Query 9 (Complex Join): Show feedback from citizens in Pune for 'Food' programs.
SELECT c.name AS citizen_name, pf.message
FROM public_feedback pf
JOIN citizens c ON pf.citizen_id = c.id
JOIN locations l ON c.location_id = l.id
JOIN beneficiary_applications ba ON c.id = ba.citizen_id
JOIN relief_programs rp ON ba.program_id = rp.id
WHERE l.district = 'Pune' AND rp.category = 'Food';

-- Query 10 (CROSS JOIN): Generate all possible pairings of citizens and relief programs.
-- This is generally used with caution as it can produce very large result sets.
SELECT c.name, rp.name
FROM citizens c
CROSS JOIN relief_programs rp
LIMIT 100; -- Limiting output for brevity.

-- 7 Subqueries 

-- Subqueries (or nested queries) are queries within another query.

-- Query 1 (Single-row subquery): Find the citizen with the highest ID.
SELECT name, address FROM citizens WHERE id = (SELECT MAX(id) FROM citizens);

-- Query 2 (Multiple-row subquery with IN): Find citizens who live in the Pune district.
SELECT name, address FROM citizens
WHERE location_id IN (SELECT id FROM locations WHERE district = 'Pune');

-- Query 3 (Correlated Subquery): Find programs with allocated funds above the average for their category.
SELECT rp.name, rp.category, fa.amount_allocated
FROM relief_programs rp
JOIN fund_allocations fa ON rp.id = fa.program_id
WHERE fa.amount_allocated > (
    SELECT AVG(fa2.amount_allocated)
    FROM fund_allocations fa2
    JOIN relief_programs rp2 ON fa2.program_id = rp2.id
    WHERE rp2.category = rp.category
);

-- Query 4 (Subquery in FROM clause): Select the average population per district.
SELECT district, avg_pop
FROM (SELECT district, AVG(population) as avg_pop FROM locations GROUP BY district) AS district_avg;

-- Query 5 (Subquery with EXISTS): Find suppliers who have provided items for the inventory.
SELECT name FROM suppliers s
WHERE EXISTS (SELECT 1 FROM inventory_items ii WHERE ii.supplier_id = s.id);

-- Query 6 (Subquery in SELECT clause): Show each citizen's name and the total number of applications they've made.
SELECT
    c.name,
    (SELECT COUNT(*) FROM beneficiary_applications ba WHERE ba.citizen_id = c.id) AS application_count
FROM citizens c;

-- Query 7 (Nested Subquery): Find citizens who received aid from a program managed by a specific officer.
SELECT name FROM citizens
WHERE id IN (
    SELECT citizen_id FROM aid_distribution
    WHERE program_id IN (
        SELECT id FROM relief_programs WHERE officer_id = 101
    )
);

-- Query 8 (Correlated Subquery with NOT EXISTS): Find officers who have not approved any applications.
SELECT name FROM government_officers go
WHERE NOT EXISTS (
    SELECT 1 FROM beneficiary_applications ba WHERE ba.officer_id = go.id AND ba.status = 'Approved'
);

-- Query 9 (Subquery with ALL): Find the program with the highest fund allocation.
SELECT name FROM relief_programs WHERE id = (
    SELECT program_id FROM fund_allocations WHERE amount_allocated >= ALL (SELECT amount_allocated FROM fund_allocations)
);

-- Query 10 (Subquery for UPDATE): Increase the quantity of all 'Food' items in inventory by 10%.
UPDATE inventory_items
SET quantity = quantity * 1.10
WHERE supplier_id IN (SELECT id FROM suppliers WHERE item_supplied = 'Rice');


-- 8. Functions – 10 Queries


-- SQL functions perform operations on data.

-- AGGREGATE FUNCTIONS

-- Query 1 (SUM): Calculate the total amount of all fund allocations.
SELECT SUM(amount_allocated) AS total_funding FROM fund_allocations;

-- Query 2 (AVG): Calculate the average quantity of items in the inventory.
SELECT AVG(quantity) AS average_inventory_quantity FROM inventory_items;

-- Query 3 (COUNT): Count the number of active relief programs.
SELECT COUNT(*) AS active_programs FROM relief_programs WHERE status = 'Active';

-- Query 4 (MIN): Find the earliest start date of any disaster event.
SELECT MIN(start_date) AS earliest_disaster FROM disaster_events;

-- Query 5 (MAX): Find the largest single donation amount.
SELECT MAX(amount) AS largest_donation FROM donations;

-- SCALAR FUNCTIONS

-- Query 6 (UPPER): Display all citizen names in uppercase.
SELECT UPPER(name) AS uppercase_name FROM citizens;

-- Query 7 (LOWER): Display officer emails in lowercase.
SELECT LOWER(email) AS lowercase_email FROM government_officers;

-- Query 8 (LENGTH): Find the length of each citizen's name.
SELECT name, LENGTH(name) AS name_length FROM citizens;

-- Query 9 (CONCAT): Combine citizen's name and their national ID.
SELECT CONCAT(name, ' (', national_id, ')') AS citizen_identifier FROM citizens;

-- Query 10 (NOW/CURRENT_TIMESTAMP): Get the current date and time.
SELECT NOW() AS current_datetime;



-- 9. Views & CTE (Common Table Expressions) – 10 Queries


-- Views are stored queries, and CTEs are temporary result sets.

-- VIEWS

-- Query 1: Create a view to show details of all active relief programs.
CREATE OR REPLACE VIEW ActiveProgramsView AS
SELECT rp.name, rp.category, rp.start_date, rp.end_date, go.name AS officer_name
FROM relief_programs rp
JOIN government_officers go ON rp.officer_id = go.id
WHERE rp.status = 'Active';

-- Query 2: Use the view to select active 'Health' programs.
SELECT * FROM ActiveProgramsView WHERE category = 'Health';

-- Query 3: Create a view for high-severity incidents.
CREATE OR REPLACE VIEW HighSeverityIncidents AS
SELECT ir.description, ir.report_date, de.name AS disaster_name, l.village
FROM incident_reports ir
JOIN disaster_events de ON ir.event_id = de.id
JOIN locations l ON ir.location_id = l.id
WHERE ir.severity_level = 'High';

-- Query 4: Query the high-severity incidents view.
SELECT * FROM HighSeverityIncidents;

-- Query 5: Drop a view.
DROP VIEW IF EXISTS HighSeverityIncidents;

-- CTEs

-- Query 6: Use a CTE to list programs and their total funding.
SELECT
    rp.name,
    pf.total_allocated
FROM relief_programs rp
JOIN (
    SELECT
        program_id,
        SUM(amount_allocated) AS total_allocated
    FROM fund_allocations
    GROUP BY program_id
) pf ON rp.id = pf.program_id;



-- Query 7: Use a CTE to find the top 3 districts by citizen count.

SELECT district, citizen_count
FROM (
    SELECT l.district, COUNT(c.id) AS citizen_count
    FROM citizens c
    JOIN locations l ON c.location_id = l.id
    GROUP BY l.district
    ORDER BY COUNT(c.id) DESC
)
WHERE ROWNUM <= 3;




-- Query 8: Use multiple CTEs.
SELECT
    rp.name,
    pb.budget,
    pd.distributions
FROM relief_programs rp
LEFT JOIN (
    SELECT program_id, SUM(amount_allocated) AS budget
    FROM fund_allocations
    GROUP BY program_id
) pb ON rp.id = pb.program_id
LEFT JOIN (
    SELECT program_id, COUNT(id) AS distributions
    FROM aid_distribution
    GROUP BY program_id
) pd ON rp.id = pd.program_id;

-- Query 9 (Recursive CTE): Create an organizational hierarchy.
-- First, add a 'manager_id' to the government_officers table.
ALTER TABLE government_officers ADD COLUMN manager_id INT;
UPDATE government_officers SET manager_id = 1 WHERE id IN (2, 3, 4);
UPDATE government_officers SET manager_id = 2 WHERE id IN (5, 6);



SELECT category, total_donated
FROM (
    SELECT category, SUM(amount) AS total_donated
    FROM donations
    GROUP BY category
) AS DonationSummary
ORDER BY total_donated DESC;


-- 10. Stored Procedures – 5 Queries

-- Stored procedures are pre-compiled SQL statements stored in the database.
-- The syntax may vary slightly between different SQL databases (e.g., MySQL, SQL Server).
-- This uses MySQL syntax.

DELIMITER $$

-- Query 1 (CREATE - Add New Citizen):
CREATE PROCEDURE AddNewCitizen (
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_dob DATE,
    IN p_gender VARCHAR(10),
    IN p_location_id INT,
    IN p_national_id VARCHAR(20)
)
BEGIN
    INSERT INTO citizens (id, name, date_of_birth, gender, location_id, national_id, registration_date, status)
    VALUES (p_id, p_name, p_dob, p_gender, p_location_id, p_national_id, CURDATE(), 'Active');
END$$

-- Query 2 (READ - Get Citizen Details):
CREATE PROCEDURE GetCitizenDetails (
    IN p_citizen_id INT
)
BEGIN
    SELECT * FROM citizens WHERE id = p_citizen_id;
END$$

-- Query 3 (UPDATE - Update Program Status):
CREATE PROCEDURE UpdateProgramStatus (
    IN p_program_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE relief_programs SET status = p_status WHERE id = p_program_id;
END$$

-- Query 4 (DELETE - Delete a Donation):
CREATE PROCEDURE DeleteDonation (
    IN p_donation_id INT
)
BEGIN
    DELETE FROM donations WHERE id = p_donation_id;
END$$

DELIMITER ;

-- Query 5: Call a stored procedure to get details for citizen with ID 1.
CALL GetCitizenDetails(1);

-- 11. Window Functions – 5 Queries


-- Window functions perform calculations across a set of table rows.

-- Query 1 (ROW_NUMBER): Assign a unique number to each citizen within their district.
SELECT 
    name,
    district,
    @row_num := IF(@current_district = district, @row_num + 1, 1) AS row_num,
    @current_district := district
FROM (
    SELECT c.name, l.district
    FROM citizens c
    JOIN locations l ON c.location_id = l.id
    ORDER BY l.district, c.name
) t
CROSS JOIN (SELECT @row_num := 0, @current_district := '') vars;



-- Query 2 (RANK): Rank programs within each category based on their allocated funds.
SELECT
    name,
    category,
    amount_allocated,
    @rank := IF(@prev_category = category, @rank + 1, 1) AS budget_rank,
    @prev_category := category
FROM (
    SELECT rp.name, rp.category, fa.amount_allocated
    FROM relief_programs rp
    JOIN fund_allocations fa ON rp.id = fa.program_id
    ORDER BY category, amount_allocated DESC
) t
CROSS JOIN (SELECT @rank := 0, @prev_category := '') vars;



-- Query 3 (LEAD): Show the amount of the next donation.
SELECT
    d1.id,
    d1.amount,
    COALESCE(MIN(d2.amount), 0) AS next_donation_amount
FROM donations d1
LEFT JOIN donations d2 
    ON d2.donation_date > d1.donation_date
GROUP BY d1.id, d1.amount
ORDER BY d1.donation_date;


-- Query 4 (LAG): Show the amount of the previous donation.
SELECT
    d1.id,
    d1.amount,
    COALESCE(MAX(d2.amount), 0) AS previous_donation_amount
FROM donations d1
LEFT JOIN donations d2 
    ON d2.donation_date < d1.donation_date
GROUP BY d1.id, d1.amount
ORDER BY d1.donation_date;


-- Query 5 (DENSE_RANK): Rank suppliers based on the number of items they supply.
SELECT
    name,
    item_count,
    @rank := IF(@prev_count = item_count, @rank, @rank + 1) AS supplier_rank,
    @prev_count := item_count
FROM (
    SELECT
        s.name,
        COUNT(i.id) AS item_count
    FROM suppliers s
    JOIN inventory_items i ON s.id = i.supplier_id
    GROUP BY s.name
    ORDER BY COUNT(i.id) DESC
) t
CROSS JOIN (SELECT @rank := 0, @prev_count := NULL) vars;


-- 12. Transactions – 5 Queries


-- Transactions ensure that a group of operations are executed as a single unit.

-- Query 1 (COMMIT): A successful transaction to transfer funds.
START TRANSACTION;
-- Decrease funds from one program
UPDATE fund_allocations SET amount_spent = amount_spent + 5000 WHERE id = 1;
-- Increase funds for another program (simulated)
UPDATE fund_allocations SET amount_allocated = amount_allocated + 5000 WHERE id = 2;
COMMIT;

-- Query 2 (ROLLBACK): An unsuccessful transaction.
START TRANSACTION;
UPDATE fund_allocations SET amount_spent = amount_spent + 10000 WHERE id = 3;
-- Let's say an error occurs or a condition isn't met, we roll back.
ROLLBACK;
-- The changes to fund_allocations with id=3 will be undone.

-- Query 3, 4, 5 (SAVEPOINT): A transaction with a partial rollback.
START TRANSACTION;
-- Action 1
INSERT INTO donations (id, donor_name, amount) VALUES (101, 'Donor A', 500);
-- Create a savepoint
SAVEPOINT sp1;
-- Action 2
INSERT INTO donations (id, donor_name, amount) VALUES (102, 'Donor B', 1000);
-- Something went wrong, roll back to the savepoint.
-- This will undo the insertion of 'Donor B' but keep 'Donor A'.
ROLLBACK TO SAVEPOINT sp1;
-- Commit the transaction to save the insertion of 'Donor A'.
COMMIT;

-- 13. Triggers – 5 Queries

-- Triggers are stored programs that are automatically executed in response to certain events.
-- Uses MySQL syntax.

DELIMITER $$

-- Query 1 (AFTER INSERT Trigger): Log an action in 'audittrails' after a new citizen is added.
CREATE TRIGGER AfterCitizenInsert
AFTER INSERT ON citizens
FOR EACH ROW
BEGIN
    INSERT INTO audittrails (action_type, table_name, record_id, action_time, remarks)
    VALUES ('INSERT', 'citizens', NEW.id, NOW(), 'New citizen registered');
END$$

-- Query 2 (BEFORE UPDATE Trigger): Prevent updating a citizen's national_id.
CREATE TRIGGER BeforeCitizenUpdate
BEFORE UPDATE ON citizens
FOR EACH ROW
BEGIN
    IF NEW.national_id != OLD.national_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'National ID cannot be changed.';
    END IF;
END$$

-- Query 3 (AFTER DELETE Trigger): Log the deletion of a relief program.
CREATE TRIGGER AfterProgramDelete
AFTER DELETE ON relief_programs
FOR EACH ROW
BEGIN
    INSERT INTO audittrails (action_type, table_name, record_id, action_time, remarks)
    VALUES ('DELETE', 'relief_programs', OLD.id, NOW(), CONCAT('Program deleted: ', OLD.name));
END$$

-- Query 4: Insert a citizen to test the AFTER INSERT trigger.
-- This will automatically add a new row to the 'audittrails' table.
INSERT INTO citizens (id, name, national_id) VALUES (100, 'Test Trigger', 'TT100');

-- Query 5: Try to update a national ID to test the BEFORE UPDATE trigger.
-- This operation will fail and return an error message.
-- UPDATE citizens SET national_id = 'NEWID100' WHERE id = 100;

DELIMITER ;


