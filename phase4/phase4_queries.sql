/*
Database - Government_relief_department

-- 1. create database Government_relief_department
-- 2. do proper analysis to organize data properly
-- 3. there must be 25 tables within minimum 10 attributes, insert 20 records. 
-- 4. do properdocumentation. 
-- 5. analyze table data & write situation based condition queries-
      1. create,insert,select,truncate,drop,
	  
-- --------------------------------------------------- Analysis of Database ------------------------------------------------

Database Name --> Government_relief_department

Tables -->
1. citizens (id, name, date_of_birth, gender, address, location_id, contact_number, national_id, registration_date, status)
2. relief_programs (id, name, category, description, start_date, end_date, status, officer_id, location_id, document_reference)
3. disaster_events (id, event_type, name, start_date, end_date,location_id, severity_level, description, document_reference, status)
4. fund_allocations (id, program_id, amount_allocated, amount_spent,fiscal_year, officer_id, status, remarks, document_reference, date_created)
5. aid_distribution (id, citizen_id, program_id, item_description, quantity,distribution_date, location_id, officer_id, status, remarks)
6. locations (id, district, taluka, village, pincode,latitude, longitude, population, zone_type, status) 
7. government_officers (id, name, designation, department, contact_number, email,office_address, location_id, joining_date, status)
8. suppliers (id, name, contact_person, phone, email, address,item_supplied, license_number, status, remarks)
9. inventory_items (id, name, category, quantity, unit,supplier_id, purchase_date, expiry_date, status, location_id)
10.beneficiary_applications (id, citizen_id, program_id, application_date, status,approved_date, officer_id, remarks, document_reference, location_id)
11.application_status_logs (id, application_id, status, update_date,updated_by, remarks, document_reference,officer_id, location_id, program_id)
12.incident_reports (id, event_id, reporter_name, report_date,description, location_id, severity_level,document_reference, status, officer_id)
13.ngo_partners (id, name, registration_number, contact_person, phone,email, address, area_of_work, status, remarks)
14.public_feedback (id, citizen_id, feedback_date, feedback_type,message, location_id, officer_id, status,remarks, document_reference)
15.training_programs (id, title, description, start_date, end_date,trainer_name, officer_id, location_id, category, status)
16.emergency_contacts (id, name, contact_number, department,location_id, email, designation, status,remarks, added_by)
17.budget_plans (id, plan_name, fiscal_year, estimated_amount,approved_amount, officer_id, status,remarks, document_reference, date_created)
18.audit_trails (id, action_type, table_name, record_id,officer_id, action_time, remarks,status, location_id, ip_address)
19.donations (id, donor_name, donation_date, amount,category, mode_of_payment, remarks,status, location_id, document_reference)
20.media_coverage (id, title, media_type, date_published,source, url, summary, event_id, location_id, officer_id) 
21.shelter_centers (id, name, location_id, capacity,current_occupancy, contact_person, contact_number,status, remarks, officer_id)
22.transportation_logs (id, vehicle_number, driver_name, purpose, date_of_use,route, status, location_id, officer_id, remarks, document_reference)
23.resource_requests (id, program_id, item_required, quantity, request_date,status, location_id, officer_id, remarks, document_reference)
24.resource_requests (id, program_id, item_required, quantity, request_date,status, location_id, officer_id, remarks, document_reference)
25.Budget_Allocation (department_name, fiscal_year, allocated_amount,used_amount, remaining_amount, approved_by,approval_date, remarks, status)

 */
   -- ---------------------------------------- Database queries ---------------------------------------------------------

-- create a university database
CREATE DATABASE Government_relief_department;

-- to work on database, you need to use it first
use Government_relief_department;

 -- --------------------------------------------------------- Table Queries -------------------------------------------------
 
-- table 1
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

--  Insert 20 sample records
INSERT INTO citizens (id, name, date_of_birth, gender, address, location_id, contact_number, national_id, registration_date, status)
VALUES
(1, 'Aarav Sharma', '1985-02-14', 'Male', '123 Main St, Mumbai', 101, '9123456780', 'ID100000001', '2020-01-10', 'Active'),
(2, 'Priya Singh', '1990-07-25', 'Female', '45 Rose Garden, Pune', 102, '9123456781', 'ID100000002', '2020-02-12', 'Active'),
(3, 'Rohan Patel', '1978-11-05', 'Male', '78 Green Park, Nagpur', 103, '9123456782', 'ID100000003', '2020-03-05', 'Inactive'),
(4, 'Neha Kulkarni', '1995-04-18', 'Female', '9 Lake View, Nashik', 104, '9123456783', 'ID100000004', '2020-04-20', 'Active'),
(5, 'Vikram Desai', '1982-12-30', 'Male', '56 Sunshine Rd, Aurangabad', 105, '9123456784', 'ID100000005', '2020-05-11', 'Suspended'),
(6, 'Sonal Mehta', '1975-03-22', 'Female', '12 Hilltop, Thane', 106, '9123456785', 'ID100000006', '2020-06-03', 'Active'),
(7, 'Karan Iyer', '1988-09-09', 'Male', '89 Riverside, Kolhapur', 107, '9123456786', 'ID100000007', '2020-07-15', 'Inactive'),
(8, 'Anita Rao', '1992-01-01', 'Female', '33 Orchid Lane, Ahmednagar', 108, '9123456787', 'ID100000008', '2020-08-22', 'Active'),
(9, 'Deepak Joshi', '1980-06-16', 'Male', '7 Lotus Street, Latur', 109, '9123456788', 'ID100000009', '2020-09-10', 'Active'),
(10, 'Ritika Chavan', '1987-08-28', 'Female', '21 Riverbank, Solapur', 110, '9123456789', 'ID100000010', '2020-10-05', 'Suspended'),
(11, 'Aditya Rao', '1991-05-12', 'Male', '15 Palm Drive, Satara', 111, '9123456790', 'ID100000011', '2020-11-17', 'Active'),
(12, 'Priyanka Ghosh', '1993-10-23', 'Female', '44 Lotus Blvd, Kolhapur', 112, '9123456791', 'ID100000012', '2020-12-08', 'Inactive'),
(13, 'Sachin Patil', '1979-07-07', 'Male', '99 Pebble Way, Sangli', 113, '9123456792', 'ID100000013', '2021-01-14', 'Active'),
(14, 'Sunita Dixit', '1984-03-30', 'Female', '67 Maple Ave, Nashik', 114, '9123456793', 'ID100000014', '2021-02-25', 'Active'),
(15, 'Manish Kapoor', '1986-11-11', 'Male', '23 Cedar St, Pune', 115, '9123456794', 'ID100000015', '2021-03-19', 'Suspended'),
(16, 'Neelam Verma', '1994-02-02', 'Female', '88 Cherry Lane, Mumbai', 116, '9123456795', 'ID100000016', '2021-04-07', 'Active'),
(17, 'Amit Khanna', '1983-12-19', 'Male', '5 Palmview Rd, Thane', 117, '9123456796', 'ID100000017', '2021-05-29', 'Active'),
(18, 'Shruti Nair', '1996-06-06', 'Female', '20 Ocean Dr, Kolhapur', 118, '9123456797', 'ID100000018', '2021-06-18', 'Inactive'),
(19, 'Raghav Jain', '1989-09-21', 'Male', '31 Dawn St, Nagpur', 119, '9123456798', 'ID100000019', '2021-07-30', 'Active'),
(20, 'Meera Shah', '1992-12-12', 'Female', '77 Sunset Blvd, Aurangabad', 120, '9123456799', 'ID100000020', '2021-08-25', 'Active');

-- to display table data
    select * from citizens;
   
 -- to reamove complete records from table
   truncate table citizens;
    
 -- to remove complete records and attribute from table
    drop table citizens ;
    
    -- 1. Create a simple view to show active citizens
CREATE VIEW active_citizens AS
SELECT id, name, date_of_birth, gender, status
FROM citizens
WHERE status='Active';

-- 2. Create a view with age calculation
CREATE VIEW citizens_age AS
SELECT id, name, DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(), date_of_birth)), '%Y')+0 AS age, status
FROM citizens;

-- 3. View showing citizens by location
CREATE VIEW citizens_by_location AS
SELECT location_id, COUNT(*) AS total_citizens
FROM citizens
GROUP BY location_id;

-- 4. View showing recent registrations
CREATE VIEW recent_registrations AS
SELECT id, name, registration_date
FROM citizens
WHERE registration_date >= '2021-01-01';

-- 5. View showing suspended citizens
CREATE VIEW suspended_citizens AS
SELECT *
FROM citizens
WHERE status='Suspended';

-- 6. CTE example: list active citizens older than 35
WITH active_over_35 AS (
    SELECT id, name, date_of_birth, status
    FROM citizens
    WHERE status='Active' AND DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(), date_of_birth)), '%Y')+0 > 35
)
SELECT * FROM active_over_35;

-- 7. CTE: citizens count per location
WITH location_count AS (
    SELECT location_id, COUNT(*) AS total
    FROM citizens
    GROUP BY location_id
)
SELECT * FROM location_count;

-- 8. CTE: inactive citizens
WITH inactive_citizens AS (
    SELECT id, name
    FROM citizens
    WHERE status='Inactive'
)
SELECT * FROM inactive_citizens;

-- 9. CTE with join: citizens and location names (assuming location table exists)
WITH citizen_location AS (
    SELECT c.id, c.name, l.location_name
    FROM citizens c
    JOIN locations l ON c.location_id = l.location_id
)
SELECT * FROM citizen_location;

-- 10. CTE to find youngest citizen
WITH youngest AS (
    SELECT id, name, date_of_birth
    FROM citizens
    ORDER BY date_of_birth DESC
    LIMIT 1
)
SELECT * FROM youngest;

-- 11. Stored Procedure: Get citizen by ID
DELIMITER //
CREATE PROCEDURE GetCitizenByID(IN cid INT)
BEGIN
    SELECT * FROM citizens WHERE id=cid;
END //
DELIMITER ;

-- 12. Stored Procedure: Count citizens by status
DELIMITER //
CREATE PROCEDURE CountByStatus(IN cstatus VARCHAR(20))
BEGIN
    SELECT COUNT(*) AS total_citizens
    FROM citizens
    WHERE status=cstatus;
END //
DELIMITER ;

-- 13. Stored Procedure: Update citizen status
DELIMITER //
CREATE PROCEDURE UpdateStatus(IN cid INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE citizens
    SET status=new_status
    WHERE id=cid;
END //
DELIMITER ;

-- 14. Stored Procedure: Insert new citizen
DELIMITER //
CREATE PROCEDURE InsertCitizen(IN cname VARCHAR(100), IN dob DATE, IN gender VARCHAR(10), IN addr TEXT, IN loc_id INT, IN contact VARCHAR(15), IN nid VARCHAR(20), IN reg_date DATE, IN cstatus VARCHAR(20))
BEGIN
    INSERT INTO citizens (name, date_of_birth, gender, address, location_id, contact_number, national_id, registration_date, status)
    VALUES (cname, dob, gender, addr, loc_id, contact, nid, reg_date, cstatus);
END //
DELIMITER ;

-- 15. Window Function: Rank citizens by registration date
SELECT id, name, registration_date,
RANK() OVER(ORDER BY registration_date) AS reg_rank
FROM citizens;

-- 16. Window Function: Row number per gender
SELECT id, name, gender,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY date_of_birth) AS gender_row
FROM citizens;

-- 17. Window Function: Count of citizens per status
SELECT id, name, status,
COUNT(*) OVER(PARTITION BY status) AS status_count
FROM citizens;

-- 18. Window Function: Running total of citizens by registration date
SELECT id, name, registration_date,
SUM(1) OVER(ORDER BY registration_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM citizens;

-- 19. Window Function: Moving average of age (assuming age calculation)
SELECT id, name, (YEAR(CURDATE())-YEAR(date_of_birth)) AS age,
AVG(YEAR(CURDATE())-YEAR(date_of_birth)) OVER(ORDER BY id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_age
FROM citizens;

-- 20. DCL: Grant select on citizens table
GRANT SELECT ON citizens TO 'user1'@'localhost';

-- 21. DCL: Grant insert on citizens table
GRANT INSERT ON citizens TO 'user1'@'localhost';

-- 22. DCL: Revoke update privilege
REVOKE UPDATE ON citizens FROM 'user1'@'localhost';

-- 23. DCL: Grant all privileges to admin
GRANT ALL PRIVILEGES ON citizens TO 'admin'@'localhost';

-- 24. TCL: Start transaction
START TRANSACTION;

-- 25. TCL: Commit transaction
COMMIT;

-- 26. TCL: Rollback transaction
ROLLBACK;

-- 27. TCL: Example with insert and rollback
START TRANSACTION;
INSERT INTO citizens (id, name, date_of_birth, gender, address, location_id, contact_number, national_id, registration_date, status)
VALUES (21, 'Test User', '1990-01-01', 'Male', 'Test Address', 121, '9000000000', 'ID100000021', CURDATE(), 'Active');
ROLLBACK;

-- 28. Trigger: Before insert to check duplicate national_id
DELIMITER //
CREATE TRIGGER before_insert_citizen
BEFORE INSERT ON citizens
FOR EACH ROW
BEGIN
    IF EXISTS(SELECT 1 FROM citizens WHERE national_id=NEW.national_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Duplicate National ID not allowed';
    END IF;
END //
DELIMITER ;

-- 29. Trigger: After insert log new citizen (assuming table citizen_logs exists)
DELIMITER //
CREATE TRIGGER after_insert_citizen
AFTER INSERT ON citizens
FOR EACH ROW
BEGIN
    INSERT INTO citizen_logs (citizen_id, action, action_date)
    VALUES (NEW.id, 'Inserted', NOW());
END //
DELIMITER ;

-- 30. Trigger: Before update prevent status change to Suspended for active citizens under 18
DELIMITER //
CREATE TRIGGER before_update_citizen
BEFORE UPDATE ON citizens
FOR EACH ROW
BEGIN
    IF NEW.status='Suspended' AND (YEAR(CURDATE())-YEAR(OLD.date_of_birth)) < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Cannot suspend minors';
    END IF;
END //
DELIMITER ;

-- 31. Simple SELECT
SELECT * FROM citizens;

-- 32. SELECT specific columns
SELECT id, name, gender, status FROM citizens;

-- 33. WHERE clause
SELECT * FROM citizens WHERE status='Active';

-- 34. AND / OR conditions
SELECT * FROM citizens WHERE status='Active' AND gender='Female';

-- 35. LIKE operator
SELECT * FROM citizens WHERE name LIKE 'A%';

-- 36. BETWEEN operator
SELECT * FROM citizens WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';

-- 37. ORDER BY
SELECT * FROM citizens ORDER BY registration_date DESC;

-- 38. GROUP BY with COUNT
SELECT status, COUNT(*) AS total FROM citizens GROUP BY status;

-- 39. HAVING clause
SELECT status, COUNT(*) AS total FROM citizens GROUP BY status HAVING total>5;

-- 40. DISTINCT
SELECT DISTINCT gender FROM citizens;

-- 41. IN operator
SELECT * FROM citizens WHERE location_id IN (101,102,103);

-- 42. NOT IN operator
SELECT * FROM citizens WHERE location_id NOT IN (101,102);

-- 43. IS NULL / IS NOT NULL
SELECT * FROM citizens WHERE address IS NOT NULL;

-- 44. Aggregate functions
SELECT COUNT(*) AS total_citizens, AVG(YEAR(CURDATE())-YEAR(date_of_birth)) AS avg_age FROM citizens;

-- 45. Subquery in WHERE
SELECT * FROM citizens WHERE location_id = (SELECT location_id FROM citizens WHERE name='Priya Singh');

-- 46. Subquery in SELECT
SELECT name, (SELECT COUNT(*) FROM citizens WHERE status='Active') AS total_active FROM citizens;

-- 47. EXISTS
SELECT * FROM citizens c1 WHERE EXISTS (SELECT 1 FROM citizens c2 WHERE c2.status='Suspended' AND c1.id=c2.id);

-- 48. NOT EXISTS
SELECT * FROM citizens c1 WHERE NOT EXISTS (SELECT 1 FROM citizens c2 WHERE c2.status='Suspended' AND c1.id=c2.id);

-- 49. CASE statement
SELECT id, name, status,
CASE WHEN status='Active' THEN 'Green' WHEN status='Inactive' THEN 'Yellow' ELSE 'Red' END AS status_color
FROM citizens;

-- 50. CONCAT and DATE_FORMAT built-in functions
SELECT name, CONCAT(name,' (',gender,')') AS full_info, DATE_FORMAT(date_of_birth,'%d-%b-%Y') AS dob_formatted
FROM citizens;

-- table 2
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

INSERT INTO relief_programs (id, name, category, description, start_date, end_date, status, officer_id, location_id, document_reference)
VALUES
(1, 'Food Aid Initiative', 'Food', 'Distribution of food packets', '2025-01-15', '2025-06-15', 'Active', 101, 201, 'DOC-A001'),
(2, 'Medical Camp Support', 'Health', 'Free medical camps in rural areas', '2025-02-01', '2025-05-30', 'Active', 102, 202, 'DOC-A002'),
(3, 'Shelter Provision', 'Housing', 'Temporary shelters for displaced people', '2025-03-01', '2025-07-31', 'Active', 103, 203, 'DOC-A003'),
(4, 'Livelihood Training', 'Employment', 'Skills training program', '2025-04-01', '2025-08-31', 'Planned', 104, 204, 'DOC-A004'),
(5, 'Educational Aid', 'Education', 'Support for school children', '2025-05-01', '2025-09-30', 'Planned', 105, 205, 'DOC-A005'),
(6, 'Water Purification', 'Water', 'Clean water plant installation', '2025-01-20', '2025-04-20', 'Completed', 106, 206, 'DOC-A006'),
(7, 'Sanitation Drive', 'Sanitation', 'Building toilets in villages', '2025-02-10', '2025-06-10', 'Active', 107, 207, 'DOC-A007'),
(8, 'Cash Relief', 'Financial', 'One-time cash assistance', '2025-03-15', '2025-04-15', 'Completed', 108, 208, 'DOC-A008'),
(9, 'Crop Insurance', 'Insurance', 'Subsidized crop insurance', '2025-04-01', '2025-10-01', 'Active', 109, 209, 'DOC-A009'),
(10, 'Microloan Program', 'Financial', 'Low-interest microloans', '2025-05-15', '2025-11-15', 'Planned', 110, 210, 'DOC-A010'),
(11, 'Disaster Awareness', 'Awareness', 'Workshops on disaster preparedness', '2025-01-05', '2025-03-05', 'Completed', 111, 211, 'DOC-A011'),
(12, 'Women''s Empowerment', 'Social', 'Support for women''s groups', '2025-02-20', '2025-08-20', 'Active', 112, 212, 'DOC-A012'),
(13, 'Farmer Subsidy', 'Agriculture', 'Subsidies for small-scale farmers', '2025-03-20', '2025-09-20', 'Active', 113, 213, 'DOC-A013'),
(14, 'Child Nutrition', 'Health', 'Feeding program for children', '2025-04-10', '2025-10-10', 'Planned', 114, 214, 'DOC-A014'),
(15, 'Old Age Support', 'Social', 'Pension program for elderly', '2025-05-01', '2025-12-31', 'Planned', 115, 215, 'DOC-A015'),
(16, 'Plantation Drive', 'Environment', 'Tree plantation in towns', '2025-01-25', '2025-04-25', 'Completed', 116, 216, 'DOC-A016'),
(17, 'Legal Aid', 'Legal', 'Free legal services', '2025-02-15', '2025-07-15', 'Active', 117, 217, 'DOC-A017'),
(18, 'Disability Assistance', 'Health', 'Support for differently-abled', '2025-03-10', '2025-09-10', 'Active', 118, 218, 'DOC-A018'),
(19, 'Emergency Kits', 'Relief', 'Distribution of emergency kits', '2025-04-05', '2025-05-05', 'Completed', 119, 219, 'DOC-A019'),
(20, 'Reforestation', 'Environment', 'Replanting deforested lands', '2025-05-10', '2025-11-10', 'Planned', 120, 220, 'DOC-A020');

-- to display table data
    select * from relief_programs;
   
 -- to reamove complete records from table
   truncate table relief_programs;
    
 -- to remove complete records and attribute from table
    drop table relief_programs ;

-- 1. Simple SELECT all records
SELECT * FROM relief_programs;

-- 2. SELECT with WHERE filter
SELECT * FROM relief_programs WHERE status = 'Active';

-- 3. SELECT specific columns
SELECT id, name, category, status FROM relief_programs;

-- 4. SELECT with ORDER BY
SELECT * FROM relief_programs ORDER BY start_date DESC;

-- 5. SELECT with LIMIT / TOP (depending on DBMS)
SELECT * FROM relief_programs ORDER BY start_date DESC LIMIT 5;

-- 6. Aggregate: COUNT programs by status
SELECT status, COUNT(*) AS total_programs FROM relief_programs GROUP BY status;

-- 7. Aggregate: MAX, MIN dates
SELECT MAX(start_date) AS latest_start, MIN(start_date) AS earliest_start FROM relief_programs;

-- 8. Aggregate: SUM, AVG example (dummy numeric)
-- Assuming hypothetical numeric column 'budget' added
-- SELECT SUM(budget) AS total_budget, AVG(budget) AS avg_budget FROM relief_programs;

-- 9. DISTINCT categories
SELECT DISTINCT category FROM relief_programs;

-- 10. LIKE filter
SELECT * FROM relief_programs WHERE name LIKE '%Aid%';

-- 11. BETWEEN dates
SELECT * FROM relief_programs WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';

-- 12. IN clause
SELECT * FROM relief_programs WHERE category IN ('Health', 'Education');

-- 13. NOT IN clause
SELECT * FROM relief_programs WHERE status NOT IN ('Completed');

-- 14. IS NULL check
SELECT * FROM relief_programs WHERE officer_id IS NULL;

-- 15. IS NOT NULL
SELECT * FROM relief_programs WHERE officer_id IS NOT NULL;

-- 16. View: Active programs
CREATE OR REPLACE VIEW active_programs AS
SELECT id, name, category, status FROM relief_programs WHERE status = 'Active';

-- 17. View usage
SELECT * FROM active_programs;

-- 18. CTE: Programs starting after March
WITH march_programs AS (
    SELECT id, name, start_date FROM relief_programs WHERE start_date >= '2025-03-01'
)
SELECT * FROM march_programs;

-- 19. CTE with aggregation
WITH status_count AS (
    SELECT status, COUNT(*) AS total FROM relief_programs GROUP BY status
)
SELECT * FROM status_count;

-- 20. Window Function: Row number by start_date
SELECT id, name, status,
ROW_NUMBER() OVER (PARTITION BY status ORDER BY start_date) AS rn
FROM relief_programs;

-- 21. Window Function: Rank by start_date
SELECT id, name, status,
RANK() OVER (PARTITION BY status ORDER BY start_date DESC) AS rnk
FROM relief_programs;

-- 22. Window Function: Dense rank
SELECT id, name, status,
DENSE_RANK() OVER (PARTITION BY category ORDER BY start_date) AS drnk
FROM relief_programs;

-- 23. Window Function: COUNT over partition
SELECT category, status,
COUNT(*) OVER (PARTITION BY status) AS status_count
FROM relief_programs;

-- 24. Stored Procedure: Get programs by category (MySQL style)
DELIMITER $$
CREATE PROCEDURE GetProgramsByCategory(IN cat VARCHAR(50))
BEGIN
    SELECT * FROM relief_programs WHERE category = cat;
END$$
DELIMITER ;

-- 25. Call Stored Procedure
CALL GetProgramsByCategory('Health');

-- 26. Stored Procedure: Update status (MySQL)
DELIMITER $$
CREATE PROCEDURE UpdateProgramStatus(IN pid INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE relief_programs SET status = new_status WHERE id = pid;
END$$
DELIMITER ;

-- 27. Call update procedure
CALL UpdateProgramStatus(4, 'Active');

-- 28. Transaction: Example
START TRANSACTION;
UPDATE relief_programs SET status = 'Completed' WHERE id = 1;
UPDATE relief_programs SET status = 'Completed' WHERE id = 2;
COMMIT;

-- 29. Transaction rollback example
START TRANSACTION;
UPDATE relief_programs SET status = 'Pending' WHERE id = 3;
ROLLBACK;

-- 30. Grant select (DCL)
GRANT SELECT ON relief_programs TO 'user_readonly';

-- 31. Revoke select
REVOKE SELECT ON relief_programs FROM 'user_readonly';

-- 32. Trigger: Before insert, auto uppercase name
CREATE TRIGGER before_relief_insert
BEFORE INSERT ON relief_programs
FOR EACH ROW
SET NEW.name = UPPER(NEW.name);

-- 33. Trigger: After update, log changes (simplified)
CREATE TRIGGER after_status_update
AFTER UPDATE ON relief_programs
FOR EACH ROW
INSERT INTO program_log (program_id, old_status, new_status, change_date)
VALUES (OLD.id, OLD.status, NEW.status, NOW());

-- 34. Subquery: Get programs with officer_id max
SELECT * FROM relief_programs WHERE officer_id = (SELECT MAX(officer_id) FROM relief_programs);

-- 35. Subquery: Programs not Completed
SELECT * FROM relief_programs WHERE status <> (SELECT status FROM relief_programs WHERE id = 6);

-- 36. Subquery with IN
SELECT * FROM relief_programs WHERE category IN (SELECT DISTINCT category FROM relief_programs WHERE status='Active');

-- 37. EXISTS
SELECT * FROM relief_programs rp
WHERE EXISTS (SELECT 1 FROM relief_programs WHERE category=rp.category AND status='Active');

-- 38. NOT EXISTS
SELECT * FROM relief_programs rp
WHERE NOT EXISTS (SELECT 1 FROM relief_programs WHERE category=rp.category AND status='Completed');

-- 39. UNION example
SELECT id, name FROM relief_programs WHERE status='Active'
UNION
SELECT id, name FROM relief_programs WHERE status='Planned';

-- 40
SELECT r1.id, r1.name
FROM relief_programs r1
INNER JOIN relief_programs r2
    ON r1.id = r2.id
WHERE r1.status = 'Active'
  AND r2.category = 'Health';


-- 41. Self join: Programs starting same day
SELECT a.id AS program1, b.id AS program2, a.start_date
FROM relief_programs a
JOIN relief_programs b ON a.start_date = b.start_date AND a.id <> b.id;

-- 42. Aggregate with HAVING
SELECT category, COUNT(*) AS total
FROM relief_programs
GROUP BY category
HAVING COUNT(*) > 2;

-- 43. CASE statement
SELECT id, name, 
CASE WHEN status='Active' THEN 'Ongoing'
     WHEN status='Planned' THEN 'Upcoming'
     ELSE 'Finished' END AS program_status
FROM relief_programs;

-- 44. COALESCE example
SELECT id, name, COALESCE(description, 'No Description') AS desc_text
FROM relief_programs;

-- 45. CONCAT example
SELECT id, CONCAT(name, ' [', status, ']') AS program_info
FROM relief_programs;

-- 46. DATE function: YEAR
SELECT id, name, YEAR(start_date) AS start_year
FROM relief_programs;

-- 47. DATE function: MONTH
SELECT id, name, MONTH(start_date) AS start_month
FROM relief_programs;

-- 48. LIKE with wildcards
SELECT * FROM relief_programs WHERE name LIKE 'S%';

-- 49. IN + subquery combination
SELECT * FROM relief_programs
WHERE category IN (SELECT category FROM relief_programs WHERE status='Planned');

-- 50. Final SELECT: All planned programs with officer info (join example)
SELECT id, name, MONTH(start_date) AS start_month
FROM relief_programs;


-- table 3
CREATE TABLE disaster_events (
    id INT PRIMARY KEY,
    event_type VARCHAR(50),
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    location_id INT,
    severity_level VARCHAR(20),
    description TEXT,
    document_reference VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO disaster_events (id, event_type, name, start_date, end_date,location_id, severity_level, description, document_reference, status) VALUES
(1, 'Flood', 'Monsoon Flood 2025', '2025-06-01', '2025-06-10', 301, 'High', 'Severe flooding due to heavy rains in the region.', 'DOC-D001', 'Active'),
(2, 'Earthquake', 'Maharashtra Quake', '2025-05-15', '2025-05-15', 302, 'Critical', 'A 6.2 magnitude earthquake struck late evening.', 'DOC-D002', 'Resolved'),
(3, 'Cyclone', 'Cyclone Mira', '2025-04-20', '2025-04-25', 303, 'High', 'Cyclonic storm making landfall in coastal areas.', 'DOC-D003', 'Resolved'),
(4, 'Landslide', 'Western Ghats Slide', '2025-03-10', '2025-03-12', 304, 'Medium', 'Slope failure on hill roads.', 'DOC-D004', 'Active'),
(5, 'Heatwave', 'Summer Heat 2025', '2025-05-01', '2025-05-20', 305, 'Medium', 'Extended spells of high temperatures.', 'DOC-D005', 'Active'),
(6, 'Flood', 'River Tapi Flood', '2025-02-15', '2025-02-22', 306, 'High', 'River overflow causing localized flooding.', 'DOC-D006', 'Resolved'),
(7, 'Wildfire', 'Forest Fire Satara', '2025-01-30', '2025-02-05', 307, 'High', 'Wildfire spreading in forest region.', 'DOC-D007', 'Resolved'),
(8, 'Tsunami', 'Tsunami Alert 2025', '2025-03-01', '2025-03-02', 308, 'Critical', 'Coastal tsunami warning after offshore quake.', 'DOC-D008', 'Resolved'),
(9, 'Storm', 'Cyclonic Storm 2025', '2025-04-05', '2025-04-08', 309, 'Medium', 'Severe storm with high winds and rain.', 'DOC-D009', 'Resolved'),
(10, 'Flood', 'Monsoon Flood 2024', '2024-06-05', '2024-06-15', 310, 'High', 'Last year’s flooding event.', 'DOC-D010', 'Archived'),
(11, 'Earthquake', 'Gujarat Quake 2025', '2025-06-15', '2025-06-15', 311, 'Critical', 'Small earthquake recorded inland.', 'DOC-D011', 'Resolved'),
(12, 'Heatwave', 'Extreme Heat May', '2025-05-10', '2025-05-18', 312, 'High', 'Temperatures exceeded 45°C in several regions.', 'DOC-D012', 'Resolved'),
(13, 'Landslide', 'Landslide Kolhapur', '2025-04-12', '2025-04-14', 313, 'Medium', 'Hillside collapse blocking roads.', 'DOC-D013', 'Resolved'),
(14, 'Cyclone', 'Cyclone Zephyr', '2025-05-25', '2025-05-30', 314, 'High', 'Cyclonic winds caused coastal damage.', 'DOC-D014', 'Active'),
(15, 'Storm', 'Western Storm', '2025-02-20', '2025-02-22', 315, 'Medium', 'Storm and lightning across region.', 'DOC-D015', 'Resolved'),
(16, 'Wildfire', 'Fire in Nagpur Forest', '2025-03-20', '2025-03-25', 316, 'Medium', 'Forest blaze contained by fire services.', 'DOC-D016', 'Resolved'),
(17, 'Heatwave', 'April Heat Spike', '2025-04-01', '2025-04-07', 317, 'Medium', 'Temperatures 42‑44°C across plains.', 'DOC-D017', 'Resolved'),
(18, 'Flood', 'Flood Elora Creek', '2025-01-10', '2025-01-15', 318, 'High', 'Flash flooding after heavy rains.', 'DOC-D018', 'Resolved'),
(19, 'Landslide', 'Hill Road Slide', '2025-05-05', '2025-05-07', 319, 'Low', 'Minor landslide, quickly cleared.', 'DOC-D019', 'Resolved'),
(20, 'Storm', 'Storm Delta', '2025-06-10', '2025-06-12', 320, 'High', 'Storm surge and heavy rain.', 'DOC-D020', 'Active');

-- to display table data
    select * from disaster_events ;
   
 -- to reamove complete records from table
   truncate table disaster_events;
    
 -- to remove complete records and attribute from table
    drop table disaster_events;

-- 1. Simple SELECT all
SELECT * FROM disaster_events;

-- 2. SELECT specific columns
SELECT id, name, event_type, severity_level FROM disaster_events;

-- 3. SELECT with WHERE
SELECT * FROM disaster_events WHERE severity_level = 'High';

-- 4. SELECT with ORDER BY
SELECT * FROM disaster_events ORDER BY start_date DESC;

-- 5. SELECT with LIMIT / TOP (example for MySQL / SQL Server)
SELECT * FROM disaster_events LIMIT 5;

-- 6. Aggregate COUNT
SELECT event_type, COUNT(*) AS total_events FROM disaster_events GROUP BY event_type;

-- 7. Aggregate SUM / AVG (for numeric column if exists, here we use id as example)
SELECT AVG(id) AS avg_id, SUM(id) AS sum_id FROM disaster_events;

-- 8. DISTINCT values
SELECT DISTINCT event_type FROM disaster_events;

-- 9. LIKE / pattern matching
SELECT * FROM disaster_events WHERE name LIKE '%Flood%';

-- 10. BETWEEN dates
SELECT * FROM disaster_events WHERE start_date BETWEEN '2025-03-01' AND '2025-06-01';

-- 11. IN clause
SELECT * FROM disaster_events WHERE status IN ('Active', 'Resolved');

-- 12. JOIN with relief_programs example (assuming location_id match)
SELECT d.name AS disaster_name, r.name AS program_name
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id;

-- 13. LEFT JOIN
SELECT d.name, r.name
FROM disaster_events d
LEFT JOIN relief_programs r ON d.location_id = r.location_id;

-- 14. RIGHT JOIN
SELECT d.name, r.name
FROM disaster_events d
RIGHT JOIN relief_programs r ON d.location_id = r.location_id;

-- 15. Self JOIN example (events overlapping dates)
SELECT a.name AS event1, b.name AS event2
FROM disaster_events a
JOIN disaster_events b ON a.start_date <= b.end_date AND a.end_date >= b.start_date
WHERE a.id <> b.id;

-- 16. View creation
CREATE VIEW v_active_disasters AS
SELECT id, name, event_type, start_date, end_date, severity_level
FROM disaster_events WHERE status = 'Active';

-- 17. SELECT from view
SELECT * FROM v_active_disasters;

-- 18. CTE example
WITH high_severity AS (
    SELECT id, name, severity_level FROM disaster_events
    WHERE severity_level = 'High'
)
SELECT * FROM high_severity;

-- 19. CTE with aggregation
WITH event_counts AS (
    SELECT event_type, COUNT(*) AS total FROM disaster_events GROUP BY event_type
)
SELECT * FROM event_counts WHERE total > 2;

-- 20. Window function ROW_NUMBER
SELECT id, name, severity_level,
ROW_NUMBER() OVER (PARTITION BY severity_level ORDER BY start_date) AS rn
FROM disaster_events;

-- 21. Window function RANK
SELECT id, name, severity_level,
RANK() OVER (PARTITION BY severity_level ORDER BY start_date) AS rnk
FROM disaster_events;

-- 22. Window function DENSE_RANK
SELECT id, name, severity_level,
DENSE_RANK() OVER (PARTITION BY severity_level ORDER BY start_date) AS drnk
FROM disaster_events;

-- 23. Window function SUM (count per severity)
SELECT id, name, severity_level,
SUM(id) OVER (PARTITION BY severity_level) AS severity_sum
FROM disaster_events;

-- 24. Insert row
INSERT INTO disaster_events (id, event_type, name, start_date, end_date, location_id, severity_level, description, document_reference, status)
VALUES (21, 'Flood', 'Test Flood', '2025-07-01', '2025-07-03', 321, 'Low', 'Test description', 'DOC-D021', 'Active');

-- 25. Update row
UPDATE disaster_events SET status = 'Resolved' WHERE id = 1;

-- 26. Delete row
DELETE FROM disaster_events WHERE id = 21;

-- 27. Transaction example
START TRANSACTION;
UPDATE disaster_events SET severity_level = 'Critical' WHERE id = 5;
DELETE FROM disaster_events WHERE id = 20;
COMMIT;

-- 28. Rollback example
START TRANSACTION;
UPDATE disaster_events SET severity_level = 'Low' WHERE id = 6;
ROLLBACK;

-- 29. Grant permission (DCL)
GRANT SELECT, INSERT, UPDATE ON disaster_events TO 'relief_user';

-- 30. Revoke permission (DCL)
REVOKE UPDATE ON disaster_events FROM 'relief_user';

-- 31. Stored Procedure creation
DELIMITER //
CREATE PROCEDURE sp_get_active_disasters()
BEGIN
    SELECT * FROM disaster_events WHERE status = 'Active';
END //
DELIMITER ;

-- 32. Call stored procedure
CALL sp_get_active_disasters();

-- 33. Stored procedure with input
DELIMITER //
CREATE PROCEDURE sp_get_disasters_by_severity(IN sev VARCHAR(20))
BEGIN
    SELECT * FROM disaster_events WHERE severity_level = sev;
END //
DELIMITER ;

-- 34. Call with parameter
CALL sp_get_disasters_by_severity('High');

-- 35. Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_disaster
BEFORE INSERT ON disaster_events
FOR EACH ROW
SET NEW.status = 'Active' //
DELIMITER ;

-- 36. Trigger AFTER UPDATE
DELIMITER //
CREATE TRIGGER trg_after_update_disaster
AFTER UPDATE ON disaster_events
FOR EACH ROW
INSERT INTO resource_requests (id, program_id, item_required, quantity, request_date, status, location_id, officer_id, remarks, document_reference)
VALUES (NEW.id+100, 1, 'Emergency Kits', 50, CURDATE(), 'Pending', NEW.location_id, 201, 'Auto request', CONCAT('DOC-RR', NEW.id+100)) //
DELIMITER ;

-- 37. CASE statement
SELECT name, severity_level,
CASE
    WHEN severity_level = 'Critical' THEN 'High Priority'
    WHEN severity_level = 'High' THEN 'Medium Priority'
    ELSE 'Low Priority'
END AS priority
FROM disaster_events;

-- 38. EXISTS subquery
SELECT * FROM disaster_events d
WHERE EXISTS (SELECT 1 FROM relief_programs r WHERE r.location_id = d.location_id);

-- 39. NOT EXISTS subquery
SELECT * FROM disaster_events d
WHERE NOT EXISTS (SELECT 1 FROM relief_programs r WHERE r.location_id = d.location_id);

-- 40. UNION example
SELECT name, start_date FROM disaster_events WHERE severity_level = 'High'
UNION
SELECT name, start_date FROM disaster_events WHERE severity_level = 'Critical';

-- 41. MIN/MAX
SELECT MIN(start_date) AS first_event, MAX(end_date) AS last_event FROM disaster_events;

-- 43. LIKE multiple patterns
SELECT * FROM disaster_events WHERE name LIKE '%Storm%' OR name LIKE '%Cyclone%';

-- 44. GROUP BY with HAVING
SELECT severity_level, COUNT(*) AS total FROM disaster_events
GROUP BY severity_level HAVING COUNT(*) > 2;

-- 45. UPDATE with JOIN
UPDATE disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id
SET d.status = 'Completed'
WHERE r.status = 'Completed';

-- 46. DELETE with JOIN
DELETE d FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id
WHERE r.status = 'Archived';

-- 47. Subquery in SELECT
SELECT id, name, (SELECT COUNT(*) FROM resource_requests rr WHERE rr.location_id = d.location_id) AS total_requests
FROM disaster_events d;

-- 48. EXISTS with window
SELECT * FROM disaster_events d
WHERE EXISTS (SELECT 1 FROM disaster_events dd WHERE dd.severity_level = 'High' AND dd.location_id = d.location_id);

-- 49. Window function with LEAD
SELECT id, name, start_date,
LEAD(start_date) OVER (ORDER BY start_date) AS next_event_start
FROM disaster_events;

-- 50. Window function with LAG
SELECT id, name, start_date,
LAG(start_date) OVER (ORDER BY start_date) AS previous_event_start
FROM disaster_events;


-- table 4
CREATE TABLE fund_allocations (
    id INT PRIMARY KEY,
    program_id INT,
    amount_allocated DECIMAL(12,2),
    amount_spent DECIMAL(12,2),
    fiscal_year VARCHAR(10),
    officer_id INT,
    status VARCHAR(20),
    remarks TEXT,
    document_reference VARCHAR(100),
    date_created DATE
);

INSERT INTO fund_allocations (id, program_id, amount_allocated, amount_spent,fiscal_year, officer_id, status, remarks, document_reference, date_created) VALUES
(1, 1, 500000.00, 200000.00, '2024-25', 101, 'Ongoing', 'Initial allocation', 'DOC-F001', '2024-04-01'),
(2, 2, 300000.00, 150000.00, '2024-25', 102, 'Ongoing', 'Medical fund', 'DOC-F002', '2024-04-05'),
(3, 3, 800000.00, 400000.00, '2024-25', 103, 'Ongoing', 'Shelter expenses', 'DOC-F003', '2024-04-10'),
(4, 4, 250000.00, 100000.00, '2024-25', 104, 'Planned', 'Training budget', 'DOC-F004', '2024-04-15'),
(5, 5, 450000.00, 0.00, '2024-25', 105, 'Planned', 'Education support', 'DOC-F005', '2024-04-20'),
(6, 6, 300000.00, 300000.00, '2023-24', 106, 'Completed', 'Completed water project', 'DOC-F006', '2023-04-01'),
(7, 7, 350000.00, 200000.00, '2024-25', 107, 'Ongoing', 'Sanitation initiative', 'DOC-F007', '2024-04-25'),
(8, 8, 200000.00, 200000.00, '2023-24', 108, 'Completed', 'Cash relief payout', 'DOC-F008', '2023-05-01'),
(9, 9, 600000.00, 300000.00, '2024-25', 109, 'Ongoing', 'Insurance premium', 'DOC-F009', '2024-05-05'),
(10, 10, 550000.00, 0.00, '2024-25', 110, 'Planned', 'Microloan reserve', 'DOC-F010', '2024-05-10'),
(11, 11, 150000.00, 150000.00, '2023-24', 111, 'Completed', 'Awareness workshops', 'DOC-F011', '2023-01-15'),
(12, 12, 400000.00, 100000.00, '2024-25', 112, 'Ongoing', 'Women empowerment', 'DOC-F012', '2024-05-15'),
(13, 13, 500000.00, 250000.00, '2024-25', 113, 'Ongoing', 'Farmer subsidy', 'DOC-F013', '2024-05-20'),
(14, 14, 320000.00, 0.00, '2024-25', 114, 'Planned', 'Child nutrition', 'DOC-F014', '2024-05-25'),
(15, 15, 450000.00, 0.00, '2024-25', 115, 'Planned', 'Old age pensions', 'DOC-F015', '2024-05-30'),
(16, 16, 200000.00, 200000.00, '2023-24', 116, 'Completed', 'Tree plantation', 'DOC-F016', '2023-06-01'),
(17, 17, 180000.00, 80000.00, '2024-25', 117, 'Ongoing', 'Legal aid', 'DOC-F017', '2024-06-05'),
(18, 18, 220000.00, 110000.00, '2024-25', 118, 'Ongoing', 'Disability support', 'DOC-F018', '2024-06-10'),
(19, 19, 275000.00, 275000.00, '2023-24', 119, 'Completed', 'Emergency kit supplies', 'DOC-F019', '2023-06-15'),
(20, 20, 330000.00, 0.00, '2024-25', 120, 'Planned', 'Reforestation funding', 'DOC-F020', '2024-06-20');

-- to display table data
    select * from fund_allocations ;
   
 -- to reamove complete records from table
   truncate table fund_allocations;
    
 -- to remove complete records and attribute from table
    drop table fund_allocations;

-- 1. Simple SELECT
SELECT * FROM fund_allocations;

-- 2. SELECT with WHERE
SELECT * FROM fund_allocations WHERE status='Ongoing';

-- 3. SELECT specific columns
SELECT program_id, amount_allocated, amount_spent FROM fund_allocations;

-- 4. SELECT with ORDER BY
SELECT * FROM fund_allocations ORDER BY amount_allocated DESC;

-- 5. SELECT with LIMIT
SELECT * FROM fund_allocations LIMIT 5;

-- 6. Aggregate SUM
SELECT SUM(amount_allocated) AS total_allocated FROM fund_allocations;

-- 7. Aggregate AVG
SELECT AVG(amount_spent) AS avg_spent FROM fund_allocations;

-- 8. Aggregate MAX
SELECT MAX(amount_allocated) AS max_allocated FROM fund_allocations;

-- 9. Aggregate MIN
SELECT MIN(amount_spent) AS min_spent FROM fund_allocations;

-- 10. COUNT
SELECT COUNT(*) AS total_records FROM fund_allocations;

-- 11. GROUP BY status
SELECT status, SUM(amount_allocated) AS total_allocated FROM fund_allocations GROUP BY status;

-- 12. HAVING clause
SELECT status, SUM(amount_spent) AS total_spent 
FROM fund_allocations 
GROUP BY status 
HAVING SUM(amount_spent) > 200000;

-- 13. View creation
CREATE OR REPLACE VIEW ongoing_funds AS 
SELECT * FROM fund_allocations WHERE status='Ongoing';

-- 14. SELECT from view
SELECT * FROM ongoing_funds;

-- 15. CTE example
WITH high_allocations AS (
  SELECT * FROM fund_allocations WHERE amount_allocated > 400000
)
SELECT * FROM high_allocations;

-- 16. CTE with aggregate
WITH yearly_summary AS (
  SELECT fiscal_year, SUM(amount_allocated) AS total_allocated
  FROM fund_allocations
  GROUP BY fiscal_year
)
SELECT * FROM yearly_summary;

-- 17. Window function: ROW_NUMBER
SELECT id, program_id, amount_allocated,
       ROW_NUMBER() OVER (ORDER BY amount_allocated DESC) AS row_num
FROM fund_allocations;

-- 18. Window function: RANK
SELECT id, program_id, amount_allocated,
       RANK() OVER (ORDER BY amount_allocated DESC) AS rank_num
FROM fund_allocations;

-- 19. Window function: DENSE_RANK
SELECT id, program_id, amount_allocated,
       DENSE_RANK() OVER (ORDER BY amount_allocated DESC) AS dense_rank_num
FROM fund_allocations;

-- 20. Window function: SUM over partition
SELECT id, program_id, fiscal_year, amount_allocated,
       SUM(amount_allocated) OVER (PARTITION BY fiscal_year) AS year_total
FROM fund_allocations;

-- 21. Window function: AVG over partition
SELECT id, program_id, fiscal_year, amount_spent,
       AVG(amount_spent) OVER (PARTITION BY fiscal_year) AS avg_year_spent
FROM fund_allocations;

-- 22. Stored Procedure: Get allocations by officer
DELIMITER $$
CREATE PROCEDURE get_allocations_by_officer(IN officer INT)
BEGIN
  SELECT * FROM fund_allocations WHERE officer_id = officer;
END$$
DELIMITER ;

-- 23. Call stored procedure
CALL get_allocations_by_officer(101);

-- 24. Stored Procedure: Update status
DELIMITER $$
CREATE PROCEDURE update_fund_status(IN fund_id INT, IN new_status VARCHAR(20))
BEGIN
  UPDATE fund_allocations SET status = new_status WHERE id = fund_id;
END$$
DELIMITER ;

-- 25. Call update procedure
CALL update_fund_status(5, 'Ongoing');

-- 26. DCL: Grant SELECT
GRANT SELECT ON fund_allocations TO 'user_demo'@'localhost';

-- 27. DCL: Revoke SELECT
REVOKE SELECT ON fund_allocations FROM 'user_demo'@'localhost';

-- 28. TCL: COMMIT example
START TRANSACTION;
UPDATE fund_allocations SET amount_spent=500000 WHERE id=1;
COMMIT;

-- 29. TCL: ROLLBACK example
START TRANSACTION;
UPDATE fund_allocations SET amount_spent=0 WHERE id=2;
ROLLBACK;

-- 30. TCL: SAVEPOINT example
START TRANSACTION;
SAVEPOINT before_update;
UPDATE fund_allocations SET amount_spent=100000 WHERE id=3;
ROLLBACK TO SAVEPOINT before_update;
COMMIT;

-- 31. Trigger: Before Insert
DELIMITER $$
CREATE TRIGGER before_insert_fund
BEFORE INSERT ON fund_allocations
FOR EACH ROW
BEGIN
  IF NEW.amount_allocated < 0 THEN
    SET NEW.amount_allocated = 0;
  END IF;
END$$
DELIMITER ;

-- 32. Trigger: After Insert
DELIMITER $$
CREATE TRIGGER after_insert_fund
AFTER INSERT ON fund_allocations
FOR EACH ROW
BEGIN
  INSERT INTO audit_log(table_name, action, record_id, action_date)
  VALUES('fund_allocations','INSERT', NEW.id, NOW());
END$$
DELIMITER ;

-- 33. SELECT with CASE
SELECT id, amount_spent,
       CASE
         WHEN amount_spent = 0 THEN 'Not spent'
         WHEN amount_spent < amount_allocated THEN 'Partially spent'
         ELSE 'Fully spent'
       END AS spending_status
FROM fund_allocations;

-- 34. Subquery in SELECT
SELECT id, amount_allocated,
       (SELECT SUM(amount_spent) FROM fund_allocations f2 WHERE f2.fiscal_year = f1.fiscal_year) AS total_spent_year
FROM fund_allocations f1;

-- 35. Subquery in WHERE
SELECT * FROM fund_allocations
WHERE amount_allocated > (SELECT AVG(amount_allocated) FROM fund_allocations);

-- 36. Subquery in FROM
SELECT fiscal_year, total_allocated
FROM (SELECT fiscal_year, SUM(amount_allocated) AS total_allocated FROM fund_allocations GROUP BY fiscal_year) AS yearly_totals;

-- 37. JOIN example (Assume programs table exists)
SELECT f.id, f.amount_allocated, p.program_name
FROM fund_allocations f
JOIN programs p ON f.program_id = p.id;

-- 38. LEFT JOIN example
SELECT f.id, f.amount_allocated, p.program_name
FROM fund_allocations f
LEFT JOIN programs p ON f.program_id = p.id;

-- 39. RIGHT JOIN example
SELECT f.id, f.amount_allocated, p.program_name
FROM fund_allocations f
RIGHT JOIN programs p ON f.program_id = p.id;

-- 40. UNION example
SELECT officer_id, amount_allocated FROM fund_allocations WHERE status='Ongoing'
UNION
SELECT officer_id, amount_allocated FROM fund_allocations WHERE status='Planned';

-- 41. UNION ALL example
SELECT officer_id, amount_allocated FROM fund_allocations WHERE status='Ongoing'
UNION ALL
SELECT officer_id, amount_allocated FROM fund_allocations WHERE status='Planned';

-- 42. DISTINCT example
SELECT DISTINCT fiscal_year FROM fund_allocations;

-- 43. LIKE example
SELECT * FROM fund_allocations WHERE remarks LIKE '%fund%';

-- 44. IN example
SELECT * FROM fund_allocations WHERE status IN ('Ongoing', 'Planned');

-- 45. BETWEEN example
SELECT * FROM fund_allocations WHERE amount_allocated BETWEEN 200000 AND 400000;

-- 46. IS NULL example
SELECT * FROM fund_allocations WHERE document_reference IS NULL;

-- 47. IS NOT NULL example
SELECT * FROM fund_allocations WHERE document_reference IS NOT NULL;

-- 48. DELETE example
DELETE FROM fund_allocations WHERE id=20;

-- 49. UPDATE example
UPDATE fund_allocations SET remarks='Updated remark' WHERE id=1;

-- 50. INSERT example
INSERT INTO fund_allocations (id, program_id, amount_allocated, amount_spent, fiscal_year, officer_id, status, remarks, document_reference, date_created)
VALUES (21, 21, 100000.00, 0.00, '2024-25', 121, 'Planned', 'New fund allocation', 'DOC-F021', '2024-06-25');


-- table 5
CREATE TABLE aid_distribution (
    id INT PRIMARY KEY,
    citizen_id INT,
    program_id INT,
    item_description TEXT,
    quantity INT,
    distribution_date DATE,
    location_id INT,
    officer_id INT,
    status VARCHAR(20),
    remarks TEXT
);

INSERT INTO aid_distribution (id, citizen_id, program_id, item_description, quantity,distribution_date, location_id, officer_id, status, remarks) VALUES
(1, 1001, 1, 'Rice bags (10 kg)', 50, '2025-06-01', 201, 301, 'Delivered', 'Allotted to village 1'),
(2, 1002, 1, 'Rice bags (10 kg)', 40, '2025-06-01', 201, 302, 'Delivered', 'Allocation correct'),
(3, 1003, 2, 'Health Kit', 20, '2025-06-02', 202, 303, 'Delivered', 'Checked by officer'),
(4, 1004, 2, 'Health Kit', 25, '2025-06-02', 202, 304, 'Pending', 'Awaiting confirmation'),
(5, 1005, 3, 'Blankets', 30, '2025-06-03', 203, 305, 'Delivered', 'Distributed to families'),
(6, 1006, 3, 'Blankets', 35, '2025-06-03', 203, 306, 'Delivered', 'Quality verified'),
(7, 1007, 4, 'Cash Voucher', 100, '2025-06-04', 204, 307, 'Delivered', 'Voucher code sent'),
(8, 1008, 4, 'Cash Voucher', 150, '2025-06-04', 204, 308, 'Pending', 'Pending activation'),
(9, 1009, 5, 'Clothing Pack', 10, '2025-06-05', 205, 309, 'Delivered', 'Sizes M/L'),
(10, 1010, 5, 'Clothing Pack', 12, '2025-06-05', 205, 310, 'Delivered', 'Sizes S/M'),
(11, 1011, 6, 'Water Purifier', 5, '2025-06-06', 206, 311, 'Delivered', 'Installed'),
(12, 1012, 6, 'Water Purifier', 3, '2025-06-06', 206, 312, 'Pending', 'Technician delayed'),
(13, 1013, 7, 'Sanitation Kit', 40, '2025-06-07', 207, 313, 'Delivered', ''),
(14, 1014, 7, 'Sanitation Kit', 45, '2025-06-07', 207, 314, 'Delivered', 'Distributed to women'),
(15, 1015, 8, 'Cash Relief', 200, '2025-06-08', 208, 315, 'Delivered', 'Urgent case'),
(16, 1016, 8, 'Cash Relief', 250, '2025-06-08', 208, 316, 'Pending', 'Proof required'),
(17, 1017, 9, 'Seed Packets', 100, '2025-06-09', 209, 317, 'Delivered', 'For next planting'),
(18, 1018, 9, 'Seed Packets', 120, '2025-06-09', 209, 318, 'Delivered', 'Mixed varieties'),
(19, 1019, 10, 'Microloan', 1, '2025-06-10', 210, 319, 'Delivered', 'Started repayment'),
(20, 1020, 10, 'Microloan', 1, '2025-06-10', 210, 320, 'Delivered', 'Schedule set');

-- to display table data
    select * from aid_distribution;
   
 -- to reamove complete records from table
   truncate table aid_distribution;
    
 -- to remove complete records and attribute from table
    drop table aid_distribution;

-- 1. Simple SELECT
SELECT * FROM aid_distribution;

-- 2. SELECT specific columns
SELECT citizen_id, program_id, item_description, quantity FROM aid_distribution;

-- 3. SELECT with WHERE
SELECT * FROM aid_distribution WHERE status='Delivered';

-- 4. SELECT with ORDER BY
SELECT * FROM aid_distribution ORDER BY distribution_date DESC;

-- 5. SELECT with LIMIT
SELECT * FROM aid_distribution LIMIT 5;

-- 6. SELECT with aggregation
SELECT program_id, SUM(quantity) AS total_quantity FROM aid_distribution GROUP BY program_id;

-- 7. SELECT with HAVING
SELECT program_id, SUM(quantity) AS total_quantity FROM aid_distribution GROUP BY program_id HAVING total_quantity > 100;

-- 8. DISTINCT values
SELECT DISTINCT status FROM aid_distribution;

-- 9. COUNT total records
SELECT COUNT(*) AS total_records FROM aid_distribution;

-- 10. COUNT per program
SELECT program_id, COUNT(*) AS records_per_program FROM aid_distribution GROUP BY program_id;

-- 11. MIN quantity
SELECT MIN(quantity) AS min_quantity FROM aid_distribution;

-- 12. MAX quantity
SELECT MAX(quantity) AS max_quantity FROM aid_distribution;

-- 13. AVG quantity
SELECT AVG(quantity) AS avg_quantity FROM aid_distribution;

-- 14. SUM quantity
SELECT SUM(quantity) AS sum_quantity FROM aid_distribution;

-- 15. JOIN with relief_programs (assuming program_id FK)
SELECT a.id, a.citizen_id, r.name, a.quantity
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id;

-- 16. LEFT JOIN
SELECT a.id, a.citizen_id, r.name, a.quantity
FROM aid_distribution a
LEFT JOIN relief_programs r ON a.program_id = r.id;

-- 17. RIGHT JOIN
SELECT a.id, a.citizen_id, r.name, a.quantity
FROM aid_distribution a
RIGHT JOIN relief_programs r ON a.program_id = r.id;

-- 19. UNION example
SELECT citizen_id, quantity FROM aid_distribution WHERE status='Delivered'
UNION
SELECT citizen_id, quantity FROM aid_distribution WHERE status='Pending';

-- 20. Subquery
SELECT * FROM aid_distribution WHERE program_id IN (SELECT id FROM relief_programs WHERE category='Food');

-- 21. CTE example
WITH total_items AS (
    SELECT program_id, SUM(quantity) AS total_quantity
    FROM aid_distribution
    GROUP BY program_id
)
SELECT * FROM total_items;

-- 22. CTE with filtering
WITH pending_items AS (
    SELECT program_id, COUNT(*) AS pending_count
    FROM aid_distribution
    WHERE status='Pending'
    GROUP BY program_id
)
SELECT * FROM pending_items WHERE pending_count>1;

-- 23. Create simple VIEW
CREATE OR REPLACE VIEW delivered_items AS
SELECT * FROM aid_distribution WHERE status='Delivered';

-- 24. SELECT from VIEW
SELECT * FROM delivered_items;

-- 25. Stored Procedure: get aid by program
DELIMITER $$
CREATE PROCEDURE GetAidByProgram(IN prog_id INT)
BEGIN
    SELECT * FROM aid_distribution WHERE program_id = prog_id;
END$$
DELIMITER ;

-- 26. Call stored procedure
CALL GetAidByProgram(1);

-- 27. Window function: ROW_NUMBER
SELECT id, citizen_id, program_id, ROW_NUMBER() OVER(PARTITION BY program_id ORDER BY distribution_date) AS row_num FROM aid_distribution;

-- 28. Window function: RANK
SELECT id, citizen_id, program_id, RANK() OVER(PARTITION BY program_id ORDER BY quantity DESC) AS rank_quantity FROM aid_distribution;

-- 29. Window function: SUM
SELECT program_id, quantity, SUM(quantity) OVER(PARTITION BY program_id) AS running_total FROM aid_distribution;

-- 30. Window function: AVG
SELECT program_id, quantity, AVG(quantity) OVER(PARTITION BY program_id) AS avg_quantity FROM aid_distribution;

-- 31. UPDATE record
UPDATE aid_distribution SET status='Delivered' WHERE id=4;

-- 32. DELETE record
DELETE FROM aid_distribution WHERE id=20;

-- 33. INSERT record
INSERT INTO aid_distribution (id,citizen_id,program_id,item_description,quantity,distribution_date,location_id,officer_id,status,remarks)
VALUES (21,1021,1,'Rice bags (10 kg)',30,'2025-06-11',201,321,'Pending','New allocation');

-- 34. GRANT privileges
GRANT SELECT, INSERT, UPDATE ON aid_distribution TO 'user1'@'localhost';

-- 35. REVOKE privileges
REVOKE UPDATE ON aid_distribution FROM 'user1'@'localhost';

-- 36. START TRANSACTION
START TRANSACTION;

-- 37. Transaction: multiple updates
UPDATE aid_distribution SET status='Delivered' WHERE id=8;
UPDATE aid_distribution SET remarks='Confirmed' WHERE id=8;

-- 38. COMMIT
COMMIT;

-- 39. ROLLBACK example
START TRANSACTION;
UPDATE aid_distribution SET quantity=999 WHERE id=5;
ROLLBACK;

-- 40. Trigger BEFORE INSERT
DELIMITER $$
CREATE TRIGGER trg_before_insert_aid
BEFORE INSERT ON aid_distribution
FOR EACH ROW
SET NEW.remarks = IFNULL(NEW.remarks,'No remarks')$$
DELIMITER ;

-- 41. Trigger AFTER INSERT
DELIMITER $$
CREATE TRIGGER trg_after_insert_aid
AFTER INSERT ON aid_distribution
FOR EACH ROW
INSERT INTO audit_log(table_name, record_id, action) VALUES('aid_distribution', NEW.id, 'INSERT')$$
DELIMITER ;

-- 42. Trigger BEFORE UPDATE
DELIMITER $$
CREATE TRIGGER trg_before_update_status
BEFORE UPDATE ON aid_distribution
FOR EACH ROW
SET NEW.remarks = CONCAT('Updated on ', NOW())$$
DELIMITER ;

-- 43. SELECT with LIKE
SELECT * FROM aid_distribution WHERE item_description LIKE '%Rice%';

-- 44. SELECT with BETWEEN
SELECT * FROM aid_distribution WHERE distribution_date BETWEEN '2025-06-01' AND '2025-06-05';

-- 45. SELECT with IN
SELECT * FROM aid_distribution WHERE status IN ('Delivered','Pending');

-- 46. SELECT with NOT IN
SELECT * FROM aid_distribution WHERE status NOT IN ('Delivered');

-- 47. SELECT with CASE
SELECT id, status, CASE WHEN quantity>50 THEN 'High' ELSE 'Low' END AS quantity_level FROM aid_distribution;

-- 48. DELETE with condition
DELETE FROM aid_distribution WHERE status='Pending' AND distribution_date<'2025-06-05';

-- 49. UPDATE with calculation
UPDATE aid_distribution SET quantity=quantity+10 WHERE program_id=1;

-- 50. SELECT top N per program using window
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY program_id ORDER BY quantity DESC) AS rn
    FROM aid_distribution
) t WHERE rn <= 2;


-- table 6
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

INSERT INTO locations (id, district, taluka, village, pincode,latitude, longitude, population, zone_type, status) VALUES
(1, 'Pune', 'Mulshi', 'Belawade', '411057', 18.505007, 73.518105, 1200, 'Rural', 'Active'),
(2, 'Pune', 'Maval', 'Kamshet', '410405', 18.810000, 73.555000, 5000, 'Rural', 'Active'),
(3, 'Ahmednagar', 'Kopargaon', 'Kolapewadi', '423602', 19.8938, 74.3624, 2500, 'Rural', 'Active'),
(4, 'Nagpur', 'Lakhandur', 'Dighori Mothi', '441805', 20.886991, 79.930843, 5728, 'Rural', 'Active'),
(5, 'Pune', 'Mulshi', 'Mulshi', '412108', 18.505007, 73.518105, 1800, 'Rural', 'Active'),
(6, 'Pune', 'Pimpri-Chinchwad', 'Pimpri', '411017', 18.616667, 73.800000, 1200000, 'Urban', 'Active'),
(7, 'Pune', 'Pimpri-Chinchwad', 'Chinchwad', '411019', 18.620000, 73.800000, 800000, 'Urban', 'Active'),
(8, 'Maharashtra', '---', 'Akola (village)', '413401', 17.372799, 75.148499, 3500, 'Rural', 'Active'),
(9, 'Pune', 'Maval', 'Adavi', '410405', 18.770000, 73.680000, 800, 'Rural', 'Active'),
(10, 'Pune', 'Maval', 'Lonavala', '410401', 18.759356, 73.464700, 50000, 'Urban', 'Active'),
(11, 'Palghar', 'Dahanu', 'Chinchani', '401503', 19.985000, 72.720000, 13435, 'Urban', 'Active'),
(12, 'Pune', 'Mulshi', 'Ambegaon', '412115', 18.650000, 73.433300, 1500, 'Rural', 'Active'),
(13, 'Pune', 'Mulshi', 'Karjat', '410201', 18.900000, 73.330000, 25000, 'Urban', 'Active'),
(14, 'Pune', 'Maval', 'Gahunje', '410101', 18.690000, 73.780000, 2000, 'Rural', 'Active'),
(15, 'Pune', 'Pune City', 'Pune', '411001', 18.520430, 73.856743, 3124458, 'Urban', 'Active'),
(16, 'Pune', 'Mulshi', 'Aundhe Khurd', '410405', 18.750000, 73.690000, 600, 'Rural', 'Active'),
(17, 'Pune', 'Maval', 'Tikona', '410405', 18.770000, 73.620000, 300, 'Rural', 'Active'),
(18, 'Ahmednagar', 'Kopargaon', 'Anchalgaon', '423601', 19.900000, 74.354000, 1600, 'Rural', 'Active'),
(19, 'Ahmednagar', 'Kopargaon', 'Manjur', '423605', 19.910000, 74.360000, 1800, 'Rural', 'Active'),
(20, 'Ahmednagar', 'Kopargaon', 'Padhegaon', '423605', 19.920000, 74.370000, 1900, 'Rural', 'Active');

-- to display table data
    select * from locations;
   
 -- to reamove complete records from table
   truncate table locations;
    
 -- to remove complete records and attribute from table
    drop table locations;



-- table 7
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

INSERT INTO government_officers (id, name, designation, department, contact_number, email,office_address, location_id, joining_date, status) VALUES
(1, 'Bipul Pathak', 'Additional Chief Secretary', 'Finance & Planning', '9123456001', 'b.pathak@maha.gov.in', 'Mantralaya, Mumbai', 13, '2022-06-30', 'Active'),
(2, 'Ashish Chandra Verma', 'Principal Secretary', 'Home Affairs', '9123456002', 'a.verma@maha.gov.in', 'Mantralaya, Mumbai', 13, '2020-11-15', 'Active'),
(3, 'Sandeep Kumar', 'Principal Secretary', 'Vigilance', '9123456003', 's.kumar@maha.gov.in', 'Vigilance Bhavan, Mumbai', 13, '2021-07-10', 'Active'),
(4, 'Pandurang K Pole', 'Secretary', 'Urban Development', '9123456004', 'p.pole@maha.gov.in', 'UD Dept., Mumbai', 13, '2021-03-05', 'Active'),
(5, 'A Nedunchezhiyan', 'Principal Director', 'Fire Services', '9123456005', 'a.nedunchezhiyan@maha.gov.in', 'Delhi Fire HQ, Mumbai', 13, '2023-01-20', 'Active'),
(6, 'Arun Kumar Mishra', 'Director', 'Municipal Corporation', '9123456006', 'a.mishra@maha.gov.in', 'MC Office, Mumbai', 13, '2023-01-25', 'Active'),
(7, 'Dr. Nitin Kareer', 'Additional Chief Secretary', 'Forests', '9123456007', 'n.kareer@maha.gov.in', 'Forest Dept., Mumbai', 13, '2024-05-10', 'Active'),
(8, 'Ramesh Chavan', 'Joint Secretary', 'Revenue', '9123456008', 'r.chavan@maha.gov.in', 'Revenue Dept., Mumbai', 13, '2024-05-10', 'Active'),
(9, 'Kiran Wadte', 'Deputy Secretary', 'State Excise', '9123456009', 'k.wadte@maha.gov.in', 'Excise Dept., Mumbai', 13, '2024-05-10', 'Active'),
(10, 'Shivaji Chaoure', 'Under Secretary', 'Social Justice', '9123456010', 's.chaoure@maha.gov.in', 'Social Justice Bhavan, Mumbai', 13, '2024-05-10', 'Active'),
(11, 'Hari Nath Mishra', 'Secretary', 'Security', '9123456011', 'h.mishra@maha.gov.in', 'Security Offices, Mumbai', 13, '2024-12-01', 'Active'),
(12, 'Tapan Deka', 'Director General', 'Intelligence Bureau', '9123456012', 't.deka@maha.gov.in', 'IB Headquarters, Mumbai', 13, '2022-07-01', 'Active'),
(13, 'Ravi Sinha', 'Secretary', 'Research & Analysis Wing', '9123456013', 'r.sinha@maha.gov.in', 'RAW HQ, Mumbai', 13, '2023-06-30', 'Active'),
(14, 'Praveen Sood', 'Director', 'Central Bureau of Investigation', '9123456014', 'p.sood@maha.gov.in', 'CBI, Mumbai', 13, '2023-05-25', 'Active'),
(15, 'Daljit Singh Chaudhary', 'Director General', 'BSF', '9123456015', 'd.chaudhary@maha.gov.in', 'BSF HQ, Delhi', 13, '2024-08-28', 'Active'),
(16, 'Gyanendra Pratap Singh', 'Director General', 'CRPF', '9123456016', 'g.singh@maha.gov.in', 'CRPF HQ, Delhi', 13, '2025-01-20', 'Active'),
(17, 'Rajwinder Singh Bhatti', 'Director General', 'CISF', '9123456017', 'r.bhatti@maha.gov.in', 'CISF HQ, Delhi', 13, '2024-08-28', 'Active'),
(18, 'Rahul Rasgotra', 'Director General', 'ITBP', '9123456018', 'r.rasgotra@maha.gov.in', 'ITBP HQ, Delhi', 13, '2024-01-01', 'Active'),
(19, 'Amrit Mohan Prasad', 'Director General', 'SSB', '9123456019', 'a.prasad@maha.gov.in', 'SSB HQ, Delhi', 13, '2024-09-15', 'Active'),
(20, 'B. Srinivasan', 'Director General', 'NSG', '9123456020', 'b.srinivasan@maha.gov.in', 'NSG HQ, Delhi', 13, '2024-08-28', 'Active');

-- to display table data
    select * from government_officers;
   
 -- to reamove complete records from table
   truncate table government_officers;
    
 -- to remove complete records and attribute from table
    drop table government_officers;
    
    -- 1. Simple SELECT
SELECT * FROM locations;

-- 2. SELECT specific columns
SELECT district, village, population FROM locations;

-- 3. WHERE clause
SELECT * FROM locations WHERE population > 10000;

-- 4. ORDER BY
SELECT * FROM locations ORDER BY population DESC;

-- 5. GROUP BY
SELECT district, COUNT(*) AS village_count FROM locations GROUP BY district;

-- 6. HAVING
SELECT district, COUNT(*) AS village_count FROM locations GROUP BY district HAVING COUNT(*) > 3;

-- 7. JOIN with fund_allocations
SELECT l.village, f.amount_allocated 
FROM locations l 
JOIN fund_allocations f ON l.id = f.officer_id;

-- 8. LEFT JOIN
SELECT l.village, f.amount_allocated 
FROM locations l 
LEFT JOIN fund_allocations f ON l.id = f.officer_id;

-- 10. RIGHT JOIN
SELECT l.village, f.amount_allocated 
FROM locations l 
RIGHT JOIN fund_allocations f ON l.id = f.officer_id;

-- 11. DISTINCT
SELECT DISTINCT district FROM locations;

-- 12. LIMIT / TOP
SELECT * FROM locations LIMIT 5;

-- 13. Subquery in SELECT
SELECT village, (SELECT COUNT(*) FROM aid_distribution a WHERE a.location_id = l.id) AS aid_count
FROM locations l;

-- 14. Subquery in WHERE
SELECT * FROM locations WHERE id IN (SELECT location_id FROM aid_distribution WHERE quantity > 50);

-- 15. EXISTS
SELECT * FROM locations l WHERE EXISTS (SELECT 1 FROM aid_distribution a WHERE a.location_id = l.id);

-- 16. NOT EXISTS
SELECT * FROM locations l WHERE NOT EXISTS (SELECT 1 FROM aid_distribution a WHERE a.location_id = l.id);

-- 17. CASE statement
SELECT village, 
       CASE WHEN population > 5000 THEN 'Large' ELSE 'Small' END AS size_category
FROM locations;

-- 18. Aggregate SUM
SELECT SUM(population) AS total_population FROM locations;

-- 19. AVG
SELECT AVG(population) AS avg_population FROM locations;

-- 20. MIN/MAX
SELECT MIN(population) AS min_pop, MAX(population) AS max_pop FROM locations;

-- 21. View creation
CREATE OR REPLACE VIEW village_summary AS
SELECT district, COUNT(*) AS total_villages, SUM(population) AS total_population
FROM locations GROUP BY district;

-- 22. Select from view
SELECT * FROM village_summary;

-- 23. CTE
WITH rural_locations AS (
    SELECT * FROM locations WHERE zone_type = 'Rural'
)
SELECT district, COUNT(*) AS rural_count FROM rural_locations GROUP BY district;

-- 24. Recursive CTE (example for hierarchy)
WITH RECURSIVE location_hierarchy(id, district, taluka) AS (
    SELECT id, district, taluka FROM locations WHERE id = 1
    UNION ALL
    SELECT l.id, l.district, l.taluka
    FROM locations l
    INNER JOIN location_hierarchy lh ON l.id = lh.id + 1
)
SELECT * FROM location_hierarchy;

-- 25. Stored Procedure
DELIMITER //
CREATE PROCEDURE get_location_by_district(IN dist_name VARCHAR(50))
BEGIN
    SELECT * FROM locations WHERE district = dist_name;
END //
DELIMITER ;

-- 26. Call procedure
CALL get_location_by_district('Pune');

-- 27. Window function ROW_NUMBER
SELECT id, village, ROW_NUMBER() OVER(PARTITION BY district ORDER BY population DESC) AS rn
FROM locations;

-- 28. Window function RANK
SELECT id, village, RANK() OVER(PARTITION BY district ORDER BY population DESC) AS rank_village
FROM locations;

-- 29. Window function DENSE_RANK
SELECT id, village, DENSE_RANK() OVER(PARTITION BY district ORDER BY population DESC) AS dense_rank_village
FROM locations;

-- 30. Window function SUM
SELECT district, village, SUM(population) OVER(PARTITION BY district) AS district_population
FROM locations;

-- 31. Window function AVG
SELECT district, village, AVG(population) OVER(PARTITION BY district) AS avg_population
FROM locations;

-- 32. Transaction start
START TRANSACTION;

-- 33. Transaction update
UPDATE locations SET population = population + 100 WHERE id = 1;

-- 34. Transaction rollback
ROLLBACK;

-- 35. Transaction commit
START TRANSACTION;
UPDATE locations SET population = population + 50 WHERE id = 2;
COMMIT;

-- 36. GRANT SELECT
GRANT SELECT ON locations TO 'officer_user';

-- 37. GRANT INSERT
GRANT INSERT ON locations TO 'officer_user';

-- 38. REVOKE INSERT
REVOKE INSERT ON locations FROM 'officer_user';

-- 39. CREATE TRIGGER BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_location
BEFORE INSERT ON locations
FOR EACH ROW
BEGIN
    IF NEW.population < 0 THEN
        SET NEW.population = 0;
    END IF;
END;
//
DELIMITER ;

-- 40. CREATE TRIGGER AFTER INSERT
DELIMITER //
CREATE TRIGGER trg_after_insert_location
AFTER INSERT ON locations
FOR EACH ROW
BEGIN
    INSERT INTO fund_allocations(program_id, amount_allocated, amount_spent, fiscal_year, officer_id, status, remarks, document_reference, date_created)
    VALUES (NEW.id, 10000, 0, '2025-26', NEW.id, 'Planned', 'Auto allocation', CONCAT('DOC-', NEW.id), CURDATE());
END;
//
DELIMITER ;

-- 41. Update query
UPDATE locations SET status = 'Inactive' WHERE population < 1000;

-- 42. Delete query
DELETE FROM locations WHERE id = 20;

-- 43. Insert query
INSERT INTO locations (id, district, taluka, village, pincode, latitude, longitude, population, zone_type, status)
VALUES (21, 'Pune', 'Mulshi', 'NewVillage', '412116', 18.700000, 73.500000, 900, 'Rural', 'Active');

-- 44. ALTER TABLE add column
ALTER TABLE locations ADD COLUMN remark TEXT;

-- 45. ALTER TABLE modify column
ALTER TABLE locations MODIFY COLUMN population INT DEFAULT 0;

-- 46. ALTER TABLE drop column
ALTER TABLE locations DROP COLUMN remark;

-- 47. COUNT rows
SELECT COUNT(*) FROM locations;

-- 48. IN clause
SELECT * FROM locations WHERE district IN ('Pune','Nagpur');

-- 49. LIKE clause
SELECT * FROM locations WHERE village LIKE '%wadi%';

-- 50. BETWEEN clause
SELECT * FROM locations WHERE population BETWEEN 1000 AND 10000;

-- table 8
CREATE TABLE suppliers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    item_supplied VARCHAR(100),
    license_number VARCHAR(50),
    status VARCHAR(20),
    remarks TEXT
);

INSERT INTO suppliers (id, name, contact_person, phone, email, address,item_supplied, license_number, status, remarks) VALUES
(1, 'Global Foods Pvt Ltd', 'Ravi Kumar', '9123457001', 'r.kumar@globalfoods.in', '123 Market Rd, Mumbai', 'Rice', 'LIC-GF001', 'Active', 'Top quality supplier'),
(2, 'Health First Supplies', 'Anita Desai', '9123457002', 'a.desai@healthfirst.in', '45 Health St, Pune', 'First Aid Kits', 'LIC-HF002', 'Active', ''),
(3, 'Clean Water Solutions', 'Sameer Khan', '9123457003', 's.khan@cws.in', '89 Aqua Lane, Nashik', 'Water Purifiers', 'LIC-CW003', 'Pending', 'Awaiting docs'),
(4, 'Green Trees Nursery', 'Priya Shah', '9123457004', 'p.shah@greentrees.in', '12 Plant Ave, Lonavala', 'Seedlings', 'LIC-GT004', 'Active', ''),
(5, 'Quick Relief Tools', 'Vikram Patel', '9123457005', 'v.patel@qrtools.in', '56 Relief Rd, Thane', 'Shovels', 'LIC-QR005', 'Active', ''),
(6, 'Safe Shelter Co.', 'Meera Joshi', '9123457006', 'm.joshi@safeshelter.in', '33 Shelter St, Kolhapur', 'Tents', 'LIC-SS006', 'Active', '10,000 tents ready'),
(7, 'Bright Light Electronics', 'Rahul Deshmukh', '9123457007', 'r.deshmukh@ble.in', '7 Power Park, Aurangabad', 'Generators', 'LIC-BL007', 'Pending', 'Under review'),
(8, 'Care Clothing Pvt Ltd', 'Neha Kulkarni', '9123457008', 'n.kulkarni@careclothing.in', '21 Cotton Blvd, Satara', 'Blankets', 'LIC-CC008', 'Active', ''),
(9, 'FarmAid Providers', 'Karan Roy', '9123457009', 'k.roy@farmaid.in', '15 Agro Park, Sangli', 'Seeds', 'LIC-FA009', 'Active', ''),
(10, 'QuickMed Supplies', 'Anita Naik', '9123457010', 'a.naik@quickmed.in', '44 Med St, Kolhapur', 'Medicines', 'LIC-QM010', 'Active', 'Urgent'),
(11, 'Pure Water Tanks', 'Deepak Joshi', '9123457011', 'd.joshi@pwtanks.in', '99 Tank Rd, Latur', 'Water Tanks', 'LIC-PW011', 'Active', ''),
(12, 'Safe Sanitation', 'Ritika Desai', '9123457012', 'r.desai@safesan.in', '67 Toilet Lane, Solapur', 'Sanitation Kits', 'LIC-SS012', 'Pending', ''),
(13, 'Energy Solar Systems', 'Aditya Rao', '9123457013', 'a.rao@essolar.in', '23 Solar Park, Pune', 'Solar Lamps', 'LIC-ES013', 'Active', ''),
(14, 'Legal Support Services', 'Priyanka Ghosh', '9123457014', 'p.ghosh@legalsupport.in', '88 Law St, Nashik', 'Legal Advice', 'LIC-LS014', 'Active', ''),
(15, 'ElderAid Providers', 'Sachin Patil', '9123457015', 's.patil@elderaid.in', '31 Pension Rd, Pune', 'Pension Bags', 'LIC-EA015', 'Active', ''),
(16, 'Forest Care India', 'Sunita Dixit', '9123457016', 's.dixit@forestcare.in', '77 Greenway, Mumbai', 'Saplings', 'LIC-FC016', 'Active', ''),
(17, 'Justice Outreach', 'Manish Kapoor', '9123457017', 'm.kapoor@justiceout.in', '20 Law Ln, Thane', 'Legal Kits', 'LIC-JO017', 'Active', ''),
(18, 'Ability Support', 'Neelam Verma', '9123457018', 'n.verma@abilitysup.in', '5 Support Rd, Kolhapur', 'Mobility Aids', 'LIC-AS018', 'Pending', ''),
(19, 'Storm Relief Kits', 'Amit Khanna', '9123457019', 'a.khanna@srkits.in', '31 Emergency Ave, Nagpur', 'Emergency Kits', 'LIC-SR019', 'Active', ''),
(20, 'Eco Reforest Supplies', 'Shruti Nair', '9123457020', 's.nair@ecoreforest.in', '77 Green St, Aurangabad', 'Tree Saplings', 'LIC-ER020', 'Active', 'Seedlings only');

-- to display table data
    select * from suppliers;
   
 -- to reamove complete records from table
   truncate table suppliers;
    
 -- to remove complete records and attribute from table
    drop table suppliers;
    
    -- 1. View
CREATE VIEW active_suppliers AS
SELECT * FROM suppliers WHERE status='Active';

-- 2. View with specific columns
CREATE VIEW supplier_contacts AS
SELECT name, contact_person, phone, email FROM suppliers;

-- 3. Simple SELECT
SELECT * FROM suppliers;

-- 4. SELECT specific columns
SELECT name, item_supplied, status FROM suppliers;

-- 5. WHERE clause
SELECT * FROM suppliers WHERE status='Pending';

-- 6. ORDER BY
SELECT * FROM suppliers ORDER BY name ASC;

-- 7. ORDER BY DESC
SELECT * FROM suppliers ORDER BY id DESC;

-- 8. LIMIT / TOP
SELECT * FROM suppliers LIMIT 5;

-- 9. COUNT
SELECT COUNT(*) FROM suppliers;

-- 10. COUNT with condition
SELECT COUNT(*) FROM suppliers WHERE status='Active';

-- 11. DISTINCT
SELECT DISTINCT status FROM suppliers;

-- 12. GROUP BY
SELECT status, COUNT(*) FROM suppliers GROUP BY status;

-- 13. HAVING
SELECT status, COUNT(*) cnt FROM suppliers GROUP BY status HAVING cnt>10;

-- 14. INNER JOIN (example with aid_distribution)
SELECT s.name, a.item_description 
FROM suppliers s
JOIN aid_distribution a ON s.item_supplied=a.item_description;

-- 15. LEFT JOIN
SELECT s.name, a.item_description 
FROM suppliers s
LEFT JOIN aid_distribution a ON s.item_supplied=a.item_description;

-- 16. RIGHT JOIN
SELECT s.name, a.item_description 
FROM suppliers s
RIGHT JOIN aid_distribution a ON s.item_supplied=a.item_description;

-- 17. Subquery
SELECT * FROM suppliers WHERE id IN (SELECT supplier_id FROM aid_distribution);

-- 18. EXISTS
SELECT * FROM suppliers s WHERE EXISTS (SELECT 1 FROM aid_distribution a WHERE a.item_description=s.item_supplied);

-- 19. CTE simple
WITH active_sup AS (SELECT * FROM suppliers WHERE status='Active')
SELECT * FROM active_sup;

-- 20. CTE with aggregation
WITH sup_count AS (
  SELECT status, COUNT(*) AS cnt FROM suppliers GROUP BY status
)
SELECT * FROM sup_count;

-- 21. Stored Procedure Insert
DELIMITER //
CREATE PROCEDURE add_supplier(IN sname VARCHAR(100), IN contact VARCHAR(100))
BEGIN
INSERT INTO suppliers(name, contact_person) VALUES(sname, contact);
END //
DELIMITER ;

-- 22. Stored Procedure Select
DELIMITER //
CREATE PROCEDURE get_active_suppliers()
BEGIN
SELECT * FROM suppliers WHERE status='Active';
END //
DELIMITER ;

-- 23. Window Function ROW_NUMBER
SELECT name, status, ROW_NUMBER() OVER(PARTITION BY status ORDER BY id) AS rn FROM suppliers;

-- 24. RANK
SELECT name, status, RANK() OVER(PARTITION BY status ORDER BY id) AS rnk FROM suppliers;

-- 25. DENSE_RANK
SELECT name, status, DENSE_RANK() OVER(PARTITION BY status ORDER BY id) AS drnk FROM suppliers;

-- 26. SUM window
SELECT status, SUM(id) OVER(PARTITION BY status) AS sum_id FROM suppliers;

-- 27. AVG window
SELECT status, AVG(id) OVER(PARTITION BY status) AS avg_id FROM suppliers;

-- 28. MIN window
SELECT status, MIN(id) OVER(PARTITION BY status) AS min_id FROM suppliers;

-- 29. MAX window
SELECT status, MAX(id) OVER(PARTITION BY status) AS max_id FROM suppliers;

-- 30. GRANT SELECT
GRANT SELECT ON suppliers TO 'user1';

-- 31. GRANT INSERT
GRANT INSERT ON suppliers TO 'user1';

-- 32. REVOKE SELECT
REVOKE SELECT ON suppliers FROM 'user1';

-- 33. BEGIN TRANSACTION
START TRANSACTION;

-- 34. INSERT inside transaction
INSERT INTO suppliers(name) VALUES('Temp Supplier');

-- 35. ROLLBACK
ROLLBACK;

-- 36. COMMIT
COMMIT;

-- 37. Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_supplier
BEFORE INSERT ON suppliers
FOR EACH ROW
SET NEW.remarks = IFNULL(NEW.remarks,'N/A'); //
DELIMITER ;

-- 38. Trigger AFTER INSERT
DELIMITER //
CREATE TRIGGER trg_after_insert_supplier
AFTER INSERT ON suppliers
FOR EACH ROW
INSERT INTO aid_distribution(citizen_id, program_id, item_description, quantity, distribution_date, location_id, officer_id, status, remarks)
VALUES(NEW.id,1,NEW.item_supplied,10,CURDATE(),101,201,'Pending','Auto'); //
DELIMITER ;

-- 39. UPDATE
UPDATE suppliers SET status='Pending' WHERE id=1;

-- 40. DELETE
DELETE FROM suppliers WHERE id=20;

-- 41. LIKE
SELECT * FROM suppliers WHERE name LIKE 'A%';

-- 42. BETWEEN
SELECT * FROM suppliers WHERE id BETWEEN 5 AND 10;

-- 43. IS NULL
SELECT * FROM suppliers WHERE remarks IS NULL;

-- 44. COALESCE
SELECT name, COALESCE(remarks,'No remark') FROM suppliers;

-- 45. CASE
SELECT name, 
CASE WHEN status='Active' THEN 'On' ELSE 'Off' END AS status_flag
FROM suppliers;

-- 46. CONCAT
SELECT CONCAT(name,' - ',item_supplied) AS supplier_item FROM suppliers;

-- 47. SUBSTRING
SELECT SUBSTRING(name,1,5) AS short_name FROM suppliers;

-- 48. UPPER
SELECT UPPER(name) FROM suppliers;

-- 49. LOWER
SELECT LOWER(name) FROM suppliers;

-- 50. TRUNCATE
TRUNCATE TABLE suppliers;


-- table 9
 CREATE TABLE inventory_items (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit VARCHAR(20),
    supplier_id INT,
    purchase_date DATE,
    expiry_date DATE,
    status VARCHAR(20),
    location_id INT
);

INSERT INTO inventory_items (id, name, category, quantity, unit,supplier_id, purchase_date, expiry_date, status, location_id) VALUES
(1, 'Rice Bag', 'Food', 100, 'kg', 1, '2025-06-01', '2026-06-01', 'Available', 13),
(2, 'Blanket', 'Clothing', 200, 'pcs', 8, '2025-05-15', '2030-05-15', 'Available', 7),
(3, 'Water Purifier', 'Equipment', 10, 'units', 3, '2025-04-20', '2030-04-20', 'Available', 6),
(4, 'First Aid Kit', 'Medical', 50, 'kits', 2, '2025-06-05', '2027-06-05', 'Available', 12),
(5, 'Tent', 'Shelter', 30, 'units', 6, '2025-05-01', '2030-05-01', 'Available', 13),
(6, 'Soap Pack', 'Hygiene', 500, 'packs', 12, '2025-06-10', '2026-06-10', 'Available', 12),
(7, 'Sanitation Kit', 'Hygiene', 100, 'kits', 12, '2025-06-12', '2027-06-12', 'Available', 7),
(8, 'Generator', 'Equipment', 5, 'units', 7, '2025-05-20', '2030-05-20', 'Available', 5),
(9, 'Rice Bag', 'Food', 150, 'kg', 1, '2025-06-02', '2026-06-02', 'Available', 9),
(10, 'Blanket', 'Clothing', 180, 'pcs', 8, '2025-05-18', '2030-05-18', 'Available', 9),
(11, 'Water Bottle', 'Hygiene', 1000, 'bottles', 11, '2025-06-08', '2026-06-08', 'Available', 10),
(12, 'Medical Gloves', 'Medical', 1000, 'pairs', 2, '2025-06-01', '2027-06-01', 'Available', 12),
(13, 'Mobile Phone', 'Equipment', 20, 'units', 7, '2025-05-25', '2030-05-25', 'Available', 5),
(14, 'Rice Bag', 'Food', 200, 'kg', 1, '2025-06-03', '2026-06-03', 'Available', 15),
(15, 'Blanket', 'Clothing', 160, 'pcs', 8, '2025-05-20', '2030-05-20', 'Available', 15),
(16, 'Soap Pack', 'Hygiene', 400, 'packs', 12, '2025-06-11', '2026-06-11', 'Available', 10),
(17, 'First Aid Kit', 'Medical', 60, 'kits', 2, '2025-06-06', '2027-06-06', 'Available', 11),
(18, 'Tent', 'Shelter', 25, 'units', 6, '2025-05-03', '2030-05-03', 'Available', 14),
(19, 'Water Purifier', 'Equipment', 8, 'units', 3, '2025-04-22', '2030-04-22', 'Available', 6),
(20, 'Generator', 'Equipment', 4, 'units', 7, '2025-05-22', '2030-05-22', 'Available', 5);

-- to display table data
    select * from inventory_items;
   
 -- to reamove complete records from table
   truncate table inventory_items;
    
 -- to remove complete records and attribute from table
    drop table inventory_items;
    
    -- 1. Create a simple view of available items
CREATE VIEW available_inventory AS
SELECT * FROM inventory_items WHERE status = 'Available';

-- 2. View items by category
CREATE VIEW inventory_by_category AS
SELECT category, COUNT(*) AS total_items FROM inventory_items GROUP BY category;

-- 3. View items with supplier info (join with suppliers)
CREATE VIEW inventory_with_supplier AS
SELECT i.id, i.name, i.category, s.name AS supplier_name
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 4. CTE: Items expiring soon
WITH expiring_soon AS (
    SELECT * FROM inventory_items WHERE expiry_date < '2026-01-01'
)
SELECT * FROM expiring_soon;

-- 5. CTE: Total quantity by category
WITH category_quantity AS (
    SELECT category, SUM(quantity) AS total_qty FROM inventory_items GROUP BY category
)
SELECT * FROM category_quantity;

-- 6. Stored procedure to get items by supplier
DELIMITER //
CREATE PROCEDURE get_items_by_supplier(IN sup_id INT)
BEGIN
    SELECT * FROM inventory_items WHERE supplier_id = sup_id;
END//
DELIMITER ;

-- 7. Stored procedure to update item status
DELIMITER //
CREATE PROCEDURE update_item_status(IN item INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE inventory_items SET status = new_status WHERE id = item;
END//
DELIMITER ;

-- 8. Window function: Row number by category
SELECT id, name, category,
       ROW_NUMBER() OVER(PARTITION BY category ORDER BY quantity DESC) AS rn
FROM inventory_items;

-- 9. Window function: Rank by quantity
SELECT id, name, category,
       RANK() OVER(PARTITION BY category ORDER BY quantity DESC) AS rnk
FROM inventory_items;

-- 10. Window function: Dense rank
SELECT id, name, category,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY quantity DESC) AS dr
FROM inventory_items;

-- 11. Window function: Sum over category
SELECT category, SUM(quantity) OVER(PARTITION BY category) AS total_qty
FROM inventory_items;

-- 12. Window function: Moving average quantity
SELECT id, name, category, quantity,
       AVG(quantity) OVER(PARTITION BY category ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM inventory_items;

-- 13. Insert new inventory item
INSERT INTO inventory_items (id,name,category,quantity,unit,supplier_id,purchase_date,expiry_date,status,location_id)
VALUES (21,'Sleeping Bag','Shelter',50,'units',6,'2025-06-15','2030-06-15','Available',14);

-- 14. Update quantity of an item
UPDATE inventory_items SET quantity = quantity + 10 WHERE id = 1;

-- 15. Delete expired items
DELETE FROM inventory_items WHERE expiry_date < '2025-06-01';

-- 16. Select all items
SELECT * FROM inventory_items;

-- 17. Select items by category
SELECT * FROM inventory_items WHERE category = 'Food';

-- 18. Count items per category
SELECT category, COUNT(*) AS cnt FROM inventory_items GROUP BY category;

-- 19. Sum of quantities per supplier
SELECT supplier_id, SUM(quantity) AS total_qty FROM inventory_items GROUP BY supplier_id;

-- 20. Min, Max, Avg quantity
SELECT MIN(quantity), MAX(quantity), AVG(quantity) FROM inventory_items;

-- 21. Transaction: Reduce quantity safely
START TRANSACTION;
UPDATE inventory_items SET quantity = quantity - 5 WHERE id = 1;
COMMIT;

-- 22. Transaction rollback example
START TRANSACTION;
UPDATE inventory_items SET quantity = quantity - 1000 WHERE id = 2;
ROLLBACK;

-- 23. Grant select to user
GRANT SELECT ON inventory_items TO 'user1'@'localhost';

-- 24. Revoke insert privilege
REVOKE INSERT ON inventory_items FROM 'user1'@'localhost';

-- 25. Trigger before insert: default status
CREATE TRIGGER before_insert_inventory
BEFORE INSERT ON inventory_items
FOR EACH ROW
SET NEW.status = IFNULL(NEW.status,'Available');

-- 26. Trigger after update: log quantity changes
CREATE TABLE inventory_log(id INT AUTO_INCREMENT PRIMARY KEY, item_id INT, old_qty INT, new_qty INT, change_date DATETIME);
CREATE TRIGGER after_update_quantity
AFTER UPDATE ON inventory_items
FOR EACH ROW
INSERT INTO inventory_log(item_id, old_qty, new_qty, change_date)
VALUES (OLD.id, OLD.quantity, NEW.quantity, NOW());

-- 27. Select items in stock > 100
SELECT * FROM inventory_items WHERE quantity > 100;

-- 28. Select items with supplier name
SELECT i.id, i.name, s.name AS supplier_name FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 29. Select expired items
SELECT * FROM inventory_items WHERE expiry_date < CURDATE();

-- 30. Count items by status
SELECT status, COUNT(*) AS cnt FROM inventory_items GROUP BY status;

-- 31. Order items by purchase date
SELECT * FROM inventory_items ORDER BY purchase_date DESC;

-- 32. Limit 5 latest items
SELECT * FROM inventory_items ORDER BY purchase_date DESC LIMIT 5;

-- 33. Check for duplicates
SELECT name, COUNT(*) AS cnt FROM inventory_items GROUP BY name HAVING cnt > 1;

-- 34. Update location for a category
UPDATE inventory_items SET location_id = 20 WHERE category = 'Hygiene';

-- 35. Select items by multiple categories
SELECT * FROM inventory_items WHERE category IN ('Food','Shelter');

-- 36. Aggregate: total units per category
SELECT category, SUM(quantity) AS total_units FROM inventory_items GROUP BY category;

-- 37. Select items expiring in 2026
SELECT * FROM inventory_items WHERE YEAR(expiry_date) = 2026;

-- 38. Select items by name pattern
SELECT * FROM inventory_items WHERE name LIKE '%Bag%';

-- 39. Update status for expired items
UPDATE inventory_items SET status = 'Expired' WHERE expiry_date < CURDATE();

-- 40. Delete items by supplier
DELETE FROM inventory_items WHERE supplier_id = 7 AND quantity = 0;

-- 41. Count items per location
SELECT location_id, COUNT(*) FROM inventory_items GROUP BY location_id;

-- 42. Join with suppliers and filter active
SELECT i.id, i.name, s.name AS supplier_name
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id
WHERE s.status = 'Active';

-- 43. Window: cumulative sum per category
SELECT id, name, category, quantity,
       SUM(quantity) OVER(PARTITION BY category ORDER BY purchase_date) AS cumulative_qty
FROM inventory_items;

-- 44. Window: lag and lead example
SELECT id, name, quantity,
       LAG(quantity,1) OVER(PARTITION BY category ORDER BY purchase_date) AS prev_qty,
       LEAD(quantity,1) OVER(PARTITION BY category ORDER BY purchase_date) AS next_qty
FROM inventory_items;

-- 45. Create summary table
CREATE TABLE inventory_summary AS
SELECT category, SUM(quantity) AS total_qty FROM inventory_items GROUP BY category;

-- 46. Stored procedure to insert new item
DELIMITER //
CREATE PROCEDURE insert_inventory_item(IN i_id INT, IN i_name VARCHAR(100), IN i_cat VARCHAR(50), IN i_qty INT, IN i_unit VARCHAR(20), IN i_supplier INT, IN i_purchase DATE, IN i_expiry DATE, IN i_status VARCHAR(20), IN i_location INT)
BEGIN
    INSERT INTO inventory_items(id,name,category,quantity,unit,supplier_id,purchase_date,expiry_date,status,location_id)
    VALUES(i_id,i_name,i_cat,i_qty,i_unit,i_supplier,i_purchase,i_expiry,i_status,i_location);
END//
DELIMITER ;

-- 47. Select items grouped by supplier
SELECT supplier_id, COUNT(*) AS items_count, SUM(quantity) AS total_qty
FROM inventory_items GROUP BY supplier_id;

-- 48. Check total inventory value (quantity assuming unit price column added)
-- ALTER TABLE inventory_items ADD COLUMN unit_price DECIMAL(10,2);
-- SELECT SUM(quantity * unit_price) AS total_value FROM inventory_items;

-- 49. Delete low stock items
DELETE FROM inventory_items WHERE quantity < 5;

-- 50. Reset all quantities to zero (example TCL)
START TRANSACTION;
UPDATE inventory_items SET quantity = 0;
COMMIT;

    
-- table 10
 CREATE TABLE beneficiary_applications (
    id INT PRIMARY KEY,
    citizen_id INT,
    program_id INT,
    application_date DATE,
    status VARCHAR(20),
    approved_date DATE,
    officer_id INT,
    remarks TEXT,
    document_reference VARCHAR(100),
    location_id INT
);

INSERT INTO beneficiary_applications (id, citizen_id, program_id, application_date, status,approved_date, officer_id, remarks, document_reference, location_id) VALUES
(1, 1001, 1, '2025-06-01', 'Pending', NULL, 301, '', 'DOC-BA001', 13),
(2, 1002, 2, '2025-06-02', 'Approved', '2025-06-05', 302, 'Verified documents', 'DOC-BA002', 7),
(3, 1003, 3, '2025-06-03', 'Rejected', '2025-06-06', 303, 'Incomplete data', 'DOC-BA003', 6),
(4, 1004, 1, '2025-06-04', 'Pending', NULL, 304, '', 'DOC-BA004', 12),
(5, 1005, 2, '2025-06-05', 'Approved', '2025-06-08', 305, 'All good', 'DOC-BA005', 13),
(6, 1006, 3, '2025-06-06', 'Pending', NULL, 306, 'Awaiting review', 'DOC-BA006', 7),
(7, 1007, 4, '2025-06-07', 'Approved', '2025-06-10', 307, 'Approved by committee', 'DOC-BA007', 5),
(8, 1008, 4, '2025-06-08', 'Rejected', '2025-06-11', 308, 'Duplicate application', 'DOC-BA008', 5),
(9, 1009, 5, '2025-06-09', 'Pending', NULL, 309, '', 'DOC-BA009', 9),
(10, 1010, 5, '2025-06-10', 'Approved', '2025-06-13', 310, 'All docs OK', 'DOC-BA010', 9),
(11, 1011, 6, '2025-06-11', 'Pending', NULL, 311, '', 'DOC-BA011', 10),
(12, 1012, 6, '2025-06-12', 'Approved', '2025-06-15', 312, 'Eligible', 'DOC-BA012', 12),
(13, 1013, 7, '2025-06-13', 'Rejected', '2025-06-16', 313, 'Not in catchment', 'DOC-BA013', 7),
(14, 1014, 7, '2025-06-14', 'Pending', NULL, 314, 'Pending officer review', 'DOC-BA014', 7),
(15, 1015, 8, '2025-06-15', 'Approved', '2025-06-18', 315, 'Approved fast-track', 'DOC-BA015', 8),
(16, 1016, 8, '2025-06-16', 'Pending', NULL, 316, '', 'DOC-BA016', 8),
(17, 1017, 9, '2025-06-17', 'Approved', '2025-06-20', 317, 'Eligible under criteria', 'DOC-BA017', 9),
(18, 1018, 9, '2025-06-18', 'Rejected', '2025-06-21', 318, 'Missed deadline', 'DOC-BA018', 9),
(19, 1019, 10, '2025-06-19', 'Pending', NULL, 319, '', 'DOC-BA019', 10),
(20, 1020, 10, '2025-06-20', 'Approved', '2025-06-23', 320, 'Verified eligibility', 'DOC-BA020', 10);

-- to display table data
    select * from beneficiary_applications;
   
 -- to reamove complete records from table
   truncate table beneficiary_applications;
    
 -- to remove complete records and attribute from table
    drop table beneficiary_applications;

-- 1. Create a simple view
CREATE VIEW vw_pending_applications AS
SELECT * FROM beneficiary_applications WHERE status='Pending';

-- 2. View for approved applications
CREATE VIEW vw_approved_applications AS
SELECT id, citizen_id, program_id, status, approved_date FROM beneficiary_applications WHERE status='Approved';

-- 3. View for rejected applications
CREATE VIEW vw_rejected_applications AS
SELECT id, citizen_id, remarks FROM beneficiary_applications WHERE status='Rejected';

-- 4. Count of applications per program
CREATE VIEW vw_applications_count AS
SELECT program_id, COUNT(*) AS total_applications FROM beneficiary_applications GROUP BY program_id;

-- 5. Applications per officer
CREATE VIEW vw_officer_applications AS
SELECT officer_id, COUNT(*) AS assigned_apps FROM beneficiary_applications GROUP BY officer_id;

-- 6. CTE: Latest application per citizen
WITH LatestApplications AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY citizen_id ORDER BY application_date DESC) AS rn
    FROM beneficiary_applications
)
SELECT * FROM LatestApplications WHERE rn=1;

-- 7. CTE: Approved applications in June
WITH ApprovedJune AS (
    SELECT * FROM beneficiary_applications
    WHERE status='Approved' AND MONTH(application_date)=6
)
SELECT * FROM ApprovedJune;

-- 8. Stored Procedure: Insert new application
DELIMITER $$
CREATE PROCEDURE AddBeneficiaryApp(IN cid INT, IN pid INT, IN loc INT)
BEGIN
INSERT INTO beneficiary_applications (citizen_id, program_id, application_date, status, location_id)
VALUES (cid, pid, CURDATE(), 'Pending', loc);
END$$
DELIMITER ;

-- 9. Stored Procedure: Approve application
DELIMITER $$
CREATE PROCEDURE ApproveApplication(IN appid INT, IN offid INT)
BEGIN
UPDATE beneficiary_applications
SET status='Approved', approved_date=CURDATE(), officer_id=offid
WHERE id=appid;
END$$
DELIMITER ;

-- 10. Stored Procedure: Reject application
DELIMITER $$
CREATE PROCEDURE RejectApplication(IN appid INT, IN offid INT, IN remark TEXT)
BEGIN
UPDATE beneficiary_applications
SET status='Rejected', approved_date=CURDATE(), officer_id=offid, remarks=remark
WHERE id=appid;
END$$
DELIMITER ;

-- 11. Window: Rank applications by date per program
SELECT *, RANK() OVER(PARTITION BY program_id ORDER BY application_date ASC) AS app_rank
FROM beneficiary_applications;

-- 12. Window: Count applications per officer
SELECT *, COUNT(*) OVER(PARTITION BY officer_id) AS officer_total
FROM beneficiary_applications;

-- 13. Window: Cumulative approved per program
SELECT *, SUM(CASE WHEN status='Approved' THEN 1 ELSE 0 END) OVER(PARTITION BY program_id ORDER BY application_date) AS cumulative_approved
FROM beneficiary_applications;

-- 14. Window: Lead and lag dates
SELECT id, citizen_id, application_date,
LEAD(application_date) OVER(ORDER BY application_date) AS next_app,
LAG(application_date) OVER(ORDER BY application_date) AS prev_app
FROM beneficiary_applications;

-- 15. Grant SELECT
GRANT SELECT ON beneficiary_applications TO 'viewer'@'localhost';

-- 16. Grant INSERT
GRANT INSERT ON beneficiary_applications TO 'editor'@'localhost';

-- 17. Grant UPDATE
GRANT UPDATE ON beneficiary_applications TO 'editor'@'localhost';

-- 18. Grant DELETE
GRANT DELETE ON beneficiary_applications TO 'admin'@'localhost';

-- 19. Revoke INSERT
REVOKE INSERT ON beneficiary_applications FROM 'editor'@'localhost';

-- 20. Revoke DELETE
REVOKE DELETE ON beneficiary_applications FROM 'admin'@'localhost';

-- 21. Begin Transaction
START TRANSACTION;

-- 22. Insert in transaction
INSERT INTO beneficiary_applications (citizen_id, program_id, application_date, status, location_id) VALUES (1021, 11, CURDATE(), 'Pending', 11);

-- 23. Update in transaction
UPDATE beneficiary_applications SET status='Approved', approved_date=CURDATE() WHERE id=1;

-- 24. Commit transaction
COMMIT;

-- 25. Rollback transaction
ROLLBACK;

-- 26. Trigger: Before insert, set default status
DELIMITER $$
CREATE TRIGGER trg_before_insert_ba
BEFORE INSERT ON beneficiary_applications
FOR EACH ROW
BEGIN
IF NEW.status IS NULL THEN
SET NEW.status='Pending';
END IF;
END$$
DELIMITER ;

-- 27. Trigger: After update, log approval
DELIMITER $$
CREATE TRIGGER trg_after_update_ba
AFTER UPDATE ON beneficiary_applications
FOR EACH ROW
BEGIN
IF NEW.status='Approved' THEN
INSERT INTO application_logs(app_id, action_date, action) VALUES (NEW.id, NOW(), 'Approved');
END IF;
END$$
DELIMITER ;

-- 28. Select all applications
SELECT * FROM beneficiary_applications;

-- 29. Select pending
SELECT * FROM beneficiary_applications WHERE status='Pending';

-- 30. Select approved
SELECT * FROM beneficiary_applications WHERE status='Approved';

-- 31. Select rejected
SELECT * FROM beneficiary_applications WHERE status='Rejected';

-- 32. Count per status
SELECT status, COUNT(*) AS total FROM beneficiary_applications GROUP BY status;

-- 33. Applications in last 7 days
SELECT * FROM beneficiary_applications WHERE application_date >= CURDATE() - INTERVAL 7 DAY;

-- 34. Applications per program
SELECT program_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY program_id;

-- 35. Applications per officer
SELECT officer_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY officer_id;

-- 36. Max approved per program
SELECT program_id, MAX(approved_date) AS last_approved FROM beneficiary_applications WHERE status='Approved' GROUP BY program_id;

-- 37. Min application date
SELECT MIN(application_date) AS first_application FROM beneficiary_applications;

-- 38. Average applications per officer
SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM beneficiary_applications GROUP BY officer_id) AS t;

-- 39. Top 3 programs by application count
SELECT program_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY program_id ORDER BY total DESC LIMIT 3;

-- 40. Applications without officer
SELECT * FROM beneficiary_applications WHERE officer_id IS NULL;

-- 41. Search by remarks
SELECT * FROM beneficiary_applications WHERE remarks LIKE '%review%';

-- 42. Update remark
UPDATE beneficiary_applications SET remarks='Checked and approved' WHERE id=2;

-- 43. Delete rejected older than 1 month
DELETE FROM beneficiary_applications WHERE status='Rejected' AND application_date < CURDATE() - INTERVAL 30 DAY;

-- 44. Alter table add column
ALTER TABLE beneficiary_applications ADD COLUMN priority VARCHAR(20) DEFAULT 'Normal';

-- 45. Alter table modify column
ALTER TABLE beneficiary_applications MODIFY COLUMN remarks VARCHAR(500);

-- 46. Inner join with locations
SELECT ba.id, ba.citizen_id, l.village, ba.status
FROM beneficiary_applications ba
INNER JOIN locations l ON ba.location_id=l.id;

-- 47. Left join with locations
SELECT ba.id, ba.citizen_id, l.village, ba.status
FROM beneficiary_applications ba
LEFT JOIN locations l ON ba.location_id=l.id;

-- 48. Subquery: Applications of top officer
SELECT * FROM beneficiary_applications WHERE officer_id = (SELECT officer_id FROM beneficiary_applications GROUP BY officer_id ORDER BY COUNT(*) DESC LIMIT 1);

-- 49. Subquery: Applications with max program applications
SELECT * FROM beneficiary_applications WHERE program_id = (SELECT program_id FROM beneficiary_applications GROUP BY program_id ORDER BY COUNT(*) DESC LIMIT 1);

-- 50. Distinct program ids
SELECT DISTINCT program_id FROM beneficiary_applications;


-- table 11
 CREATE TABLE application_status_logs (
    id INT PRIMARY KEY,
    application_id INT,
    status VARCHAR(20),
    update_date DATE,
    updated_by INT,
    remarks TEXT,
    document_reference VARCHAR(100),
    officer_id INT,
    location_id INT,
    program_id INT
);

INSERT INTO application_status_logs (id, application_id, status, update_date,updated_by, remarks, document_reference,officer_id, location_id, program_id) VALUES
(1, 1, 'Submitted', '2025-06-01', 301, 'Initial submission', 'DOC-L001', 301, 13, 1),
(2, 2, 'Under Review', '2025-06-02', 302, 'Review in progress', 'DOC-L002', 302, 7, 2),
(3, 3, 'Rejected', '2025-06-03', 303, 'Missing documents', 'DOC-L003', 303, 6, 3),
(4, 4, 'Submitted', '2025-06-04', 304, 'Submitted by citizen', 'DOC-L004', 304, 12, 1),
(5, 5, 'Approved', '2025-06-05', 305, 'All clear', 'DOC-L005', 305, 13, 2),
(6, 6, 'Submitted', '2025-06-06', 306, 'Pending review', 'DOC-L006', 306, 7, 3),
(7, 7, 'Approved', '2025-06-07', 307, 'Approved by manager', 'DOC-L007', 307, 5, 4),
(8, 8, 'Rejected', '2025-06-08', 308, 'Duplicate entry', 'DOC-L008', 308, 5, 4),
(9, 9, 'Submitted', '2025-06-09', 309, 'Awaiting docs', 'DOC-L009', 309, 9, 5),
(10, 10, 'Approved', '2025-06-10', 310, 'Verified', 'DOC-L010', 310, 9, 5),
(11, 11, 'Submitted', '2025-06-11', 311, '', 'DOC-L011', 311, 10, 6),
(12, 12, 'Approved', '2025-06-12', 312, 'Good to go', 'DOC-L012', 312, 12, 6),
(13, 13, 'Rejected', '2025-06-13', 313, 'Not eligible', 'DOC-L013', 313, 7, 7),
(14, 14, 'Submitted', '2025-06-14', 314, 'Pending assignment', 'DOC-L014', 314, 7, 7),
(15, 15, 'Approved', '2025-06-15', 315, 'Fast-track', 'DOC-L015', 315, 8, 8),
(16, 16, 'Submitted', '2025-06-16', 316, '', 'DOC-L016', 316, 8, 8),
(17, 17, 'Approved', '2025-06-17', 317, 'Meets criteria', 'DOC-L017', 317, 9, 9),
(18, 18, 'Rejected', '2025-06-18', 318, 'Late submission', 'DOC-L018', 318, 9, 9),
(19, 19, 'Submitted', '2025-06-19', 319, '', 'DOC-L019', 319, 10, 10),
(20, 20, 'Approved', '2025-06-20', 320, 'Finalized', 'DOC-L020', 320, 10, 10);

-- to display table data
    select * from application_status_logs ;
   
 -- to reamove complete records from table
   truncate table application_status_logs ;
    
 -- to remove complete records and attribute from table
    drop table application_status_logs ;

-- 1. Simple SELECT from beneficiary_applications
SELECT * FROM beneficiary_applications;

-- 2. SELECT with WHERE
SELECT * FROM beneficiary_applications WHERE status='Pending';

-- 3. SELECT with ORDER BY
SELECT * FROM application_status_logs ORDER BY update_date DESC;

-- 4. SELECT with LIMIT
SELECT * FROM inventory_items LIMIT 5;

-- 5. Aggregate COUNT
SELECT status, COUNT(*) AS total FROM beneficiary_applications GROUP BY status;

-- 6. Aggregate SUM
SELECT category, SUM(quantity) AS total_qty FROM inventory_items GROUP BY category;

-- 7. AVG example
SELECT AVG(quantity) AS avg_qty FROM inventory_items WHERE category='Food';

-- 8. MIN/MAX example
SELECT MIN(purchase_date), MAX(expiry_date) FROM inventory_items;

-- 9. JOIN example
SELECT b.id, b.citizen_id, l.status FROM beneficiary_applications b
JOIN application_status_logs l ON b.id = l.application_id;

-- 10. LEFT JOIN
SELECT b.id, l.status FROM beneficiary_applications b
LEFT JOIN application_status_logs l ON b.id = l.application_id;

-- 11. RIGHT JOIN
SELECT b.id, l.status FROM beneficiary_applications b
RIGHT JOIN application_status_logs l ON b.id = l.application_id;

-- 13. View creation
CREATE VIEW vw_pending_applications AS
SELECT * FROM beneficiary_applications WHERE status='Pending';

-- 14. View select
SELECT * FROM vw_pending_applications;

-- 15. CTE example
WITH recent_applications AS (
  SELECT * FROM beneficiary_applications WHERE application_date > '2025-06-10'
)
SELECT * FROM recent_applications;

-- 16. CTE with aggregate
WITH status_count AS (
  SELECT status, COUNT(*) AS total FROM beneficiary_applications GROUP BY status
)
SELECT * FROM status_count;

-- 17. Window function ROW_NUMBER
SELECT id, status,
ROW_NUMBER() OVER(PARTITION BY status ORDER BY application_date DESC) AS rn
FROM beneficiary_applications;

-- 18. Window function RANK
SELECT id, status,
RANK() OVER(PARTITION BY status ORDER BY application_date ASC) AS rnk
FROM beneficiary_applications;

-- 19. Window function DENSE_RANK
SELECT id, status,
DENSE_RANK() OVER(PARTITION BY status ORDER BY application_date ASC) AS drnk
FROM beneficiary_applications;

-- 20. Window SUM
SELECT category, quantity,
SUM(quantity) OVER(PARTITION BY category) AS total_category_qty
FROM inventory_items;

-- 21. Stored Procedure - select by ID
DELIMITER //
CREATE PROCEDURE GetApplication(IN app_id INT)
BEGIN
  SELECT * FROM beneficiary_applications WHERE id=app_id;
END //
DELIMITER ;

-- 22. Call stored procedure
CALL GetApplication(1);

-- 23. Stored Procedure - update status
DELIMITER //
CREATE PROCEDURE ApproveApplication(IN app_id INT)
BEGIN
  UPDATE beneficiary_applications SET status='Approved', approved_date=CURDATE() WHERE id=app_id;
END //
DELIMITER ;

-- 24. Call stored procedure update
CALL ApproveApplication(4);

-- 25. Transaction BEGIN/COMMIT
START TRANSACTION;
UPDATE inventory_items SET quantity=quantity-10 WHERE id=1;
COMMIT;

-- 26. Transaction ROLLBACK
START TRANSACTION;
UPDATE inventory_items SET quantity=quantity-1000 WHERE id=1;
ROLLBACK;

-- 27. GRANT example (DCL)
GRANT SELECT, INSERT, UPDATE ON inventory_items TO 'user1';

-- 28. REVOKE example
REVOKE UPDATE ON inventory_items FROM 'user1';

-- 29. Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_inventory
BEFORE INSERT ON inventory_items
FOR EACH ROW
BEGIN
  IF NEW.quantity < 0 THEN
    SET NEW.quantity = 0;
  END IF;
END //
DELIMITER ;

-- 30. Trigger AFTER UPDATE
DELIMITER //
CREATE TRIGGER trg_after_update_application
AFTER UPDATE ON beneficiary_applications
FOR EACH ROW
BEGIN
  INSERT INTO application_status_logs(application_id,status,update_date,updated_by,remarks,document_reference,officer_id,location_id,program_id)
  VALUES(NEW.id, NEW.status, CURDATE(), NEW.officer_id, 'Status changed', NEW.document_reference, NEW.officer_id, NEW.location_id, NEW.program_id);
END //
DELIMITER ;

-- 31. DELETE query
DELETE FROM inventory_items WHERE id=20;

-- 32. UPDATE query
UPDATE beneficiary_applications SET status='Rejected' WHERE id=6;

-- 33. INSERT query
INSERT INTO inventory_items(id,name,category,quantity,unit,supplier_id,purchase_date,expiry_date,status,location_id)
VALUES(21,'Mask','Hygiene',500,'pcs',12,'2025-06-21','2026-06-21','Available',10);

-- 34. DISTINCT example
SELECT DISTINCT category FROM inventory_items;

-- 35. LIKE operator
SELECT * FROM beneficiary_applications WHERE document_reference LIKE 'DOC-BA0%';

-- 36. BETWEEN operator
SELECT * FROM application_status_logs WHERE update_date BETWEEN '2025-06-05' AND '2025-06-10';

-- 37. IN operator
SELECT * FROM beneficiary_applications WHERE status IN ('Pending','Approved');

-- 38. COUNT with condition
SELECT COUNT(*) FROM inventory_items WHERE quantity < 50;

-- 39. GROUP BY with HAVING
SELECT category, SUM(quantity) AS total_qty FROM inventory_items
GROUP BY category HAVING SUM(quantity) > 100;

-- 40. UNION example
SELECT id, status FROM beneficiary_applications WHERE status='Pending'
UNION
SELECT id, status FROM application_status_logs WHERE status='Pending';

-- 41. Subquery example
SELECT * FROM beneficiary_applications WHERE id IN (SELECT application_id FROM application_status_logs WHERE status='Rejected');

-- 42. Correlated subquery
SELECT id, status FROM beneficiary_applications b
WHERE EXISTS (SELECT 1 FROM application_status_logs l WHERE l.application_id=b.id AND l.status='Approved');

-- 43. CASE expression
SELECT id, status,
CASE WHEN status='Pending' THEN 'Waiting'
     WHEN status='Approved' THEN 'Done'
     ELSE 'Other'
END AS status_text
FROM beneficiary_applications;

-- 44. COALESCE example
SELECT id, COALESCE(approved_date,'Not Approved') AS approval FROM beneficiary_applications;

-- 45. ISNULL example
SELECT id FROM beneficiary_applications WHERE approved_date IS NULL;

-- 46. CONCAT example
SELECT CONCAT('Application-',id) AS app_ref FROM beneficiary_applications;

-- 47. Subquery with aggregate
SELECT id, (SELECT COUNT(*) FROM application_status_logs l WHERE l.application_id=b.id) AS log_count
FROM beneficiary_applications b;

-- 48. Window LAG function
SELECT id, status, LAG(status) OVER(ORDER BY application_date) AS prev_status
FROM beneficiary_applications;

-- 49. Window LEAD function
SELECT id, status, LEAD(status) OVER(ORDER BY application_date) AS next_status
FROM beneficiary_applications;

-- 50. Window AVG function
SELECT id, quantity, AVG(quantity) OVER(PARTITION BY category) AS avg_category_qty
FROM inventory_items;


-- table 12
 CREATE TABLE incident_reports (
    id INT PRIMARY KEY,
    event_id INT,
    reporter_name VARCHAR(100),
    report_date DATE,
    description TEXT,
    location_id INT,
    severity_level VARCHAR(20),
    document_reference VARCHAR(100),
    status VARCHAR(20),
    officer_id INT
);

INSERT INTO incident_reports (id, event_id, reporter_name, report_date,description, location_id, severity_level,document_reference, status, officer_id) VALUES
(1, 1, 'Aarav Sharma', '2025-06-02', 'Flooded village access road', 13, 'High', 'DOC-I001', 'Open', 301),
(2, 2, 'Priya Singh', '2025-06-03', 'Collapsed mud house', 7, 'Medium', 'DOC-I002', 'Closed', 302),
(3, 3, 'Rohan Patel', '2025-06-04', 'Tree fallen on road', 6, 'Low', 'DOC-I003', 'Open', 303),
(4, 3, 'Neha Kulkarni', '2025-06-05', 'Damaged electric pole', 12, 'Medium', 'DOC-I004', 'Investigating', 304),
(5, 4, 'Vikram Desai', '2025-06-06', 'Minor landslide on hill slope', 13, 'Low', 'DOC-I005', 'Resolved', 305),
(6, 5, 'Sonal Mehta', '2025-06-07', 'Heatstroke reported in elderly group', 7, 'Medium', 'DOC-I006', 'Open', 306),
(7, 6, 'Karan Iyer', '2025-06-08', 'Water purifier malfunctioned', 5, 'Low', 'DOC-I007', 'Resolved', 307),
(8, 7, 'Anita Rao', '2025-06-09', 'Toilet blocked at distribution site', 12, 'Medium', 'DOC-I008', 'Closed', 308),
(9, 8, 'Deepak Joshi', '2025-06-10', 'Fraudulent voucher claim', 9, 'High', 'DOC-I009', 'Under Review', 309),
(10, 9, 'Ritika Chavan', '2025-06-11', 'Crop damage reported', 9, 'High', 'DOC-I010', 'Open', 310),
(11, 10, 'Aditya Rao', '2025-06-12', 'Delayed microloan disbursal', 10, 'Medium', 'DOC-I011', 'Investigating', 311),
(12, 11, 'Priyanka Ghosh', '2025-06-13', 'Missing attendance records', 12, 'Low', 'DOC-I012', 'Resolved', 312),
(13, 12, 'Sachin Patil', '2025-06-14', 'Insufficient sanitation kits', 7, 'Medium', 'DOC-I013', 'Investigating', 313),
(14, 13, 'Sunita Dixit', '2025-06-15', 'Rice quality issue', 7, 'Medium', 'DOC-I014', 'Under Review', 314),
(15, 14, 'Manish Kapoor', '2025-06-16', 'Elderly missed pension payment', 8, 'High', 'DOC-I015', 'Open', 315),
(16, 15, 'Neelam Verma', '2025-06-17', 'Plantation saplings dead', 8, 'Medium', 'DOC-I016', 'Investigating', 316),
(17, 16, 'Amit Khanna', '2025-06-18', 'Legal counsel unavailable', 9, 'Low', 'DOC-I017', 'Resolved', 317),
(18, 17, 'Shruti Nair', '2025-06-19', 'Assistive device broken', 9, 'Medium', 'DOC-I018', 'Under Review', 318),
(19, 18, 'Raghav Jain', '2025-06-20', 'Emergency kit missing item', 10, 'Low', 'DOC-I019', 'Resolved', 319),
(20, 19, 'Meera Shah', '2025-06-21', 'Reforestation saplings damaged', 10, 'Medium', 'DOC-I020', 'Open', 320);

-- to display table data
    select * from incident_reports ;
   
 -- to reamove complete records from table
   truncate table incident_reports ;
    
 -- to remove complete records and attribute from table
    drop table incident_reports ;
-- 1. Simple SELECT
SELECT * FROM incident_reports;

-- 2. SELECT with WHERE
SELECT * FROM incident_reports WHERE severity_level='High';

-- 3. SELECT with ORDER BY
SELECT * FROM incident_reports ORDER BY report_date DESC;

-- 4. SELECT with LIMIT
SELECT * FROM incident_reports LIMIT 5;

-- 5. COUNT aggregate
SELECT status, COUNT(*) AS total FROM incident_reports GROUP BY status;

-- 6. MAX report_date
SELECT MAX(report_date) AS latest_report FROM incident_reports;

-- 7. MIN report_date
SELECT MIN(report_date) AS earliest_report FROM incident_reports;

-- 8. AVG (not numeric column, example skipped)

-- 9. DISTINCT severity_level
SELECT DISTINCT severity_level FROM incident_reports;

-- 10. LIKE operator
SELECT * FROM incident_reports WHERE reporter_name LIKE 'A%';

-- 11. IN operator
SELECT * FROM incident_reports WHERE status IN ('Open','Resolved');

-- 12. BETWEEN operator
SELECT * FROM incident_reports WHERE report_date BETWEEN '2025-06-05' AND '2025-06-15';

-- 13. GROUP BY with HAVING
SELECT severity_level, COUNT(*) AS total FROM incident_reports
GROUP BY severity_level HAVING COUNT(*) > 2;

-- 14. Subquery example
SELECT * FROM incident_reports WHERE officer_id IN (SELECT officer_id FROM incident_reports WHERE status='Open');

-- 15. Correlated subquery
SELECT * FROM incident_reports i1
WHERE EXISTS (SELECT 1 FROM incident_reports i2 WHERE i2.location_id=i1.location_id AND i2.severity_level='High');

-- 16. CASE expression
SELECT id, severity_level,
CASE WHEN severity_level='High' THEN 'Urgent'
     WHEN severity_level='Medium' THEN 'Moderate'
     ELSE 'Low'
END AS severity_text
FROM incident_reports;

-- 17. COALESCE
SELECT id, COALESCE(status,'Not Set') AS current_status FROM incident_reports;

-- 18. CONCAT
SELECT CONCAT('IR-',id) AS report_ref, reporter_name FROM incident_reports;

-- 19. View creation
CREATE VIEW vw_open_reports AS
SELECT * FROM incident_reports WHERE status='Open';

-- 20. Select from View
SELECT * FROM vw_open_reports;

-- 21. CTE simple
WITH recent_incidents AS (
  SELECT * FROM incident_reports WHERE report_date>'2025-06-10'
)
SELECT * FROM recent_incidents;

-- 22. CTE with aggregation
WITH severity_count AS (
  SELECT severity_level, COUNT(*) AS total FROM incident_reports GROUP BY severity_level
)
SELECT * FROM severity_count;

-- 23. Window function ROW_NUMBER
SELECT id, severity_level, ROW_NUMBER() OVER(PARTITION BY severity_level ORDER BY report_date DESC) AS rn FROM incident_reports;

-- 24. Window function RANK
SELECT id, severity_level, RANK() OVER(PARTITION BY severity_level ORDER BY report_date ASC) AS rnk FROM incident_reports;

-- 25. Window function DENSE_RANK
SELECT id, severity_level, DENSE_RANK() OVER(PARTITION BY severity_level ORDER BY report_date ASC) AS drnk FROM incident_reports;

-- 26. Window function SUM
SELECT location_id, severity_level, COUNT(*) OVER(PARTITION BY location_id) AS total_reports FROM incident_reports;

-- 27. Stored Procedure - select by id
DELIMITER //
CREATE PROCEDURE GetIncident(IN ir_id INT)
BEGIN
  SELECT * FROM incident_reports WHERE id=ir_id;
END //
DELIMITER ;

-- 28. Call stored procedure
CALL GetIncident(3);

-- 29. Stored Procedure - update status
DELIMITER //
CREATE PROCEDURE ResolveIncident(IN ir_id INT)
BEGIN
  UPDATE incident_reports SET status='Resolved' WHERE id=ir_id;
END //
DELIMITER ;

-- 30. Call update procedure
CALL ResolveIncident(6);

-- 31. Transaction BEGIN/COMMIT
START TRANSACTION;
UPDATE incident_reports SET status='Investigating' WHERE id=2;
COMMIT;

-- 32. Transaction ROLLBACK
START TRANSACTION;
UPDATE incident_reports SET status='Closed' WHERE id=1;
ROLLBACK;

-- 33. DCL GRANT
GRANT SELECT, INSERT, UPDATE ON incident_reports TO 'user1';

-- 34. DCL REVOKE
REVOKE UPDATE ON incident_reports FROM 'user1';

-- 35. INSERT example
INSERT INTO incident_reports(id,event_id,reporter_name,report_date,description,location_id,severity_level,document_reference,status,officer_id)
VALUES(21,5,'Nikhil Kumar','2025-06-22','Damaged school building',11,'Medium','DOC-I021','Open',321);

-- 36. UPDATE example
UPDATE incident_reports SET status='Closed' WHERE id=5;

-- 37. DELETE example
DELETE FROM incident_reports WHERE id=7;

-- 38. LAG window function
SELECT id, status, LAG(status) OVER(ORDER BY report_date) AS prev_status FROM incident_reports;

-- 39. LEAD window function
SELECT id, status, LEAD(status) OVER(ORDER BY report_date) AS next_status FROM incident_reports;

-- 40. COUNT with condition
SELECT COUNT(*) FROM incident_reports WHERE severity_level='High';

-- 41. Aggregate with subquery
SELECT id, (SELECT COUNT(*) FROM incident_reports i2 WHERE i2.location_id=i1.location_id) AS location_count
FROM incident_reports i1;

-- 42. Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_incident
BEFORE INSERT ON incident_reports
FOR EACH ROW
BEGIN
  IF NEW.severity_level IS NULL THEN SET NEW.severity_level='Low'; END IF;
END //
DELIMITER ;

-- 43. Trigger AFTER UPDATE
DELIMITER //
CREATE TRIGGER trg_after_update_incident
AFTER UPDATE ON incident_reports
FOR EACH ROW
BEGIN
  INSERT INTO incident_reports(id,event_id,reporter_name,report_date,description,location_id,severity_level,document_reference,status,officer_id)
  VALUES(NEW.id+1000,NEW.event_id,NEW.reporter_name,CURDATE(),'Status change log',NEW.location_id,NEW.severity_level,NEW.document_reference,NEW.status,NEW.officer_id);
END //
DELIMITER ;

-- 44. Simple SELECT with alias
SELECT id AS report_id, reporter_name AS reporter FROM incident_reports;

-- 45. EXISTS example
SELECT * FROM incident_reports i WHERE EXISTS (SELECT 1 FROM incident_reports WHERE severity_level='High' AND location_id=i.location_id);

-- 46. ANY example
SELECT * FROM incident_reports WHERE severity_level=ANY(SELECT severity_level FROM incident_reports WHERE status='Open');

-- 47. ALL example
SELECT * FROM incident_reports WHERE id > ALL(SELECT id FROM incident_reports WHERE status='Closed');

-- 48. Window AVG (dummy numeric example, count per location)
SELECT location_id, COUNT(*) AS report_count, AVG(COUNT(*)) OVER() AS avg_report_count FROM incident_reports GROUP BY location_id;

-- 49. UNION example
SELECT id, status FROM incident_reports WHERE severity_level='High'
UNION
SELECT id, status FROM incident_reports WHERE severity_level='Medium';

-- 50. Simple SELECT with function
SELECT id, UPPER(status) AS status_upper FROM incident_reports;


-- table 13
 CREATE TABLE ngo_partners (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    registration_number VARCHAR(50),
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    area_of_work VARCHAR(100),
    status VARCHAR(20),
    remarks TEXT
);

INSERT INTO ngo_partners (id, name, registration_number, contact_person, phone,email, address, area_of_work, status, remarks) VALUES
(1, 'Helping Hands', 'REG-HH001', 'Ravi Kumar', '9123458001', 'r.kumar@hh.org', 'Mumbai', 'Health', 'Active', ''),
(2, 'Green Earth NGO', 'REG-GE002', 'Anita Desai', '9123458002', 'a.desai@greenearth.org', 'Pune', 'Environment', 'Active', ''),
(3, 'Water For All', 'REG-WA003', 'Sameer Khan', '9123458003', 's.khan@wfa.org', 'Nashik', 'Water', 'Pending', 'License under review'),
(4, 'Plant A Tree', 'REG-PT004', 'Priya Shah', '9123458004', 'p.shah@plantatree.org', 'Lonavala', 'Forestry', 'Active', ''),
(5, 'Relief Tools Co-op', 'REG-RT005', 'Vikram Patel', '9123458005', 'v.patel@relieftools.org', 'Thane', 'Shelter', 'Active', ''),
(6, 'Shelter Aid', 'REG-SA006', 'Meera Joshi', '9123458006', 'm.joshi@shelteraid.org', 'Kolhapur', 'Housing', 'Active', ''),
(7, 'Light Up Lives', 'REG-LL007', 'Rahul Deshmukh', '9123458007', 'r.deshmukh@lul.org', 'Aurangabad', 'Energy', 'Pending', 'Verification ongoing'),
(8, 'Clothe Care', 'REG-CC008', 'Neha Kulkarni', '9123458008', 'n.kulkarni@clothecare.org', 'Satara', 'Clothing', 'Active', ''),
(9, 'Farm Aid', 'REG-FA009', 'Karan Roy', '9123458009', 'k.roy@farmaid.org', 'Sangli', 'Agriculture', 'Active', ''),
(10, 'QuickMed NGO', 'REG-QM010', 'Anita Naik', '9123458010', 'a.naik@quickmed.org', 'Kolhapur', 'Health', 'Active', ''),
(11, 'PureWater Org', 'REG-PW011', 'Deepak Joshi', '9123458011', 'd.joshi@purewater.org', 'Latur', 'Water', 'Active', ''),
(12, 'Sanitation First', 'REG-SF012', 'Ritika Desai', '9123458012', 'r.desai@sanitation.org', 'Solapur', 'Sanitation', 'Pending', ''),
(13, 'Solar Light Charity', 'REG-SL013', 'Aditya Rao', '9123458013', 'a.rao@solarlight.org', 'Pune', 'Energy', 'Active', ''),
(14, 'Legal Aid Trust', 'REG-LA014', 'Priyanka Ghosh', '9123458014', 'p.ghosh@legalaid.org', 'Nashik', 'Legal', 'Active', ''),
(15, 'Elder Aid Foundation', 'REG-EF015', 'Sachin Patil', '9123458015', 's.patil@elderaid.org', 'Pune', 'Social', 'Active', ''),
(16, 'Forest Care Trust', 'REG-FC016', 'Sunita Dixit', '9123458016', 's.dixit@forestcare.org', 'Mumbai', 'Environment', 'Active', ''),
(17, 'Justice Outreach', 'REG-JO017', 'Manish Kapoor', '9123458017', 'm.kapoor@justiceout.org', 'Thane', 'Legal', 'Active', ''),
(18, 'Ability Support', 'REG-AS018', 'Neelam Verma', '9123458018', 'n.verma@abilitysupport.org', 'Kolhapur', 'Disability', 'Pending', ''),
(19, 'Storm Relief NGO', 'REG-SR019', 'Amit Khanna', '9123458019', 'a.khanna@stormrelief.org', 'Nagpur', 'Emergency', 'Active', ''),
(20, 'EcoReforest Org', 'REG-ER020', 'Shruti Nair', '9123458020', 's.nair@ecoreforest.org', 'Aurangabad', 'Environment', 'Active', '');

-- to display table data
    select * from ngo_partners ;
   
 -- to reamove complete records from table
   truncate table  ngo_partners;
    
 -- to remove complete records and attribute from table
    drop table ngo_partners ;
-- 1 View to see active NGOs
CREATE VIEW v_active_ngos AS SELECT * FROM ngo_partners WHERE status='Active';

-- 2 View for Pending NGOs
CREATE VIEW v_pending_ngos AS SELECT * FROM ngo_partners WHERE status='Pending';

-- 3 Simple select
SELECT * FROM ngo_partners;

-- 4 Filter by area of work
SELECT * FROM ngo_partners WHERE area_of_work='Health';

-- 5 Count of NGOs per status
SELECT status, COUNT(*) AS total FROM ngo_partners GROUP BY status;

-- 6 Count of NGOs per area of work
SELECT area_of_work, COUNT(*) AS total FROM ngo_partners GROUP BY area_of_work;

-- 7 Max id
SELECT MAX(id) FROM ngo_partners;

-- 8 Min id
SELECT MIN(id) FROM ngo_partners;

-- 9 CTE example
WITH cte_active AS (SELECT * FROM ngo_partners WHERE status='Active') SELECT * FROM cte_active;

-- 10 CTE count
WITH cte_area AS (SELECT area_of_work, COUNT(*) AS total FROM ngo_partners GROUP BY area_of_work) SELECT * FROM cte_area;

-- 11 Stored Procedure: select all NGOs
DELIMITER //
CREATE PROCEDURE sp_all_ngos() BEGIN SELECT * FROM ngo_partners; END //
DELIMITER ;

-- 12 Stored Procedure: active NGOs
DELIMITER //
CREATE PROCEDURE sp_active_ngos() BEGIN SELECT * FROM ngo_partners WHERE status='Active'; END //
DELIMITER ;

-- 13 Update NGO status
UPDATE ngo_partners SET status='Active' WHERE id=3;

-- 14 Delete an NGO
DELETE FROM ngo_partners WHERE id=20;

-- 15 Insert a new NGO
INSERT INTO ngo_partners (id,name,registration_number,contact_person,phone,email,address,area_of_work,status,remarks) VALUES (21,'New NGO','REG-NG021','Test User','9123458021','test@ngo.org','Mumbai','Education','Pending','');

-- 16 Window function: rank by id
SELECT id,name, RANK() OVER (ORDER BY id) AS rnk FROM ngo_partners;

-- 17 Window function: row_number
SELECT id,name, ROW_NUMBER() OVER (ORDER BY id DESC) AS rn FROM ngo_partners;

-- 18 Window function: dense_rank
SELECT id,name, DENSE_RANK() OVER (PARTITION BY status ORDER BY name) AS drnk FROM ngo_partners;

-- 19 Grant select
GRANT SELECT ON ngo_partners TO 'report_user'@'localhost';

-- 20 Grant all
GRANT ALL ON ngo_partners TO 'admin_user'@'localhost';

-- 21 Revoke select
REVOKE SELECT ON ngo_partners FROM 'report_user'@'localhost';

-- 22 Commit example
START TRANSACTION; UPDATE ngo_partners SET status='Active' WHERE id=18; COMMIT;

-- 23 Rollback example
START TRANSACTION; UPDATE ngo_partners SET status='Pending' WHERE id=18; ROLLBACK;

-- 24 Savepoint example
START TRANSACTION; UPDATE ngo_partners SET status='Pending' WHERE id=18; SAVEPOINT sp1; UPDATE ngo_partners SET status='Active' WHERE id=19; ROLLBACK TO sp1; COMMIT;

-- 25 Trigger before insert
DELIMITER //
CREATE TRIGGER trg_before_insert_ngo BEFORE INSERT ON ngo_partners FOR EACH ROW SET NEW.remarks='Added automatically' //
DELIMITER ;

-- 26 Trigger after update
DELIMITER //
CREATE TRIGGER trg_after_update_status AFTER UPDATE ON ngo_partners FOR EACH ROW INSERT INTO ngo_status_log (ngo_id, old_status, new_status, updated_at) VALUES (OLD.id, OLD.status, NEW.status, NOW()) //
DELIMITER ;

-- 27 Select name and email
SELECT name,email FROM ngo_partners;

-- 28 Filter by city in address
SELECT * FROM ngo_partners WHERE address='Pune';

-- 29 Count NGOs in each city
SELECT address, COUNT(*) AS total FROM ngo_partners GROUP BY address;

-- 30 Check pending NGOs
SELECT * FROM ngo_partners WHERE status='Pending';

-- 31 Order by name
SELECT * FROM ngo_partners ORDER BY name ASC;

-- 32 Order by id desc
SELECT * FROM ngo_partners ORDER BY id DESC;

-- 33 Limit 5 records
SELECT * FROM ngo_partners LIMIT 5;

-- 34 Offset example
SELECT * FROM ngo_partners LIMIT 5 OFFSET 5;

-- 35 Update contact person
UPDATE ngo_partners SET contact_person='Updated Name' WHERE id=5;

-- 36 Update multiple fields
UPDATE ngo_partners SET phone='9999999999', email='updated@ngo.org' WHERE id=7;

-- 37 Delete multiple
DELETE FROM ngo_partners WHERE status='Pending';

-- 38 Select with LIKE
SELECT * FROM ngo_partners WHERE name LIKE '%Aid%';

-- 39 Select with IN
SELECT * FROM ngo_partners WHERE area_of_work IN ('Health','Water');

-- 40 Select with BETWEEN
SELECT * FROM ngo_partners WHERE id BETWEEN 5 AND 15;

-- 41 Aggregate max per area
SELECT area_of_work, MAX(id) AS max_id FROM ngo_partners GROUP BY area_of_work;

-- 42 Aggregate min per area
SELECT area_of_work, MIN(id) AS min_id FROM ngo_partners GROUP BY area_of_work;

-- 43 Aggregate avg length of name
SELECT AVG(CHAR_LENGTH(name)) AS avg_length FROM ngo_partners;

-- 44 Count distinct area_of_work
SELECT COUNT(DISTINCT area_of_work) AS total_areas FROM ngo_partners;

-- 45 Conditional select
SELECT *, CASE WHEN status='Active' THEN 'Good' ELSE 'Pending Review' END AS status_desc FROM ngo_partners;

-- 46 Self join example
SELECT a.id,a.name,b.id AS partner_id,b.name AS partner_name FROM ngo_partners a JOIN ngo_partners b ON a.area_of_work=b.area_of_work AND a.id<>b.id;

-- 47 Union example
SELECT name,email FROM ngo_partners WHERE status='Active' UNION SELECT name,email FROM ngo_partners WHERE status='Pending';

-- 50 Top N per area using window
SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY area_of_work ORDER BY id) AS rn FROM ngo_partners) AS t WHERE rn<=2;


-- table 14
CREATE TABLE public_feedback (
    id INT PRIMARY KEY,
    citizen_id INT,
    feedback_date DATE,
    feedback_type VARCHAR(50),
    message TEXT,
    location_id INT,
    officer_id INT,
    status VARCHAR(20),
    remarks TEXT,
    document_reference VARCHAR(100)
);

INSERT INTO public_feedback (id, citizen_id, feedback_date, feedback_type,message, location_id, officer_id, status,remarks, document_reference) VALUES
(1, 1001, '2025-06-01', 'Complaint', 'Slow aid distribution', 13, 301, 'Open', '', 'DOC-F001'),
(2, 1002, '2025-06-02', 'Suggestion', 'Increase transparency in process', 7, 302, 'Reviewed', 'Good idea', 'DOC-F002'),
(3, 1003, '2025-06-03', 'Compliment', 'Officers were helpful', 6, 303, 'Closed', '', 'DOC-F003'),
(4, 1004, '2025-06-04', 'Complaint', 'Incomplete documents requested', 12, 304, 'Open', '', 'DOC-F004'),
(5, 1005, '2025-06-05', 'Suggestion', 'Add more distribution centers', 13, 305, 'Reviewed', 'Feasible', 'DOC-F005'),
(6, 1006, '2025-06-06', 'Complaint', 'Poor communication', 7, 306, 'Open', '', 'DOC-F006'),
(7, 1007, '2025-06-07', 'Compliment', 'Smooth process', 5, 307, 'Closed', 'Well done', 'DOC-F007'),
(8, 1008, '2025-06-08', 'Complaint', 'Late payments', 5, 308, 'Open', '', 'DOC-F008'),
(9, 1009, '2025-06-09', 'Suggestion', 'Mobile app for updates', 9, 309, 'Reviewed', 'Tech team notified', 'DOC-F009'),
(10, 1010, '2025-06-10', 'Compliment', 'Good documentation', 9, 310, 'Closed', '', 'DOC-F010'),
(11, 1011, '2025-06-11', 'Complaint', 'Process too complex', 10, 311, 'Open', '', 'DOC-F011'),
(12, 1012, '2025-06-12', 'Suggestion', 'Train officers better', 12, 312, 'Reviewed', 'Training planned', 'DOC-F012'),
(13, 1013, '2025-06-13', 'Compliment', 'Community support strong', 7, 313, 'Closed', '', 'DOC-F013'),
(14, 1014, '2025-06-14', 'Complaint', 'Duplicate entries caused delay', 7, 314, 'Open', '', 'DOC-F014'),
(15, 1015, '2025-06-15', 'Suggestion', 'Extend office hours', 8, 315, 'Reviewed', 'Considered', 'DOC-F015'),
(16, 1016, '2025-06-16', 'Complaint', 'No transport support', 8, 316, 'Open', '', 'DOC-F016'),
(17, 1017, '2025-06-17', 'Compliment', 'Very professional staff', 9, 317, 'Closed', '', 'DOC-F017'),
(18, 1018, '2025-06-18', 'Complaint', 'Unclear instructions', 9, 318, 'Open', '', 'DOC-F018'),
(19, 1019, '2025-06-19', 'Suggestion', 'Provide multilingual forms', 10, 319, 'Reviewed', 'Implemented soon', 'DOC-F019'),
(20, 1020, '2025-06-20', 'Compliment', 'Happy with service', 10, 320, 'Closed', '', 'DOC-F020');

-- to display table data
    select * from public_feedback ;
   
 -- to reamove complete records from table
   truncate table  public_feedback;
    
 -- to remove complete records and attribute from table
    drop table public_feedback;

-- 1. Simple SELECT
SELECT * FROM public_feedback;

-- 2. SELECT specific columns
SELECT id, citizen_id, feedback_type, status FROM public_feedback;

-- 3. WHERE filter
SELECT * FROM public_feedback WHERE status='Open';

-- 4. ORDER BY
SELECT * FROM public_feedback ORDER BY feedback_date DESC;

-- 5. LIMIT
SELECT * FROM public_feedback ORDER BY feedback_date DESC LIMIT 5;

-- 6. COUNT
SELECT COUNT(*) FROM public_feedback;

-- 7. COUNT with WHERE
SELECT COUNT(*) FROM public_feedback WHERE status='Open';

-- 8. GROUP BY
SELECT feedback_type, COUNT(*) FROM public_feedback GROUP BY feedback_type;

-- 9. HAVING
SELECT feedback_type, COUNT(*) FROM public_feedback GROUP BY feedback_type HAVING COUNT(*)>3;

-- 10. DISTINCT
SELECT DISTINCT feedback_type FROM public_feedback;

-- 11. LIKE
SELECT * FROM public_feedback WHERE message LIKE '%delay%';

-- 12. IN
SELECT * FROM public_feedback WHERE status IN ('Open','Reviewed');

-- 13. BETWEEN
SELECT * FROM public_feedback WHERE feedback_date BETWEEN '2025-06-05' AND '2025-06-15';

-- 14. IS NULL
SELECT * FROM public_feedback WHERE remarks IS NULL;

-- 15. IS NOT NULL
SELECT * FROM public_feedback WHERE remarks IS NOT NULL;

-- 16. UPDATE
UPDATE public_feedback SET status='Reviewed' WHERE id=1;

-- 17. DELETE
DELETE FROM public_feedback WHERE id=20;

-- 18. INSERT
INSERT INTO public_feedback (id, citizen_id, feedback_date, feedback_type, message, location_id, officer_id, status, remarks, document_reference) VALUES
(21, 1021, '2025-06-21', 'Complaint', 'Late document submission', 11, 321, 'Open', '', 'DOC-F021');

-- 19. CREATE VIEW
CREATE VIEW vw_open_feedback AS SELECT * FROM public_feedback WHERE status='Open';

-- 20. SELECT from VIEW
SELECT * FROM vw_open_feedback;

-- 21. DROP VIEW
DROP VIEW IF EXISTS vw_open_feedback;

-- 22. CTE simple
WITH cte_feedback AS (SELECT * FROM public_feedback WHERE status='Open') SELECT * FROM cte_feedback;

-- 23. CTE with aggregation
WITH cte_count AS (SELECT feedback_type, COUNT(*) AS cnt FROM public_feedback GROUP BY feedback_type) SELECT * FROM cte_count;

-- 25. Call stored procedure
CALL sp_get_feedback_by_status('Open');

-- 26. Window Function: row_number
SELECT id, feedback_type, ROW_NUMBER() OVER(PARTITION BY feedback_type ORDER BY feedback_date) AS rn FROM public_feedback;

-- 27. Window Function: rank
SELECT id, feedback_type, RANK() OVER(PARTITION BY feedback_type ORDER BY feedback_date) AS rnk FROM public_feedback;

-- 28. Window Function: dense_rank
SELECT id, feedback_type, DENSE_RANK() OVER(PARTITION BY feedback_type ORDER BY feedback_date) AS drnk FROM public_feedback;

-- 29. Window Function: sum
SELECT feedback_type, SUM(id) OVER(PARTITION BY feedback_type) AS total_id FROM public_feedback;

-- 30. Window Function: avg
SELECT feedback_type, AVG(id) OVER(PARTITION BY feedback_type) AS avg_id FROM public_feedback;

-- 31. GRANT SELECT
GRANT SELECT ON public_feedback TO public;

-- 32. REVOKE SELECT
REVOKE SELECT ON public_feedback FROM public;

-- 33. BEGIN TRANSACTION
BEGIN;

-- 34. Transaction: Update multiple
UPDATE public_feedback SET status='Reviewed' WHERE id IN (2,5,9);

-- 35. Transaction: Commit
COMMIT;

-- 36. Transaction: Rollback
BEGIN; UPDATE public_feedback SET status='Open' WHERE id=2; ROLLBACK;

-- 37. TRIGGER: Before INSERT
CREATE TRIGGER trg_before_insert_feedback BEFORE INSERT ON public_feedback
FOR EACH ROW SET NEW.status = 'Open';

-- 38. TRIGGER: After INSERT
CREATE TRIGGER trg_after_insert_feedback AFTER INSERT ON public_feedback
FOR EACH ROW INSERT INTO audit_feedback (feedback_id, action_type, action_date) VALUES (NEW.id, 'INSERT', NOW());

-- 39. SELECT with JOIN (self-join example)
SELECT a.id AS feedback1, b.id AS feedback2 FROM public_feedback a JOIN public_feedback b ON a.officer_id=b.officer_id WHERE a.id<>b.id;

-- 40. Subquery: simple
SELECT * FROM public_feedback WHERE id IN (SELECT id FROM public_feedback WHERE status='Open');

-- 41. Subquery: correlated
SELECT * FROM public_feedback pf1 WHERE id=(SELECT MAX(id) FROM public_feedback pf2 WHERE pf2.status=pf1.status);

-- 42. UNION
SELECT id, message FROM public_feedback WHERE status='Open' UNION SELECT id, message FROM public_feedback WHERE status='Reviewed';

-- 43. UNION ALL
SELECT id, message FROM public_feedback WHERE status='Open' UNION ALL SELECT id, message FROM public_feedback WHERE status='Reviewed';

-- 44. EXISTS
SELECT * FROM public_feedback pf WHERE EXISTS (SELECT 1 FROM public_feedback pf2 WHERE pf2.status='Open' AND pf2.id=pf.id);

-- 45. NOT EXISTS
SELECT * FROM public_feedback pf WHERE NOT EXISTS (SELECT 1 FROM public_feedback pf2 WHERE pf2.status='Closed' AND pf2.id=pf.id);

-- 46. CASE statement
SELECT id, feedback_type, CASE WHEN status='Open' THEN 'Pending' ELSE 'Processed' END AS status_desc FROM public_feedback;

-- 47. COALESCE
SELECT id, COALESCE(remarks,'No remarks') AS remark_text FROM public_feedback;

-- 48. CONCAT
SELECT CONCAT(citizen_id,'-',feedback_type) AS feedback_label FROM public_feedback;

-- 49. LENGTH
SELECT id, LENGTH(message) AS msg_length FROM public_feedback;

-- 50. SUBSTRING
SELECT id, SUBSTRING(message,1,20) AS msg_preview FROM public_feedback;


-- table 15
 CREATE TABLE training_programs (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE,
    trainer_name VARCHAR(100),
    officer_id INT,
    location_id INT,
    category VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO training_programs (id, title, description, start_date, end_date,trainer_name, officer_id, location_id, category, status) VALUES
(1, 'Disaster Management Basics', 'Training on disaster response & mitigation', '2025-06-01', '2025-06-05', 'Dr. A. Kulkarni', 301, 13, 'Safety', 'Scheduled'),
(2, 'First Aid Certification', 'CPR and basic life support training', '2025-06-10', '2025-06-12', 'Ms. Priya Singh', 302, 7, 'Medical', 'Scheduled'),
(3, 'Food Distribution Protocols', 'Techniques for ration distribution', '2025-06-15', '2025-06-17', 'Mr. Sanjay Rao', 303, 6, 'Logistics', 'Planned'),
(4, 'Sanitation Hygiene', 'Safe practices in sanitation drives', '2025-06-20', '2025-06-22', 'Ms. Anita Desai', 304, 12, 'Hygiene', 'Planned'),
(5, 'Mental Health Support', 'Counseling for trauma survivors', '2025-07-01', '2025-07-03', 'Dr. Neha Kulkarni', 305, 13, 'Health', 'Planned'),
(6, 'Shelter Management', 'Setting up temporary shelters', '2025-07-05', '2025-07-07', 'Mr. Vikram Patel', 306, 7, 'Housing', 'Planned'),
(7, 'Water Purification Training', 'Operating purification units', '2025-07-10', '2025-07-12', 'Ms. Sonal Mehta', 307, 5, 'Water', 'Planned'),
(8, 'Cash Aid Disbursement', 'Managing financial relief', '2025-07-15', '2025-07-17', 'Mr. Karan Iyer', 308, 12, 'Finance', 'Planned'),
(9, 'Agriculture Recovery', 'Support training for farmers', '2025-07-20', '2025-07-22', 'Dr. Deepak Joshi', 309, 9, 'Agriculture', 'Planned'),
(10, 'Loan Management', 'Microloan processing and tracking', '2025-08-01', '2025-08-03', 'Ms. Ritika Chavan', 310, 9, 'Finance', 'Planned'),
(11, 'Child Safety Camps', 'Protection and nutrition training', '2025-08-05', '2025-08-07', 'Ms. Priyanka Ghosh', 311, 10, 'Childcare', 'Planned'),
(12, 'Senior Care Training', 'Elderly support services', '2025-08-10', '2025-08-12', 'Mr. Sachin Patil', 312, 12, 'Social', 'Planned'),
(13, 'Environment Restoration', 'Reforestation methods', '2025-08-15', '2025-08-17', 'Mr. Manish Kapoor', 313, 7, 'Environment', 'Planned'),
(14, 'Legal Rights Awareness', 'Educating rights of citizens', '2025-08-20', '2025-08-22', 'Ms. Neelam Verma', 314, 7, 'Legal', 'Planned'),
(15, 'Disability Support Training', 'Assisting differently-abled', '2025-08-25', '2025-08-27', 'Mr. Amit Khanna', 315, 8, 'Health', 'Planned'),
(16, 'Fire Safety Basics', 'Local fire prevention techniques', '2025-09-01', '2025-09-03', 'Mr. Rahul Rasgotra', 316, 8, 'Safety', 'Planned'),
(17, 'Community Policing', 'Enhancing community-law coordination', '2025-09-05', '2025-09-07', 'Ms. Amrita Singh', 317, 9, 'Security', 'Planned'),
(18, 'Emergency Communications', 'Using radios in disaster', '2025-09-10', '2025-09-12', 'Mr. Raghav Jain', 318, 9, 'Security', 'Planned'),
(19, 'Grant Writing Workshop', 'Preparing funding proposals', '2025-09-15', '2025-09-17', 'Ms. Meera Shah', 319, 10, 'Finance', 'Planned'),
(20, 'Volunteer Management', 'Coordinating volunteer teams', '2025-09-20', '2025-09-22', 'Ms. Shruti Nair', 320, 10, 'Management', 'Planned');

-- to display table data
    select * from training_programs;
   
 -- to reamove complete records from table
   truncate table  training_programs;
    
 -- to remove complete records and attribute from table
    drop table training_programs;

-- 1. Simple SELECT
SELECT * FROM training_programs;

-- 2. SELECT specific columns
SELECT title, start_date, end_date FROM training_programs;

-- 3. SELECT with WHERE
SELECT * FROM training_programs WHERE status='Planned';

-- 4. SELECT with ORDER BY
SELECT * FROM training_programs ORDER BY start_date;

-- 5. SELECT with LIMIT
SELECT * FROM training_programs ORDER BY start_date LIMIT 5;

-- 6. SELECT with DISTINCT
SELECT DISTINCT category FROM training_programs;

-- 7. COUNT
SELECT COUNT(*) FROM training_programs;

-- 8. COUNT with WHERE
SELECT COUNT(*) FROM training_programs WHERE status='Scheduled';

-- 9. MAX date
SELECT MAX(end_date) FROM training_programs;

-- 10. MIN date
SELECT MIN(start_date) FROM training_programs;

-- 11. AVG (dummy numeric, using id)
SELECT AVG(id) FROM training_programs;

-- 12. SUM (dummy numeric, using id)
SELECT SUM(id) FROM training_programs;

-- 13. GROUP BY category
SELECT category, COUNT(*) FROM training_programs GROUP BY category;

-- 14. HAVING
SELECT category, COUNT(*) FROM training_programs GROUP BY category HAVING COUNT(*)>1;

-- 15. INNER JOIN (example with officers table)
SELECT t.title, o.officer_id FROM training_programs t INNER JOIN officers o ON t.officer_id=o.officer_id;

-- 16. LEFT JOIN
SELECT t.title, o.officer_id FROM training_programs t LEFT JOIN officers o ON t.officer_id=o.officer_id;

-- 17. RIGHT JOIN
SELECT t.title, o.officer_id FROM training_programs t RIGHT JOIN officers o ON t.officer_id=o.officer_id;

-- 19. Self Join
SELECT t1.title AS t1_title, t2.title AS t2_title FROM training_programs t1 JOIN training_programs t2 ON t1.category=t2.category AND t1.id<>t2.id;

-- 20. Subquery in WHERE
SELECT * FROM training_programs WHERE id IN (SELECT id FROM training_programs WHERE status='Scheduled');

-- 21. Subquery in SELECT
SELECT title, (SELECT COUNT(*) FROM training_programs WHERE category='Finance') AS finance_count FROM training_programs;

-- 22. EXISTS
SELECT * FROM training_programs t WHERE EXISTS (SELECT 1 FROM training_programs WHERE category='Safety');

-- 23. CTE example
WITH planned_trainings AS (SELECT * FROM training_programs WHERE status='Planned') SELECT * FROM planned_trainings;

-- 24. Recursive CTE example
WITH RECURSIVE dates(start_date) AS (
    SELECT start_date FROM training_programs WHERE id = 1
    UNION ALL
    SELECT start_date + INTERVAL 1 DAY
    FROM dates
    WHERE start_date < '2025-06-10'
)
SELECT * FROM dates;

-- 25. CREATE VIEW
CREATE VIEW vw_planned_trainings AS SELECT title, start_date, end_date FROM training_programs WHERE status='Planned';

-- 26. SELECT from VIEW
SELECT * FROM vw_planned_trainings;

-- 27. CREATE PROCEDURE (PostgreSQL syntax)
DELIMITER //

CREATE PROCEDURE sp_get_trainings_by_category(IN cat VARCHAR(100))
BEGIN
    SELECT * 
    FROM training_programs
    WHERE category = cat;
END //

DELIMITER ;

-- 28. CALL PROCEDURE
CALL sp_get_trainings_by_category('Finance');

-- 29. UPDATE statement
UPDATE training_programs SET status='Completed' WHERE end_date<'2025-07-01';

-- 30. DELETE statement
DELETE FROM training_programs WHERE status='Completed';

-- 31. INSERT statement
INSERT INTO training_programs (id,title,description,start_date,end_date,trainer_name,officer_id,location_id,category,status)
VALUES (21,'Nutrition Workshop','Healthy diet training','2025-09-25','2025-09-27','Dr. Kavita',321,11,'Health','Planned');

-- 32. Window function ROW_NUMBER
SELECT id,title,ROW_NUMBER() OVER(PARTITION BY category ORDER BY start_date) AS rn FROM training_programs;

-- 33. Window function RANK
SELECT id,title,RANK() OVER(PARTITION BY category ORDER BY start_date) AS rnk FROM training_programs;

-- 34. Window function DENSE_RANK
SELECT id,title,DENSE_RANK() OVER(PARTITION BY category ORDER BY start_date) AS drnk FROM training_programs;

-- 35. Window function SUM
SELECT category,SUM(id) OVER(PARTITION BY category) AS sum_id FROM training_programs;

-- 36. GRANT SELECT
GRANT SELECT ON training_programs TO public;

-- 37. GRANT INSERT
GRANT INSERT ON training_programs TO public;

-- 38. REVOKE UPDATE
REVOKE UPDATE ON training_programs FROM public;

-- 39. BEGIN transaction
BEGIN;

-- 40. COMMIT transaction
COMMIT;

-- 41. ROLLBACK transaction
ROLLBACK;

-- 44. LIKE operator
SELECT * FROM training_programs WHERE title LIKE 'Disaster%';

-- 45. BETWEEN operator
SELECT * FROM training_programs WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';

-- 46. IN operator
SELECT * FROM training_programs WHERE category IN ('Finance','Health');

-- 47. CASE expression
SELECT id,title,
CASE WHEN status='Planned' THEN 'Upcoming' ELSE 'Completed' END AS training_status
FROM training_programs;

-- 48. COALESCE
SELECT id,title,COALESCE(status,'Unknown') FROM training_programs;

-- 49. NULL check
SELECT * FROM training_programs WHERE trainer_name IS NULL;

-- 50. CONCAT
SELECT id, CONCAT(title,' - ',category) AS title_category FROM training_programs;


-- table 16
 CREATE TABLE emergency_contacts (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(15),
    department VARCHAR(50),
    location_id INT,
    email VARCHAR(100),
    designation VARCHAR(50),
    status VARCHAR(20),
    remarks TEXT,
    added_by INT
);

INSERT INTO emergency_contacts (id, name, contact_number, department,location_id, email, designation, status,remarks, added_by) VALUES
(1, 'Ravi Kumar', '9123459001', 'Fire Services', 13, 'r.kumar@firedept.gov', 'Station Chief', 'Active', '', 301),
(2, 'Anita Desai', '9123459002', 'Health', 7, 'a.desai@healthdept.gov', 'Medical Officer', 'Active', '', 302),
(3, 'Sameer Khan', '9123459003', 'Water Purification', 6, 's.khan@waterdept.gov', 'Engineer', 'Active', '', 303),
(4, 'Priya Shah', '9123459004', 'Sanitation', 12, 'p.shah@sanitation.gov', 'Supervisor', 'Active', '', 304),
(5, 'Vikram Patel', '9123459005', 'Shelter', 13, 'v.patel@shelter.gov', 'Coordinator', 'Active', '', 305),
(6, 'Meera Joshi', '9123459006', 'Logistics', 7, 'm.joshi@logistics.gov', 'Logistic Officer', 'Active', '', 306),
(7, 'Rahul Deshmukh', '9123459007', 'Energy', 5, 'r.deshmukh@energy.gov', 'Engineer', 'Pending', 'Certification pending', 307),
(8, 'Neha Kulkarni', '9123459008', 'Clothing Supply', 12, 'n.kulkarni@clothsup.gov', 'Procurement Lead', 'Active', '', 308),
(9, 'Karan Roy', '9123459009', 'Agriculture', 9, 'k.roy@agri.gov', 'Agriculture Specialist', 'Active', '', 309),
(10, 'Anita Naik', '9123459010', 'Medical Supplies', 9, 'a.naik@medsup.gov', 'Supply Officer', 'Active', '', 310),
(11, 'Deepak Joshi', '9123459011', 'Water Tanks', 10, 'd.joshi@watertanks.gov', 'Maintenance Head', 'Active', '', 311),
(12, 'Ritika Desai', '9123459012', 'Sanitation Kits', 12, 'r.desai@sankits.gov', 'Field Officer', 'Pending', 'Awaiting training', 312),
(13, 'Aditya Rao', '9123459013', 'Solar Energy', 7, 'a.rao@solarpower.gov', 'Project Manager', 'Active', '', 313),
(14, 'Priyanka Ghosh', '9123459014', 'Legal Aid', 7, 'p.ghosh@legalaid.gov', 'Legal Officer', 'Active', '', 314),
(15, 'Sachin Patil', '9123459015', 'Pension Distribution', 8, 's.patil@pension.gov', 'Superintendent', 'Active', '', 315),
(16, 'Sunita Dixit', '9123459016', 'Forestry', 8, 's.dixit@forestry.gov', 'Environmental Officer', 'Active', '', 316),
(17, 'Manish Kapoor', '9123459017', 'Justice Outreach', 9, 'm.kapoor@justice.gov', 'Program Manager', 'Active', '', 317),
(18, 'Neelam Verma', '9123459018', 'Disability Services', 9, 'n.verma@disability.gov', 'Case Worker', 'Pending', 'Background check', 318),
(19, 'Amit Khanna', '9123459019', 'Emergency Kits', 10, 'a.khanna@emergencykits.gov', 'Kit Coordinator', 'Active', '', 319),
(20, 'Shruti Nair', '9123459020', 'Reforestation', 10, 's.nair@reforest.gov', 'Plantation Lead', 'Active', '', 320);

-- to display table data
    select * from emergency_contacts;
   
 -- to reamove complete records from table
   truncate table emergency_contacts;
    
 -- to remove complete records and attribute from table
    drop table emergency_contacts;

-- 1. Simple View: all active contacts
CREATE VIEW vw_active_contacts AS
SELECT * FROM emergency_contacts WHERE status='Active';

-- 2. View: contacts by department
CREATE VIEW vw_dept_contacts AS
SELECT department, COUNT(*) AS total_contacts
FROM emergency_contacts
GROUP BY department;

-- 3. View: pending contacts
CREATE VIEW vw_pending_contacts AS
SELECT * FROM emergency_contacts WHERE status='Pending';

-- 4. View: email and name only
CREATE VIEW vw_contact_emails AS
SELECT name, email FROM emergency_contacts;

-- 5. View: location-wise count
CREATE VIEW vw_location_count AS
SELECT location_id, COUNT(*) AS contacts_count
FROM emergency_contacts GROUP BY location_id;

-- 6. CTE: recent contacts
WITH recent_contacts AS (
  SELECT * FROM emergency_contacts WHERE id>15
)
SELECT * FROM recent_contacts;

-- 7. CTE: active engineers
WITH active_engineers AS (
  SELECT * FROM emergency_contacts WHERE designation LIKE '%Engineer%' AND status='Active'
)
SELECT * FROM active_engineers;

-- 8. CTE: department summary
WITH dept_summary AS (
  SELECT department, COUNT(*) AS total FROM emergency_contacts GROUP BY department
)
SELECT * FROM dept_summary;

-- 9. CTE: contacts needing remarks
WITH needs_remarks AS (
  SELECT * FROM emergency_contacts WHERE remarks<>''
)
SELECT * FROM needs_remarks;

-- 10. CTE: location 7 contacts
WITH loc7_contacts AS (
  SELECT * FROM emergency_contacts WHERE location_id=7
)
SELECT * FROM loc7_contacts;

-- 11. Stored Procedure: get contacts by status
DELIMITER //

CREATE PROCEDURE sp_get_contacts_by_status(IN p_status VARCHAR(50))
BEGIN
    SELECT * 
    FROM emergency_contacts
    WHERE status = p_status;
END //

DELIMITER ;

-- 12. Stored Procedure: count by department
DELIMITER //

CREATE PROCEDURE sp_count_by_department()
BEGIN
    SELECT department, COUNT(*) AS total_contacts
    FROM emergency_contacts
    GROUP BY department;
END //

DELIMITER ;

-- 13. Stored Procedure: update remarks
DELIMITER //

CREATE PROCEDURE sp_update_remarks(IN p_id INT, IN p_remarks TEXT)
BEGIN
    UPDATE emergency_contacts
    SET remarks = p_remarks
    WHERE id = p_id;
END //

DELIMITER ;


-- 14. Window Function: row number by department
SELECT *, ROW_NUMBER() OVER(PARTITION BY department ORDER BY id) AS rn
FROM emergency_contacts;

-- 15. Window Function: rank by location
SELECT *, RANK() OVER(PARTITION BY location_id ORDER BY id) AS rnk
FROM emergency_contacts;

-- 16. Window Function: dense rank by status
SELECT *, DENSE_RANK() OVER(PARTITION BY status ORDER BY id) AS drnk
FROM emergency_contacts;

-- 17. Window Function: cumulative count
SELECT *, COUNT(*) OVER(PARTITION BY department ORDER BY id) AS cum_count
FROM emergency_contacts;

-- 18. Window Function: lag previous ID
SELECT *, LAG(id) OVER(ORDER BY id) AS prev_id FROM emergency_contacts;

-- 19. Window Function: lead next ID
SELECT *, LEAD(id) OVER(ORDER BY id) AS next_id FROM emergency_contacts;

-- 20. Window Function: average ID by department
SELECT *, AVG(id) OVER(PARTITION BY department) AS avg_id
FROM emergency_contacts;

-- 21. DCL: grant select
GRANT SELECT ON emergency_contacts TO public;

-- 22. DCL: grant insert
GRANT INSERT ON emergency_contacts TO public;

-- 23. DCL: revoke update
REVOKE UPDATE ON emergency_contacts FROM public;

-- 24. DCL: grant update
GRANT UPDATE ON emergency_contacts TO public;

-- 25. DCL: revoke delete
REVOKE DELETE ON emergency_contacts FROM public;

-- 26. TCL: begin transaction
BEGIN;

-- 27. TCL: insert within transaction
INSERT INTO emergency_contacts(id,name,contact_number,department,location_id,email,designation,status,remarks,added_by)
VALUES(21,'Test User','9123459021','Test Dept',11,'test@dept.gov','Officer','Active','','321');

-- 28. TCL: update within transaction
UPDATE emergency_contacts SET status='Pending' WHERE id=21;

-- 29. TCL: commit transaction
COMMIT;

-- 30. TCL: rollback example
BEGIN;
UPDATE emergency_contacts SET status='Closed' WHERE id=21;
ROLLBACK;

-- 31. Trigger: before insert set status default
DELIMITER //

CREATE TRIGGER trg_before_insert_status
BEFORE INSERT ON volunteer_registrations
FOR EACH ROW
BEGIN
    IF NEW.status IS NULL THEN
        SET NEW.status = 'Active';
    END IF;
END //

DELIMITER ;


-- 32. Trigger: after update log change
CREATE TABLE contact_audit (
    id INT,
    old_status VARCHAR(20),
    new_status VARCHAR(20),
    changed_at TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_update_status
AFTER UPDATE ON emergency_contacts
FOR EACH ROW
BEGIN
    INSERT INTO contact_audit(id, old_status, new_status, changed_at)
    VALUES (NEW.id, OLD.status, NEW.status, NOW());
END //

DELIMITER ;

-- 33. Select all
SELECT * FROM emergency_contacts;

-- 34. Select by department
SELECT * FROM emergency_contacts WHERE department='Health';

-- 35. Select by status
SELECT * FROM emergency_contacts WHERE status='Pending';

-- 36. Count by status
SELECT status, COUNT(*) FROM emergency_contacts GROUP BY status;

-- 37. Count by location
SELECT location_id, COUNT(*) FROM emergency_contacts GROUP BY location_id;

-- 38. Max ID
SELECT MAX(id) FROM emergency_contacts;

-- 39. Min ID
SELECT MIN(id) FROM emergency_contacts;

-- 40. Average ID
SELECT AVG(id) FROM emergency_contacts;

-- 41. Contacts added by 301
SELECT * FROM emergency_contacts WHERE added_by=301;

-- 42. Update remarks
UPDATE emergency_contacts SET remarks='Checked' WHERE id=1;

-- 43. Delete test record
DELETE FROM emergency_contacts WHERE id=21;

-- 44. Order by name
SELECT * FROM emergency_contacts ORDER BY name;

-- 45. Order by department, status
SELECT * FROM emergency_contacts ORDER BY department, status;

-- 46. Distinct departments
SELECT DISTINCT department FROM emergency_contacts;

-- 47. Top 5 latest IDs
SELECT * FROM emergency_contacts ORDER BY id DESC LIMIT 5;

-- 48. Contacts with empty remarks
SELECT * FROM emergency_contacts WHERE remarks='';

-- 49. Count per designation
SELECT designation, COUNT(*) FROM emergency_contacts GROUP BY designation;

-- 50. Contacts with email containing 'gov'
SELECT * FROM emergency_contacts WHERE email LIKE '%gov%';


-- table 17
 CREATE TABLE budget_plans (
    id INT PRIMARY KEY,
    plan_name VARCHAR(100),
    fiscal_year VARCHAR(10),
    estimated_amount DECIMAL(12,2),
    approved_amount DECIMAL(12,2),
    officer_id INT,
    status VARCHAR(20),
    remarks TEXT,
    document_reference VARCHAR(100),
    date_created DATE
);

INSERT INTO budget_plans (id, plan_name, fiscal_year, estimated_amount,approved_amount, officer_id, status,remarks, document_reference, date_created) VALUES
(1, 'Annual Relief Budget', '2025-2026', 5000000.00, 4500000.00, 301, 'Approved', 'Initial draft', 'DOC-BP001', '2025-04-01'),
(2, 'Medical Response Plan', '2025-2026', 2000000.00, 1800000.00, 302, 'Approved', '', 'DOC-BP002', '2025-04-05'),
(3, 'Food Distribution Plan', '2025-2026', 1500000.00, 1400000.00, 303, 'Approved', 'Includes buffer', 'DOC-BP003', '2025-04-10'),
(4, 'Shelter Setup Budget', '2025-2026', 1200000.00, 1100000.00, 304, 'Pending', 'Under review', 'DOC-BP004', '2025-04-12'),
(5, 'Water Supply Budget', '2025-2026', 1000000.00, 950000.00, 305, 'Approved', '', 'DOC-BP005', '2025-04-15'),
(6, 'Sanitation Infrastructure', '2025-2026', 800000.00, 750000.00, 306, 'Pending', 'Pending clarification', 'DOC-BP006', '2025-04-18'),
(7, 'Livelihood Support Plan', '2025-2026', 600000.00, 580000.00, 307, 'Approved', 'Pilot phase', 'DOC-BP007', '2025-04-20'),
(8, 'Microloan Disbursement', '2025-2026', 400000.00, 390000.00, 308, 'Approved', '', 'DOC-BP008', '2025-04-22'),
(9, 'Education Aid Budget', '2025-2026', 300000.00, 280000.00, 309, 'Pending', 'Awaiting funds', 'DOC-BP009', '2025-04-25'),
(10, 'Environmental Restoration', '2025-2026', 700000.00, 650000.00, 310, 'Approved', '', 'DOC-BP010', '2025-04-28'),
(11, 'Legal Aid Program', '2025-2026', 250000.00, 240000.00, 311, 'Approved', '', 'DOC-BP011', '2025-05-01'),
(12, 'Cash Relief Program', '2025-2026', 900000.00, 880000.00, 312, 'Pending', 'Needs approval', 'DOC-BP012', '2025-05-05'),
(13, 'Disaster Awareness', '2025-2026', 150000.00, 140000.00, 313, 'Approved', '', 'DOC-BP013', '2025-05-08'),
(14, 'Women’s Empowerment Fund', '2025-2026', 350000.00, 340000.00, 314, 'Approved', '', 'DOC-BP014', '2025-05-10'),
(15, 'Senior Citizen Support', '2025-2026', 200000.00, 190000.00, 315, 'Pending', 'Budget revision', 'DOC-BP015', '2025-05-12'),
(16, 'Disability Support Fund', '2025-2026', 300000.00, 290000.00, 316, 'Approved', '', 'DOC-BP016', '2025-05-15'),
(17, 'Plantation Drive Budget', '2025-2026', 180000.00, 175000.00, 317, 'Approved', '', 'DOC-BP017', '2025-05-18'),
(18, 'Microenterprise Support', '2025-2026', 500000.00, 480000.00, 318, 'Pending', 'Under review', 'DOC-BP018', '2025-05-20'),
(19, 'Cash-for-Work Scheme', '2025-2026', 650000.00, 630000.00, 319, 'Approved', '', 'DOC-BP019', '2025-05-22'),
(20, 'Emergency Response Fund', '2025-2026', 1000000.00, 950000.00, 320, 'Approved', 'Contingency included', 'DOC-BP020', '2025-05-25');

-- to display table data
    select * from budget_plans;
   
 -- to reamove complete records from table
   truncate table budget_plans;
    
 -- to remove complete records and attribute from table
    drop table budget_plans;

-- 1. Create a simple view for approved budgets
CREATE VIEW vw_approved_budgets AS
SELECT id, plan_name, fiscal_year, approved_amount
FROM budget_plans
WHERE status='Approved';

-- 2. View for pending budgets
CREATE VIEW vw_pending_budgets AS
SELECT id, plan_name, fiscal_year, estimated_amount
FROM budget_plans
WHERE status='Pending';

-- 3. View for budgets above 1 million
CREATE VIEW vw_large_budgets AS
SELECT * FROM budget_plans
WHERE estimated_amount > 1000000;

-- 4. CTE to get approved vs pending counts
WITH budget_status_count AS (
  SELECT status, COUNT(*) AS count_status
  FROM budget_plans
  GROUP BY status
)
SELECT * FROM budget_status_count;

-- 5. CTE to calculate remaining amount (estimated - approved)
WITH remaining_amount AS (
  SELECT id, plan_name, estimated_amount - approved_amount AS remaining
  FROM budget_plans
)
SELECT * FROM remaining_amount;

-- 6. CTE with filtering for plans over 500,000
WITH high_value_plans AS (
  SELECT id, plan_name, estimated_amount
  FROM budget_plans
  WHERE estimated_amount > 500000
)
SELECT * FROM high_value_plans;

-- 7. Stored procedure to insert a new budget plan
DELIMITER //
CREATE PROCEDURE sp_insert_budget(
  IN p_plan_name VARCHAR(100),
  IN p_fiscal_year VARCHAR(10),
  IN p_estimated_amount DECIMAL(12,2),
  IN p_approved_amount DECIMAL(12,2),
  IN p_officer_id INT,
  IN p_status VARCHAR(20),
  IN p_remarks TEXT,
  IN p_document_reference VARCHAR(100),
  IN p_date_created DATE
)
BEGIN
  INSERT INTO budget_plans(plan_name, fiscal_year, estimated_amount, approved_amount, officer_id, status, remarks, document_reference, date_created)
  VALUES(p_plan_name, p_fiscal_year, p_estimated_amount, p_approved_amount, p_officer_id, p_status, p_remarks, p_document_reference, p_date_created);
END;
//
DELIMITER ;

-- 8. Stored procedure to update budget status
DELIMITER //
CREATE PROCEDURE sp_update_status(IN p_id INT, IN p_status VARCHAR(20))
BEGIN
  UPDATE budget_plans SET status=p_status WHERE id=p_id;
END;
//
DELIMITER ;

-- 9. Window function: running total of approved_amount
SELECT id, plan_name, approved_amount,
       SUM(approved_amount) OVER(ORDER BY date_created) AS running_total
FROM budget_plans;

-- 10. Window function: rank plans by approved_amount
SELECT id, plan_name, approved_amount,
       RANK() OVER(ORDER BY approved_amount DESC) AS rank_approved
FROM budget_plans;

-- 11. Window function: dense rank for estimated_amount
SELECT id, plan_name, estimated_amount,
       DENSE_RANK() OVER(ORDER BY estimated_amount DESC) AS dense_rank_est
FROM budget_plans;

-- 12. Window function: row number for each fiscal year
SELECT id, plan_name, fiscal_year,
       ROW_NUMBER() OVER(PARTITION BY fiscal_year ORDER BY estimated_amount DESC) AS row_num
FROM budget_plans;

-- 13. Grant SELECT on budget_plans to user 'auditor'
GRANT SELECT ON budget_plans TO 'auditor'@'localhost';

-- 14. Grant INSERT privilege
GRANT INSERT ON budget_plans TO 'budget_officer'@'localhost';

-- 15. Revoke DELETE privilege
REVOKE DELETE ON budget_plans FROM 'budget_officer'@'localhost';

-- 16. Start transaction to update multiple budgets
START TRANSACTION;
UPDATE budget_plans SET approved_amount=approved_amount+50000 WHERE status='Approved';
UPDATE budget_plans SET remarks='Checked' WHERE status='Pending';
COMMIT;

-- 17. Rollback example
START TRANSACTION;
UPDATE budget_plans SET approved_amount=0 WHERE id=1;
ROLLBACK;

-- 18. Trigger before insert: set default status if null
DELIMITER //
CREATE TRIGGER trg_before_insert_budget
BEFORE INSERT ON budget_plans
FOR EACH ROW
BEGIN
  IF NEW.status IS NULL THEN
    SET NEW.status = 'Pending';
  END IF;
END;
//
DELIMITER ;

-- 19. Trigger after update: log changes
DELIMITER //
CREATE TRIGGER trg_after_update_budget
AFTER UPDATE ON budget_plans
FOR EACH ROW
BEGIN
  INSERT INTO budget_log(plan_id, old_status, new_status, change_date)
  VALUES(OLD.id, OLD.status, NEW.status, NOW());
END;
//
DELIMITER ;

-- 20. Select budgets with remaining amount > 100,000 using CTE
WITH remaining AS (
  SELECT id, plan_name, estimated_amount - approved_amount AS rem
  FROM budget_plans
)
SELECT * FROM remaining WHERE rem > 100000;

-- 21. View for officer-wise budget total
CREATE VIEW vw_officer_totals AS
SELECT officer_id, SUM(approved_amount) AS total_approved
FROM budget_plans
GROUP BY officer_id;

-- 22. Window function: percent rank by approved_amount
SELECT id, plan_name, approved_amount,
       PERCENT_RANK() OVER(ORDER BY approved_amount) AS perc_rank
FROM budget_plans;

-- 23. Window function: NTile by estimated_amount
SELECT id, plan_name, estimated_amount,
       NTILE(4) OVER(ORDER BY estimated_amount DESC) AS quartile
FROM budget_plans;

-- 24. Stored procedure: delete a budget by id
DELIMITER //
CREATE PROCEDURE sp_delete_budget(IN p_id INT)
BEGIN
  DELETE FROM budget_plans WHERE id=p_id;
END;
//
DELIMITER ;

-- 25. CTE: budgets with ratio of approved/estimated
WITH budget_ratio AS (
  SELECT id, plan_name, approved_amount/estimated_amount AS ratio
  FROM budget_plans
)
SELECT * FROM budget_ratio;

-- 26. View: recent 5 budget plans
CREATE VIEW vw_recent_budgets AS
SELECT * FROM budget_plans
ORDER BY date_created DESC
LIMIT 5;

-- 27. Window function: cumulative average of approved_amount
SELECT id, plan_name, approved_amount,
       AVG(approved_amount) OVER(ORDER BY date_created ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_avg
FROM budget_plans;

-- 28. DCL: grant update privilege
GRANT UPDATE ON budget_plans TO 'budget_manager'@'localhost';

-- 29. DCL: revoke update privilege
REVOKE UPDATE ON budget_plans FROM 'budget_officer'@'localhost';

-- 30. TCL: savepoint example
START TRANSACTION;
UPDATE budget_plans SET approved_amount=approved_amount+1000 WHERE id=2;
SAVEPOINT sp1;
UPDATE budget_plans SET approved_amount=approved_amount+2000 WHERE id=3;
ROLLBACK TO sp1;
COMMIT;

-- 31. Trigger: before update to prevent negative approved_amount
DELIMITER //
CREATE TRIGGER trg_before_update_budget
BEFORE UPDATE ON budget_plans
FOR EACH ROW
BEGIN
  IF NEW.approved_amount < 0 THEN
    SET NEW.approved_amount = 0;
  END IF;
END;
//
DELIMITER ;

-- 32. CTE: highest approved_amount
WITH max_approved AS (
  SELECT MAX(approved_amount) AS max_val FROM budget_plans
)
SELECT * FROM max_approved;

-- 33. Window: lag to compare previous approved_amount
SELECT id, plan_name, approved_amount,
       LAG(approved_amount) OVER(ORDER BY date_created) AS prev_amount
FROM budget_plans;

-- 34. Window: lead to see next approved_amount
SELECT id, plan_name, approved_amount,
       LEAD(approved_amount) OVER(ORDER BY date_created) AS next_amount
FROM budget_plans;

-- 35. View: budgets needing remarks
CREATE VIEW vw_budgets_remarks AS
SELECT * FROM budget_plans WHERE remarks <> '';

-- 36. Stored procedure: get budgets by officer
DELIMITER //
CREATE PROCEDURE sp_get_officer_budgets(IN p_officer INT)
BEGIN
  SELECT * FROM budget_plans WHERE officer_id=p_officer;
END;
//
DELIMITER ;

-- 37. Window: first_value to get first approved_amount
SELECT id, plan_name,
       FIRST_VALUE(approved_amount) OVER(ORDER BY date_created) AS first_approved
FROM budget_plans;

-- 38. Window: last_value to get last approved_amount
SELECT id, plan_name,
       LAST_VALUE(approved_amount) OVER(ORDER BY date_created ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_approved
FROM budget_plans;

-- 39. DCL: grant delete
GRANT DELETE ON budget_plans TO 'budget_admin'@'localhost';

-- 40. DCL: revoke insert
REVOKE INSERT ON budget_plans FROM 'budget_officer'@'localhost';

-- 41. TCL: set autocommit off
SET autocommit=0;
UPDATE budget_plans SET status='Reviewed' WHERE id=4;
COMMIT;

-- 42. Trigger: after insert to populate log
DELIMITER //
CREATE TRIGGER trg_after_insert_budget
AFTER INSERT ON budget_plans
FOR EACH ROW
BEGIN
  INSERT INTO budget_log(plan_id, new_status, change_date)
  VALUES(NEW.id, NEW.status, NOW());
END;
//
DELIMITER ;

-- 43. CTE: plans with over 10% difference
WITH diff_plan AS (
  SELECT id, plan_name, (estimated_amount - approved_amount)/estimated_amount AS diff
  FROM budget_plans
)
SELECT * FROM diff_plan WHERE diff > 0.10;

-- 44. View: plans per fiscal year
CREATE VIEW vw_fiscal_year_plans AS
SELECT fiscal_year, COUNT(*) AS total_plans
FROM budget_plans
GROUP BY fiscal_year;

-- 45. Window: rank with partition by fiscal_year
SELECT id, plan_name, approved_amount, fiscal_year,
       RANK() OVER(PARTITION BY fiscal_year ORDER BY approved_amount DESC) AS fiscal_rank
FROM budget_plans;

-- 46. Stored procedure: update remarks by id
DELIMITER //
CREATE PROCEDURE sp_update_remarks(IN p_id INT, IN p_remarks TEXT)
BEGIN
  UPDATE budget_plans SET remarks=p_remarks WHERE id=p_id;
END;
//
DELIMITER ;

-- 47. CTE: budgets in descending approved_amount
WITH ordered_budgets AS (
  SELECT * FROM budget_plans ORDER BY approved_amount DESC
)
SELECT * FROM ordered_budgets;

-- 48. Window: cumulative sum partitioned by status
SELECT id, plan_name, approved_amount, status,
       SUM(approved_amount) OVER(PARTITION BY status ORDER BY date_created) AS cum_status_sum
FROM budget_plans;

-- 49. TCL: rollback example
START TRANSACTION;
UPDATE budget_plans SET approved_amount=approved_amount+500 WHERE id=5;
ROLLBACK;

-- 50. Window: moving average of approved_amount
SELECT id, plan_name, approved_amount,
       AVG(approved_amount) OVER(ORDER BY date_created ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM budget_plans;


-- table 18
CREATE TABLE audit_trails (
    id INT PRIMARY KEY,
    action_type VARCHAR(50),
    table_name VARCHAR(50),
    record_id INT,
    officer_id INT,
    action_time DATETIME,
    remarks TEXT,
    status VARCHAR(20),
    location_id INT,
    ip_address VARCHAR(45)
);

INSERT INTO audit_trails (id, action_type, table_name, record_id,officer_id, action_time, remarks,status, location_id, ip_address) VALUES
(1, 'INSERT', 'citizens', 101, 301, '2025-06-01 08:15:00', 'New citizen added', 'Success', 13, '192.168.1.1'),
(2, 'UPDATE', 'beneficiary_applications', 2, 302, '2025-06-02 09:00:00', 'Verified docs', 'Success', 7, '192.168.1.2'),
(3, 'DELETE', 'incident_reports', 3, 303, '2025-06-03 10:30:00', 'Erroneous report removed', 'Success', 6, '192.168.1.3'),
(4, 'INSERT', 'training_programs', 4, 304, '2025-06-04 11:45:00', 'Training session scheduled', 'Success', 12, '192.168.1.4'),
(5, 'UPDATE', 'inventory_items', 5, 305, '2025-06-05 12:20:00', 'Quantity updated', 'Success', 13, '192.168.1.5'),
(6, 'DELETE', 'suppliers', 6, 306, '2025-06-06 13:10:00', 'Supplier removed', 'Success', 7, '192.168.1.6'),
(7, 'INSERT', 'budget_plans', 7, 307, '2025-06-07 14:00:00', 'Budget created', 'Success', 5, '192.168.1.7'),
(8, 'UPDATE', 'public_feedback', 8, 308, '2025-06-08 14:30:00', 'Status changed to Reviewed', 'Success', 12, '192.168.1.8'),
(9, 'DELETE', 'ngo_partners', 9, 309, '2025-06-09 15:15:00', 'Partner deregistered', 'Success', 9, '192.168.1.9'),
(10, 'INSERT', 'incident_reports', 10, 310, '2025-06-10 16:05:00', 'New incident logged', 'Success', 9, '192.168.1.10'),
(11, 'UPDATE', 'disaster_events', 11, 311, '2025-06-11 16:45:00', 'Severity updated', 'Success', 10, '192.168.1.11'),
(12, 'DELETE', 'application_status_logs', 12, 312, '2025-06-12 17:30:00', 'Obsolete log removed', 'Success', 12, '192.168.1.12'),
(13, 'INSERT', 'aid_distribution', 13, 313, '2025-06-13 18:00:00', 'Aid delivered', 'Success', 7, '192.168.1.13'),
(14, 'UPDATE', 'fund_allocations', 14, 314, '2025-06-14 18:45:00', 'Amount spent updated', 'Success', 7, '192.168.1.14'),
(15, 'DELETE', 'relief_programs', 15, 315, '2025-06-15 19:10:00', 'Program cancelled', 'Success', 8, '192.168.1.15'),
(16, 'INSERT', 'locations', 16, 316, '2025-06-16 20:00:00', 'New location added', 'Success', 8, '192.168.1.16'),
(17, 'UPDATE', 'government_officers', 17, 317, '2025-06-17 20:30:00', 'Designation updated', 'Success', 9, '192.168.1.17'),
(18, 'DELETE', 'emergency_contacts', 18, 318, '2025-06-18 21:15:00', 'Contact no longer valid', 'Success', 9, '192.168.1.18'),
(19, 'INSERT', 'public_feedback', 19, 319, '2025-06-19 21:45:00', 'Feedback received', 'Success', 10, '192.168.1.19'),
(20, 'UPDATE', 'audit_trails', 1, 320, '2025-06-20 22:00:00', 'Remark added', 'Success', 10, '192.168.1.20');

-- to display table data
    select * from  audit_trails ;
   
 -- to reamove complete records from table
   truncate table  audit_trails ;
    
 -- to remove complete records and attribute from table
    drop table  audit_trails ;

-- 1. Simple SELECT
SELECT * FROM audit_trails;

-- 2. SELECT with WHERE
SELECT * FROM audit_trails WHERE action_type='INSERT';

-- 3. SELECT specific columns
SELECT id, action_type, table_name, officer_id FROM audit_trails;

-- 4. SELECT with ORDER BY
SELECT * FROM audit_trails ORDER BY action_time DESC;

-- 5. SELECT with LIMIT
SELECT * FROM audit_trails ORDER BY action_time DESC LIMIT 5;

-- 6. SELECT with COUNT
SELECT COUNT(*) AS total_actions FROM audit_trails;

-- 7. SELECT with GROUP BY
SELECT action_type, COUNT(*) AS total FROM audit_trails GROUP BY action_type;

-- 8. SELECT with HAVING
SELECT action_type, COUNT(*) AS total FROM audit_trails GROUP BY action_type HAVING COUNT(*) > 5;

-- 9. SELECT with DISTINCT
SELECT DISTINCT table_name FROM audit_trails;

-- 10. SELECT with BETWEEN
SELECT * FROM audit_trails WHERE action_time BETWEEN '2025-06-01' AND '2025-06-10';

-- 11. SELECT with LIKE
SELECT * FROM audit_trails WHERE remarks LIKE '%added%';

-- 12. CREATE VIEW
CREATE VIEW vw_inserts AS
SELECT * FROM audit_trails WHERE action_type='INSERT';

-- 13. CREATE VIEW with aggregation
CREATE VIEW vw_action_summary AS
SELECT action_type, COUNT(*) AS total FROM audit_trails GROUP BY action_type;

-- 14. DROP VIEW
DROP VIEW IF EXISTS vw_inserts;

-- 15. CTE basic
WITH recent_actions AS (
    SELECT * FROM audit_trails ORDER BY action_time DESC LIMIT 5
)
SELECT * FROM recent_actions;

-- 16. CTE with aggregation
WITH action_counts AS (
    SELECT action_type, COUNT(*) AS total FROM audit_trails GROUP BY action_type
)
SELECT * FROM action_counts WHERE total>3;

-- 17. CTE recursive example (dummy example for hierarchy)
WITH RECURSIVE officer_hierarchy AS (
    SELECT officer_id, id AS trail_id FROM audit_trails WHERE officer_id=301
    UNION ALL
    SELECT a.officer_id, a.id FROM audit_trails a
    INNER JOIN officer_hierarchy oh ON a.officer_id=oh.officer_id+1
)
SELECT * FROM officer_hierarchy;

-- 18. Window function ROW_NUMBER
SELECT *, ROW_NUMBER() OVER(PARTITION BY action_type ORDER BY action_time DESC) AS rn FROM audit_trails;

-- 19. Window function RANK
SELECT *, RANK() OVER(PARTITION BY action_type ORDER BY action_time DESC) AS rnk FROM audit_trails;

-- 20. Window function DENSE_RANK
SELECT *, DENSE_RANK() OVER(PARTITION BY action_type ORDER BY action_time DESC) AS drnk FROM audit_trails;

-- 21. Window function SUM
SELECT officer_id, SUM(id) OVER(PARTITION BY officer_id ORDER BY action_time) AS running_sum FROM audit_trails;

-- 22. Window function COUNT
SELECT officer_id, COUNT(*) OVER(PARTITION BY officer_id) AS total_actions FROM audit_trails;

-- 23. Window function AVG
SELECT officer_id, AVG(id) OVER(PARTITION BY officer_id) AS avg_id FROM audit_trails;

-- 24. Simple INSERT
INSERT INTO audit_trails(id, action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id, ip_address)
VALUES(21,'INSERT','audit_trails',21,321,'2025-06-21 10:00:00','Test insert','Success',11,'192.168.1.21');

-- 25. UPDATE statement
UPDATE audit_trails SET remarks='Updated remarks' WHERE id=21;

-- 26. DELETE statement
DELETE FROM audit_trails WHERE id=21;

-- 27. Stored Procedure create
DELIMITER //
CREATE PROCEDURE sp_get_inserts()
BEGIN
    SELECT * FROM audit_trails WHERE action_type='INSERT';
END //
DELIMITER ;

-- 28. Call stored procedure
CALL sp_get_inserts();

-- 29. Stored Procedure with parameter
DELIMITER //
CREATE PROCEDURE sp_get_by_officer(IN p_officer_id INT)
BEGIN
    SELECT * FROM audit_trails WHERE officer_id=p_officer_id;
END //
DELIMITER ;

-- 30. Call procedure with parameter
CALL sp_get_by_officer(301);

-- 31. Transaction example BEGIN
START TRANSACTION;

-- 32. Transaction example INSERT
INSERT INTO audit_trails(id, action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id, ip_address)
VALUES(22,'INSERT','audit_trails',22,322,'2025-06-22 11:00:00','Transaction test','Success',12,'192.168.1.22');

-- 33. Transaction COMMIT
COMMIT;

-- 34. Transaction ROLLBACK example
START TRANSACTION;
INSERT INTO audit_trails(id, action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id, ip_address)
VALUES(23,'INSERT','audit_trails',23,323,'2025-06-23 12:00:00','Rollback test','Success',13,'192.168.1.23');
ROLLBACK;

-- 35. GRANT example
GRANT SELECT, INSERT, UPDATE ON audit_trails TO 'relief_user'@'localhost';

-- 36. REVOKE example
REVOKE UPDATE ON audit_trails FROM 'relief_user'@'localhost';

-- 37. TRIGGER BEFORE INSERT
DELIMITER //
CREATE TRIGGER trg_before_insert_audit
BEFORE INSERT ON audit_trails
FOR EACH ROW
BEGIN
    SET NEW.status='Pending';
END //
DELIMITER ;

-- 38. TRIGGER AFTER INSERT
DELIMITER //
CREATE TRIGGER trg_after_insert_audit
AFTER INSERT ON audit_trails
FOR EACH ROW
BEGIN
    INSERT INTO audit_trails(id, action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id, ip_address)
    VALUES(NEW.id+100,'INSERT','audit_trails_log',NEW.id,NEW.officer_id,NOW(),'Auto log','Success',NEW.location_id,NEW.ip_address);
END //
DELIMITER ;

-- 39. TRIGGER BEFORE UPDATE
DELIMITER //
CREATE TRIGGER trg_before_update_audit
BEFORE UPDATE ON audit_trails
FOR EACH ROW
BEGIN
    SET NEW.action_time=NOW();
END //
DELIMITER ;

-- 40. TRIGGER AFTER UPDATE
DELIMITER //
CREATE TRIGGER trg_after_update_audit
AFTER UPDATE ON audit_trails
FOR EACH ROW
BEGIN
    INSERT INTO audit_trails(id, action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id, ip_address)
    VALUES(NEW.id+200,'UPDATE','audit_trails_log',NEW.id,NEW.officer_id,NOW(),'Updated log','Success',NEW.location_id,NEW.ip_address);
END //
DELIMITER ;

-- 41. Aggregate MAX
SELECT MAX(action_time) AS last_action FROM audit_trails;

-- 42. Aggregate MIN
SELECT MIN(action_time) AS first_action FROM audit_trails;

-- 43. Aggregate AVG
SELECT AVG(record_id) AS avg_record FROM audit_trails;

-- 44. Aggregate SUM
SELECT SUM(record_id) AS total_records FROM audit_trails;

-- 45. Conditional SELECT CASE
SELECT id, action_type,
CASE WHEN action_type='INSERT' THEN 'New Entry'
     WHEN action_type='UPDATE' THEN 'Updated'
     ELSE 'Removed' END AS action_desc
FROM audit_trails;

-- 46. Subquery example
SELECT * FROM audit_trails WHERE officer_id IN (SELECT officer_id FROM audit_trails WHERE action_type='INSERT');

-- 47. EXISTS example
SELECT * FROM audit_trails a WHERE EXISTS (SELECT 1 FROM audit_trails b WHERE b.id=a.id AND b.status='Success');

-- 48. IN example
SELECT * FROM audit_trails WHERE table_name IN ('audit_trails','citizens');

-- 49. JOIN self join example
SELECT a.id, a.officer_id, b.id AS related_id
FROM audit_trails a
JOIN audit_trails b ON a.officer_id=b.officer_id AND a.id<>b.id;

-- 50. LIMIT with OFFSET
SELECT * FROM audit_trails ORDER BY action_time ASC LIMIT 5 OFFSET 5;


-- table 19
 CREATE TABLE donations (
    id INT PRIMARY KEY,
    donor_name VARCHAR(100),
    donation_date DATE,
    amount DECIMAL(12,2),
    category VARCHAR(50),
    mode_of_payment VARCHAR(50),
    remarks TEXT,
    status VARCHAR(20),
    location_id INT,
    document_reference VARCHAR(100)
);

INSERT INTO donations (id, donor_name, donation_date, amount,category, mode_of_payment, remarks,status, location_id, document_reference) VALUES
(1, 'Aarav Sharma', '2025-06-01', 5000.00, 'Financial', 'Online', 'Monthly donation', 'Received', 13, 'DOC-DN001'),
(2, 'Priya Singh', '2025-06-02', 2500.50, 'Food', 'Cash', 'Rice contribution', 'Received', 7, 'DOC-DN002'),
(3, 'Rohan Patel', '2025-06-03', 7500.00, 'Medical', 'Cheque', 'Medicines', 'Received', 6, 'DOC-DN003'),
(4, 'Neha Kulkarni', '2025-06-04', 1200.00, 'Clothing', 'Cash', 'Blankets', 'Received', 12, 'DOC-DN004'),
(5, 'Vikram Desai', '2025-06-05', 15000.00, 'Shelter', 'Online', 'Tent donation', 'Received', 13, 'DOC-DN005'),
(6, 'Sonal Mehta', '2025-06-06', 3000.75, 'Hygiene', 'Cheque', 'Sanitation kits', 'Received', 7, 'DOC-DN006'),
(7, 'Karan Iyer', '2025-06-07', 10000.00, 'Water', 'Online', 'Purifier unit', 'Pending', 5, 'DOC-DN007'),
(8, 'Anita Rao', '2025-06-08', 4200.00, 'Financial', 'Cash', 'School fund', 'Received', 12, 'DOC-DN008'),
(9, 'Deepak Joshi', '2025-06-09', 800.00, 'Clothing', 'Cash', 'Winter jackets', 'Received', 9, 'DOC-DN009'),
(10, 'Ritika Chavan', '2025-06-10', 600.00, 'Food', 'Online', 'Groceries', 'Received', 9, 'DOC-DN010'),
(11, 'Aditya Rao', '2025-06-11', 9500.00, 'Medical', 'Cheque', 'Health camp fund', 'Received', 10, 'DOC-DN011'),
(12, 'Priyanka Ghosh', '2025-06-12', 3500.50, 'Hygiene', 'Online', 'Soaps and sanitizers', 'Received', 12, 'DOC-DN012'),
(13, 'Sachin Patil', '2025-06-13', 2700.00, 'Shelter', 'Cash', 'Blanket kits', 'Received', 7, 'DOC-DN013'),
(14, 'Sunita Dixit', '2025-06-14', 1800.00, 'Water', 'Cheque', 'Water bottles', 'Pending', 7, 'DOC-DN014'),
(15, 'Manish Kapoor', '2025-06-15', 2200.00, 'Education', 'Online', 'School supplies', 'Received', 8, 'DOC-DN015'),
(16, 'Neelam Verma', '2025-06-16', 500.00, 'Clothing', 'Cash', 'School uniforms', 'Received', 8, 'DOC-DN016'),
(17, 'Amit Khanna', '2025-06-17', 4300.00, 'Food', 'Online', 'Meal kits', 'Received', 9, 'DOC-DN017'),
(18, 'Shruti Nair', '2025-06-18', 7600.00, 'Financial', 'Cheque', 'Scholarship fund', 'Received', 9, 'DOC-DN018'),
(19, 'Raghav Jain', '2025-06-19', 890.00, 'Medical', 'Cash', 'First aid kits', 'Pending', 10, 'DOC-DN019'),
(20, 'Meera Shah', '2025-06-20', 13200.00, 'Shelter', 'Online', 'Tent and bedding', 'Received', 10, 'DOC-DN020');

-- to display table data
    select * from  donations;
   
 -- to reamove complete records from table
   truncate table  donations;
    
 -- to remove complete records and attribute from table
    drop table  donations;

-- 1 View: All donations
CREATE VIEW vw_all_donations AS SELECT * FROM donations;

-- 2 View: Donations above 5000
CREATE VIEW vw_large_donations AS SELECT * FROM donations WHERE amount > 5000;

-- 3 View: Donations pending
CREATE VIEW vw_pending_donations AS SELECT * FROM donations WHERE status='Pending';

-- 4 CTE: Total donations per category
WITH category_totals AS (
    SELECT category, SUM(amount) AS total_amount
    FROM donations
    GROUP BY category
)
SELECT * FROM category_totals;

-- 5 CTE: Donations by online payment
WITH online_donations AS (
    SELECT donor_name, amount
    FROM donations
    WHERE mode_of_payment='Online'
)
SELECT * FROM online_donations;

-- 6 CTE: Top 3 donations
WITH top_donors AS (
    SELECT donor_name, amount, RANK() OVER (ORDER BY amount DESC) AS rank_no
    FROM donations
)
SELECT * FROM top_donors WHERE rank_no <=3;

-- 7 Stored Procedure: Insert donation
DELIMITER //

CREATE PROCEDURE sp_insert_donation (
    IN p_donor_name VARCHAR(100),
    IN p_donation_date DATE,
    IN p_amount DECIMAL(12,2),
    IN p_category VARCHAR(50),
    IN p_mode_of_payment VARCHAR(50),
    IN p_remarks TEXT,
    IN p_status VARCHAR(20),
    IN p_location_id INT,
    IN p_document_reference VARCHAR(100)
)
BEGIN
    INSERT INTO donations(
        donor_name, donation_date, amount, category, 
        mode_of_payment, remarks, status, location_id, document_reference
    )
    VALUES(
        p_donor_name, p_donation_date, p_amount, p_category, 
        p_mode_of_payment, p_remarks, p_status, p_location_id, p_document_reference
    );
END //

DELIMITER ;



-- 9 Window Function: Running total of donations
SELECT donor_name, donation_date, amount,
       SUM(amount) OVER (ORDER BY donation_date) AS running_total
FROM donations;

-- 10 Window Function: Row number by amount
SELECT donor_name, amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_no
FROM donations;

-- 11 Window Function: Rank by donation
SELECT donor_name, amount,
       RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS category_rank
FROM donations;


-- 13 DCL: Grant select
GRANT SELECT ON donations TO officer_role;

-- 14 DCL: Grant insert
GRANT INSERT ON donations TO officer_role;

-- 15 DCL: Revoke update
REVOKE UPDATE ON donations FROM guest_role;

-- 16 DCL: Grant update
GRANT UPDATE ON donations TO manager_role;

-- 17 TCL: Commit example
START TRANSACTION;
UPDATE donations SET status='Received' WHERE status='Pending';
COMMIT;

-- 18 TCL: Rollback example
START TRANSACTION;
DELETE FROM donations WHERE id=20;
ROLLBACK;

-- 19 TCL: Savepoint
START TRANSACTION;
UPDATE donations SET amount=amount+100 WHERE id=1;
SAVEPOINT sp1;
UPDATE donations SET amount=amount+200 WHERE id=2;
ROLLBACK TO sp1;
COMMIT;

-- 20 Trigger: Before insert set default status
CREATE TRIGGER trg_before_insert_donations
BEFORE INSERT ON donations
FOR EACH ROW
SET NEW.status = IFNULL(NEW.status,'Received');

-- 21 Trigger: After insert log insert
CREATE TRIGGER trg_after_insert_donations
AFTER INSERT ON donations
FOR EACH ROW
INSERT INTO audit_trails(action_type, table_name, record_id, officer_id, action_time, remarks, status, location_id)
VALUES('INSERT','donations', NEW.id, NULL, NOW(),'Donation added','Success',NEW.location_id);

-- 22 Select all donations
SELECT * FROM donations;

-- 23 Select donations by donor
SELECT * FROM donations WHERE donor_name='Aarav Sharma';

-- 24 Sum of donations
SELECT SUM(amount) AS total_donations FROM donations;

-- 25 Average donation
SELECT AVG(amount) AS avg_donation FROM donations;

-- 26 Max donation
SELECT MAX(amount) AS max_donation FROM donations;

-- 27 Min donation
SELECT MIN(amount) AS min_donation FROM donations;

-- 28 Count donations
SELECT COUNT(*) AS donation_count FROM donations;

-- 29 Count donations per category
SELECT category, COUNT(*) AS category_count FROM donations GROUP BY category;

-- 30 Donations received this month
SELECT * FROM donations WHERE MONTH(donation_date)=6 AND YEAR(donation_date)=2025;

-- 31 Donations above 5000
SELECT * FROM donations WHERE amount>5000;

-- 32 Donations by mode
SELECT mode_of_payment, COUNT(*) FROM donations GROUP BY mode_of_payment;

-- 33 Donations by status
SELECT status, COUNT(*) FROM donations GROUP BY status;

-- 34 Donations per location
SELECT location_id, SUM(amount) AS total_amount FROM donations GROUP BY location_id;

-- 35 Update donation remarks
UPDATE donations SET remarks='Updated' WHERE id=5;

-- 36 Delete a donation
DELETE FROM donations WHERE id=16;

-- 37 Insert a donation
INSERT INTO donations VALUES (21,'Test Donor','2025-06-21',500,'Financial','Cash','Test','Pending',11,'DOC-DN021');

-- 38 Top 5 donations
SELECT * FROM donations ORDER BY amount DESC LIMIT 5;

-- 39 Bottom 5 donations
SELECT * FROM donations ORDER BY amount ASC LIMIT 5;

-- 40 Donations per category sum
SELECT category, SUM(amount) AS total_amount FROM donations GROUP BY category;

-- 41 Donations per category avg
SELECT category, AVG(amount) AS avg_amount FROM donations GROUP BY category;

-- 42 Donations per category max
SELECT category, MAX(amount) AS max_amount FROM donations GROUP BY category;

-- 43 Donations per category min
SELECT category, MIN(amount) AS min_amount FROM donations GROUP BY category;

-- 44 Donations last 7 days
SELECT * FROM donations WHERE donation_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

-- 45 Donations with remarks not null
SELECT * FROM donations WHERE remarks IS NOT NULL;

-- 46 Donations with empty remarks
SELECT * FROM donations WHERE remarks='';

-- 47 Update donation status to received
UPDATE donations SET status='Received' WHERE status='Pending';

-- 48 Delete donations below 1000
DELETE FROM donations WHERE amount<1000;

-- 49 Select donations with rank over 2
SELECT donor_name, amount, RANK() OVER (ORDER BY amount DESC) AS rank_no FROM donations HAVING rank_no>2;

-- 50 CTE with window total per category
WITH category_running AS (
SELECT *, SUM(amount) OVER(PARTITION BY category ORDER BY donation_date) AS running_total FROM donations
)
SELECT * FROM category_running;


-- table20
 CREATE TABLE media_coverage (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    media_type VARCHAR(50),
    date_published DATE,
    source VARCHAR(100),
    url TEXT,
    summary TEXT,
    event_id INT,
    location_id INT,
    officer_id INT
);
INSERT INTO media_coverage (id, title, media_type, date_published,source, url, summary, event_id, location_id, officer_id) VALUES
(1, 'Monsoon Flood Impact', 'Article', '2025-06-02', 'Daily Times', 'http://example.com/flood', 'Coverage of monsoon impacts', 1, 13, 301),
(2, 'Cyclone Mira Approaches', 'Article', '2025-04-21', 'Weather News', 'http://example.com/mira', 'Pre-landfall updates', 3, 303, 302),
(3, 'Earthquake Aftermath', 'Video', '2025-05-16', 'News24', 'http://youtube.com/watch?v=abcd', 'Footage of affected areas', 2, 302, 303),
(4, 'Landslide in Ghats', 'Article', '2025-03-11', 'Mountain Herald', 'http://example.com/landslide', 'Road block coverage', 4, 304, 304),
(5, 'Heatwave Hits Region', 'Article', '2025-05-02', 'Health Daily', 'http://example.com/heatwave', 'Health warnings issued', 5, 305, 305),
(6, 'River Tapi Floods', 'Video', '2025-02-16', 'RiverWatch', 'http://youtube.com/watch?v=efgh', 'Video of overflow', 6, 306, 306),
(7, 'Satara Forest Fires', 'Article', '2025-01-31', 'Forest Times', 'http://example.com/fire', 'Wildfire control update', 7, 307, 307),
(8, 'Tsunami Alert Issued', 'Article', '2025-03-02', 'Coastal News', 'http://example.com/tsunami', 'Alert details', 8, 308, 308),
(9, 'Cyclonic Storm Report', 'Article', '2025-04-06', 'Weather Watch', 'http://example.com/storm', 'Storm summary', 9, 309, 309),
(10, '2024 Flood Recap', 'Video', '2024-06-16', 'Flood Media', 'http://youtube.com/watch?v=ijkl', 'Last year surveillance', 10, 310, 310),
(11, 'Gujarat Quake Report', 'Article', '2025-06-16', 'Quake Review', 'http://example.com/quake', 'Seismic readings', 11, 311, 311),
(12, 'Extreme Heat Advisory', 'Article', '2025-05-11', 'HotNews', 'http://example.com/heat2', 'Advisory issued', 12, 312, 312),
(13, 'Kolhapur Landslide', 'Video', '2025-04-13', 'Mountain Watch', 'http://youtube.com/watch?v=mnop', 'Road clearance progress', 13, 313, 313),
(14, 'Cyclone Zephyr Nears', 'Article', '2025-05-26', 'Storm Central', 'http://example.com/zephyr', 'Pre-landfall updates', 14, 314, 314),
(15, 'Western Storm Report', 'Article', '2025-02-21', 'Storm Watch', 'http://example.com/west', 'Lightning damage report', 15, 315, 315),
(16, 'Nagpur Forest Fire', 'Video', '2025-03-21', 'Forest Watch', 'http://youtube.com/watch?v=qrst', 'Containment efforts', 16, 316, 316),
(17, 'April Heat Spike', 'Article', '2025-04-02', 'Weather Daily', 'http://example.com/aprilheat', 'Temperature data', 17, 317, 317),
(18, 'Elora Creek Flood', 'Article', '2025-01-11', 'Local News', 'http://example.com/elora', 'Flash flooding coverage', 18, 318, 318),
(19, 'Hill Road Slide', 'Video', '2025-05-06', 'RoadWatch', 'http://youtube.com/watch?v=uvwx', 'Clearing operations', 19, 319, 319),
(20, 'Storm Delta Coverage', 'Article', '2025-06-11', 'StormAlert', 'http://example.com/delta', 'Storm surge effects', 20, 320, 320);

-- to display table data
    select * from  media_coverage ;
   
 -- to reamove complete records from table
   truncate table  media_coverage ;
    
 -- to remove complete records and attribute from table
    drop table media_coverage ;

-- 1 View: All media coverage
CREATE VIEW vw_all_media AS SELECT * FROM media_coverage;

-- 2 View: Recent articles only
CREATE VIEW vw_recent_articles AS 
SELECT id, title, media_type, date_published 
FROM media_coverage WHERE media_type='Article';

-- 3 View: Videos only
CREATE VIEW vw_videos AS 
SELECT id, title, url FROM media_coverage WHERE media_type='Video';

-- 4 View: Coverage by location
CREATE VIEW vw_location_coverage AS 
SELECT location_id, COUNT(*) AS total_coverage 
FROM media_coverage GROUP BY location_id;

-- 5 View: Coverage by officer
CREATE VIEW vw_officer_coverage AS 
SELECT officer_id, COUNT(*) AS coverage_count 
FROM media_coverage GROUP BY officer_id;

-- 6 CTE: Last 5 published media
WITH recent_media AS (
  SELECT * FROM media_coverage ORDER BY date_published DESC LIMIT 5
) SELECT * FROM recent_media;

-- 7 CTE: Articles with title like '%Flood%'
WITH flood_articles AS (
  SELECT * FROM media_coverage WHERE title LIKE '%Flood%'
) SELECT * FROM flood_articles;

-- 8 CTE: Count by media_type
WITH media_count AS (
  SELECT media_type, COUNT(*) AS total FROM media_coverage GROUP BY media_type
) SELECT * FROM media_count;

-- 9 CTE: Latest media per location
WITH latest_location AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY location_id ORDER BY date_published DESC) AS rn
  FROM media_coverage
) SELECT * FROM latest_location WHERE rn=1;


DELIMITER //

CREATE PROCEDURE sp_delete_media(IN p_id INT)
BEGIN
    DELETE FROM media_coverage
    WHERE id = p_id;
END //

DELIMITER ;

-- 12 Window Function: Rank by date per media_type
SELECT *, RANK() OVER(PARTITION BY media_type ORDER BY date_published DESC) AS media_rank
FROM media_coverage;

-- 13 Window Function: Row number by location
SELECT *, ROW_NUMBER() OVER(PARTITION BY location_id ORDER BY date_published DESC) AS row_num
FROM media_coverage;

-- 14 Window Function: Count per officer
SELECT *, COUNT(*) OVER(PARTITION BY officer_id) AS coverage_count
FROM media_coverage;

-- 15 Window Function: Cumulative coverage per location
SELECT *, SUM(1) OVER(PARTITION BY location_id ORDER BY date_published) AS cum_count
FROM media_coverage;

-- 16 DCL: Grant SELECT
GRANT SELECT ON media_coverage TO 'report_user';

-- 17 DCL: Grant INSERT
GRANT INSERT ON media_coverage TO 'editor_user';

-- 18 DCL: Revoke DELETE
REVOKE DELETE ON media_coverage FROM 'editor_user';

-- 19 TCL: Start transaction
START TRANSACTION;

-- 20 TCL: Commit transaction
COMMIT;

-- 21 TCL: Rollback transaction
ROLLBACK;

-- 22 Simple SELECT
SELECT * FROM media_coverage;

-- 23 SELECT specific columns
SELECT id, title, media_type, date_published FROM media_coverage;

-- 24 SELECT with WHERE
SELECT * FROM media_coverage WHERE media_type='Article';

-- 25 SELECT with ORDER BY
SELECT * FROM media_coverage ORDER BY date_published DESC;

-- 26 SELECT with LIMIT
SELECT * FROM media_coverage LIMIT 10;

-- 27 SELECT with JOIN (example join with events)
-- Assuming events table exists
SELECT m.id, m.title, e.event_name 
FROM media_coverage m
JOIN events e ON m.event_id=e.id;

-- 28 SELECT with aggregate COUNT
SELECT media_type, COUNT(*) AS total FROM media_coverage GROUP BY media_type;

-- 29 SELECT with aggregate MAX
SELECT MAX(date_published) AS latest_media FROM media_coverage;

-- 30 SELECT with aggregate MIN
SELECT MIN(date_published) AS earliest_media FROM media_coverage;

-- 31 SELECT with aggregate AVG (not much numeric but just example)
SELECT AVG(id) AS avg_id FROM media_coverage;

-- 32 SELECT with GROUP BY and HAVING
SELECT location_id, COUNT(*) AS total 
FROM media_coverage GROUP BY location_id HAVING total>1;

-- 33 SELECT distinct media_type
SELECT DISTINCT media_type FROM media_coverage;

-- 34 Subquery in WHERE
SELECT * FROM media_coverage 
WHERE location_id IN (SELECT location_id FROM media_coverage WHERE media_type='Video');

-- 35 Subquery in FROM
SELECT m.location_id, sub.count_media FROM media_coverage m
JOIN (SELECT location_id, COUNT(*) AS count_media FROM media_coverage GROUP BY location_id) sub
ON m.location_id=sub.location_id;

-- 36 UPDATE statement
UPDATE media_coverage SET summary='Updated summary' WHERE id=1;

-- 37 DELETE statement
DELETE FROM media_coverage WHERE id=20;

-- 40 INSERT statement
INSERT INTO media_coverage(id,title,media_type,date_published,source,url,summary,event_id,location_id,officer_id)
VALUES(21,'New Article','Article','2025-09-01','News Daily','http://example.com/new','Summary',1,13,301);


-- 41 SELECT with LIKE
SELECT * FROM media_coverage WHERE title LIKE '%Flood%';

-- 42 SELECT with BETWEEN
SELECT * FROM media_coverage WHERE date_published BETWEEN '2025-04-01' AND '2025-06-30';

-- 43 SELECT with IS NULL
SELECT * FROM media_coverage WHERE summary IS NULL;

-- 44 SELECT with IS NOT NULL
SELECT * FROM media_coverage WHERE summary IS NOT NULL;

-- 45 SELECT with CASE
SELECT id, title,
CASE WHEN media_type='Video' THEN 'Visual' ELSE 'Text' END AS type_class
FROM media_coverage;

-- 46 SELECT with CONCAT
SELECT CONCAT(title,' - ',source) AS title_source FROM media_coverage;

-- 47 SELECT with SUBSTRING
SELECT SUBSTRING(title,1,10) AS short_title FROM media_coverage;

-- 48 SELECT with ORDER BY and LIMIT
SELECT * FROM media_coverage ORDER BY date_published DESC LIMIT 5;

-- 49 DELETE with condition
DELETE FROM media_coverage WHERE media_type='Video' AND date_published<'2025-01-01';

-- 50 UPDATE with condition
UPDATE media_coverage SET media_type='Article' WHERE media_type='Video';


-- table 21
 CREATE TABLE shelter_centers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location_id INT,
    capacity INT,
    current_occupancy INT,
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    status VARCHAR(20),
    remarks TEXT,
    officer_id INT
);

INSERT INTO shelter_centers (id, name, location_id, capacity,current_occupancy, contact_person, contact_number,status, remarks, officer_id) VALUES
(1, 'Mulshi Community Hall', 13, 200, 150, 'Ravi Kumar', '9123459001', 'Open', '', 301),
(2, 'Maval School Shelter', 7, 100, 90, 'Anita Desai', '9123459002', 'Open', '', 302),
(3, 'Ahmednagar Relief Camp', 6, 300, 280, 'Sameer Khan', '9123459003', 'Open', '', 303),
(4, 'Nagpur City Center', 12, 250, 240, 'Priya Shah', '9123459004', 'Open', '', 304),
(5, 'Aurangabad Tent Camp', 13, 400, 350, 'Vikram Patel', '9123459005', 'Open', '', 305),
(6, 'Pune Relief Camp', 7, 500, 480, 'Meera Joshi', '9123459006', 'Open', '', 306),
(7, 'Kolhapur Safe House', 5, 150, 130, 'Rahul Deshmukh', '9123459007', 'Open', '', 307),
(8, 'Satara Shelter', 12, 200, 180, 'Neha Kulkarni', '9123459008', 'Open', '', 308),
(9, 'Latur Emergency Camp', 9, 300, 270, 'Karan Roy', '9123459009', 'Open', '', 309),
(10, 'Solapur Relief Center', 9, 350, 330, 'Anita Naik', '9123459010', 'Open', '', 310),
(11, 'Nashik Aid Shelter', 10, 250, 230, 'Deepak Joshi', '9123459011', 'Open', '', 311),
(12, 'Mumbai Community Camp', 12, 600, 580, 'Ritika Desai', '9123459012', 'Open', '', 312),
(13, 'Pune City Shelter', 7, 400, 380, 'Aditya Rao', '9123459013', 'Open', '', 313),
(14, 'Mumbai Relief Tent', 7, 450, 420, 'Priyanka Ghosh', '9123459014', 'Open', '', 314),
(15, 'Thane Temporary Camp', 8, 300, 290, 'Sachin Patil', '9123459015', 'Open', '', 315),
(16, 'Mumbai Overflow Camp', 8, 350, 340, 'Sunita Dixit', '9123459016', 'Open', '', 316),
(17, 'Kolhapur Youth Camp', 9, 200, 180, 'Manish Kapoor', '9123459017', 'Open', '', 317),
(18, 'Kolhapur Women Shelter', 9, 150, 140, 'Neelam Verma', '9123459018', 'Open', '', 318),
(19, 'Nagpur Relief Center', 10, 300, 290, 'Amit Khanna', '9123459019', 'Open', '', 319),
(20, 'Aurangabad Community Center', 10, 400, 380, 'Shruti Nair', '9123459020', 'Open', '', 320);

-- to display table data
    select * from  shelter_centers  ;
   
 -- to reamove complete records from table
   truncate table  shelter_centers ;
    
 -- to remove complete records and attribute from table
    drop table  shelter_centers ;

-- 1 View: All shelters
CREATE VIEW vw_all_shelters AS SELECT * FROM shelter_centers;

-- 2 View: Open shelters
CREATE VIEW vw_open_shelters AS SELECT * FROM shelter_centers WHERE status='Open';

-- 3 CTE: High occupancy
WITH high_occ AS (SELECT * FROM shelter_centers WHERE current_occupancy > 300) SELECT * FROM high_occ;

-- 4 CTE: Shelter summary
WITH shelter_summary AS (
    SELECT location_id, COUNT(*) AS total_centers, SUM(current_occupancy) AS total_people
    FROM shelter_centers GROUP BY location_id
) SELECT * FROM shelter_summary;

-- 5 Stored Procedure: Get shelter by id
DELIMITER $$
CREATE PROCEDURE sp_get_shelter(IN sid INT)
BEGIN
    SELECT * FROM shelter_centers WHERE id = sid;
END$$
DELIMITER ;

-- 6 Stored Procedure: Update occupancy
DELIMITER $$
CREATE PROCEDURE sp_update_occupancy(IN sid INT, IN occ INT)
BEGIN
    UPDATE shelter_centers SET current_occupancy = occ WHERE id = sid;
END$$
DELIMITER ;

-- 7 Window Function: Rank by occupancy
SELECT id, name, current_occupancy, RANK() OVER(ORDER BY current_occupancy DESC) AS occ_rank FROM shelter_centers;

-- 8 Window Function: Row number per location
SELECT *, ROW_NUMBER() OVER(PARTITION BY location_id ORDER BY current_occupancy DESC) AS rn FROM shelter_centers;

-- 9 Window Function: Cumulative occupancy
SELECT *, SUM(current_occupancy) OVER(ORDER BY id) AS cum_occupancy FROM shelter_centers;

-- 10 Window Function: Dense rank
SELECT *, DENSE_RANK() OVER(ORDER BY capacity DESC) AS capacity_rank FROM shelter_centers;

-- 11 Window Function: Avg occupancy per location
SELECT *, AVG(current_occupancy) OVER(PARTITION BY location_id) AS avg_occ_loc FROM shelter_centers;

-- 12 DCL: Grant select
GRANT SELECT ON shelter_centers TO 'user1'@'localhost';

-- 13 DCL: Grant insert
GRANT INSERT ON shelter_centers TO 'user1'@'localhost';

-- 14 DCL: Revoke insert
REVOKE INSERT ON shelter_centers FROM 'user1'@'localhost';

-- 15 DCL: Grant update
GRANT UPDATE ON shelter_centers TO 'user2'@'localhost';

-- 16 TCL: Start transaction
START TRANSACTION;

-- 17 TCL: Commit transaction
COMMIT;

-- 18 TCL: Rollback transaction
ROLLBACK;

-- 19 TCL: Savepoint
SAVEPOINT sp1;

-- 20 TCL: Rollback to savepoint
ROLLBACK TO sp1;

-- 21 Insert a new shelter
INSERT INTO shelter_centers (id,name,location_id,capacity,current_occupancy,contact_person,contact_number,status,remarks,officer_id) 
VALUES (21,'New Shelter',11,200,50,'Test','9123459021','Open','',321);

-- 22 Update shelter occupancy
UPDATE shelter_centers SET current_occupancy = 100 WHERE id = 1;

-- 23 Delete shelter
DELETE FROM shelter_centers WHERE id = 21;

-- 24 Select all shelters
SELECT * FROM shelter_centers;

-- 25 Select specific columns
SELECT id,name,capacity,current_occupancy FROM shelter_centers;

-- 26 Filter by capacity
SELECT * FROM shelter_centers WHERE capacity > 300;

-- 27 Filter by occupancy
SELECT * FROM shelter_centers WHERE current_occupancy < 200;

-- 28 Order by occupancy descending
SELECT * FROM shelter_centers ORDER BY current_occupancy DESC;

-- 29 Group by location
SELECT location_id, COUNT(*) AS num_shelters FROM shelter_centers GROUP BY location_id;

-- 30 Aggregate: total occupancy
SELECT SUM(current_occupancy) AS total_people FROM shelter_centers;

-- 31 Aggregate: max capacity
SELECT MAX(capacity) AS max_capacity FROM shelter_centers;

-- 32 Aggregate: min occupancy
SELECT MIN(current_occupancy) AS min_occupancy FROM shelter_centers;

-- 33 Aggregate: average occupancy
SELECT AVG(current_occupancy) AS avg_occupancy FROM shelter_centers;

-- 34 Join with dummy locations table
-- CREATE TABLE locations(id INT PRIMARY KEY, name VARCHAR(100));
SELECT s.id, s.name, l.name AS location_name
FROM shelter_centers s
JOIN locations l ON s.location_id = l.id;

-- 35 Subquery: shelters above avg occupancy
SELECT * FROM shelter_centers
WHERE current_occupancy > (SELECT AVG(current_occupancy) FROM shelter_centers);

-- 36 Subquery: get max occupancy
SELECT * FROM shelter_centers
WHERE current_occupancy = (SELECT MAX(current_occupancy) FROM shelter_centers);

-- 37 Case: occupancy status
SELECT name,current_occupancy,
CASE 
WHEN current_occupancy > 300 THEN 'High'
WHEN current_occupancy > 150 THEN 'Medium'
ELSE 'Low' END AS occupancy_status
FROM shelter_centers;

-- 38 Trigger: before insert limit occupancy
DELIMITER $$
CREATE TRIGGER trg_before_insert_shelter
BEFORE INSERT ON shelter_centers
FOR EACH ROW
BEGIN
IF NEW.current_occupancy > NEW.capacity THEN
SET NEW.current_occupancy = NEW.capacity;
END IF;
END$$
DELIMITER ;

-- 39 Trigger: after update log occupancy
DELIMITER $$
CREATE TRIGGER trg_after_update_shelter
AFTER UPDATE ON shelter_centers
FOR EACH ROW
BEGIN
INSERT INTO shelter_log(shelter_id, old_occ, new_occ, updated_at) VALUES(OLD.id, OLD.current_occupancy, NEW.current_occupancy, NOW());
END$$
DELIMITER ;

-- 40 Select count per status
SELECT status, COUNT(*) FROM shelter_centers GROUP BY status;

-- 41 Top 5 occupied shelters
SELECT * FROM shelter_centers ORDER BY current_occupancy DESC LIMIT 5;

-- 42 Bottom 5 occupancy shelters
SELECT * FROM shelter_centers ORDER BY current_occupancy ASC LIMIT 5;

-- 43 List shelters needing expansion
SELECT * FROM shelter_centers WHERE current_occupancy > (capacity*0.8);

-- 44 List shelters underutilized
SELECT * FROM shelter_centers WHERE current_occupancy < (capacity*0.5);

-- 45 Update status to Closed for full shelters
UPDATE shelter_centers SET status='Closed' WHERE current_occupancy >= capacity;

-- 46 Window: LAG previous occupancy
SELECT id,name,current_occupancy,LAG(current_occupancy) OVER(ORDER BY id) AS prev_occ FROM shelter_centers;

-- 47 Window: LEAD next occupancy
SELECT id,name,current_occupancy,LEAD(current_occupancy) OVER(ORDER BY id) AS next_occ FROM shelter_centers;

-- 48 Window: NTILE 4
SELECT id,name,current_occupancy,NTILE(4) OVER(ORDER BY current_occupancy DESC) AS quartile FROM shelter_centers;

-- 49 Merge equivalent (upsert)
INSERT INTO shelter_centers(id,name,location_id,capacity,current_occupancy,contact_person,contact_number,status,remarks,officer_id)
VALUES(1,'Mulshi Community Hall',13,200,160,'Ravi Kumar','9123459001','Open','',301)
ON DUPLICATE KEY UPDATE current_occupancy=VALUES(current_occupancy);

-- 50 Count shelters per officer
SELECT officer_id, COUNT(*) AS shelters_managed FROM shelter_centers GROUP BY officer_id;

-- table 22
 CREATE TABLE transportation_logs (
    id INT PRIMARY KEY,
    vehicle_number VARCHAR(20),
    driver_name VARCHAR(100),
    purpose TEXT,
    date_of_use DATE,
    route TEXT,
    status VARCHAR(20),
    location_id INT,
    officer_id INT,
    remarks TEXT,
    document_reference VARCHAR(100)
);

INSERT INTO transportation_logs (id, vehicle_number, driver_name, purpose, date_of_use,route, status, location_id, officer_id, remarks, document_reference) VALUES
(1, 'MH14AB1234', 'Ravi Kumar', 'Aid distribution', '2025-06-01', 'Mulshi–Pune', 'Completed', 13, 301, '', 'DOC-T001'),
(2, 'MH14BC2345', 'Anita Desai', 'Medical camp support', '2025-06-02', 'Maval–Nashik', 'Completed', 7, 302, '', 'DOC-T002'),
(3, 'MH14CD3456', 'Sameer Khan', 'Water purification installation', '2025-06-03', 'Ahmednagar–Kolhapur', 'Completed', 6, 303, '', 'DOC-T003'),
(4, 'MH14DE4567', 'Priya Shah', 'Sanitation drive', '2025-06-04', 'Nagpur–Thane', 'Completed', 12, 304, '', 'DOC-T004'),
(5, 'MH14EF5678', 'Vikram Patel', 'Tent supply', '2025-06-05', 'Aurangabad–Mumbai', 'Cancelled', 13, 305, 'Flat tire', 'DOC-T005'),
(6, 'MH14FG6789', 'Meera Joshi', 'Blanket delivery', '2025-06-06', 'Pune–Satara', 'InTransit', 7, 306, '', 'DOC-T006'),
(7, 'MH14GH7890', 'Rahul Deshmukh', 'Generator transport', '2025-06-07', 'Kolhapur–Latur', 'Completed', 5, 307, '', 'DOC-T007'),
(8, 'MH14HI8901', 'Neha Kulkarni', 'Clothing transport', '2025-06-08', 'Satara–Solapur', 'Completed', 12, 308, '', 'DOC-T008'),
(9, 'MH14IJ9012', 'Karan Roy', 'Seed transport', '2025-06-09', 'Latur–Pune', 'Completed', 9, 309, '', 'DOC-T009'),
(10, 'MH14JK0123', 'Anita Naik', 'Medicine delivery', '2025-06-10', 'Solapur–Kolhapur', 'Completed', 9, 310, '', 'DOC-T010'),
(11, 'MH14KL1234', 'Deepak Joshi', 'Water tank transport', '2025-06-11', 'Nashik–Mumbai', 'Completed', 10, 311, '', 'DOC-T011'),
(12, 'MH14LM2345', 'Ritika Desai', 'Sanitation kit delivery', '2025-06-12', 'Mumbai–Pune', 'Completed', 12, 312, '', 'DOC-T012'),
(13, 'MH14MN3456', 'Aditya Rao', 'Solar lamp transport', '2025-06-13', 'Pune–Nashik', 'Completed', 7, 313, '', 'DOC-T013'),
(14, 'MH14NO4567', 'Priyanka Ghosh', 'Legal kit delivery', '2025-06-14', 'Nashik–Pune', 'Completed', 7, 314, '', 'DOC-T014'),
(15, 'MH14OP5678', 'Sachin Patil', 'Pension bag delivery', '2025-06-15', 'Thane–Mumbai', 'Completed', 8, 315, '', 'DOC-T015'),
(16, 'MH14PQ6789', 'Sunita Dixit', 'Sapling transport', '2025-06-16', 'Mumbai–Kolhapur', 'Completed', 8, 316, '', 'DOC-T016'),
(17, 'MH14QR7890', 'Manish Kapoor', 'Legal aid materials', '2025-06-17', 'Kolhapur–Pune', 'Completed', 9, 317, '', 'DOC-T017'),
(18, 'MH14RS8901', 'Neelam Verma', 'Disability aid transport', '2025-06-18', 'Kolhapur–Nagpur', 'Completed', 9, 318, '', 'DOC-T018'),
(19, 'MH14ST9012', 'Amit Khanna', 'Emergency kit delivery', '2025-06-19', 'Nagpur–Solapur', 'Completed', 10, 319, '', 'DOC-T019'),
(20, 'MH14TU0123', 'Shruti Nair', 'Reforestation sapling transport', '2025-06-20', 'Aurangabad–Pune', 'Completed', 10, 320, '', 'DOC-T020');

-- to display table data
    select * from  transportation_logs;
   
 -- to reamove complete records from table
   truncate table transportation_logs;
    
 -- to remove complete records and attribute from table
    drop table transportation_logs ;
-- 1. Create a simple View of completed transports
CREATE VIEW completed_transports AS
SELECT id, vehicle_number, driver_name, purpose, date_of_use, status
FROM transportation_logs
WHERE status='Completed';

-- 2. View of transports by a specific officer
CREATE VIEW officer_transports AS
SELECT *
FROM transportation_logs
WHERE officer_id=312;

-- 3. View for transports in a specific location
CREATE VIEW location_transports AS
SELECT *
FROM transportation_logs
WHERE location_id=7;

-- 4. CTE: Get recent 5 transports
WITH recent_transports AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY date_of_use DESC) AS rn
    FROM transportation_logs
)
SELECT * FROM recent_transports WHERE rn <=5;

-- 5. CTE: Count transports by status
WITH status_count AS (
    SELECT status, COUNT(*) AS total
    FROM transportation_logs
    GROUP BY status
)
SELECT * FROM status_count;

-- 6. CTE: Get cancelled transports
WITH cancelled AS (
    SELECT id, vehicle_number, purpose, status
    FROM transportation_logs
    WHERE status='Cancelled'
)
SELECT * FROM cancelled;

-- 7. CTE: Count transports by status
WITH status_count AS (
    SELECT status, COUNT(*) AS total
    FROM transportation_logs
    GROUP BY status
)
SELECT * FROM status_count;

-- 8. CTE: Get cancelled transports
WITH cancelled AS (
    SELECT id, vehicle_number, purpose, status
    FROM transportation_logs
    WHERE status='Cancelled'
)
SELECT * FROM cancelled;

-- 10. View of transports by a specific officer
CREATE VIEW officer_transports AS
SELECT *
FROM transportation_logs
WHERE officer_id=312;


-- 11. Window Function: Running total of transports by location
SELECT id, vehicle_number, location_id, SUM(id) OVER(PARTITION BY location_id ORDER BY date_of_use) AS running_total
FROM transportation_logs;

-- 12. Window Function: Rank drivers by number of transports
SELECT driver_name, COUNT(*) AS total_transports,
RANK() OVER(ORDER BY COUNT(*) DESC) AS driver_rank
FROM transportation_logs
GROUP BY driver_name;

-- 13. Window Function: Lead to next transport date
SELECT id, driver_name, date_of_use,
LEAD(date_of_use) OVER(PARTITION BY driver_name ORDER BY date_of_use) AS next_transport
FROM transportation_logs;

-- 14. Window Function: Lag previous transport date
SELECT id, driver_name, date_of_use,
LAG(date_of_use) OVER(PARTITION BY driver_name ORDER BY date_of_use) AS prev_transport
FROM transportation_logs;

-- 15. DCL: Grant SELECT permission
GRANT SELECT ON transportation_logs TO 'user1';

-- 16. DCL: Grant INSERT permission
GRANT INSERT ON transportation_logs TO 'user1';

-- 17. DCL: Revoke DELETE permission
REVOKE DELETE ON transportation_logs FROM 'user1';

-- 18. DCL: Grant UPDATE permission
GRANT UPDATE ON transportation_logs TO 'user1';

-- 19. TCL: Commit a transaction
START TRANSACTION;
UPDATE transportation_logs SET status='InTransit' WHERE id=6;
COMMIT;

-- 20. TCL: Rollback a transaction
START TRANSACTION;
UPDATE transportation_logs SET status='Cancelled' WHERE id=4;
ROLLBACK;

-- 21. TCL: Savepoint example
START TRANSACTION;
UPDATE transportation_logs SET status='Pending' WHERE id=7;
SAVEPOINT sp1;
UPDATE transportation_logs SET status='Completed' WHERE id=5;
ROLLBACK TO sp1;
COMMIT;

-- 22. Trigger: Before insert, set default status
CREATE TRIGGER trg_before_insert_transport
BEFORE INSERT ON transportation_logs
FOR EACH ROW
SET NEW.status = IFNULL(NEW.status, 'Pending');

-- 23. Trigger: After insert, log insertion
CREATE TRIGGER trg_after_insert_transport
AFTER INSERT ON transportation_logs
FOR EACH ROW
INSERT INTO transportation_logs_log(log_id, transport_id, action, action_date)
VALUES(NULL, NEW.id, 'INSERT', NOW());

-- 24. Trigger: Before update, log old status
CREATE TRIGGER trg_before_update_transport
BEFORE UPDATE ON transportation_logs
FOR EACH ROW
INSERT INTO transportation_logs_log(log_id, transport_id, action, old_status, action_date)
VALUES(NULL, OLD.id, 'UPDATE', OLD.status, NOW());

-- 25. Trigger: After update, log new status
CREATE TRIGGER trg_after_update_transport
AFTER UPDATE ON transportation_logs
FOR EACH ROW
INSERT INTO transportation_logs_log(log_id, transport_id, action, new_status, action_date)
VALUES(NULL, NEW.id, 'UPDATE', NEW.status, NOW());

-- 26. Select all transports
SELECT * FROM transportation_logs;

-- 27. Select specific columns
SELECT id, vehicle_number, driver_name, status FROM transportation_logs;

-- 28. Select with WHERE
SELECT * FROM transportation_logs WHERE status='Completed';

-- 29. Select using ORDER BY
SELECT * FROM transportation_logs ORDER BY date_of_use DESC;

-- 30. Select using GROUP BY
SELECT status, COUNT(*) AS total FROM transportation_logs GROUP BY status;

-- 31. Aggregate function SUM
SELECT location_id, SUM(id) AS total_transports FROM transportation_logs GROUP BY location_id;

-- 32. Aggregate AVG
SELECT location_id, AVG(id) AS avg_transports FROM transportation_logs GROUP BY location_id;

-- 33. Aggregate MAX
SELECT MAX(id) AS max_id FROM transportation_logs;

-- 34. Aggregate MIN
SELECT MIN(id) AS min_id FROM transportation_logs;

-- 35. Subquery: Drivers with more than 1 transport
SELECT driver_name FROM transportation_logs
WHERE driver_name IN (
    SELECT driver_name FROM transportation_logs GROUP BY driver_name HAVING COUNT(*)>1
);

-- 36. Subquery with EXISTS
SELECT * FROM transportation_logs t
WHERE EXISTS (
    SELECT 1 FROM transportation_logs WHERE driver_name=t.driver_name AND status='Cancelled'
);

-- 37. JOIN with shelter_centers (example)
SELECT t.id, t.driver_name, s.name AS shelter_name
FROM transportation_logs t
JOIN shelter_centers s ON t.location_id=s.location_id;

-- 38. LEFT JOIN example
SELECT t.id, t.driver_name, s.name AS shelter_name
FROM transportation_logs t
LEFT JOIN shelter_centers s ON t.location_id=s.location_id;

-- 39. RIGHT JOIN example
SELECT t.id, t.driver_name, s.name AS shelter_name
FROM transportation_logs t
RIGHT JOIN shelter_centers s ON t.location_id=s.location_id;

-- 40. UNION example
SELECT driver_name FROM transportation_logs WHERE status='Completed'
UNION
SELECT driver_name FROM transportation_logs WHERE status='Cancelled';

-- 41. UNION ALL example
SELECT driver_name FROM transportation_logs WHERE status='Completed'
UNION ALL
SELECT driver_name FROM transportation_logs WHERE status='Pending';

-- 42. CASE example
SELECT id, driver_name,
CASE WHEN status='Completed' THEN 'Done'
     WHEN status='Pending' THEN 'Waiting'
     ELSE 'Other' END AS status_desc
FROM transportation_logs;

-- 43. DISTINCT example
SELECT DISTINCT status FROM transportation_logs;

-- 44. LIMIT example
SELECT * FROM transportation_logs LIMIT 5;

-- 45. LIKE example
SELECT * FROM transportation_logs WHERE vehicle_number LIKE 'MH14%';

-- 46. IN example
SELECT * FROM transportation_logs WHERE location_id IN (7,9,10);

-- 47. NOT IN example
SELECT * FROM transportation_logs WHERE status NOT IN ('Completed');

-- 48. BETWEEN example
SELECT * FROM transportation_logs WHERE date_of_use BETWEEN '2025-06-01' AND '2025-06-10';

-- 49. DELETE example
DELETE FROM transportation_logs WHERE id=20;

-- 50. UPDATE example
UPDATE transportation_logs SET status='Completed' WHERE id=7;


-- table 23
 CREATE TABLE volunteer_registrations (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    skills TEXT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    location_id INT,
    registration_date DATE,
    status VARCHAR(20)
);
INSERT INTO volunteer_registrations (id, name, age, gender, skills,contact_number, email, location_id,registration_date, status) VALUES
(1, 'Aarav Sharma', 25, 'Male', 'First Aid, Logistics', '9123460001', 'aarav.sharma@example.com', 13, '2025-06-01', 'Active'),
(2, 'Priya Singh', 30, 'Female', 'Counseling, Communication', '9123460002', 'priya.singh@example.com', 7, '2025-06-02', 'Active'),
(3, 'Rohan Patel', 22, 'Male', 'Transport Coordination', '9123460003', 'rohan.patel@example.com', 6, '2025-06-03', 'Pending'),
(4, 'Neha Kulkarni', 28, 'Female', 'Sanitation Drive', '9123460004', 'neha.kulkarni@example.com', 12, '2025-06-04', 'Active'),
(5, 'Vikram Desai', 35, 'Male', 'Shelter Setup', '9123460005', 'vikram.desai@example.com', 13, '2025-06-05', 'Active'),
(6, 'Sonal Mehta', 27, 'Female', 'Hygiene Awareness', '9123460006', 'sonal.mehta@example.com', 7, '2025-06-06', 'Pending'),
(7, 'Karan Iyer', 24, 'Male', 'Generator Operation', '9123460007', 'karan.iyer@example.com', 5, '2025-06-07', 'Active'),
(8, 'Anita Rao', 32, 'Female', 'Clothing Distribution', '9123460008', 'anita.rao@example.com', 12, '2025-06-08', 'Active'),
(9, 'Deepak Joshi', 29, 'Male', 'Seed Drill', '9123460009', 'deepak.joshi@example.com', 9, '2025-06-09', 'Active'),
(10, 'Ritika Chavan', 26, 'Female', 'Medical Aid', '9123460010', 'ritika.chavan@example.com', 9, '2025-06-10', 'Pending'),
(11, 'Aditya Rao', 31, 'Male', 'Water Purifier Setup', '9123460011', 'aditya.rao@example.com', 10, '2025-06-11', 'Active'),
(12, 'Priyanka Ghosh', 33, 'Female', 'Legal Aid', '9123460012', 'priyanka.ghosh@example.com', 12, '2025-06-12', 'Active'),
(13, 'Sachin Patil', 34, 'Male', 'Pension Assistance', '9123460013', 'sachin.patil@example.com', 7, '2025-06-13', 'Active'),
(14, 'Sunita Dixit', 29, 'Female', 'Environmental Monitoring', '9123460014', 'sunita.dixit@example.com', 7, '2025-06-14', 'Pending'),
(15, 'Manish Kapoor', 40, 'Male', 'Legal Outreach', '9123460015', 'manish.kapoor@example.com', 8, '2025-06-15', 'Active'),
(16, 'Neelam Verma', 23, 'Female', 'Disability Assistance', '9123460016', 'neelam.verma@example.com', 8, '2025-06-16', 'Active'),
(17, 'Amit Khanna', 37, 'Male', 'Cash Aid Distribution', '9123460017', 'amit.khanna@example.com', 9, '2025-06-17', 'Pending'),
(18, 'Shruti Nair', 26, 'Female', 'Scholarship Liaison', '9123460018', 'shruti.nair@example.com', 9, '2025-06-18', 'Active'),
(19, 'Raghav Jain', 28, 'Male', 'Medical Kit Packager', '9123460019', 'raghav.jain@example.com', 10, '2025-06-19', 'Active'),
(20, 'Meera Shah', 30, 'Female', 'Tent Setup', '9123460020', 'meera.shah@example.com', 10, '2025-06-20', 'Pending');

-- to display table data
    select * from  volunteer_registrations ;
   
 -- to reamove complete records from table
   truncate table volunteer_registrations ;
    
 -- to remove complete records and attribute from table
    drop table volunteer_registrations  ;

-- 1. View: All Active Volunteers
CREATE VIEW active_volunteers AS
SELECT * FROM volunteer_registrations WHERE status='Active';

-- 2. View: Volunteers by Location
CREATE VIEW volunteers_by_location AS
SELECT location_id, COUNT(*) AS volunteer_count
FROM volunteer_registrations
GROUP BY location_id;

-- 3. CTE: Recent Registrations (last 5 days)
WITH recent_registrations AS (
    SELECT * FROM volunteer_registrations
    WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 5 DAY)
)
SELECT * FROM recent_registrations;

-- 4. CTE: Pending Volunteers by Location
WITH pending_volunteers AS (
    SELECT location_id, COUNT(*) AS pending_count
    FROM volunteer_registrations
    WHERE status='Pending'
    GROUP BY location_id
)
SELECT * FROM pending_volunteers;

-- 5. Stored Procedure: Get Volunteer by ID
DELIMITER //
CREATE PROCEDURE get_volunteer_by_id(IN v_id INT)
BEGIN
    SELECT * FROM volunteer_registrations WHERE id = v_id;
END //
DELIMITER ;

-- 6. Stored Procedure: Update Volunteer Status
DELIMITER //
CREATE PROCEDURE update_volunteer_status(IN v_id INT, IN v_status VARCHAR(20))
BEGIN
    UPDATE volunteer_registrations SET status = v_status WHERE id = v_id;
END //
DELIMITER ;

-- 7. Window Function: Rank Volunteers by Age
SELECT id, name, age,
       RANK() OVER (ORDER BY age DESC) AS age_rank
FROM volunteer_registrations;

-- 8. Window Function: Row Number by Registration Date
SELECT id, name, registration_date,
       ROW_NUMBER() OVER (PARTITION BY location_id ORDER BY registration_date ASC) AS row_num
FROM volunteer_registrations;

-- 9. Window Function: Count Volunteers by Location
SELECT id, name, location_id,
       COUNT(*) OVER (PARTITION BY location_id) AS location_count
FROM volunteer_registrations;

-- 10. Window Function: Average Age per Location
SELECT id, name, location_id, age,
       AVG(age) OVER (PARTITION BY location_id) AS avg_age
FROM volunteer_registrations;

-- 11. DCL: Grant SELECT to user 'volunteer_user'
GRANT SELECT ON volunteer_registrations TO 'volunteer_user'@'localhost';

-- 12. DCL: Revoke UPDATE from user 'volunteer_user'
REVOKE UPDATE ON volunteer_registrations FROM 'volunteer_user'@'localhost';

-- 13. TCL: Start Transaction Example
START TRANSACTION;
UPDATE volunteer_registrations SET status='Active' WHERE id=3;
COMMIT;

-- 14. TCL: Rollback Example
START TRANSACTION;
UPDATE volunteer_registrations SET status='Active' WHERE id=10;
ROLLBACK;

-- 15. Trigger: Before Insert, default status to 'Pending' if NULL
DELIMITER //
CREATE TRIGGER trg_before_insert_volunteer
BEFORE INSERT ON volunteer_registrations
FOR EACH ROW
BEGIN
    IF NEW.status IS NULL THEN
        SET NEW.status = 'Pending';
    END IF;
END //
DELIMITER ;

-- 16. Trigger: After Update, log status change
CREATE TABLE volunteer_status_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    volunteer_id INT,
    old_status VARCHAR(20),
    new_status VARCHAR(20),
    changed_on DATETIME DEFAULT NOW()
);

DELIMITER //
CREATE TRIGGER trg_after_update_status
AFTER UPDATE ON volunteer_registrations
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO volunteer_status_log(volunteer_id, old_status, new_status)
        VALUES (OLD.id, OLD.status, NEW.status);
    END IF;
END //
DELIMITER ;

-- 17. Select volunteers older than 30
SELECT * FROM volunteer_registrations WHERE age > 30;

-- 18. Select volunteers grouped by gender
SELECT gender, COUNT(*) AS count FROM volunteer_registrations GROUP BY gender;

-- 19. Select volunteers registered in last 10 days
SELECT * FROM volunteer_registrations
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 10 DAY);

-- 20. Update volunteer contact
UPDATE volunteer_registrations SET contact_number='9123460099' WHERE id=1;

-- 21. Delete a volunteer by ID
DELETE FROM volunteer_registrations WHERE id=20;

-- 22. Count Active Volunteers
SELECT COUNT(*) AS active_count FROM volunteer_registrations WHERE status='Active';

-- 23. List volunteers by skill containing 'Medical'
SELECT * FROM volunteer_registrations WHERE skills LIKE '%Medical%';

-- 24. Change status to Active for Pending volunteers
UPDATE volunteer_registrations SET status='Active' WHERE status='Pending';

-- 25. Select youngest volunteer
SELECT * FROM volunteer_registrations ORDER BY age ASC LIMIT 1;

-- 26. Select oldest volunteer
SELECT * FROM volunteer_registrations ORDER BY age DESC LIMIT 1;

-- 27. CTE: Volunteers by skill
WITH skill_group AS (
    SELECT id, name, skills FROM volunteer_registrations
)
SELECT * FROM skill_group WHERE skills LIKE '%Logistics%';

-- 28. View: Volunteers needing follow-up (Pending)
CREATE VIEW pending_volunteers AS
SELECT * FROM volunteer_registrations WHERE status='Pending';

-- 29. Stored Procedure: Delete Volunteer by ID
DELIMITER //
CREATE PROCEDURE delete_volunteer(IN v_id INT)
BEGIN
    DELETE FROM volunteer_registrations WHERE id = v_id;
END //
DELIMITER ;

-- 30. Window Function: Cumulative count by registration date
SELECT id, name, registration_date,
       COUNT(*) OVER (ORDER BY registration_date) AS cumulative_count
FROM volunteer_registrations;

-- 31. Window Function: Dense Rank by Age
SELECT id, name, age,
       DENSE_RANK() OVER (ORDER BY age DESC) AS dense_age_rank
FROM volunteer_registrations;

-- 32. Grant INSERT privilege
GRANT INSERT ON volunteer_registrations TO 'volunteer_user'@'localhost';

-- 33. Revoke DELETE privilege
REVOKE DELETE ON volunteer_registrations FROM 'volunteer_user'@'localhost';

-- 34. Start transaction for multiple updates
START TRANSACTION;
UPDATE volunteer_registrations SET status='Active' WHERE id IN (3,6,10);
COMMIT;

-- 35. Rollback example with multiple updates
START TRANSACTION;
UPDATE volunteer_registrations SET status='Pending' WHERE id IN (1,2);
ROLLBACK;

-- 36. Trigger: After Insert log new volunteer
CREATE TABLE volunteer_insert_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    volunteer_id INT,
    inserted_on DATETIME DEFAULT NOW()
);

DELIMITER //
CREATE TRIGGER trg_after_insert_volunteer
AFTER INSERT ON volunteer_registrations
FOR EACH ROW
BEGIN
    INSERT INTO volunteer_insert_log(volunteer_id) VALUES (NEW.id);
END //
DELIMITER ;

-- 37. Select volunteers by location
SELECT * FROM volunteer_registrations WHERE location_id=7;

-- 38. Update email of a volunteer
UPDATE volunteer_registrations SET email='updated@example.com' WHERE id=5;

-- 39. Count volunteers per location
SELECT location_id, COUNT(*) AS count FROM volunteer_registrations GROUP BY location_id;

-- 40. Select distinct skills
SELECT DISTINCT skills FROM volunteer_registrations;

-- 41. CTE: Volunteers above 30
WITH volunteers_above_30 AS (
    SELECT * FROM volunteer_registrations WHERE age>30
)
SELECT * FROM volunteers_above_30;


-- 43. Stored Procedure: Insert New Volunteer
DELIMITER //
CREATE PROCEDURE insert_volunteer(
    IN v_name VARCHAR(100),
    IN v_age INT,
    IN v_gender VARCHAR(10),
    IN v_skills TEXT,
    IN v_contact VARCHAR(15),
    IN v_email VARCHAR(100),
    IN v_location INT,
    IN v_status VARCHAR(20)
)
BEGIN
    INSERT INTO volunteer_registrations(name, age, gender, skills, contact_number, email, location_id, registration_date, status)
    VALUES (v_name, v_age, v_gender, v_skills, v_contact, v_email, v_location, CURDATE(), v_status);
END //
DELIMITER ;

-- 44. Trigger: Before Update to prevent setting age < 18
DELIMITER //
CREATE TRIGGER trg_before_update_age
BEFORE UPDATE ON volunteer_registrations
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
        SET NEW.age = OLD.age;
    END IF;
END //
DELIMITER ;

-- 45. Select volunteers sorted by name
SELECT * FROM volunteer_registrations ORDER BY name ASC;

-- 46. Count volunteers by status
SELECT status, COUNT(*) AS count FROM volunteer_registrations GROUP BY status;

-- 47. Window Function: Lead to see next volunteer registration date
SELECT id, name, registration_date,
       LEAD(registration_date) OVER (ORDER BY registration_date) AS next_registration
FROM volunteer_registrations;

-- 48. Window Function: Lag to see previous volunteer registration date
SELECT id, name, registration_date,
       LAG(registration_date) OVER (ORDER BY registration_date) AS previous_registration
FROM volunteer_registrations;

-- 49. Update multiple volunteers in transaction
START TRANSACTION;
UPDATE volunteer_registrations SET status='Pending' WHERE location_id=12;
COMMIT;

-- 50. Delete multiple volunteers in transaction with rollback
START TRANSACTION;
DELETE FROM volunteer_registrations WHERE status='Pending' AND location_id=9;
ROLLBACK;


-- table 24
 CREATE TABLE resource_requests (
    id INT PRIMARY KEY,
    program_id INT,
    item_required VARCHAR(100),
    quantity INT,
    request_date DATE,
    status VARCHAR(20),
    location_id INT,
    officer_id INT,
    remarks TEXT,
    document_reference VARCHAR(100)
);

INSERT INTO resource_requests (id, program_id, item_required, quantity, request_date,status, location_id, officer_id, remarks, document_reference) VALUES
(1, 1, 'Rice Bags', 100, '2025-06-01', 'Approved', 13, 301, '', 'DOC-RR001'),
(2, 2, 'Health Kits', 50, '2025-06-02', 'Pending', 7, 302, 'Docs needed', 'DOC-RR002'),
(3, 3, 'Tents', 20, '2025-06-03', 'Approved', 6, 303, '', 'DOC-RR003'),
(4, 4, 'Sanitation Kits', 40, '2025-06-04', 'Approved', 12, 304, '', 'DOC-RR004'),
(5, 5, 'Blankets', 60, '2025-06-05', 'Pending', 13, 305, 'Price quotes', 'DOC-RR005'),
(6, 6, 'Water Filters', 10, '2025-06-06', 'Approved', 7, 306, '', 'DOC-RR006'),
(7, 7, 'Generators', 5, '2025-06-07', 'Approved', 5, 307, '', 'DOC-RR007'),
(8, 8, 'Clothing Packs', 100, '2025-06-08', 'Pending', 12, 308, 'Budget approval', 'DOC-RR008'),
(9, 9, 'Seed Packets', 200, '2025-06-09', 'Approved', 9, 309, '', 'DOC-RR009'),
(10, 10, 'Medical Gloves', 500, '2025-06-10', 'Approved', 9, 310, '', 'DOC-RR010'),
(11, 11, 'Water Tanks', 5, '2025-06-11', 'Pending', 10, 311, '', 'DOC-RR011'),
(12, 12, 'Sanitation Kits', 80, '2025-06-12', 'Approved', 12, 312, '', 'DOC-RR012'),
(13, 13, 'Saplings', 300, '2025-06-13', 'Pending', 7, 313, 'N/A', 'DOC-RR013'),
(14, 14, 'Legal Kits', 50, '2025-06-14', 'Approved', 7, 314, '', 'DOC-RR014'),
(15, 15, 'Pension Bags', 100, '2025-06-15', 'Approved', 8, 315, '', 'DOC-RR015'),
(16, 16, 'Mobility Aids', 30, '2025-06-16', 'Pending', 8, 316, '', 'DOC-RR016'),
(17, 17, 'Cash Vouchers', 150, '2025-06-17', 'Approved', 9, 317, '', 'DOC-RR017'),
(18, 18, 'School Supplies', 200, '2025-06-18', 'Approved', 9, 318, '', 'DOC-RR018'),
(19, 19, 'First Aid Kits', 60, '2025-06-19', 'Pending', 10, 319, '', 'DOC-RR019'),
(20, 20, 'Tents', 25, '2025-06-20', 'Approved', 10, 320, '', 'DOC-RR020');

-- to display table data
    select * from  resource_requests;
   
 -- to reamove complete records from table
   truncate table  resource_requests ;
    
 -- to remove complete records and attribute from table
    drop table resource_requests;

-- 1. View: Active Volunteers
CREATE VIEW active_volunteers AS
SELECT * FROM volunteer_registrations WHERE status='Active';

-- 2. View: Full Shelter Status
CREATE VIEW shelter_status AS
SELECT id, name, capacity, current_occupancy, status FROM shelter_centers;

-- 3. View: Pending Resource Requests
CREATE VIEW pending_requests AS
SELECT * FROM resource_requests WHERE status='Pending';

-- 4. CTE: Shelter occupancy over 90%
WITH high_occupancy AS (
    SELECT name, current_occupancy, capacity
    FROM shelter_centers
    WHERE current_occupancy > 0.9 * capacity
)
SELECT * FROM high_occupancy;

-- 5. CTE: Volunteers by location
WITH volunteers_by_location AS (
    SELECT location_id, COUNT(*) AS volunteer_count
    FROM volunteer_registrations
    GROUP BY location_id
)
SELECT * FROM volunteers_by_location;

-- 6. CTE: Pending resource requests summary
WITH pending_summary AS (
    SELECT location_id, COUNT(*) AS pending_count
    FROM resource_requests
    WHERE status='Pending'
    GROUP BY location_id
)
SELECT * FROM pending_summary;

-- 8. Stored Procedure: Approve Resource Request
DELIMITER //

CREATE PROCEDURE approve_request(IN r_id INT)
BEGIN
    UPDATE resource_requests
    SET status = 'Approved'
    WHERE id = r_id;
END //

DELIMITER ;


-- 9. Stored Procedure: Update Shelter Occupancy
DELIMITER //

CREATE PROCEDURE update_occupancy(IN s_id INT, IN new_count INT)
BEGIN
    UPDATE shelter_centers
    SET current_occupancy = new_count
    WHERE id = s_id;
END //

DELIMITER ;


-- 10. Window Function: Rank shelters by occupancy
SELECT name, current_occupancy, capacity,
RANK() OVER (ORDER BY current_occupancy DESC) AS occupancy_rank
FROM shelter_centers;

-- 11. Window Function: Volunteer age ranking
SELECT name, age, location_id,
ROW_NUMBER() OVER(PARTITION BY location_id ORDER BY age DESC) AS age_rank
FROM volunteer_registrations;

-- 12. Window Function: Total resource requests per location
SELECT location_id, SUM(quantity) OVER(PARTITION BY location_id) AS total_requested
FROM resource_requests;

-- 13. Window Function: Running total of tents requested
SELECT id, item_required, quantity,
SUM(quantity) OVER(ORDER BY request_date) AS running_total
FROM resource_requests
WHERE item_required='Tents';

-- 14. DCL: Grant SELECT on shelter_centers
GRANT SELECT ON shelter_centers TO 'relief_officer';

-- 15. DCL: Grant INSERT on volunteer_registrations
GRANT INSERT ON volunteer_registrations TO 'volunteer_manager';

-- 16. DCL: Revoke DELETE on resource_requests
REVOKE DELETE ON resource_requests FROM 'junior_officer';

-- 17. TCL: Start transaction
START TRANSACTION;

-- 18. TCL: Commit transaction
COMMIT;

-- 19. TCL: Rollback transaction
ROLLBACK;

-- 20. Trigger: Update shelter status when occupancy changes
CREATE TRIGGER trg_shelter_status
BEFORE UPDATE ON shelter_centers
FOR EACH ROW
BEGIN

-- 21. Trigger: Log new volunteer registration
DELIMITER //

CREATE TRIGGER trg_volunteer_insert
AFTER INSERT ON volunteer_registrations
FOR EACH ROW
BEGIN
    INSERT INTO volunteer_log(volunteer_id, action, action_date)
    VALUES (NEW.id, 'Inserted', NOW());
END //

DELIMITER ;

-- 23. View: Volunteers with First Aid skill
CREATE VIEW first_aid_volunteers AS
SELECT * FROM volunteer_registrations WHERE skills LIKE '%First Aid%';

-- 24. View: Shelters below 50% capacity
CREATE VIEW low_occupancy_shelters AS
SELECT name, capacity, current_occupancy FROM shelter_centers
WHERE current_occupancy < 0.5 * capacity;

-- 25. CTE: Recent volunteer registrations
WITH recent_volunteers AS (
SELECT * FROM volunteer_registrations WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
)
SELECT * FROM recent_volunteers;

-- 26. CTE: Resource requests approved this week
WITH approved_requests AS (
SELECT * FROM resource_requests WHERE status='Approved' AND request_date >= CURDATE() - INTERVAL 7 DAY
)
SELECT * FROM approved_requests;

-- 27. Stored Procedure: Delete volunteer by ID
CREATE VIEW first_aid_volunteers AS
SELECT * FROM volunteer_registrations WHERE skills LIKE '%First Aid%';

-- 28. Stored Procedure: Increment shelter occupancy
CREATE VIEW first_aid_volunteers AS
SELECT * FROM volunteer_registrations WHERE skills LIKE '%First Aid%';

-- 30. Window Function: Count of volunteers per location
SELECT location_id, COUNT(*) OVER(PARTITION BY location_id) AS volunteers_count FROM volunteer_registrations;

-- 31. DCL: Grant UPDATE on shelter_centers
GRANT UPDATE ON shelter_centers TO 'shelter_manager';

-- 32. DCL: Revoke INSERT on resource_requests
REVOKE INSERT ON resource_requests FROM 'junior_officer';

-- 33. TCL: Transaction example - allocate items
START TRANSACTION;
UPDATE resource_requests SET status='Approved' WHERE id=2;
UPDATE resource_requests SET quantity=50 WHERE id=2;
COMMIT;

-- 34. TCL: Transaction rollback example
START TRANSACTION;
UPDATE shelter_centers SET current_occupancy=current_occupancy+10 WHERE id=1;
ROLLBACK;

-- 36. View: Volunteers by gender
CREATE VIEW volunteers_gender AS
SELECT gender, COUNT(*) AS total FROM volunteer_registrations GROUP BY gender;

-- 37. View: Total capacity per location
CREATE VIEW location_capacity AS
SELECT location_id, SUM(capacity) AS total_capacity FROM shelter_centers GROUP BY location_id;

-- 38. CTE: Shelters with vacancies
WITH vacant_shelters AS (
SELECT name, capacity-current_occupancy AS vacancy FROM shelter_centers WHERE capacity>current_occupancy
)
SELECT * FROM vacant_shelters;

-- 40. CTE: Top 5 resource requests by quantity
WITH top_requests AS (
SELECT * FROM resource_requests ORDER BY quantity DESC LIMIT 5
)
SELECT * FROM top_requests;

-- 42. Window Function: Rank volunteers by age
SELECT name, age, RANK() OVER(ORDER BY age DESC) AS age_rank FROM volunteer_registrations;

-- 43. Window Function: Max resource quantity per item
SELECT item_required, quantity, MAX(quantity) OVER(PARTITION BY item_required) AS max_quantity FROM resource_requests;

-- 44. DCL: Grant DELETE on volunteer_registrations
GRANT DELETE ON volunteer_registrations TO 'admin_user';

-- 45. DCL: Revoke UPDATE on shelter_centers
REVOKE UPDATE ON shelter_centers FROM 'junior_officer';

-- 46. TCL: Transaction - update multiple shelters
START TRANSACTION;
UPDATE shelter_centers SET current_occupancy=current_occupancy+5 WHERE id IN (1,2,3);
COMMIT;

-- 47. TCL: Transaction rollback example - multiple requests
START TRANSACTION;
UPDATE resource_requests SET status='Approved' WHERE id IN (5,8);
ROLLBACK;
-- 49. View: Approved resource requests
CREATE VIEW approved_requests_view AS
SELECT * FROM resource_requests WHERE status='Approved';

-- 50. CTE: Count volunteers per skill
WITH skill_count AS (
SELECT skills, COUNT(*) AS total FROM volunteer_registrations GROUP BY skills
)
SELECT * FROM skill_count;



-- table 25
CREATE TABLE Budget_Allocation (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100),
    fiscal_year YEAR,
    allocated_amount DECIMAL(12,2),
    used_amount DECIMAL(12,2),
    remaining_amount DECIMAL(12,2),
    approved_by VARCHAR(100),
    approval_date DATE,
    remarks TEXT,
    status VARCHAR(50)
);

INSERT INTO Budget_Allocation (department_name, fiscal_year, allocated_amount,used_amount, remaining_amount, approved_by,approval_date, remarks, status) VALUES
('Finance & Planning', 2025, 5000000.00, 3500000.00, 1500000.00, 'Bipul Pathak', '2025-04-01', 'Annual budget', 'Approved'),
('Health', 2025, 3000000.00, 2000000.00, 1000000.00, 'Ashish Chandra Verma', '2025-04-05', '', 'Approved'),
('Education', 2025, 2500000.00, 1200000.00, 1300000.00, 'Pandurang K Pole', '2025-04-10', 'For school aid', 'Approved'),
('Water & Sanitation', 2025, 1500000.00, 800000.00, 700000.00, 'Dr. Nitin Kareer', '2025-04-12', '', 'Approved'),
('Urban Development', 2025, 2000000.00, 500000.00, 1500000.00, 'A Nedunchezhiyan', '2025-04-15', 'City infrastructure', 'Pending'),
('Agriculture', 2025, 1200000.00, 400000.00, 800000.00, 'Arun Kumar Mishra', '2025-04-18', '', 'Approved'),
('Social Welfare', 2025, 1800000.00, 900000.00, 900000.00, 'Ramesh Chavan', '2025-04-20', '', 'Pending'),
('Environment', 2025, 800000.00, 300000.00, 500000.00, 'Kiran Wadte', '2025-04-22', '', 'Approved'),
('Legal', 2025, 600000.00, 250000.00, 350000.00, 'Shivaji Chaoure', '2025-04-25', 'For legal aid', 'Approved'),
('Security', 2025, 1000000.00, 600000.00, 400000.00, 'Hari Nath Mishra', '2025-04-28', '', 'Approved'),
('Disaster Management', 2025, 2200000.00, 1100000.00, 1100000.00, 'Tapan Deka', '2025-05-01', '', 'Approved'),
('Forestry', 2025, 900000.00, 300000.00, 600000.00, 'Ravi Sinha', '2025-05-05', 'Plantation drive', 'Approved'),
('Municipal Corporation', 2025, 1300000.00, 700000.00, 600000.00, 'Praveen Sood', '2025-05-08', '', 'Pending'),
('Fire Services', 2025, 750000.00, 250000.00, 500000.00, 'Daljit Singh Chaudhary', '2025-05-10', '', 'Approved'),
('Public Grievance', 2025, 500000.00, 150000.00, 350000.00, 'Gyanendra Pratap Singh', '2025-05-12', '', 'Approved'),
('Civic Welfare', 2025, 650000.00, 300000.00, 350000.00, 'Rajwinder Singh Bhatti', '2025-05-15', '', 'Pending'),
('Rural Development', 2025, 1400000.00, 500000.00, 900000.00, 'Rahul Rasgotra', '2025-05-18', '', 'Approved'),
('Urban Housing', 2025, 800000.00, 200000.00, 600000.00, 'Amrit Mohan Prasad', '2025-05-20', '', 'Approved'),
('Transport', 2025, 1000000.00, 400000.00, 600000.00, 'B. Srinivasan', '2025-05-22', '', 'Approved'),
('Emergency Services', 2025, 1200000.00, 500000.00, 700000.00, 'Bipul Pathak', '2025-05-25', 'Disaster readiness', 'Pending');

-- to display table data
    select * from Budget_Allocation;
   
 -- to reamove complete records from table
   truncate table  Budget_Allocation;
    
 -- to remove complete records and attribute from table
    drop table Budget_Allocation;

-- 1 View: All budget allocations
CREATE VIEW vw_budget_allocation AS SELECT * FROM Budget_Allocation;

-- 2 View: Only pending allocations
CREATE VIEW vw_pending_allocations AS SELECT * FROM Budget_Allocation WHERE status='Pending';

-- 3 View: Departments with remaining amount > 500000
CREATE VIEW vw_high_remaining AS SELECT department_name, remaining_amount FROM Budget_Allocation WHERE remaining_amount>500000;

-- 4 View: Departments with fully used budget
CREATE VIEW vw_fully_used AS SELECT * FROM Budget_Allocation WHERE remaining_amount=0;

-- 5 View: Approved budgets
CREATE VIEW vw_approved_budget AS SELECT department_name, allocated_amount FROM Budget_Allocation WHERE status='Approved';

-- 6 CTE: Total allocated and used per status
WITH cte_status AS (
    SELECT status, SUM(allocated_amount) AS total_allocated, SUM(used_amount) AS total_used
    FROM Budget_Allocation
    GROUP BY status
) SELECT * FROM cte_status;

-- 7 CTE: Departments needing approval
WITH cte_pending AS (
    SELECT department_name, allocated_amount
    FROM Budget_Allocation WHERE status='Pending'
) SELECT * FROM cte_pending;

-- 8 CTE: Departments with remaining > used
WITH cte_remaining AS (
    SELECT department_name, remaining_amount, used_amount
    FROM Budget_Allocation
    WHERE remaining_amount>used_amount
) SELECT * FROM cte_remaining;

-- 9 Stored Procedure: Get allocation by department
DELIMITER //
CREATE PROCEDURE sp_get_allocation(IN dept_name VARCHAR(100))
BEGIN
    SELECT * FROM Budget_Allocation WHERE department_name=dept_name;
END //
DELIMITER ;

-- 10 Stored Procedure: Update used_amount
DELIMITER //
CREATE PROCEDURE sp_update_used(IN dept_id INT, IN used DECIMAL(12,2))
BEGIN
    UPDATE Budget_Allocation SET used_amount=used, remaining_amount=allocated_amount-used WHERE allocation_id=dept_id;
END //
DELIMITER ;

-- 11 Window Function: Rank by allocated_amount
SELECT department_name, allocated_amount, RANK() OVER(ORDER BY allocated_amount DESC) AS rank_alloc FROM Budget_Allocation;

-- 12 Window Function: Running total of used_amount
SELECT department_name, used_amount, SUM(used_amount) OVER(ORDER BY allocation_id) AS running_used FROM Budget_Allocation;

-- 13 Window Function: Percent rank of remaining_amount
SELECT department_name, remaining_amount, PERCENT_RANK() OVER(ORDER BY remaining_amount) AS pct_rank FROM Budget_Allocation;

-- 14 Window Function: Dense rank by allocated_amount
SELECT department_name, allocated_amount, DENSE_RANK() OVER(ORDER BY allocated_amount DESC) AS dense_rank_alloc FROM Budget_Allocation;

-- 15 Window Function: Cumulative sum of allocated_amount
SELECT department_name, allocated_amount, SUM(allocated_amount) OVER(ORDER BY allocation_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_alloc FROM Budget_Allocation;

-- 16 DCL: Grant select to user
GRANT SELECT ON Budget_Allocation TO 'user1'@'localhost';

-- 17 DCL: Revoke update privilege
REVOKE UPDATE ON Budget_Allocation FROM 'user2'@'localhost';

-- 18 TCL: Start transaction
START TRANSACTION;

-- 19 TCL: Commit transaction
COMMIT;

-- 20 TCL: Rollback transaction
ROLLBACK;

-- 21 Update budget status
UPDATE Budget_Allocation SET status='Approved' WHERE status='Pending';

-- 22 Delete canceled allocations
DELETE FROM Budget_Allocation WHERE status='Canceled';

-- 23 Insert new allocation
INSERT INTO Budget_Allocation(department_name,fiscal_year,allocated_amount,used_amount,remaining_amount,approved_by,approval_date,remarks,status) VALUES('IT',2025,500000,0,500000,'Admin','2025-06-01','New project','Pending');

-- 24 Select departments with used_amount > 500000
SELECT department_name FROM Budget_Allocation WHERE used_amount>500000;

-- 25 Select remaining budget percentage
SELECT department_name, (remaining_amount/allocated_amount)*100 AS remaining_pct FROM Budget_Allocation;

-- 26 Update remaining_amount
UPDATE Budget_Allocation SET remaining_amount=allocated_amount-used_amount;

-- 27 Select top 5 allocations
SELECT * FROM Budget_Allocation ORDER BY allocated_amount DESC LIMIT 5;

-- 28 Count departments by status
SELECT status, COUNT(*) AS dept_count FROM Budget_Allocation GROUP BY status;

-- 29 Average used_amount
SELECT AVG(used_amount) AS avg_used FROM Budget_Allocation;

-- 30 Max remaining_amount
SELECT MAX(remaining_amount) AS max_remaining FROM Budget_Allocation;

-- 31 Min remaining_amount
SELECT MIN(remaining_amount) AS min_remaining FROM Budget_Allocation;

-- 32 Departments with allocated_amount between 500000 and 2000000
SELECT department_name FROM Budget_Allocation WHERE allocated_amount BETWEEN 500000 AND 2000000;

-- 33 Departments with remarks not null
SELECT department_name, remarks FROM Budget_Allocation WHERE remarks IS NOT NULL;

-- 34 Update status to Pending for certain departments
UPDATE Budget_Allocation SET status='Pending' WHERE department_name LIKE '%Development%';

-- 35 Select fiscal year and total allocation
SELECT fiscal_year, SUM(allocated_amount) AS total_alloc FROM Budget_Allocation GROUP BY fiscal_year;

-- 36 Departments with remaining_amount < 500000
SELECT department_name FROM Budget_Allocation WHERE remaining_amount<500000;

-- 37 Departments sorted by remaining_amount desc
SELECT department_name, remaining_amount FROM Budget_Allocation ORDER BY remaining_amount DESC;

-- 38 Select approved_by and total approved amount
SELECT approved_by, SUM(allocated_amount) AS approved_total FROM Budget_Allocation WHERE status='Approved' GROUP BY approved_by;

-- 39 Update remarks
UPDATE Budget_Allocation SET remarks='Reviewed' WHERE status='Approved';

-- 40 Select departments using window lag function
SELECT department_name, allocated_amount, LAG(allocated_amount) OVER(ORDER BY allocation_id) AS prev_alloc FROM Budget_Allocation;

-- 41 Select departments using lead function
SELECT department_name, allocated_amount, LEAD(allocated_amount) OVER(ORDER BY allocation_id) AS next_alloc FROM Budget_Allocation;

-- 42 Trigger: Before insert, set remaining_amount
DELIMITER //
CREATE TRIGGER trg_before_insert_allocation BEFORE INSERT ON Budget_Allocation
FOR EACH ROW
SET NEW.remaining_amount = NEW.allocated_amount - NEW.used_amount; //
DELIMITER ;

-- 43 Trigger: After update, log changes
DELIMITER //
CREATE TRIGGER trg_after_update_allocation AFTER UPDATE ON Budget_Allocation
FOR EACH ROW
INSERT INTO Budget_Allocation_Log(allocation_id,old_used,new_used,change_date) VALUES(OLD.allocation_id, OLD.used_amount, NEW.used_amount, NOW()); //
DELIMITER ;

-- 44 Select departments using NTILE
SELECT department_name, allocated_amount, NTILE(4) OVER(ORDER BY allocated_amount) AS quartile FROM Budget_Allocation;

-- 45 Select distinct status
SELECT DISTINCT status FROM Budget_Allocation;

-- 46 Update multiple columns
UPDATE Budget_Allocation SET used_amount=used_amount+100000, remaining_amount=remaining_amount-100000 WHERE allocation_id<=5;

-- 47 Delete allocations with zero allocated_amount
DELETE FROM Budget_Allocation WHERE allocated_amount=0;

-- 48 Select first 3 departments with highest remaining
SELECT department_name, remaining_amount FROM Budget_Allocation ORDER BY remaining_amount DESC LIMIT 3;

-- 49 Select cumulative remaining using window sum
SELECT department_name, remaining_amount, SUM(remaining_amount) OVER(ORDER BY allocation_id) AS cumulative_remaining FROM Budget_Allocation;

-- 50 Rollback example transaction
START TRANSACTION;
UPDATE Budget_Allocation SET used_amount=0 WHERE allocation_id=1;
ROLLBACK;


