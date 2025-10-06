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
    
-- 1  DDL — Add Foreign Key with CASCADE
-- Add foreign key from citizens.location_id to relief_programs.location_id
-- with ON DELETE and ON UPDATE CASCADE behavior
ALTER TABLE relief_programs
ADD UNIQUE INDEX idx_location_id (location_id);


-- 3: DQL — Select with WHERE Clause and Comparison Operator

-- Get all citizens who are currently marked as 'Active'
SELECT * FROM citizens
WHERE status = 'Active';
-- 4: DQL — Use of Aliases and String Functions

-- Select citizen names in uppercase along with year of birth
SELECT 
    UPPER(name) AS uppercase_name,
    YEAR(date_of_birth) AS birth_year
FROM citizens;

-- 5: DQL — LIKE operator and ORDER BY clause

-- Find citizens whose name starts with 'A' and sort by name
SELECT * FROM citizens
WHERE name LIKE 'A%'
ORDER BY name ASC;

-- 6: Aggregate Function with GROUP BY
-- Count how many citizens are in each status group
SELECT status, COUNT(*) AS total
FROM citizens
GROUP BY status;

-- 7: INNER JOIN with Aliases
-- Join citizens and relief_programs on location_id and list active citizens with active programs
SELECT 
    c.name AS Citizen_Name,
    r.name AS Program_Name,
    r.category,
    r.status AS Program_Status
FROM citizens c
JOIN relief_programs r ON c.location_id = r.location_id
WHERE c.status = 'Active' AND r.status = 'Active';

-- 8
-- Get all relief programs that are in the same location as 'Pune'
SELECT * FROM relief_programs
WHERE location_id IN (
    SELECT location_id FROM citizens WHERE address LIKE '%Pune%'
);

-- 9: Use of BETWEEN and LIMIT
-- Get top 5 relief programs started between March and May 2025
SELECT * FROM relief_programs
WHERE start_date BETWEEN '2025-03-01' AND '2025-05-31'
LIMIT 5;

-- 10: DDL — Add NOT NULL constraint
-- Make sure 'status' in relief_programs table is always required
ALTER TABLE relief_programs
MODIFY status VARCHAR(20) NOT NULL;

-- 11. Name contains 'Shah'
SELECT * FROM citizens
WHERE name LIKE '%Shah%';

-- 12. Born between 1980 and 1990
SELECT name, date_of_birth
FROM citizens
WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';

-- 13. Gender filter with alias
SELECT name AS citizen_name, gender
FROM citizens
WHERE gender = 'Female';

-- 14. 5 oldest citizens
SELECT name, date_of_birth
FROM citizens
ORDER BY date_of_birth
LIMIT 5;

-- 15. Page results 6-10 sorted by registration_date
SELECT * FROM citizens
ORDER BY registration_date DESC
LIMIT 5 OFFSET 5;

-- 16. Count by status
SELECT status, COUNT(*) AS count_status
FROM citizens
GROUP BY status;

-- 17. Count and average age for active group
SELECT status,
       COUNT(*) AS cnt,
       AVG(EXTRACT(YEAR FROM AGE(current_date, date_of_birth))) AS avg_age
FROM citizens
GROUP BY status
HAVING COUNT(*) > 2;

-- 18. Upper-case names
SELECT UPPER(name) AS name_upper FROM citizens;

-- 19. Format registration_date
SELECT TO_CHAR(registration_date, 'DD-Mon-YYYY') AS reg_date_fmt
FROM citizens;

-- 20. Age, calculated
SELECT name,
       EXTRACT(YEAR FROM AGE(current_date, date_of_birth)) AS age
FROM citizens;

-- 21. Inner join to show city
SELECT c.name, l.city
FROM citizens c
JOIN locations l USING(location_id);

-- 22. Left join, showing null city if missing
SELECT c.name, l.city
FROM citizens c
LEFT JOIN locations l USING(location_id);

-- 23. Citizens in cities starting with 'M'
SELECT *
FROM citizens
WHERE location_id IN (
  SELECT location_id FROM locations WHERE city LIKE 'M%'
);

-- 24. Citizens having registration before any Suspended ones
SELECT *
FROM citizens c
WHERE registration_date < ANY (
  SELECT registration_date FROM citizens WHERE status = 'Suspended'
);

-- 25. Name exists of an Active citizen born before 1985
SELECT *
FROM citizens c
WHERE EXISTS (
  SELECT 1 FROM citizens x
  WHERE x.status='Active' AND x.date_of_birth<'1985-01-01' AND x.id=c.id
);

-- 26. CTE for active citizens
WITH active_cte AS (
  SELECT * FROM citizens WHERE status = 'Active'
)
SELECT name, contact_number FROM active_cte;


-- 27. Recursive CTE example: factorial
WITH RECURSIVE fact(n, f) AS (
  SELECT 0, 1
  UNION ALL
  SELECT n+1, (n+1)*f FROM fact WHERE n < 5
)
SELECT * FROM fact;

-- 28. Row number partitioned by status
SELECT name, status,
       ROW_NUMBER() OVER (PARTITION BY status ORDER BY registration_date) AS rn
FROM citizens;

-- 29. Count per status using window
SELECT DISTINCT status,
       COUNT(*) OVER (PARTITION BY status) AS status_total
FROM citizens;


-- 30. Change 'Inactive' to 'Suspended'
UPDATE citizens SET status = 'Suspended'
WHERE status = 'Inactive';

-- 31. Delete citizens with no contact number
DELETE FROM citizens WHERE contact_number IS NULL;

-- 32. Select only names and statuses
SELECT name, status FROM citizens;

-- 33. Find distinct statuses
SELECT DISTINCT status FROM citizens;

-- 34-36. Transaction with SAVEPOINT
BEGIN;
UPDATE citizens SET status='Active' WHERE id=3;
SAVEPOINT after_update;
DELETE FROM citizens WHERE id=4;
ROLLBACK TO after_update;
COMMIT;

-- 37. All names via UNION
SELECT name FROM citizens WHERE status='Active'
UNION
SELECT name FROM citizens WHERE status='Suspended';

-- 38. All names, allowing duplicates
SELECT name FROM citizens WHERE status='Active'
UNION ALL
SELECT name FROM citizens WHERE status='Active';

-- 39. Delete a location cascades to citizens
DELETE FROM locations WHERE location_id = 105;

-- 40. Update location ID cascades to citizens
UPDATE locations SET location_id=200 WHERE location_id=104;

-- 41. Self-join: pair citizens sharing same status
SELECT a.name AS c1, b.name AS c2
FROM citizens a
JOIN citizens b ON a.status=b.status
WHERE a.id<b.id;

-- 42. Aliased counts
SELECT c.status AS stat, COUNT(*) AS count
FROM citizens AS c
GROUP BY c.status;

-- 43. Numeric gender length
SELECT * FROM citizens WHERE LENGTH(gender)>=4 AND gender<>'Male';

-- 44. Numeric gender length
SELECT * FROM citizens WHERE LENGTH(gender)>=4 AND gender<>'Male';

-- 45. Citizens registered this year
SELECT name FROM citizens
WHERE EXTRACT(YEAR FROM registration_date) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 46. Registration daily count
SELECT registration_date, COUNT(*) AS daily_count
FROM citizens GROUP BY registration_date ORDER BY registration_date;

-- 47.  Average age calculation (assuming current_date)
SELECT AVG(EXTRACT(YEAR FROM AGE(current_date, date_of_birth))) AS avg_age
FROM citizens;

-- 48. Remove citizens not in location table
DELETE FROM citizens
WHERE location_id NOT IN (SELECT location_id FROM locations);

-- 49. -- 9. Select count of active citizens
SELECT COUNT(*) AS active_count
FROM citizens
WHERE status = 'Active';

-- 50. Remove table
DROP TABLE citizens;

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

-- 1. Create officer table (Referenced in relief_programs)
CREATE TABLE officers (
    officer_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(100)
);

-- 2. Create locations table (Referenced in relief_programs)
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100),
    district VARCHAR(100)
);

-- 3. Alter relief_programs to apply foreign key constraints with CASCADE
ALTER TABLE relief_programs
ADD CONSTRAINT fk_officer
FOREIGN KEY (officer_id) REFERENCES officers(officer_id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE relief_programs
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id) REFERENCES locations(location_id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 4. Drop a column (example only, not recommended without backup)
-- ALTER TABLE relief_programs DROP COLUMN document_reference;

-- 5. Add a new column for budget estimate
ALTER TABLE relief_programs ADD COLUMN budget_estimate DECIMAL(10,2);
-- DML (Insert/Update/Delete)

-- 6. Insert a new relief program
INSERT INTO relief_programs (id, name, category, description, start_date, end_date, status, officer_id, location_id, document_reference)
VALUES (21, 'Flood Relief Fund', 'Relief', 'Immediate cash and food aid', '2025-07-01', '2025-08-01', 'Active', 101, 201, 'DOC-A021');

-- 7. Update the status of a program
UPDATE relief_programs
SET status = 'Completed'
WHERE id = 1;

-- 8. Increase the budget estimate for ongoing projects by 10%
UPDATE relief_programs
SET budget_estimate = budget_estimate * 1.10
WHERE status = 'Active';

-- 9. Delete a program with ID = 20
DELETE FROM relief_programs
WHERE id = 20;


-- 10. Soft delete concept - mark as "Inactive"
UPDATE relief_programs
SET status = 'Inactive'
WHERE end_date < CURRENT_DATE();

-- 11. Insert multiple rows into officers
INSERT INTO officers (officer_id, name, designation)
VALUES (101, 'Anil Kumar', 'Relief Officer'), (102, 'Sunita Rao', 'Medical Officer');

-- 12. Insert multiple rows into locations
INSERT INTO locations (location_id, location_name, district)
VALUES (201, 'Pune City', 'Pune'), (202, 'Nashik Rural', 'Nashik');

-- 13. Delete all programs completed before April 2025
DELETE FROM relief_programs
WHERE status = 'Completed' AND end_date < '2025-04-01';

-- 14. Set a default value for budget_estimate (future updates only)
ALTER TABLE relief_programs ALTER COLUMN budget_estimate SET DEFAULT 0;

-- 15. Add NOT NULL constraint to 'name' column
 ALTER TABLE relief_programs MODIFY name VARCHAR(100) NOT NULL;

-- DQL (Select Queries)
-- 16. Select all programs
SELECT * FROM relief_programs;

-- 17. Get active programs with alias
SELECT name AS Program_Name, category AS Type, status AS Current_Status
FROM relief_programs
WHERE status = 'Active';

-- 18. Programs ending in or after August 2025
SELECT name, end_date
FROM relief_programs
WHERE end_date >= '2025-08-01';

-- 19. List of programs by officer ID
SELECT id, name FROM relief_programs WHERE officer_id = 101;

-- 20. Programs starting in 2025 Q1
SELECT name FROM relief_programs
WHERE MONTH(start_date) BETWEEN 1 AND 3;

-- 21. Count of programs by status
SELECT status, COUNT(*) AS total FROM relief_programs GROUP BY status;

-- 22. Program with the longest duration
SELECT name, DATEDIFF(end_date, start_date) AS duration_days
FROM relief_programs
ORDER BY duration_days DESC
LIMIT 1;

-- 23. Programs containing word "Aid"
SELECT * FROM relief_programs
WHERE name LIKE '%Aid%';

-- 24. Programs ordered by start date
SELECT * FROM relief_programs ORDER BY start_date;

-- 25. Group by category
SELECT category, COUNT(*) AS num_programs
FROM relief_programs
GROUP BY category;

-- Clauses, Operators, Functions
-- 26. COALESCE to handle NULL budget_estimate
SELECT name, COALESCE(budget_estimate, 0) AS Budget
FROM relief_programs;

-- 27. Use BETWEEN
SELECT name, start_date
FROM relief_programs
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- 28. IN clause
SELECT name FROM relief_programs
WHERE category IN ('Food', 'Health', 'Water');

-- 29. CASE expression
SELECT name,
  CASE
    WHEN status = 'Active' THEN 'Ongoing'
    WHEN status = 'Planned' THEN 'Scheduled'
    WHEN status = 'Completed' THEN 'Done'
    ELSE 'Unknown'
  END AS Program_Status
FROM relief_programs;

-- 30. UPPER and LENGTH
SELECT UPPER(name) AS ProgramName, LENGTH(description) AS DescriptionLength
FROM relief_programs;

-- Joins
-- 31. INNER JOIN with officers
SELECT rp.name, o.name AS officer_name, o.designation
FROM relief_programs rp
JOIN officers o ON rp.officer_id = o.officer_id;

-- 32. LEFT JOIN with locations
SELECT rp.name, l.location_name
FROM relief_programs rp
LEFT JOIN locations l ON rp.location_id = l.location_id;

-- 33. Join with filtering
SELECT rp.name, o.name AS officer
FROM relief_programs rp
JOIN officers o ON rp.officer_id = o.officer_id
WHERE rp.status = 'Completed';

-- 34. Join to find programs in a specific district
SELECT rp.name, l.district
FROM relief_programs rp
JOIN locations l ON rp.location_id = l.location_id
WHERE l.district = 'Pune';

-- 35. Count of programs per officer
SELECT o.name, COUNT(*) AS program_count
FROM relief_programs rp
JOIN officers o ON rp.officer_id = o.officer_id
GROUP BY o.name;

-- Subqueries
-- 36. Programs with max duration
SELECT * FROM relief_programs
WHERE DATEDIFF(end_date, start_date) = (
  SELECT MAX(DATEDIFF(end_date, start_date)) FROM relief_programs
);

-- 37. Programs with earliest start date
SELECT * FROM relief_programs
WHERE start_date = (
  SELECT MIN(start_date) FROM relief_programs
);

-- 38. Officers handling more than 1 program
SELECT officer_id FROM relief_programs
GROUP BY officer_id
HAVING COUNT(*) > 1;

-- 39. Programs not handled by any officer (if nulls exist)
SELECT * FROM relief_programs
WHERE officer_id NOT IN (
  SELECT officer_id FROM officers
);

-- 40. Categories with more than 2 programs
SELECT category FROM relief_programs
GROUP BY category
HAVING COUNT(*) > 2;

-- Views and CTEs
-- 41. Create a view for active programs
CREATE VIEW active_programs AS
SELECT id, name, start_date, end_date
FROM relief_programs
WHERE status = 'Active';

-- 42. Select from view
SELECT * FROM active_programs;

-- 43. CTE to get durations
WITH ProgramDurations AS (
  SELECT id, name, DATEDIFF(end_date, start_date) AS duration
  FROM relief_programs
)
SELECT * FROM ProgramDurations
WHERE duration > 90;

-- 44. Nested CTE to rank programs
WITH ProgramRanks AS (
  SELECT id, name, DENSE_RANK() OVER (ORDER BY start_date) AS start_rank
  FROM relief_programs
)
SELECT * FROM ProgramRanks WHERE start_rank <= 5;

-- 45. View for programs with officers and locations
CREATE VIEW full_program_info AS
SELECT rp.id, rp.name, o.name AS officer, l.location_name
FROM relief_programs rp
JOIN officers o ON rp.officer_id = o.officer_id
JOIN locations l ON rp.location_id = l.location_id;

-- Miscellaneous + Advanced
-- 46. Find programs overlapping with a date range
SELECT * FROM relief_programs
WHERE '2025-05-01' BETWEEN start_date AND end_date;

-- 47. Find overlapping programs for specific category
SELECT name FROM relief_programs a
WHERE EXISTS (
  SELECT 1 FROM relief_programs b
  WHERE a.id <> b.id AND a.category = b.category
  AND a.start_date BETWEEN b.start_date AND b.end_date
);

-- 48. Rank programs by end date
SELECT name, RANK() OVER (ORDER BY end_date DESC) AS end_rank
FROM relief_programs;

-- 49. JSON output (for databases supporting JSON functions)
-- SELECT JSON_OBJECT('Program', name, 'Category', category, 'Status', status) FROM relief_programs;

-- 50. Use CONCAT for custom message
SELECT CONCAT(name, ' (', category, ') is ', status) AS Program_Details
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

-- 1. Create a supporting table for disaster locations
CREATE TABLE disaster_locations (
    location_id INT PRIMARY KEY,
    district_name VARCHAR(100),
    state_name VARCHAR(100)
);

-- 2. Add FOREIGN KEY with CASCADE constraints to disaster_events
ALTER TABLE disaster_events
ADD CONSTRAINT fk_location_id
FOREIGN KEY (location_id)
REFERENCES disaster_locations(location_id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 3. Add a column for economic_loss
ALTER TABLE disaster_events
ADD COLUMN economic_loss DECIMAL(12,2);

-- 4. Rename column "name" to "event_name"
-- NOTE: Syntax may vary by RDBMS; use with caution
 ALTER TABLE disaster_events RENAME COLUMN name TO event_name;

-- 5. Modify column severity_level to enforce ENUM constraint (MySQL syntax)
    ALTER TABLE disaster_events MODIFY severity_level ENUM('Low','Medium','High','Critical');
    
-- DML (Insert, Update, Delete)
-- 6. Insert new disaster event
INSERT INTO disaster_events (id, event_type, name, start_date, end_date, location_id, severity_level, description, document_reference, status)
VALUES (21, 'Cyclone', 'Cyclone Iris', '2025-07-10', '2025-07-15', 301, 'High', 'Heavy cyclone hitting east coast.', 'DOC-D021', 'Active');

-- 7. Update status of a specific disaster event
UPDATE disaster_events
SET status = 'Resolved'
WHERE id = 1;

-- 8. Set economic_loss for critical events
UPDATE disaster_events
SET economic_loss = 10000000
WHERE severity_level = 'Critical';

-- 9. Delete events older than 2024
DELETE FROM disaster_events
WHERE YEAR(start_date) < 2025;

-- 10. Mark storms as archived if they are resolved
UPDATE disaster_events
SET status = 'Archived'
WHERE event_type = 'Storm' AND status = 'Resolved';

-- 11. Insert new records into disaster_locations
INSERT INTO disaster_locations (location_id, district_name, state_name)
VALUES (301, 'Pune', 'Maharashtra'), (302, 'Nashik', 'Maharashtra');

-- 12. Soft delete concept (Inactive marking)
UPDATE disaster_events
SET status = 'Inactive'
WHERE end_date < CURRENT_DATE() AND status = 'Active';

-- 13. Update all heatwave losses to a realistic estimate
UPDATE disaster_events
SET economic_loss = 3000000
WHERE event_type = 'Heatwave';

-- 14. Delete test/demo events (not real disasters)
DELETE FROM disaster_events
WHERE name LIKE '%Demo%';

-- 15. Insert missing loss values using COALESCE logic
UPDATE disaster_events
SET economic_loss = 500000
WHERE economic_loss IS NULL;

-- DQL (Simple Selects with Aliases, Clauses, Filtering)
-- 16. Get all disaster events
SELECT * FROM disaster_events;

-- 17. Select only resolved earthquakes
SELECT name, start_date, severity_level
FROM disaster_events
WHERE event_type = 'Earthquake' AND status = 'Resolved';

-- 18. Get active disasters with alias
SELECT name AS Disaster, event_type AS Type, status AS Current_Status
FROM disaster_events
WHERE status = 'Active';

-- 19. Events between two dates
SELECT name, event_type, start_date
FROM disaster_events
WHERE start_date BETWEEN '2025-03-01' AND '2025-06-01';

-- 20. Events with document references starting with 'DOC-D00'
SELECT * FROM disaster_events
WHERE document_reference LIKE 'DOC-D00%';

-- 21. Group events by severity
SELECT severity_level, COUNT(*) AS event_count
FROM disaster_events
GROUP BY severity_level;

-- 22. Count by event_type
SELECT event_type, COUNT(*) AS total_events
FROM disaster_events
GROUP BY event_type;

-- 23. Order by end_date descending
SELECT * FROM disaster_events ORDER BY end_date DESC;

-- 24. Longest disaster event
SELECT name, DATEDIFF(end_date, start_date) AS duration
FROM disaster_events
ORDER BY duration DESC
LIMIT 1;

-- 25. Top 3 recent disasters
SELECT name, start_date
FROM disaster_events
ORDER BY start_date DESC
LIMIT 3;

-- Operators, Functions, CASE, and More
-- 26. Use CASE to label severity
SELECT name,
  CASE
    WHEN severity_level = 'Critical' THEN 'Emergency'
    WHEN severity_level = 'High' THEN 'Severe'
    WHEN severity_level = 'Medium' THEN 'Moderate'
    ELSE 'Minor'
  END AS severity_label
FROM disaster_events;

-- 27. COALESCE for economic loss
SELECT name, COALESCE(economic_loss, 0) AS estimated_loss
FROM disaster_events;

-- 28. Find disasters using IN clause
SELECT * FROM disaster_events
WHERE event_type IN ('Flood', 'Earthquake', 'Cyclone');

-- 29. Events not resolved yet
SELECT * FROM disaster_events
WHERE status NOT IN ('Resolved', 'Archived');

-- 30. Total economic loss by severity
SELECT severity_level, SUM(COALESCE(economic_loss, 0)) AS total_loss
FROM disaster_events
GROUP BY severity_level;

-- Joins
-- 31. Join disaster events with location names
SELECT d.name AS disaster_name, l.district_name, l.state_name
FROM disaster_events d
JOIN disaster_locations l ON d.location_id = l.location_id;

-- 32. Join to get all active disasters in Maharashtra
SELECT d.name, l.state_name
FROM disaster_events d
JOIN disaster_locations l ON d.location_id = l.location_id
WHERE l.state_name = 'Maharashtra' AND d.status = 'Active';

-- 33. Join with filtering and ordering
SELECT d.name, d.event_type, l.district_name
FROM disaster_events d
JOIN disaster_locations l ON d.location_id = l.location_id
WHERE d.status = 'Resolved'
ORDER BY d.end_date DESC;

-- 34. Count of disasters per district
SELECT l.district_name, COUNT(*) AS num_disasters
FROM disaster_events d
JOIN disaster_locations l ON d.location_id = l.location_id
GROUP BY l.district_name;

-- 35. All Cyclones and Floods with location info
SELECT d.name, d.event_type, l.district_name
FROM disaster_events d
JOIN disaster_locations l ON d.location_id = l.location_id
WHERE d.event_type IN ('Cyclone', 'Flood');

-- Subqueries
-- 36. Disasters with maximum economic loss
SELECT * FROM disaster_events
WHERE economic_loss = (SELECT MAX(economic_loss) FROM disaster_events);

-- 37. Locations with more than 2 disaster events
SELECT location_id
FROM disaster_events
GROUP BY location_id
HAVING COUNT(*) > 2;

-- 38. Disasters longer than average duration
SELECT name, DATEDIFF(end_date, start_date) AS duration
FROM disaster_events
WHERE DATEDIFF(end_date, start_date) > (
  SELECT AVG(DATEDIFF(end_date, start_date)) FROM disaster_events
);

-- 39. Subquery in FROM clause to find average loss per type
SELECT event_type, AVG(economic_loss) AS avg_loss
FROM (
  SELECT event_type, economic_loss FROM disaster_events WHERE economic_loss IS NOT NULL
) AS loss_data
GROUP BY event_type;

-- 40. Subquery to find recent floods only
SELECT name FROM disaster_events
WHERE start_date >= ALL (
  SELECT start_date FROM disaster_events WHERE event_type = 'Flood'
);

-- Views and CTEs
-- 41. Create a view for active critical events
CREATE VIEW active_critical_disasters AS
SELECT * FROM disaster_events
WHERE status = 'Active' AND severity_level = 'Critical';

-- 42. View usage
SELECT name, start_date FROM active_critical_disasters;

-- 43. CTE for duration calculation
WITH EventDurations AS (
  SELECT id, name, DATEDIFF(end_date, start_date) AS duration_days
  FROM disaster_events
)
SELECT * FROM EventDurations WHERE duration_days > 5;

-- 44. CTE with join
WITH DisasterWithLocation AS (
  SELECT d.name, d.event_type, l.district_name
  FROM disaster_events d
  JOIN disaster_locations l ON d.location_id = l.location_id
)
SELECT * FROM DisasterWithLocation;

-- 45. Create view for economic summary
CREATE VIEW disaster_loss_summary AS
SELECT event_type, COUNT(*) AS num_events, SUM(economic_loss) AS total_loss
FROM disaster_events
GROUP BY event_type;

-- Advanced / Miscellaneous
-- 46. Events overlapping a certain date
SELECT * FROM disaster_events
WHERE '2025-05-10' BETWEEN start_date AND end_date;

-- 47. Dynamic message using CONCAT
SELECT CONCAT(name, ' (', event_type, ') - ', status) AS Event_Message
FROM disaster_events;

-- 48. RANK disaster events by loss
SELECT name, RANK() OVER (ORDER BY economic_loss DESC) AS loss_rank
FROM disaster_events;

-- 49. Events starting in May 2025
SELECT name, MONTH(start_date) AS start_month
FROM disaster_events
WHERE MONTH(start_date) = 5 AND YEAR(start_date) = 2025;

-- 50. JSON object (in MySQL/PostgreSQL)
SELECT JSON_OBJECT('name', name, 'type', event_type, 'status', status) FROM disaster;

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

-- 1. Create officers table (if not already created)
CREATE TABLE officers (
    officer_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(100)
);

-- 2. Create relief_programs table reference
CREATE TABLE relief_programs (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(20)
);

-- 3. Add foreign key constraints with cascading
ALTER TABLE fund_allocations
ADD CONSTRAINT fk_program_id FOREIGN KEY (program_id)
REFERENCES relief_programs(id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE fund_allocations
ADD CONSTRAINT fk_officer_id FOREIGN KEY (officer_id)
REFERENCES officers(officer_id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 4. Add a new column for remaining balance
ALTER TABLE fund_allocations
ADD COLUMN remaining_balance DECIMAL(12,2);

-- 5. Update remaining balance using generated column (if supported
ALTER TABLE fund_allocations
ADD COLUMN remaining_balance DECIMAL(10,2) GENERATED ALWAYS AS (amount_allocated - amount_spent) STORED;

-- DML (Insert, Update, Delete)
-- 6. Insert a new fund allocation record
INSERT INTO fund_allocations VALUES
(21, 1, 600000.00, 100000.00, '2024-25', 101, 'Ongoing', 'Additional fund', 'DOC-F021', '2024-07-01');

-- 7. Update amount spent for program_id = 2
UPDATE fund_allocations
SET amount_spent = amount_spent + 25000
WHERE program_id = 2;

-- 8. Set remaining_balance for all records
UPDATE fund_allocations
SET remaining_balance = amount_allocated - amount_spent;

-- 9. Mark all completed allocations with zero balance
UPDATE fund_allocations
SET status = 'Completed'
WHERE amount_allocated = amount_spent;

-- 10. Delete planned allocations with zero amount
DELETE FROM fund_allocations
WHERE status = 'Planned' AND amount_allocated = 0;

-- 11. Increase allocation by 10% for all ongoing programs
UPDATE fund_allocations
SET amount_allocated = amount_allocated * 1.10
WHERE status = 'Ongoing';

-- 12. Insert data into officers (example)
INSERT INTO officers VALUES (101, 'Amit Rao', 'Finance Officer'), (102, 'Meena Sharma', 'Auditor');

-- 13. Delete allocations created before 2023-04-01
DELETE FROM fund_allocations
WHERE date_created < '2023-04-01';

-- 14. Change fiscal_year format from '2024-25' to 'FY24-25'
UPDATE fund_allocations
SET fiscal_year = CONCAT('FY', SUBSTRING(fiscal_year, 1, 2), '-', SUBSTRING(fiscal_year, 6, 2));

-- 15. Reset remarks for completed programs
UPDATE fund_allocations
SET remarks = 'Closed after audit'
WHERE status = 'Completed';

-- DQL (Select Queries)
-- 16. View all fund allocations
SELECT * FROM fund_allocations;

-- 17. Get allocations by officer ID with alias
SELECT id AS Allocation_ID, program_id AS Program, amount_allocated AS Allocated
FROM fund_allocations
WHERE officer_id = 101;

-- 18. Get planned programs only
SELECT * FROM fund_allocations
WHERE status = 'Planned';

-- 19. Show total spent vs allocated
SELECT SUM(amount_allocated) AS Total_Allocated, SUM(amount_spent) AS Total_Spent
FROM fund_allocations;

-- 20. Allocation records ordered by amount_spent descending
SELECT * FROM fund_allocations
ORDER BY amount_spent DESC;

-- 21. Allocations created in May 2024
SELECT * FROM fund_allocations
WHERE MONTH(date_created) = 5 AND YEAR(date_created) = 2024;

-- 22. Programs where nothing has been spent
SELECT id, program_id, amount_allocated
FROM fund_allocations
WHERE amount_spent = 0;

-- 23. Count of allocations per officer
SELECT officer_id, COUNT(*) AS Total_Allocations
FROM fund_allocations
GROUP BY officer_id;

-- 24. Allocations where more than 75% is spent
SELECT * FROM fund_allocations
WHERE amount_spent >= 0.75 * amount_allocated;

-- 25. Find remaining balance for each allocation
SELECT id, (amount_allocated - amount_spent) AS Balance
FROM fund_allocations;

-- Functions, Clauses, Operators
-- 26. Use COALESCE to handle null remarks
SELECT id, COALESCE(remarks, 'No Remarks') AS remarks FROM fund_allocations;

-- 27. Use CASE for budget status
SELECT id, amount_allocated, amount_spent,
  CASE
    WHEN amount_spent = 0 THEN 'Unspent'
    WHEN amount_spent = amount_allocated THEN 'Fully Spent'
    ELSE 'Partially Spent'
  END AS Spend_Status
FROM fund_allocations;

-- 28. Use BETWEEN clause for range
SELECT * FROM fund_allocations
WHERE amount_allocated BETWEEN 300000 AND 600000;

-- 29. Allocations with remarks starting with 'Cash'
SELECT * FROM fund_allocations
WHERE remarks LIKE 'Cash%';

-- 30. Total balance grouped by status
SELECT status, SUM(amount_allocated - amount_spent) AS Total_Balance
FROM fund_allocations
GROUP BY status;

-- Joins
-- 31. Join with relief_programs for program name
SELECT fa.id, rp.name AS Program_Name, fa.amount_allocated
FROM fund_allocations fa
JOIN relief_programs rp ON fa.program_id = rp.id;

-- 32. Join with officers to get officer details
SELECT fa.id, o.name AS Officer, fa.amount_spent
FROM fund_allocations fa
JOIN officers o ON fa.officer_id = o.officer_id;

-- 33. Count allocations per program name
SELECT rp.name, COUNT(*) AS Allocation_Count
FROM fund_allocations fa
JOIN relief_programs rp ON fa.program_id = rp.id
GROUP BY rp.name;

-- 34. All planned programs with no expenditure yet
SELECT fa.id, rp.name
FROM fund_allocations fa
JOIN relief_programs rp ON fa.program_id = rp.id
WHERE fa.status = 'Planned' AND fa.amount_spent = 0;

-- 35. Allocations with full info (program + officer)
SELECT fa.id, rp.name AS Program, o.name AS Officer, fa.amount_allocated
FROM fund_allocations fa
JOIN relief_programs rp ON fa.program_id = rp.id
JOIN officers o ON fa.officer_id = o.officer_id;

-- Subqueries
-- 36. Allocation with max amount spent
SELECT * FROM fund_allocations
WHERE amount_spent = (SELECT MAX(amount_spent) FROM fund_allocations);

-- 37. Officers who handled more than 2 allocations
SELECT officer_id
FROM fund_allocations
GROUP BY officer_id
HAVING COUNT(*) > 2;

-- 38. Programs with highest total allocation
SELECT program_id
FROM fund_allocations
GROUP BY program_id
ORDER BY SUM(amount_allocated) DESC
LIMIT 1;

-- 39. Allocations created after the latest completed program
SELECT * FROM fund_allocations
WHERE date_created > (
  SELECT MAX(date_created)
  FROM fund_allocations
  WHERE status = 'Completed'
);

-- 40. Subquery inside FROM clause to get % spent
SELECT id, Allocated, Spent, ROUND((Spent / Allocated) * 100, 2) AS Percent_Spent
FROM (
  SELECT id, amount_allocated AS Allocated, amount_spent AS Spent
  FROM fund_allocations
) AS sub;
-- Views and CTEs

-- 41. Create view for completed allocations
CREATE VIEW completed_allocations AS
SELECT * FROM fund_allocations
WHERE status = 'Completed';

-- 42. View usage
SELECT * FROM completed_allocations;

-- 43. CTE for allocation gaps
WITH FundGaps AS (
  SELECT id, amount_allocated - amount_spent AS gap
  FROM fund_allocations
)
SELECT * FROM FundGaps WHERE gap > 100000;

-- 44. CTE with joins
WITH FundOfficer AS (
  SELECT fa.id, o.name AS officer_name, fa.amount_spent
  FROM fund_allocations fa
  JOIN officers o ON fa.officer_id = o.officer_id
)
SELECT * FROM FundOfficer WHERE amount_spent > 100000;

-- 45. View to show balance per fiscal year
CREATE VIEW balance_summary AS
SELECT fiscal_year, SUM(amount_allocated - amount_spent) AS Total_Remaining
FROM fund_allocations
GROUP BY fiscal_year;
-- Miscellaneous & Advanced

-- 46. Allocations overlapping with a custom fiscal date
SELECT * FROM fund_allocations
WHERE fiscal_year = 'FY24-25' AND date_created BETWEEN '2024-04-01' AND '2025-03-31';

-- 47. Use RANK to order allocations by spent amount
SELECT id, RANK() OVER (ORDER BY amount_spent DESC) AS Spend_Rank
FROM fund_allocations;

-- 48. JSON output of allocations (if supported)
-- SELECT JSON_OBJECT('id', id, 'allocated', amount_allocated, 'status', status) FROM fund_allocations;

-- 49. Custom label using CONCAT
SELECT CONCAT('Program ', program_id, ': ₹', amount_allocated) AS Allocation_Label
FROM fund_allocations;

-- 50. Show remaining budget using IF condition
SELECT id, amount_allocated, amount_spent,
  IF(amount_spent = 0, 'Unspent', 'Spent/Partial') AS Budget_Status
FROM fund_allocations;


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

 -- DDL – Data Definition Language

-- 1. Add a NOT NULL constraint to 'item_description'
ALTER TABLE aid_distribution 
MODIFY item_description TEXT NOT NULL;

-- 2. Add a new column to track delivery mode
ALTER TABLE aid_distribution 
ADD COLUMN delivery_mode VARCHAR(50);

-- 3. Rename column 'remarks' to 'notes'
ALTER TABLE aid_distribution 
CHANGE remarks notes TEXT;

-- 4. Drop the 'delivery_mode' column
ALTER TABLE aid_distribution 
DROP COLUMN delivery_mode;

-- 5. Change 'status' to allow only specific values using ENUM (if supported)
ALTER TABLE aid_distribution 
MODIFY status ENUM('Delivered', 'Pending', 'Cancelled');

-- 6. Add a default value to 'status'
ALTER TABLE aid_distribution 
MODIFY status VARCHAR(20) DEFAULT 'Pending';

-- 7. Create index on 'program_id' for fast lookups
CREATE INDEX idx_program_id ON aid_distribution(program_id);

-- 8. Create a view showing only pending distributions
CREATE VIEW pending_distributions AS
SELECT * FROM aid_distribution
WHERE status = 'Pending';

-- 9. Create a table backup
CREATE TABLE aid_distribution_backup AS 
SELECT * FROM aid_distribution;

-- 10. Drop the backup table
DROP TABLE aid_distribution_backup;

-- DML – Data Manipulation Language
-- 11. Insert a new record
INSERT INTO aid_distribution (id, citizen_id, program_id, item_description, quantity, distribution_date, location_id, officer_id, status, notes)
VALUES (21, 1021, 11, 'Tent', 10, '2025-06-11', 211, 321, 'Delivered', 'For families without shelter');

-- 12. Update status for a specific citizen
UPDATE aid_distribution
SET status = 'Delivered'
WHERE citizen_id = 1012;

-- 13. Delete a record where ID = 20
DELETE FROM aid_distribution
WHERE id = 20;

-- 14. Increase quantity by 10 for all "Blankets"
UPDATE aid_distribution
SET quantity = quantity + 10
WHERE item_description LIKE '%Blankets%';

-- 15. Mark all pending aid as 'Delivered' if distributed before July 2025
UPDATE aid_distribution
SET status = 'Delivered'
WHERE status = 'Pending' AND distribution_date < '2025-07-01';

-- 16. Swap quantity between ID 3 and 4 (using subqueries)
UPDATE aid_distribution a, aid_distribution b
SET a.quantity = b.quantity, b.quantity = a.quantity
WHERE a.id = 3 AND b.id = 4;

-- 17. Set notes to NULL where item is ‘Sanitation Kit’
UPDATE aid_distribution
SET notes = NULL
WHERE item_description = 'Sanitation Kit';

-- 18. Insert record with today's date
INSERT INTO aid_distribution (id, citizen_id, program_id, item_description, quantity, distribution_date, location_id, officer_id, status, notes)
VALUES (22, 1022, 12, 'Raincoat', 60, CURDATE(), 212, 322, 'Pending', 'Urgent weather relief');

-- 19. Delete all 'Cancelled' distributions
DELETE FROM aid_distribution
WHERE status = 'Cancelled';

-- 20. Duplicate record with modified program ID
INSERT INTO aid_distribution (id, citizen_id, program_id, item_description, quantity, distribution_date, location_id, officer_id, status, notes)
SELECT 23, citizen_id, 13, item_description, quantity, distribution_date, location_id, officer_id, status, notes
FROM aid_distribution
WHERE id = 1;
-- DQL – Data Query Language with Operators, Aliases, Functions
-- 21. Fetch total quantity distributed per item
SELECT item_description, SUM(quantity) AS total_quantity
FROM aid_distribution
GROUP BY item_description;

-- 22. Find average quantity per program
SELECT program_id, ROUND(AVG(quantity), 2) AS avg_quantity
FROM aid_distribution
GROUP BY program_id;

-- 23. Fetch count of 'Pending' vs 'Delivered'
SELECT status, COUNT(*) AS total_cases
FROM aid_distribution
GROUP BY status;

-- 24. Get latest distribution date
SELECT MAX(distribution_date) AS last_distribution
FROM aid_distribution;

-- 25. Count unique officers involved
SELECT COUNT(DISTINCT officer_id) AS total_officers
FROM aid_distribution;

-- 26. List aid delivered in June using BETWEEN
SELECT * FROM aid_distribution
WHERE distribution_date BETWEEN '2025-06-01' AND '2025-06-30';

-- 27. Search aid where notes contain 'urgent' (case-insensitive)
SELECT * FROM aid_distribution
WHERE LOWER(notes) LIKE '%urgent%';

-- 28. Get aid details using aliases
SELECT a.id AS Aid_ID, a.item_description AS Item, a.quantity AS Qty, a.status AS Status
FROM aid_distribution a;

-- 29. Aid quantities with square root function (fun example)
SELECT id, quantity, SQRT(quantity) AS root_qty
FROM aid_distribution;

-- 30. Round quantity to nearest 5
SELECT id, quantity, ROUND(quantity, -1) AS rounded_qty
FROM aid_distribution;
-- Joins, Subqueries, and Views
-- 31. Inner Join with program table (assume exists)
SELECT a.id, a.item_description, p.program_name
FROM aid_distribution a
JOIN relief_programs p ON a.program_id = p.program_id;

-- 32. Inner Join with citizens table
SELECT a.id, c.citizen_name, a.item_description
FROM aid_distribution a
JOIN citizens c ON a.citizen_id = c.citizen_id;

-- 33. Subquery: Aid with above average quantity
SELECT * FROM aid_distribution
WHERE quantity > (SELECT AVG(quantity) FROM aid_distribution);

-- 34. Subquery: Citizens who received 'Water Purifier'
SELECT citizen_id FROM aid_distribution
WHERE item_description = 'Water Purifier';

-- 35. View: Delivered distributions only
CREATE VIEW delivered_aid AS
SELECT * FROM aid_distribution
WHERE status = 'Delivered';

-- 36. Join with officers to show officer name
SELECT a.id, a.item_description, o.officer_name
FROM aid_distribution a
JOIN officers o ON a.officer_id = o.officer_id;

-- 37. Join with location to show district
SELECT a.id, a.item_description, l.district_name
FROM aid_distribution a
JOIN locations l ON a.location_id = l.location_id;

-- 38. Join with disaster_events to see event type
SELECT a.id, a.item_description, d.disaster_type
FROM aid_distribution a
JOIN disaster_events d ON a.program_id = d.program_id;

-- 39. List top 5 largest distributions by quantity
SELECT * FROM aid_distribution
ORDER BY quantity DESC
LIMIT 5;

-- 40. Total aid quantity delivered per officer
SELECT officer_id, SUM(quantity) AS total_distributed
FROM aid_distribution
WHERE status = 'Delivered'
GROUP BY officer_id;
-- Constraints and Cascades
-- 41. Add foreign key on program_id with CASCADE
ALTER TABLE aid_distribution
ADD CONSTRAINT fk_program
FOREIGN KEY (program_id) REFERENCES relief_programs(program_id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 42. Add foreign key on citizen_id
ALTER TABLE aid_distribution
ADD CONSTRAINT fk_citizen
FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
ON DELETE SET NULL ON UPDATE CASCADE;

-- 43. Add foreign key on officer_id with RESTRICT
ALTER TABLE aid_distribution
ADD CONSTRAINT fk_officer
FOREIGN KEY (officer_id) REFERENCES officers(officer_id)
ON DELETE RESTRICT;

-- 44. Add foreign key on location_id
ALTER TABLE aid_distribution
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id) REFERENCES locations(location_id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 45. Add compound unique key (citizen_id + program_id)
ALTER TABLE aid_distribution
ADD CONSTRAINT unique_aid_per_program
UNIQUE (citizen_id, program_id);

-- 46. Top 3 items by total quantity delivered
SELECT item_description,
       SUM(quantity) AS total_qty
FROM aid_distribution
WHERE status = 'Delivered'
GROUP BY item_description
ORDER BY total_qty DESC
LIMIT 3;

-- 47. Monthly distribution summary (by year-month)
SELECT DATE_FORMAT(distribution_date, '%Y-%m') AS month,
       COUNT(*) AS num_distributions,
       SUM(quantity) AS total_quantity
FROM aid_distribution
GROUP BY month
ORDER BY month;

-- 48. Locations yet to receive any “Health Kit”
SELECT DISTINCT location_id
FROM aid_distribution
WHERE location_id NOT IN (
  SELECT DISTINCT location_id
  FROM aid_distribution
  WHERE item_description = 'Health Kit'
);

-- 49. Days with over‑max delivery volume (e.g., >200 total units)

SELECT distribution_date,
       SUM(quantity) AS total_qty
FROM aid_distribution
GROUP BY distribution_date
HAVING total_qty > 200;

-- 50. Running cumulative total per program, ordered by date
SELECT program_id,
       distribution_date,
       SUM(quantity) OVER (
         PARTITION BY program_id
         ORDER BY distribution_date
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_qty
FROM aid_distribution
ORDER BY program_id, distribution_date;

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

-- 1. Create the 'locations' table (already done, included for reference)
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

-- 2. Add a new column for last_updated timestamp
ALTER TABLE locations ADD last_updated DATETIME;

-- 3. Modify 'pincode' column length
ALTER TABLE locations MODIFY pincode VARCHAR(6);

-- 4. Rename column 'status' to 'location_status'
ALTER TABLE locations RENAME COLUMN status TO location_status;

-- 5. Drop the 'last_updated' column
ALTER TABLE locations DROP COLUMN last_updated;

-- DML (Insert, Update, Delete)
-- 6. Insert a new location
INSERT INTO locations (id, district, taluka, village, pincode, latitude, longitude, population, zone_type, location_status)
VALUES (21, 'Satara', 'Mahabaleshwar', 'Medha', '412806', 17.9265, 73.6582, 2100, 'Rural', 'Active');

-- 7. Update population of 'Lonavala' village
UPDATE locations
SET population = 52000
WHERE village = 'Lonavala';

-- 8. Mark all 'Inactive' villages with population below 1000
UPDATE locations
SET location_status = 'Inactive'
WHERE population < 1000;

-- 9. Delete a location record by ID
DELETE FROM locations
WHERE id = 21;

-- 10. Insert multiple records at once
INSERT INTO locations (id, district, taluka, village, pincode, latitude, longitude, population, zone_type, location_status)
VALUES 
(21, 'Raigad', 'Karjat', 'Chowk', '410207', 18.9890, 73.3230, 4000, 'Rural', 'Active'),
(22, 'Solapur', 'Pandharpur', 'Velapur', '413115', 17.6840, 75.3103, 3500, 'Rural', 'Active');

-- 11. Update latitude and longitude of 'Pune' city
UPDATE locations
SET latitude = 18.520430, longitude = 73.856743
WHERE village = 'Pune';

-- 12. Set zone_type to 'Urban' for villages with population > 100000
UPDATE locations
SET zone_type = 'Urban'
WHERE population > 100000;

-- 13. Remove inactive locations
DELETE FROM locations
WHERE location_status = 'Inactive';

-- 14. Increase population by 10% for all 'Urban' areas
UPDATE locations
SET population = population * 1.1
WHERE zone_type = 'Urban';

-- 15. Change 'Mulshi' taluka’s status to 'Pending' for review
UPDATE locations
SET location_status = 'Pending'
WHERE taluka = 'Mulshi';

-- DQL (SELECT + Clauses, Operators, Aliases, Functions)
-- 16. Select all locations in 'Pune' district
SELECT * FROM locations WHERE district = 'Pune';

-- 17. Get top 5 most populated locations
SELECT * FROM locations ORDER BY population DESC LIMIT 5;

-- 18. Get average population of Rural zones
SELECT AVG(population) AS avg_rural_population
FROM locations
WHERE zone_type = 'Rural';

-- 19. Count of locations per district
SELECT district, COUNT(*) AS total_locations
FROM locations
GROUP BY district;

-- 20. List of unique talukas
SELECT DISTINCT taluka FROM locations;

-- 21. Find locations with population between 1000 and 5000
SELECT * FROM locations
WHERE population BETWEEN 1000 AND 5000;

-- 22. Get all locations with name starting with 'A'
SELECT * FROM locations
WHERE village LIKE 'A%';

-- 23. Use alias and calculated field (population in thousands)
SELECT id, village, population / 1000 AS population_k
FROM locations;

-- 24. Show latitude and longitude formatted to 3 decimal places
SELECT id, village, ROUND(latitude, 3) AS lat_3d, ROUND(longitude, 3) AS lon_3d
FROM locations;

-- 25. Get population sum for each taluka in 'Pune'
SELECT taluka, SUM(population) AS total_pop
FROM locations
WHERE district = 'Pune'
GROUP BY taluka;

-- 26. Show all locations where pincode is not null
SELECT * FROM locations WHERE pincode IS NOT NULL;

-- 27. Use CASE to classify population size
SELECT village,
  CASE
    WHEN population < 1000 THEN 'Small'
    WHEN population BETWEEN 1000 AND 10000 THEN 'Medium'
    ELSE 'Large'
  END AS population_size
FROM locations;

-- 28. Count of Urban vs Rural
SELECT zone_type, COUNT(*) AS total FROM locations GROUP BY zone_type;

-- 29. Search for villages with vowels only in the name
SELECT * FROM locations
WHERE village REGEXP '^[aeiouAEIOU]+$';

-- 30. Retrieve locations from 'Pune' or 'Nagpur'
SELECT * FROM locations
WHERE district IN ('Pune', 'Nagpur');

-- Joins & Subqueries
-- 31. INNER JOIN with relief_programs to list programs per location
SELECT l.village, rp.program_name
FROM locations l
JOIN relief_programs rp ON l.id = rp.location_id;

-- 32. LEFT JOIN to show all locations with/without relief programs
SELECT l.village, rp.program_name
FROM locations l
LEFT JOIN relief_programs rp ON l.id = rp.location_id;

-- 33. Get locations with more than 1 relief program
SELECT l.village, COUNT(rp.id) AS program_count
FROM locations l
JOIN relief_programs rp ON l.id = rp.location_id
GROUP BY l.village
HAVING COUNT(rp.id) > 1;

-- 34. Subquery: Get locations with population greater than district average
SELECT * FROM locations
WHERE population > (
    SELECT AVG(population)
    FROM locations
    WHERE district = 'Pune'
);

-- 35. Subquery: Get villages having the max population
SELECT * FROM locations
WHERE population = (
    SELECT MAX(population) FROM locations
);

-- 36. Join locations with fund_allocations on location_id
SELECT l.village, f.amount_allocated
FROM locations l
JOIN fund_allocations f ON l.id = f.location_id;

-- 37. Find locations that received aid after a disaster
SELECT DISTINCT l.village
FROM locations l
JOIN aid_distribution a ON l.id = a.location_id;

-- 38. Show location names with no aid distributions
SELECT village
FROM locations
WHERE id NOT IN (
    SELECT location_id FROM aid_distribution
);

-- 39. Join with disaster_events to show disaster type in each location
SELECT l.village, d.disaster_type
FROM locations l
JOIN disaster_events d ON l.id = d.location_id;

-- 40. Use subquery in SELECT to show relief count per location
SELECT l.village,
    (SELECT COUNT(*) FROM relief_programs rp WHERE rp.location_id = l.id) AS relief_programs
FROM locations l;

-- CASCADE Constraints (used in related tables)
-- 41. Create table with foreign key ON DELETE CASCADE
CREATE TABLE aid_distribution (
    id INT PRIMARY KEY,
    location_id INT,
    aid_type VARCHAR(50),
    amount INT,
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE
);

-- 42. Insert into aid_distribution
INSERT INTO aid_distribution (id, location_id, aid_type, amount)
VALUES (1, 6, 'Food', 50000);

-- 43. Delete location with id = 6 (also deletes aid records)
DELETE FROM locations WHERE id = 6;

-- 44. Update a location ID with CASCADE on related tables
ALTER TABLE aid_distribution
DROP FOREIGN KEY aid_distribution_ibfk_1;

ALTER TABLE aid_distribution
ADD CONSTRAINT fk_loc
FOREIGN KEY (location_id) REFERENCES locations(id)
ON UPDATE CASCADE;

-- 45. Update location ID from 5 to 55
UPDATE locations SET id = 55 WHERE id = 5;

-- 46. Create a view showing active urban areas only
CREATE VIEW active_urban_locations AS
SELECT * FROM locations
WHERE zone_type = 'Urban' AND location_status = 'Active';

-- 47. Select from view
SELECT * FROM active_urban_locations;

-- 48. Create a function to get total population of a district
DELIMITER //
CREATE FUNCTION get_total_population(district_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT SUM(population) INTO total
  FROM locations WHERE district = district_name;
  RETURN total;
END;
//
DELIMITER ;

-- 49. Use the function
SELECT get_total_population('Pune');

-- 50. Create a stored procedure to fetch all villages in a taluka
DELIMITER //
CREATE PROCEDURE GetVillagesByTaluka(IN talukaName VARCHAR(50))
BEGIN
  SELECT village FROM locations WHERE taluka = talukaName;
END;
//
DELIMITER ;


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

-- 1. Add a new column for retirement_date
ALTER TABLE government_officers
ADD retirement_date DATE;

-- 2. Modify email column to be unique
ALTER TABLE government_officers
MODIFY email VARCHAR(100) UNIQUE;

-- 3. Add CHECK constraint on status
ALTER TABLE government_officers
ADD CONSTRAINT chk_status CHECK (status IN ('Active', 'Inactive', 'Retired'));

-- 4. Rename column 'designation' to 'job_title'
ALTER TABLE government_officers
CHANGE designation job_title VARCHAR(50);

-- 5. Create a foreign key to 'locations' table with ON DELETE CASCADE
ALTER TABLE government_officers
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id) REFERENCES locations(id)
ON DELETE CASCADE ON UPDATE CASCADE;

--  DML + Clauses, Operators, Functions, Aliases
-- 6. Insert a new officer
INSERT INTO government_officers (id, name, job_title, department, contact_number, email, office_address, location_id, joining_date, status)
VALUES (21, 'Rajesh Dahiya', 'Commissioner', 'Disaster Management', '9123456021', 'r.dahiya@maha.gov.in', 'DM HQ, Mumbai', 13, '2025-07-01', 'Active');

-- 7. Update officer's status using WHERE clause
UPDATE government_officers
SET status = 'Retired'
WHERE name = 'Ashish Chandra Verma';

-- 8. Delete officers with 'Inactive' status
DELETE FROM government_officers
WHERE status = 'Inactive';

-- 9. Increase contact number range by 1000 for all
UPDATE government_officers
SET contact_number = contact_number + 1000;

-- 10. Get all officers who joined after 2023
SELECT * FROM government_officers
WHERE joining_date > '2023-01-01';

-- 11. Get officers from a specific department using LIKE
SELECT * FROM government_officers
WHERE department LIKE '%Services%';

-- 12. Use BETWEEN for joining dates
SELECT name, department FROM government_officers
WHERE joining_date BETWEEN '2023-01-01' AND '2024-12-31';

-- 13. Use IN operator
SELECT name, job_title FROM government_officers
WHERE department IN ('Fire Services', 'Urban Development', 'Forests');

-- 14. Use IS NOT NULL on contact number
SELECT * FROM government_officers
WHERE contact_number IS NOT NULL;

-- 15. Use DISTINCT to get unique designations
SELECT DISTINCT job_title FROM government_officers;

-- 16. Use ORDER BY with DESC
SELECT name, joining_date FROM government_officers
ORDER BY joining_date DESC;

-- 17. Use LIMIT to get top 5 recent joiners
SELECT name, joining_date FROM government_officers
ORDER BY joining_date DESC LIMIT 5;

-- 18. Use UPPER function to convert names
SELECT UPPER(name) AS officer_name_upper FROM government_officers;

-- 19. Use LENGTH function to get name length
SELECT name, LENGTH(name) AS name_length FROM government_officers;

-- 20. Use CONCAT to format contact display
SELECT CONCAT(name, ' (', job_title, ') - ', contact_number) AS contact_info
FROM government_officers;

-- DQL + Aggregate & Grouping Functions
-- 21. Count total officers
SELECT COUNT(*) AS total_officers FROM government_officers;

-- 22. Count officers per department
SELECT department, COUNT(*) AS officer_count
FROM government_officers
GROUP BY department;

-- 23. Find earliest joining date
SELECT MIN(joining_date) AS earliest_joined FROM government_officers;

-- 24. Find latest joining officer
SELECT name FROM government_officers
WHERE joining_date = (SELECT MAX(joining_date) FROM government_officers);

-- 25. Group by job title with having clause
SELECT job_title, COUNT(*) AS total
FROM government_officers
GROUP BY job_title
HAVING COUNT(*) > 1;

-- 26. Average length of names
SELECT AVG(LENGTH(name)) AS avg_name_length FROM government_officers;

-- 27. Use CASE for status interpretation
SELECT name, 
       CASE status
         WHEN 'Active' THEN 'Currently Serving'
         WHEN 'Retired' THEN 'Retired Officer'
         ELSE 'Unknown Status'
       END AS status_description
FROM government_officers;

-- 28. Count officers with 'Secretary' in title
SELECT COUNT(*) AS total_secretaries
FROM government_officers
WHERE job_title LIKE '%Secretary%';

-- 29. Check if any officers joined in last 30 days
SELECT * FROM government_officers
WHERE joining_date >= CURDATE() - INTERVAL 30 DAY;

-- 30. Find departments with more than 2 officers
SELECT department, COUNT(*) AS count
FROM government_officers
GROUP BY department
HAVING COUNT(*) > 2;

-- Joins + Subqueries
-- 31. List officers with their location names
SELECT go.name, go.job_title, l.name AS location_name
FROM government_officers go
JOIN locations l ON go.location_id = l.id;

-- 32. List officers whose location is in 'Mumbai'
SELECT name, job_title FROM government_officers
WHERE location_id = (SELECT id FROM locations WHERE name = 'Mumbai');

-- 33. Get count of officers per location
SELECT l.name AS location_name, COUNT(*) AS officer_count
FROM government_officers go
JOIN locations l ON go.location_id = l.id
GROUP BY l.name;

-- 34. Subquery to get officers joined after the latest officer from 'Fire Services'
SELECT * FROM government_officers
WHERE joining_date > (
  SELECT MAX(joining_date)
  FROM government_officers
  WHERE department = 'Fire Services'
);

-- 35. Officers who share department with 'Sandeep Kumar'
SELECT * FROM government_officers
WHERE department = (
  SELECT department
  FROM government_officers
  WHERE name = 'Sandeep Kumar'
);

-- 36. Get job_title and department of officer with max contact_number
SELECT job_title, department
FROM government_officers
WHERE contact_number = (
  SELECT MAX(contact_number) FROM government_officers
);

-- 37. Join officers and locations with alias
SELECT go.name AS officer, go.job_title, l.name AS city
FROM government_officers go
JOIN locations l ON go.location_id = l.id;

-- 38. Get departments that have officers in 'Delhi'
SELECT DISTINCT department
FROM government_officers
JOIN locations ON government_officers.location_id = locations.id
WHERE locations.name = 'Delhi';

-- 39. Find officers in same department as 'Pandurang K Pole'
SELECT * FROM government_officers
WHERE department = (
  SELECT department FROM government_officers WHERE name = 'Pandurang K Pole'
);

-- 40. Officers with location_id present in locations table
SELECT * FROM government_officers
WHERE location_id IN (SELECT id FROM locations);

-- Advanced + Cascade Testing
-- 41. Create a backup of the table
CREATE TABLE government_officers_backup AS
SELECT * FROM government_officers;

-- 42. Temporarily deactivate officers who joined before 2022
UPDATE government_officers
SET status = 'Inactive'
WHERE joining_date < '2022-01-01';

-- 43. Restore status for those deactivated in previous query
UPDATE government_officers
SET status = 'Active'
WHERE status = 'Inactive' AND joining_date < '2022-01-01';

-- 44. Create index on department
CREATE INDEX idx_department ON government_officers(department);

-- 45. Get officers grouped by location_id, filter >2
SELECT location_id, COUNT(*) AS total
FROM government_officers
GROUP BY location_id
HAVING COUNT(*) > 2;

-- 46. Find duplicate job titles
SELECT job_title, COUNT(*) AS count
FROM government_officers
GROUP BY job_title
HAVING COUNT(*) > 1;

-- 47. Select officers who don't have a '@' in their email (sanity check)
SELECT * FROM government_officers
WHERE email NOT LIKE '%@%';

-- 48. Demonstrate ON DELETE CASCADE (delete location → deletes officers)
-- DELETE FROM locations WHERE id = 13;

-- 49. Demonstrate ON UPDATE CASCADE (update location → reflected)
-- UPDATE locations SET name = 'New Mumbai' WHERE id = 13;

-- 50. Get all active officers from ‘Mumbai’ location using join
SELECT go.name, go.job_title, l.name AS location_name
FROM government_officers go
JOIN locations l ON go.location_id = l.id
WHERE l.name = 'Mumbai' AND go.status = 'Active';

DELIMITER ;

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
    
    -- 1. Create the 'suppliers' table (already done in your query)
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

-- 2. Add a UNIQUE constraint to license_number
ALTER TABLE suppliers
ADD CONSTRAINT unique_license UNIQUE (license_number);

-- 3. Add a created_at timestamp
ALTER TABLE suppliers
ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

-- 4. Rename the column 'remarks' to 'notes'
ALTER TABLE suppliers
CHANGE COLUMN remarks notes TEXT;

-- 5. Drop the 'notes' column
ALTER TABLE suppliers
DROP COLUMN notes;

-- DML – Insert, Update, Delete
-- 6. Insert a new supplier
INSERT INTO suppliers (id, name, contact_person, phone, email, address, item_supplied, license_number, status)
VALUES (21, 'RapidAid Pvt Ltd', 'Rekha Menon', '9123457021', 'r.menon@rapidaid.in', '88 Help Lane, Pune', 'Stretchers', 'LIC-RA021', 'Pending');

-- 7. Update supplier status to 'Active' where item_supplied = 'Water Purifiers'
UPDATE suppliers
SET status = 'Active'
WHERE item_supplied = 'Water Purifiers';

-- 8. Delete supplier with id = 7
DELETE FROM suppliers
WHERE id = 7;

-- 9. Update contact person and phone for a specific supplier
UPDATE suppliers
SET contact_person = 'Ravindra Kumar', phone = '9123457099'
WHERE name = 'Global Foods Pvt Ltd';

-- 10. Replace all null remarks with 'No remarks provided'
UPDATE suppliers
SET remarks = 'No remarks provided'
WHERE remarks IS NULL;

-- DQL – SELECT with clauses, operators, aliases, functions
-- 11. List all active suppliers
SELECT * FROM suppliers WHERE status = 'Active';

-- 12. Get suppliers who are pending OR have remarks
SELECT * FROM suppliers
WHERE status = 'Pending' OR remarks IS NOT NULL;

-- 13. Get suppliers supplying 'Seeds', 'Saplings', or 'Tree Saplings'
SELECT * FROM suppliers
WHERE item_supplied IN ('Seeds', 'Saplings', 'Tree Saplings');

-- 14. Get suppliers whose name starts with 'S'
SELECT * FROM suppliers
WHERE name LIKE 'S%';

-- 15. List suppliers between ID 5 and 10
SELECT * FROM suppliers
WHERE id BETWEEN 5 AND 10;

-- 16. Count total suppliers
SELECT COUNT(*) AS total_suppliers FROM suppliers;

-- 17. Count suppliers grouped by status
SELECT status, COUNT(*) AS count_per_status
FROM suppliers
GROUP BY status;

-- 18. Show only statuses with more than 3 suppliers
SELECT status, COUNT(*) AS supplier_count
FROM suppliers
GROUP BY status
HAVING COUNT(*) > 3;

-- 19. List suppliers sorted by name in descending order
SELECT * FROM suppliers ORDER BY name DESC;

-- 20. List top 5 suppliers by ID
SELECT * FROM suppliers ORDER BY id LIMIT 5;

-- 21. Show contact details with aliases
SELECT name AS Supplier, contact_person AS Contact, phone AS PhoneNo
FROM suppliers;

-- 22. Show only distinct item_supplied
SELECT DISTINCT item_supplied FROM suppliers;

-- 23. Uppercase all supplier names
SELECT UPPER(name) AS upper_name FROM suppliers;

-- 24. Get length of each supplier name
SELECT name, LENGTH(name) AS name_length FROM suppliers;

-- 25. Concatenate supplier name and contact person
SELECT CONCAT(name, ' - ', contact_person) AS full_info FROM suppliers;

-- Joins & Subqueries
-- 26. Get suppliers who supply items funded by a department
SELECT s.name, s.item_supplied, f.department
FROM suppliers s
JOIN fund_allocations f ON s.item_supplied = f.purpose;

-- 27. Subquery: Get suppliers whose item is funded by 'Health Department'
SELECT name
FROM suppliers
WHERE item_supplied IN (
    SELECT purpose FROM fund_allocations WHERE department = 'Health Department'
);

-- 28. List suppliers with more than one entry in fund_allocations (correlated subquery)
SELECT name FROM suppliers s
WHERE (
    SELECT COUNT(*) FROM fund_allocations f
    WHERE f.purpose = s.item_supplied
) > 1;

-- 29. Get suppliers not linked to any fund allocation
SELECT * FROM suppliers
WHERE item_supplied NOT IN (
    SELECT DISTINCT purpose FROM fund_allocations
);

-- 30. Join with locations to show city with supplier name
SELECT s.name, l.city
FROM suppliers s
JOIN locations l ON s.address LIKE CONCAT('%', l.city, '%');

-- Functions, Nested Queries, Aggregate Filters
-- 31. Count of suppliers per item supplied
SELECT item_supplied, COUNT(*) AS total FROM suppliers
GROUP BY item_supplied;

-- 32. Get supplier(s) with the longest name
SELECT * FROM suppliers
WHERE LENGTH(name) = (
    SELECT MAX(LENGTH(name)) FROM suppliers
);

-- 33. Show suppliers with duplicate items supplied
SELECT item_supplied, COUNT(*) FROM suppliers
GROUP BY item_supplied
HAVING COUNT(*) > 1;

-- 34. Find supplier IDs that don’t have emails
SELECT id FROM suppliers WHERE email IS NULL OR email = '';

-- 35. Show the most common item_supplied
SELECT item_supplied FROM suppliers
GROUP BY item_supplied
ORDER BY COUNT(*) DESC
LIMIT 1;
-- Cascading FK actions
-- 36. Create 'supply_orders' referencing 'suppliers' with cascading
CREATE TABLE supply_orders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 37. Insert dummy order referencing supplier
INSERT INTO supply_orders (order_id, supplier_id, order_date, quantity)
VALUES (1, 3, '2025-07-01', 200);

-- 38. Delete a supplier with ID 3 and see order auto-delete due to ON DELETE CASCADE
DELETE FROM suppliers WHERE id = 3;

-- 39. Update supplier ID and see dependent table auto-update due to ON UPDATE CASCADE
UPDATE suppliers SET id = 30 WHERE id = 5;

-- 40. View all supply_orders after cascade actions
SELECT * FROM supply_orders;

-- 41. Suppliers with their latest order quantity
SELECT s.id, s.name, o.quantity
FROM suppliers s
JOIN supply_orders o ON s.id = o.supplier_id
WHERE o.order_date = (
  SELECT MAX(order_date)
  FROM supply_orders
  WHERE supplier_id = s.id
);

 -- 42. Suppliers who never received any orders
SELECT *
FROM suppliers s
LEFT JOIN supply_orders o ON s.id = o.supplier_id
WHERE o.order_id IS NULL;

-- 43. Top 3 suppliers by number of orders
SELECT s.id, s.name, COUNT(o.order_id) AS num_orders
FROM suppliers s
JOIN supply_orders o ON s.id = o.supplier_id
GROUP BY s.id, s.name
ORDER BY num_orders DESC
LIMIT 3;

-- 44. Running total of orders per supplier over time (window function)
SELECT
  o.supplier_id,
  o.order_date,
  o.quantity,
  SUM(o.quantity) OVER (
    PARTITION BY o.supplier_id
    ORDER BY o.order_date
    ROWS UNBOUNDED PRECEDING
  ) AS running_qty
FROM supply_orders o;

-- 45. Suppliers whose average order quantity exceeds overall average
SELECT supplier_id, AVG(quantity) AS avg_qty
FROM supply_orders
GROUP BY supplier_id
HAVING AVG(quantity) > (
  SELECT AVG(quantity) FROM supply_orders
);

-- 46. Number of distinct items each supplier has provided
SELECT s.id, s.name, COUNT(DISTINCT f.purpose) AS distinct_items
FROM suppliers s
JOIN fund_allocations f ON s.item_supplied = f.purpose
GROUP BY s.id, s.name;


-- 47. Suppliers sharing the same item supply (self-join)
SELECT DISTINCT s1.name AS supplier_a, s2.name AS supplier_b, s1.item_supplied
FROM suppliers s1
JOIN suppliers s2
  ON s1.item_supplied = s2.item_supplied
  AND s1.id < s2.id;


-- 48. Suppliers with orders in multiple distinct months
SELECT supplier_id
FROM supply_orders
GROUP BY supplier_id
HAVING COUNT(DISTINCT DATE_FORMAT(order_date,'%Y-%m')) > 1;

-- 49. Suppliers with highest and lowest order quantities per item (using UNION ALL)
SELECT s.id, s.name, o.quantity, 'MAX' AS type
FROM suppliers s
JOIN supply_orders o ON s.id = o.supplier_id
WHERE o.quantity = (
  SELECT MAX(quantity) FROM supply_orders WHERE supplier_id = s.id
)
UNION ALL
SELECT s.id, s.name, o.quantity, 'MIN' AS type
FROM suppliers s
JOIN supply_orders o ON s.id = o.supplier_id
WHERE o.quantity = (
  SELECT MIN(quantity) FROM supply_orders WHERE supplier_id = s.id
);

-- 50. Recursive CTE to count hierarchical referral chains (if applicable)
WITH RECURSIVE ref_chain AS (
  SELECT id, name, contact_person, referred_by
  FROM suppliers
  WHERE referred_by IS NOT NULL
  UNION ALL
  SELECT s.id, s.name, s.contact_person, s.referred_by
  FROM suppliers s
  JOIN ref_chain rc ON s.referred_by = rc.id
)
SELECT * FROM ref_chain;

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
    
    -- 1. Create the inventory_items table (already done, shown here for reference)
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

-- 2. Add a new column for tracking damaged quantity
ALTER TABLE inventory_items
ADD COLUMN damaged_quantity INT DEFAULT 0;

-- 3. Rename column "unit" to "measurement_unit"
ALTER TABLE inventory_items
CHANGE COLUMN unit measurement_unit VARCHAR(20);

-- 4. Add NOT NULL constraint to quantity
ALTER TABLE inventory_items
MODIFY COLUMN quantity INT NOT NULL;

-- 5. Drop the damaged_quantity column
ALTER TABLE inventory_items
DROP COLUMN damaged_quantity;

-- DML (Insert, Update, Delete)
-- 6. Insert a new hygiene item
INSERT INTO inventory_items (id, name, category, quantity, measurement_unit, supplier_id, purchase_date, expiry_date, status, location_id)
VALUES (21, 'Toothpaste Pack', 'Hygiene', 300, 'packs', 11, '2025-07-01', '2026-07-01', 'Available', 14);

-- 7. Update quantity of item with id=1
UPDATE inventory_items
SET quantity = quantity + 50
WHERE id = 1;

-- 8. Mark expired items as 'Expired'
UPDATE inventory_items
SET status = 'Expired'
WHERE expiry_date < CURRENT_DATE();

-- 9. Delete a record with zero quantity
DELETE FROM inventory_items
WHERE quantity = 0;

-- 10. Delete all 'Soap Pack' records with expiry in 2025
DELETE FROM inventory_items
WHERE name = 'Soap Pack' AND YEAR(expiry_date) = 2025;

-- 11. Insert multiple equipment items
INSERT INTO inventory_items (id, name, category, quantity, measurement_unit, supplier_id, purchase_date, expiry_date, status, location_id)
VALUES 
(22, 'Solar Lamp', 'Equipment', 15, 'units', 4, '2025-06-01', '2030-06-01', 'Available', 11),
(23, 'Portable Fan', 'Equipment', 25, 'units', 4, '2025-06-02', '2030-06-02', 'Available', 12);

-- 12. Set quantity = 0 where status = 'Expired'
UPDATE inventory_items
SET quantity = 0
WHERE status = 'Expired';

-- 13. Soft delete – change status to 'Removed'
UPDATE inventory_items
SET status = 'Removed'
WHERE id = 15;

-- 14. Increase quantity by 10% for all hygiene items
UPDATE inventory_items
SET quantity = quantity * 1.10
WHERE category = 'Hygiene';

-- 15. Insert item with minimum quantity allowed
INSERT INTO inventory_items (id, name, category, quantity, measurement_unit, supplier_id, purchase_date, expiry_date, status, location_id)
VALUES (24, 'Disinfectant Spray', 'Hygiene', 1, 'bottles', 11, '2025-06-25', '2026-06-25', 'Available', 10);

-- DQL (Select + Clauses, Operators, Functions, Aliases)
-- 16. Select all items with alias for better readability
SELECT id AS item_id, name AS item_name, quantity, status
FROM inventory_items;

-- 17. Get expired items using DATE functions
SELECT name, expiry_date
FROM inventory_items
WHERE expiry_date < CURRENT_DATE();

-- 18. Count of items per category
SELECT category, COUNT(*) AS total_items
FROM inventory_items
GROUP BY category;

-- 19. Total quantity available by location
SELECT location_id, SUM(quantity) AS total_quantity
FROM inventory_items
GROUP BY location_id
ORDER BY total_quantity DESC;

-- 20. Items expiring in next 30 days
SELECT name, DATEDIFF(expiry_date, CURDATE()) AS days_remaining
FROM inventory_items
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- 21. Average quantity per unit category
SELECT category, AVG(quantity) AS average_quantity
FROM inventory_items
GROUP BY category;

-- 22. Select distinct categories
SELECT DISTINCT category FROM inventory_items;

-- 23. Items with 'Water' in their name
SELECT * FROM inventory_items
WHERE name LIKE '%Water%';

-- 24. Items NOT from category 'Food'
SELECT * FROM inventory_items
WHERE category != 'Food';

-- 25. Use CASE to tag items as 'Low', 'Medium', or 'High' stock
SELECT name, quantity,
    CASE 
        WHEN quantity < 50 THEN 'Low'
        WHEN quantity BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'High'
    END AS stock_level
FROM inventory_items;

-- Joins and Subqueries
-- 26. Get item and supplier name
SELECT i.name AS item_name, s.name AS supplier_name
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 27. List items and their location names
SELECT i.name, l.name AS location_name
FROM inventory_items i
JOIN locations l ON i.location_id = l.id;

-- 28. Items supplied by 'Relief Supplies Inc.'
SELECT name
FROM inventory_items
WHERE supplier_id = (
    SELECT id FROM suppliers WHERE name = 'Relief Supplies Inc.'
);

-- 29. Locations storing more than 500 total quantity
SELECT location_id
FROM inventory_items
GROUP BY location_id
HAVING SUM(quantity) > 500;

-- 30. Find the latest purchased item
SELECT *
FROM inventory_items
ORDER BY purchase_date DESC
LIMIT 1;

-- 31. List equipment with quantity > average of all
SELECT *
FROM inventory_items
WHERE category = 'Equipment' AND quantity > (
    SELECT AVG(quantity) FROM inventory_items
);

-- 32. Find items stored at locations in 'Maharashtra'
SELECT i.*
FROM inventory_items i
JOIN locations l ON i.location_id = l.id
WHERE l.state = 'Maharashtra';

-- 33. Suppliers who have supplied more than 2 items
SELECT supplier_id, COUNT(*) AS total_items
FROM inventory_items
GROUP BY supplier_id
HAVING COUNT(*) > 2;

-- 34. Subquery with IN – Items from suppliers in 'Delhi'
SELECT name
FROM inventory_items
WHERE supplier_id IN (
    SELECT id FROM suppliers WHERE state = 'Delhi'
);

-- 35. Nested subquery – item with max quantity in each category
SELECT *
FROM inventory_items i
WHERE quantity = (
    SELECT MAX(quantity)
    FROM inventory_items
    WHERE category = i.category
);
-- ON DELETE / UPDATE CASCADE

-- 36. Add foreign key to supplier_id with ON DELETE CASCADE
ALTER TABLE inventory_items
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(id)
ON DELETE CASCADE;

-- 37. Add foreign key to location_id with ON UPDATE CASCADE
ALTER TABLE inventory_items
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id)
REFERENCES locations(id)
ON UPDATE CASCADE;

-- 38. Test: delete a supplier and check cascade delete
DELETE FROM suppliers
WHERE id = 1;

-- 39. Update a location id in locations table to see cascade
UPDATE locations
SET id = 99
WHERE id = 5;

-- 40. Remove a supplier and verify cascade on inventory_items
DELETE FROM suppliers
WHERE id = 2;

-- Advanced Queries (Views, Functions, CTEs, Aggregation)
-- 41. Create a view of hygiene items
CREATE VIEW hygiene_items AS
SELECT * FROM inventory_items WHERE category = 'Hygiene';

-- 42. Use the view
SELECT * FROM hygiene_items WHERE quantity > 100;

-- 43. CTE for average quantity per category
WITH avg_cte AS (
  SELECT category, AVG(quantity) AS avg_qty
  FROM inventory_items
  GROUP BY category
)
SELECT i.name, i.category, i.quantity, a.avg_qty
FROM inventory_items i
JOIN avg_cte a ON i.category = a.category;

-- 44. Create a stored function to get item age
DELIMITER //
CREATE FUNCTION get_item_age(p_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(CURDATE(), p_date);
END;
//
DELIMITER ;

-- 45. Use the function
SELECT name, get_item_age(purchase_date) AS days_since_purchase
FROM inventory_items;

-- 46. List expired items using custom logic
SELECT * FROM inventory_items
WHERE expiry_date < CURDATE();

-- 47. Items from a specific month (June 2025)
SELECT * FROM inventory_items
WHERE MONTH(purchase_date) = 6 AND YEAR(purchase_date) = 2025;

-- 48. Items expiring this year
SELECT * FROM inventory_items
WHERE YEAR(expiry_date) = YEAR(CURDATE());

-- 49. Category with maximum total quantity
SELECT category, SUM(quantity) AS total_qty
FROM inventory_items
GROUP BY category
ORDER BY total_qty DESC
LIMIT 1;

-- 50. Use CONCAT and alias for readable summary
SELECT CONCAT(name, ' (', category, ')') AS item_summary, quantity, status
FROM inventory_items;

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
    
    -- 1. Create the table with foreign keys and cascading options
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
    location_id INT,
    FOREIGN KEY (program_id) REFERENCES relief_programs(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Add a new column to track review status
ALTER TABLE beneficiary_applications ADD review_status VARCHAR(20) DEFAULT 'Not Reviewed';

-- 3. Modify the column to increase document reference length
ALTER TABLE beneficiary_applications MODIFY document_reference VARCHAR(150);

-- 4. Rename the column for better readability
ALTER TABLE beneficiary_applications RENAME COLUMN remarks TO officer_remarks;

-- 5. Drop the review_status column
ALTER TABLE beneficiary_applications DROP COLUMN review_status;

-- DML (Data Manipulation Language)
-- 6. Insert a new pending application
INSERT INTO beneficiary_applications VALUES
(21, 1021, 2, '2025-06-21', 'Pending', NULL, 321, '', 'DOC-BA021', 11);

-- 7. Update status to Approved and set approval date
UPDATE beneficiary_applications 
SET status = 'Approved', approved_date = CURDATE(), officer_remarks = 'Approved after review' 
WHERE id = 4;

-- 8. Reject all pending applications older than 15 days
UPDATE beneficiary_applications 
SET status = 'Rejected', approved_date = CURDATE(), officer_remarks = 'Auto-rejected'
WHERE status = 'Pending' AND DATEDIFF(CURDATE(), application_date) > 15;

-- 9. Delete all rejected applications with NULL remarks
DELETE FROM beneficiary_applications 
WHERE status = 'Rejected' AND officer_remarks = '';

-- 10. Set officer to NULL if not yet assigned
UPDATE beneficiary_applications SET officer_id = NULL WHERE officer_id = 0;

-- 11. Insert multiple applications using subquery for citizens from location 7
INSERT INTO beneficiary_applications (id, citizen_id, program_id, application_date, status, approved_date, officer_id, officer_remarks, document_reference, location_id)
SELECT 22 + ROW_NUMBER() OVER(), citizen_id, 1, CURDATE(), 'Pending', NULL, 301, '', CONCAT('DOC-NEW-', citizen_id), 7
FROM (SELECT 1000 + seq AS citizen_id FROM seq_1_to_2) AS tmp;

-- 12. Delete all applications from a removed program
DELETE FROM beneficiary_applications 
WHERE program_id NOT IN (SELECT id FROM relief_programs);

-- 13. Set a default officer_remarks if NULL
UPDATE beneficiary_applications 
SET officer_remarks = 'No remarks provided'
WHERE officer_remarks IS NULL;

-- 14. Mark pending apps as stale after 30 days
UPDATE beneficiary_applications 
SET status = 'Stale'
WHERE status = 'Pending' AND DATEDIFF(CURDATE(), application_date) > 30;

-- 15. Reassign applications to new officer due to transfer
UPDATE beneficiary_applications 
SET officer_id = 999
WHERE officer_id IN (304, 306, 308);

-- DQL (Data Query Language) with Clauses, Operators, Aliases, Functions
-- 16. Get all approved applications
SELECT * FROM beneficiary_applications WHERE status = 'Approved';

-- 17. Find pending applications older than 7 days
SELECT * FROM beneficiary_applications 
WHERE status = 'Pending' AND DATEDIFF(CURDATE(), application_date) > 7;

-- 18. Count applications per status
SELECT status, COUNT(*) AS total FROM beneficiary_applications GROUP BY status;

-- 19. Average processing time for approved applications
SELECT AVG(DATEDIFF(approved_date, application_date)) AS avg_processing_days 
FROM beneficiary_applications WHERE status = 'Approved';

-- 20. List applications handled by officer 305
SELECT id, citizen_id, officer_remarks FROM beneficiary_applications WHERE officer_id = 305;

-- 21. Use LIKE operator for document reference pattern
SELECT * FROM beneficiary_applications WHERE document_reference LIKE 'DOC-BA0%';

-- 22. Use IN clause to get selective status
SELECT * FROM beneficiary_applications WHERE status IN ('Pending', 'Rejected');

-- 23. Get applications with missing approval date
SELECT * FROM beneficiary_applications WHERE approved_date IS NULL;

-- 24. Show latest 5 applications
SELECT * FROM beneficiary_applications ORDER BY application_date DESC LIMIT 5;

-- 25. Alias usage for readable output
SELECT id AS AppID, citizen_id AS Citizen, status AS Status FROM beneficiary_applications;

-- 26. Show officer wise count of applications
SELECT officer_id, COUNT(*) AS total_apps 
FROM beneficiary_applications GROUP BY officer_id;

-- 27. Applications by location with more than 2 entries
SELECT location_id, COUNT(*) AS apps 
FROM beneficiary_applications 
GROUP BY location_id HAVING COUNT(*) > 2;

-- 28. Get application duration in days using DATE functions
SELECT id, DATEDIFF(IFNULL(approved_date, CURDATE()), application_date) AS days_taken 
FROM beneficiary_applications;

-- 29. Extract month from application_date
SELECT id, MONTH(application_date) AS app_month FROM beneficiary_applications;

-- 30. Find top 3 locations by application volume
SELECT location_id, COUNT(*) AS total FROM beneficiary_applications 
GROUP BY location_id ORDER BY total DESC LIMIT 3;

-- Joins & Subqueries
-- 31. Join with relief_programs to get program name
SELECT b.id, r.program_name, b.status 
FROM beneficiary_applications b
JOIN relief_programs r ON b.program_id = r.id;

-- 32. Join with government_officers to get officer details
SELECT b.id, g.name AS officer_name, b.status
FROM beneficiary_applications b
JOIN government_officers g ON b.officer_id = g.id;

-- 33. Applications from top 3 most assigned officers
SELECT * FROM beneficiary_applications 
WHERE officer_id IN (
    SELECT officer_id FROM (
        SELECT officer_id FROM beneficiary_applications 
        GROUP BY officer_id ORDER BY COUNT(*) DESC LIMIT 3
    ) AS top_officers
);

-- 34. Join with locations to get region
SELECT b.id, l.region_name, b.status 
FROM beneficiary_applications b
JOIN locations l ON b.location_id = l.id;

-- 35. Get program-wise application count using subquery
SELECT id, (SELECT COUNT(*) FROM beneficiary_applications b WHERE b.program_id = p.id) AS app_count
FROM relief_programs p;

-- 36. List applications where officer and location are both NULL (if possible)
SELECT * FROM beneficiary_applications 
WHERE officer_id IS NULL AND location_id IS NULL;

-- 37. Join and filter approved apps handled by officers from specific region
SELECT b.id, g.name, l.region_name
FROM beneficiary_applications b
JOIN government_officers g ON b.officer_id = g.id
JOIN locations l ON b.location_id = l.id
WHERE b.status = 'Approved';

-- 38. List applications for programs that offer more than 1 crore in aid
SELECT b.*
FROM beneficiary_applications b
JOIN relief_programs p ON b.program_id = p.id
WHERE p.max_aid_amount > 1000000;

-- 39. Count of rejected apps per program
SELECT program_id, COUNT(*) AS rejected_apps
FROM beneficiary_applications 
WHERE status = 'Rejected'
GROUP BY program_id;

-- 40. Applications handled by the same officer who approved another application
SELECT * FROM beneficiary_applications b1
WHERE officer_id IN (
    SELECT officer_id FROM beneficiary_applications WHERE status = 'Approved'
);
--  41–50. Advanced & Cascades
-- 41. Enable foreign keys with ON DELETE CASCADE
ALTER TABLE beneficiary_applications 
ADD CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES relief_programs(id) ON DELETE CASCADE;

-- 42. Check cascading delete on program
DELETE FROM relief_programs WHERE id = 1;

-- 43. Update location ID with cascade
UPDATE locations SET id = 99 WHERE id = 7;

-- 44. Use CASE to show readable status
SELECT id, 
  CASE 
    WHEN status = 'Pending' THEN '🟡 Awaiting Review'
    WHEN status = 'Approved' THEN '🟢 Approved'
    WHEN status = 'Rejected' THEN '🔴 Rejected'
    ELSE '⚪ Unknown'
  END AS status_label
FROM beneficiary_applications;

-- 45. JSON format using CONCAT
SELECT id, 
  CONCAT('{\"citizen\": ', citizen_id, ', \"status\": \"', status, '\"}') AS json_output
FROM beneficiary_applications;

-- 46. Get officer who approved most applications
SELECT officer_id FROM beneficiary_applications
WHERE status = 'Approved'
GROUP BY officer_id
ORDER BY COUNT(*) DESC LIMIT 1;

-- 47. Application approval rate per location
SELECT location_id, 
       ROUND(SUM(CASE WHEN status = 'Approved' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM beneficiary_applications
GROUP BY location_id;

-- 48. Application ID and length of remarks
SELECT id, LENGTH(officer_remarks) AS remark_length FROM beneficiary_applications;

-- 49. Pending applications count by officer
SELECT officer_id, COUNT(*) AS pending_apps
FROM beneficiary_applications
WHERE status = 'Pending'
GROUP BY officer_id;

-- 50. Find duplicate citizen applications
SELECT citizen_id, COUNT(*) AS count
FROM beneficiary_applications
GROUP BY citizen_id
HAVING COUNT(*) > 1;

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

-- 1. Create table with constraints (already done, just annotated)
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

-- 2. Add a NOT NULL constraint on status
ALTER TABLE application_status_logs
MODIFY status VARCHAR(20) NOT NULL;

-- 3. Add a foreign key to officer_id with cascading delete
ALTER TABLE application_status_logs
ADD CONSTRAINT fk_officer
FOREIGN KEY (officer_id)
REFERENCES government_officers(id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 4. Add a foreign key to application_id with cascading delete
ALTER TABLE application_status_logs
ADD CONSTRAINT fk_application
FOREIGN KEY (application_id)
REFERENCES beneficiary_applications(id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 5. Add a new column to track status change type
ALTER TABLE application_status_logs
ADD COLUMN change_type VARCHAR(30);

-- DML Queries (Insert, Update, Delete)
-- 6. Insert a new status log
INSERT INTO application_status_logs 
(id, application_id, status, update_date, updated_by, remarks, document_reference, officer_id, location_id, program_id)
VALUES (21, 21, 'Submitted', '2025-07-01', 321, 'Auto-submission', 'DOC-L021', 321, 1, 1);

-- 7. Update status to "Under Review" for application_id = 1
UPDATE application_status_logs
SET status = 'Under Review', update_date = CURDATE()
WHERE application_id = 1;

-- 8. Mark empty remarks as 'No remarks provided'
UPDATE application_status_logs
SET remarks = 'No remarks provided'
WHERE remarks = '';

-- 9. Delete records with status 'Rejected' before a specific date
DELETE FROM application_status_logs
WHERE status = 'Rejected' AND update_date < '2025-06-10';

-- 10. Insert multiple records in a single query
INSERT INTO application_status_logs (id, application_id, status, update_date, updated_by, remarks, document_reference, officer_id, location_id, program_id)
VALUES 
(22, 22, 'Submitted', '2025-07-02', 322, '', 'DOC-L022', 322, 2, 2),
(23, 23, 'Approved', '2025-07-03', 323, 'Processed quickly', 'DOC-L023', 323, 3, 3);

-- 11. Use mathematical expression in update
UPDATE application_status_logs
SET updated_by = updated_by + 10
WHERE program_id = 5;

-- 12. Restore status back to 'Submitted' if wrongly updated
UPDATE application_status_logs
SET status = 'Submitted'
WHERE application_id IN (4, 6, 16);

-- 13. Delete logs for specific officer
DELETE FROM application_status_logs
WHERE officer_id = 318;

-- 14. Change update_date format using string function (for presentation)
SELECT id, DATE_FORMAT(update_date, '%d-%m-%Y') AS formatted_date
FROM application_status_logs;

-- 15. Nullify remarks for 'Approved' status (simulate data cleanup)
UPDATE application_status_logs
SET remarks = NULL
WHERE status = 'Approved';

-- DQL Queries with Clauses, Aliases, Operators, Functions
-- 16. Select all approved applications with alias
SELECT application_id AS AppID, status AS Status, update_date AS UpdatedOn
FROM application_status_logs
WHERE status = 'Approved';

-- 17. Get logs where status starts with 'S'
SELECT * FROM application_status_logs
WHERE status LIKE 'S%';

-- 18. Count logs per status
SELECT status, COUNT(*) AS status_count
FROM application_status_logs
GROUP BY status;

-- 19. Fetch logs with remarks not null
SELECT * FROM application_status_logs
WHERE remarks IS NOT NULL;

-- 20. Get the latest update date
SELECT MAX(update_date) AS LatestUpdate
FROM application_status_logs;

-- 21. Get status-wise average officer_id
SELECT status, AVG(officer_id) AS avg_officer
FROM application_status_logs
GROUP BY status;

-- 22. Get logs between two dates
SELECT * FROM application_status_logs
WHERE update_date BETWEEN '2025-06-05' AND '2025-06-15';

-- 23. Order logs by date descending
SELECT * FROM application_status_logs
ORDER BY update_date DESC;

-- 24. Count logs for each location
SELECT location_id, COUNT(*) AS log_count
FROM application_status_logs
GROUP BY location_id
HAVING log_count > 1;

-- 25. List logs with multiple conditions
SELECT * FROM application_status_logs
WHERE status = 'Submitted' AND remarks != '' AND location_id IN (1, 2, 3);

-- 26. Extract year from update date
SELECT id, YEAR(update_date) AS update_year
FROM application_status_logs;

-- 27. Get top 5 most recent logs
SELECT * FROM application_status_logs
ORDER BY update_date DESC
LIMIT 5;

-- 28. List distinct statuses
SELECT DISTINCT status FROM application_status_logs;

-- 29. Concatenate status and remarks
SELECT id, CONCAT(status, ' - ', remarks) AS status_detail
FROM application_status_logs;

-- 30. Replace blank remarks with 'Pending'
SELECT id, COALESCE(NULLIF(remarks, ''), 'Pending') AS safe_remarks
FROM application_status_logs;

-- Joins and Subqueries
-- 31. Join with government_officers to get officer name
SELECT asl.id, go.name AS officer_name, asl.status
FROM application_status_logs asl
JOIN government_officers go ON asl.officer_id = go.id;

-- 32. Join with beneficiary_applications for application details
SELECT asl.id, ba.applicant_name, asl.status, asl.update_date
FROM application_status_logs asl
JOIN beneficiary_applications ba ON asl.application_id = ba.id;

-- 33. Subquery: get logs for applications having latest date
SELECT * FROM application_status_logs
WHERE update_date = (SELECT MAX(update_date) FROM application_status_logs);

-- 34. Subquery: get all logs of applications that were rejected
SELECT * FROM application_status_logs
WHERE application_id IN (
    SELECT application_id FROM application_status_logs WHERE status = 'Rejected'
);

-- 35. Get officer with maximum number of updates
SELECT officer_id, COUNT(*) AS updates_count
FROM application_status_logs
GROUP BY officer_id
ORDER BY updates_count DESC
LIMIT 1;

-- 36. Join with locations table
SELECT asl.id, l.region_name, asl.status
FROM application_status_logs asl
JOIN locations l ON asl.location_id = l.id;

-- 37. Find logs for programs that have more than 2 entries
SELECT program_id
FROM application_status_logs
GROUP BY program_id
HAVING COUNT(*) > 2;

-- 38. Nested subquery to get names of locations for rejected logs
SELECT l.name
FROM locations l
WHERE l.id IN (
    SELECT location_id FROM application_status_logs WHERE status = 'Rejected'
);

-- 39. Logs by officers who handled more than 1 program
SELECT * FROM application_status_logs
WHERE officer_id IN (
    SELECT officer_id
    FROM application_status_logs
    GROUP BY officer_id
    HAVING COUNT(DISTINCT program_id) > 1
);

-- 40. Logs for most active location
SELECT * FROM application_status_logs
WHERE location_id = (
    SELECT location_id
    FROM application_status_logs
    GROUP BY location_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Advanced Logic, CASE, Functions, Cascades
-- 41. Use CASE to label status
SELECT id, 
       status,
       CASE 
           WHEN status = 'Submitted' THEN 'Pending'
           WHEN status = 'Approved' THEN 'Successful'
           WHEN status = 'Rejected' THEN 'Unsuccessful'
           ELSE 'Unknown'
       END AS status_type
FROM application_status_logs;

-- 42. Create index for faster retrieval
CREATE INDEX idx_status_date ON application_status_logs(status, update_date);

-- 43. Find logs where document ID pattern ends with even number
SELECT * FROM application_status_logs
WHERE RIGHT(document_reference, 1) IN ('0','2','4','6','8');

-- 44. Logs updated by officer whose ID is highest
SELECT * FROM application_status_logs
WHERE updated_by = (SELECT MAX(updated_by) FROM application_status_logs);

-- 45. Group logs by program and get average update_by ID
SELECT program_id, ROUND(AVG(updated_by), 2) AS avg_updated_by
FROM application_status_logs
GROUP BY program_id;

-- 46. Create a view of active submissions
CREATE VIEW view_submitted_logs AS
SELECT * FROM application_status_logs
WHERE status = 'Submitted';

-- 47. Use EXISTS to filter logs
SELECT * FROM application_status_logs asl
WHERE EXISTS (
    SELECT 1 FROM government_officers go WHERE go.id = asl.officer_id
);

-- 48. Logs with long remarks only
SELECT * FROM application_status_logs
WHERE LENGTH(remarks) > 20;

-- 49. Delete logs with NULL or empty document_reference
DELETE FROM application_status_logs
WHERE document_reference IS NULL OR document_reference = '';

-- 50. Use CONCAT_WS to cleanly merge info
SELECT id, CONCAT_WS(' | ', application_id, status, document_reference) AS log_summary
FROM application_status_logs;

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

-- 1. Create table with foreign key constraints and cascading options
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
    officer_id INT,
    CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES disaster_events(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_officer FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 2. Alter table to add new column for report type
ALTER TABLE incident_reports ADD report_type VARCHAR(50);

-- 3. Drop column if not required
ALTER TABLE incident_reports DROP COLUMN report_type;

-- 4. Rename a column
ALTER TABLE incident_reports RENAME COLUMN status TO report_status;

-- 5. Add NOT NULL constraint to reporter_name
ALTER TABLE incident_reports MODIFY reporter_name VARCHAR(100) NOT NULL;

-- DML (Data Manipulation Language)
-- 6. Insert a new incident report
INSERT INTO incident_reports (id, event_id, reporter_name, report_date, description, location_id, severity_level, document_reference, report_status, officer_id)
VALUES (21, 20, 'Ravi Mehra', '2025-06-22', 'Bridge damaged by flood', 10, 'High', 'DOC-I021', 'Open', 321);

-- 7. Update severity level of a report
UPDATE incident_reports SET severity_level = 'Critical' WHERE id = 1;

-- 8. Delete an incident report
DELETE FROM incident_reports WHERE id = 21;

-- 9. Bulk update reports marked 'Investigating' to 'Under Review'
UPDATE incident_reports SET report_status = 'Under Review' WHERE report_status = 'Investigating';

-- 10. Change officer for a specific location’s reports
UPDATE incident_reports SET officer_id = 999 WHERE location_id = 9;

-- 11. Insert multiple new rows
INSERT INTO incident_reports (id, event_id, reporter_name, report_date, description, location_id, severity_level, document_reference, report_status, officer_id)
VALUES 
(22, 21, 'Rajiv Sharma', '2025-06-22', 'School roof leak', 11, 'Medium', 'DOC-I022', 'Open', 322),
(23, 22, 'Leena Das', '2025-06-23', 'Street lights damaged', 12, 'Low', 'DOC-I023', 'Resolved', 323);

-- 12. Delete reports older than a certain date
DELETE FROM incident_reports WHERE report_date < '2025-06-05';

-- 13. Update report status based on severity
UPDATE incident_reports SET report_status = 'Critical' WHERE severity_level = 'High';

-- 14. Reassign all 'Open' reports to officer 333
UPDATE incident_reports SET officer_id = 333 WHERE report_status = 'Open';

-- 15. Revert severity from 'Critical' to 'High'
UPDATE incident_reports SET severity_level = 'High' WHERE severity_level = 'Critical';

-- DQL (Data Query Language) with Clauses, Functions, Aliases, Operators
-- 16. Get all reports marked as 'Open'
SELECT * FROM incident_reports WHERE report_status = 'Open';

-- 17. Fetch reports filed in June 2025
SELECT * FROM incident_reports WHERE MONTH(report_date) = 6 AND YEAR(report_date) = 2025;

-- 18. Count total reports per severity level
SELECT severity_level, COUNT(*) AS total_reports FROM incident_reports GROUP BY severity_level;

-- 19. Find the earliest and latest report date
SELECT MIN(report_date) AS first_report, MAX(report_date) AS last_report FROM incident_reports;

-- 20. Reports grouped by location and severity
SELECT location_id, severity_level, COUNT(*) AS count FROM incident_reports GROUP BY location_id, severity_level;

-- 21. Reports containing the word 'damaged'
SELECT * FROM incident_reports WHERE description LIKE '%damaged%';

-- 22. List of distinct officers handling reports
SELECT DISTINCT officer_id FROM incident_reports;

-- 23. Find reports not assigned to officer 310
SELECT * FROM incident_reports WHERE officer_id <> 310;

-- 24. Use alias and case to label reports
SELECT id AS ReportID, 
       reporter_name AS Reporter, 
       CASE 
           WHEN severity_level = 'High' THEN '⚠️ High Risk'
           WHEN severity_level = 'Medium' THEN 'Moderate'
           ELSE 'Low Risk'
       END AS Severity_Label 
FROM incident_reports;

-- 25. Reports ordered by severity and date
SELECT * FROM incident_reports ORDER BY severity_level DESC, report_date ASC;

-- 26. Total reports per day
SELECT report_date, COUNT(*) AS total FROM incident_reports GROUP BY report_date;

-- 27. Count of ‘Resolved’ reports by officer
SELECT officer_id, COUNT(*) AS resolved_count FROM incident_reports WHERE report_status = 'Resolved' GROUP BY officer_id;

-- 28. Latest report filed per officer
SELECT officer_id, MAX(report_date) AS latest_report FROM incident_reports GROUP BY officer_id;

-- 29. Reports filed in second week of June
SELECT * FROM incident_reports WHERE report_date BETWEEN '2025-06-08' AND '2025-06-14';

-- 30. Reports with severity ‘Medium’ or ‘High’ not yet resolved
SELECT * FROM incident_reports 
WHERE severity_level IN ('Medium', 'High') AND report_status NOT IN ('Resolved', 'Closed');

-- Joins and Subqueries
-- 31. Join with locations to get full location names
SELECT ir.id, ir.reporter_name, l.name AS location_name, ir.severity_level
FROM incident_reports ir
JOIN locations l ON ir.location_id = l.id;

-- 32. Join with government officers to get designation
SELECT ir.id, ir.description, go.name AS officer_name, go.designation
FROM incident_reports ir
JOIN government_officers go ON ir.officer_id = go.id;

-- 33. Join with disaster_events to fetch event type
SELECT ir.id, ir.description, de.event_type
FROM incident_reports ir
JOIN disaster_events de ON ir.event_id = de.id;

-- 34. Subquery to get reports from locations with > 2 reports
SELECT * FROM incident_reports
WHERE location_id IN (
    SELECT location_id FROM incident_reports GROUP BY location_id HAVING COUNT(*) > 2
);

-- 35. Subquery to get latest report for each location
SELECT * FROM incident_reports ir
WHERE report_date = (
    SELECT MAX(report_date) FROM incident_reports WHERE location_id = ir.location_id
);

-- 36. Nested subquery: Get officers with more than 3 reports
SELECT * FROM government_officers
WHERE id IN (
    SELECT officer_id FROM incident_reports GROUP BY officer_id HAVING COUNT(*) > 3
);

-- 37. List incidents that happened after the disaster event
SELECT ir.* FROM incident_reports ir
JOIN disaster_events de ON ir.event_id = de.id
WHERE ir.report_date > de.event_date;

-- 38. Officers handling both ‘High’ and ‘Low’ severity incidents
SELECT officer_id FROM incident_reports
WHERE severity_level IN ('High', 'Low')
GROUP BY officer_id
HAVING COUNT(DISTINCT severity_level) = 2;

-- 39. Average reports per officer
SELECT officer_id, COUNT(*) / COUNT(DISTINCT report_date) AS avg_per_day 
FROM incident_reports GROUP BY officer_id;

-- 40. List locations with no recent reports (after 2025-06-15)
SELECT * FROM locations
WHERE id NOT IN (
    SELECT location_id FROM incident_reports WHERE report_date > '2025-06-15'
);

-- Advanced Filtering, Window Functions, Views, CTEs
-- 41. Use a view to simplify open incident tracking
CREATE VIEW open_incident_summary AS
SELECT location_id, COUNT(*) AS open_reports
FROM incident_reports
WHERE report_status = 'Open'
GROUP BY location_id;

-- 42. Use the above view
SELECT * FROM open_incident_summary WHERE open_reports > 1;

-- 43. Create a CTE to show rank of incidents per officer by date
WITH ranked_reports AS (
    SELECT id, officer_id, report_date,
           RANK() OVER (PARTITION BY officer_id ORDER BY report_date) AS report_rank
    FROM incident_reports
)
SELECT * FROM ranked_reports WHERE report_rank = 1;

-- 44. CTE to get report counts per severity per location
WITH severity_summary AS (
    SELECT location_id, severity_level, COUNT(*) AS total
    FROM incident_reports
    GROUP BY location_id, severity_level
)
SELECT * FROM severity_summary WHERE total > 1;

-- 45. Find duplicate reports by same reporter on same date
SELECT reporter_name, report_date, COUNT(*) 
FROM incident_reports 
GROUP BY reporter_name, report_date 
HAVING COUNT(*) > 1;

-- 46. Use COALESCE to handle null officer assignment
SELECT id, COALESCE(officer_id, 'Unassigned') AS officer_info FROM incident_reports;

-- 47. Concatenate fields for readable report title
SELECT CONCAT('Report #', id, ': ', description) AS report_summary FROM incident_reports;

-- 48. Length of each report description
SELECT id, LENGTH(description) AS description_length FROM incident_reports;

-- 49. Number of reports per weekday
SELECT DAYNAME(report_date) AS weekday, COUNT(*) AS total_reports
FROM incident_reports
GROUP BY DAYNAME(report_date);

-- 50. Detect report delays (>5 days after disaster)
SELECT ir.* FROM incident_reports ir
JOIN disaster_events de ON ir.event_id = de.id
WHERE DATEDIFF(ir.report_date, de.event_date) > 5;

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

-- 1. Add a new column for NGO's founding year
ALTER TABLE ngo_partners ADD founding_year INT;

-- 2. Modify 'status' to allow only specific values
ALTER TABLE ngo_partners
MODIFY status ENUM('Active', 'Pending', 'Inactive');

-- 3. Add UNIQUE constraint to registration_number
ALTER TABLE ngo_partners
ADD CONSTRAINT unique_registration UNIQUE (registration_number);

-- 4. Add a FOREIGN KEY reference to a new table `relief_projects`
CREATE TABLE relief_projects (
  id INT PRIMARY KEY,
  ngo_id INT,
  project_name VARCHAR(100),
  FOREIGN KEY (ngo_id) REFERENCES ngo_partners(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;


-- 5. Drop the remarks column
ALTER TABLE ngo_partners DROP COLUMN remarks;

-- DML (Insert, Update, Delete)
-- 6. Update NGO status to 'Inactive' for those whose registration_number starts with 'REG-CC'
UPDATE ngo_partners
SET status = 'Inactive'
WHERE registration_number LIKE 'REG-CC%';

-- 7. Delete NGOs from Kolhapur whose status is 'Pending'
DELETE FROM ngo_partners
WHERE address = 'Kolhapur' AND status = 'Pending';

-- 8. Add a new NGO partner
INSERT INTO ngo_partners (id, name, registration_number, contact_person, phone, email, address, area_of_work, status)
VALUES (21, 'Vision Aid', 'REG-VA021', 'Ashok Mehta', '9123458021', 'a.mehta@visionaid.org', 'Mumbai', 'Vision', 'Pending');

-- 9. Bulk update: Change status from 'Pending' to 'Active' for NGOs in Pune
UPDATE ngo_partners
SET status = 'Active'
WHERE status = 'Pending' AND address = 'Pune';

-- 10. Replace name for NGO with id = 5
UPDATE ngo_partners
SET name = 'Relief Tools Cooperative'
WHERE id = 5;

-- 11. Delete inactive NGOs
DELETE FROM ngo_partners WHERE status = 'Inactive';

-- 12. Insert a duplicate to test unique constraint violation (will fail)
-- INSERT INTO ngo_partners (id, name, registration_number, contact_person, phone, email, address, area_of_work, status)
-- VALUES (22, 'Fake NGO', 'REG-HH001', 'Fake Person', '9000000000', 'fake@ngo.org', 'FakeCity', 'Fraud', 'Active');

-- 13. Change all phone numbers starting with '91234580' to '+91-' prefix
UPDATE ngo_partners
SET phone = CONCAT('+91-', RIGHT(phone, 4))
WHERE phone LIKE '91234580%';

-- 14. Set founding year = 2015 for all NGOs registered before REG-RT005
UPDATE ngo_partners
SET founding_year = 2015
WHERE registration_number < 'REG-RT005';

-- 15. Insert another sample NGO
INSERT INTO ngo_partners (id, name, registration_number, contact_person, phone, email, address, area_of_work, status)
VALUES (23, 'EduReach Foundation', 'REG-EDU023', 'Aarti Jain', '9123458023', 'a.jain@edureach.org', 'Mumbai', 'Education', 'Active');

-- DQL (Select with Clauses, Functions, Aliases, Operators)
-- 16. Get all NGOs working in the 'Environment' area
SELECT * FROM ngo_partners WHERE area_of_work = 'Environment';

-- 17. Count NGOs per city
SELECT address AS city, COUNT(*) AS ngo_count
FROM ngo_partners
GROUP BY address
ORDER BY ngo_count DESC;

-- 18. Get contact info for NGOs whose name starts with 'S'
SELECT name, phone, email FROM ngo_partners
WHERE name LIKE 'S%';

-- 19. Get NGOs with long contact_person names
SELECT * FROM ngo_partners
WHERE LENGTH(contact_person) > 12;

-- 20. Select distinct area_of_work values
SELECT DISTINCT area_of_work FROM ngo_partners;

-- 21. Get NGOs with missing email
SELECT * FROM ngo_partners WHERE email IS NULL;

-- 22. NGOs where status is not 'Active'
SELECT * FROM ngo_partners WHERE status != 'Active';

-- 23. NGOs located in 'Pune' or 'Mumbai'
SELECT * FROM ngo_partners WHERE address IN ('Pune', 'Mumbai');

-- 24. NGOs with name containing 'Aid'
SELECT * FROM ngo_partners WHERE name LIKE '%Aid%';

-- 25. Top 5 NGOs ordered by name
SELECT * FROM ngo_partners ORDER BY name ASC LIMIT 5;

-- 26. Get NGO name and contact person as alias
SELECT name AS NGO_Name, contact_person AS Contact FROM ngo_partners;

-- 27. Concatenate name and email
SELECT CONCAT(name, ' <', email, '>') AS contact_info FROM ngo_partners;

-- 28. NGOs registered between REG-GE002 and REG-PW011
SELECT * FROM ngo_partners
WHERE registration_number BETWEEN 'REG-GE002' AND 'REG-PW011';

-- 29. NGOs with NULL or empty remarks
SELECT * FROM ngo_partners
WHERE remarks IS NULL OR remarks = '';

-- 30. Count NGOs by area of work (having more than 1 NGO)
SELECT area_of_work, COUNT(*) AS total
FROM ngo_partners
GROUP BY area_of_work
HAVING COUNT(*) > 1;

-- Joins & Subqueries
-- 31. INNER JOIN with a sample `relief_projects` table
SELECT n.name, p.project_name
FROM ngo_partners n
JOIN relief_projects p ON n.id = p.ngo_id;

-- 32. LEFT JOIN to show NGOs even without projects
SELECT n.name, p.project_name
FROM ngo_partners n
LEFT JOIN relief_projects p ON n.id = p.ngo_id;

-- 33. Get NGOs that have at least 1 project
SELECT * FROM ngo_partners
WHERE id IN (SELECT ngo_id FROM relief_projects);

-- 34. Find NGOs without any projects
SELECT * FROM ngo_partners
WHERE id NOT IN (SELECT ngo_id FROM relief_projects);

-- 35. Count number of projects per NGO
SELECT n.name, COUNT(p.id) AS total_projects
FROM ngo_partners n
LEFT JOIN relief_projects p ON n.id = p.ngo_id
GROUP BY n.name;

-- 36. NGOs working in the same area as 'Green Earth NGO'
SELECT * FROM ngo_partners
WHERE area_of_work = (
    SELECT area_of_work FROM ngo_partners
    WHERE name = 'Green Earth NGO'
);

-- 37. Subquery to get NGOs with more than 1 entry per city
SELECT * FROM ngo_partners
WHERE address IN (
    SELECT address FROM ngo_partners
    GROUP BY address
    HAVING COUNT(*) > 1
);

-- 38. Use EXISTS to find NGOs from Pune with status 'Active'
SELECT * FROM ngo_partners n
WHERE EXISTS (
    SELECT 1 FROM ngo_partners p
    WHERE p.address = 'Pune' AND p.status = 'Active' AND p.id = n.id
);

-- 39. Get top city by NGO count
SELECT address FROM ngo_partners
GROUP BY address
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 40. Get NGO details with max id
SELECT * FROM ngo_partners
WHERE id = (SELECT MAX(id) FROM ngo_partners);

-- Miscellaneous & Cascade Examples
-- 41. Create backup of table
CREATE TABLE ngo_partners_backup AS SELECT * FROM ngo_partners;

-- 42. Rename the table for migration
RENAME TABLE ngo_partners_backup TO archived_ngos;

-- 43. Add new foreign key table `ngo_audit_logs`
CREATE TABLE ngo_audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    ngo_id INT,
    action VARCHAR(100),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ngo_id) REFERENCES ngo_partners(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- 44. Add a default value to status column
ALTER TABLE ngo_partners ALTER status SET DEFAULT 'Pending';

-- 45. Select NGOs sorted by length of contact person name
SELECT * FROM ngo_partners
ORDER BY LENGTH(contact_person) DESC;

-- 46. NGOs that don’t work in ‘Health’ or ‘Water’
SELECT * FROM ngo_partners
WHERE area_of_work NOT IN ('Health', 'Water');

-- 47. Group NGOs and filter with HAVING clause
SELECT area_of_work, COUNT(*) as total_ngos
FROM ngo_partners
GROUP BY area_of_work
HAVING total_ngos >= 2;

-- 48. Use CASE to label NGOs based on area
SELECT name,
       CASE
           WHEN area_of_work = 'Health' THEN 'Medical'
           WHEN area_of_work = 'Water' THEN 'Utility'
           ELSE 'Other'
       END AS category
FROM ngo_partners;

-- 49. Update multiple NGOs using CASE
UPDATE ngo_partners
SET status = CASE
    WHEN status = 'Pending' THEN 'Inactive'
    WHEN status = 'Active' THEN 'Verified'
    ELSE status
END;

-- 50. Create a VIEW for active NGOs
CREATE VIEW active_ngos AS
SELECT * FROM ngo_partners WHERE status = 'Active';


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

-- 1. Create table with foreign keys and CASCADEs
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
    document_reference VARCHAR(100),
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Add a new column for urgency level
ALTER TABLE public_feedback ADD COLUMN urgency_level VARCHAR(20);

-- 3. Modify message column length
ALTER TABLE public_feedback
CHANGE COLUMN message message VARCHAR(500);

-- 4. Drop remarks column if no longer needed
ALTER TABLE public_feedback
DROP COLUMN remarks;

-- 5. Rename column feedback_type to category
ALTER TABLE public_feedback RENAME COLUMN feedback_type TO category;

-- DML (Insert, Update, Delete)
-- 6. Insert a new feedback record
INSERT INTO public_feedback (id, citizen_id, feedback_date, category, message, location_id, officer_id, status, document_reference)
VALUES (21, 1021, CURRENT_DATE, 'Suggestion', 'Install solar panels', 13, 321, 'Open', 'DOC-F021');

-- 7. Update feedback status
UPDATE public_feedback
SET status = 'Closed'
WHERE id = 1;

-- 8. Mark all suggestions as reviewed
UPDATE public_feedback
SET status = 'Reviewed'
WHERE category = 'Suggestion';

-- 9. Delete feedback with status = 'Closed'
DELETE FROM public_feedback
WHERE status = 'Closed';

-- 10. Delete feedback older than 1 year
DELETE FROM public_feedback
WHERE feedback_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR);

-- 11. Set urgency for complaints
UPDATE public_feedback
SET urgency_level = 'High'
WHERE category = 'Complaint';

-- 12. Insert using SELECT from another table (example from feedback_archive)
INSERT INTO public_feedback
SELECT * FROM feedback_archive WHERE feedback_date > '2025-01-01';

-- 13. Set status to 'Pending Review' for null statuses
UPDATE public_feedback
SET status = 'Pending Review'
WHERE status IS NULL;

-- 14. Delete duplicate messages
DELETE FROM public_feedback
WHERE id NOT IN (
  SELECT MIN(id) FROM public_feedback GROUP BY message
);

-- 15. Truncate table (use with caution)
TRUNCATE TABLE public_feedback;

-- DQL (SELECT with Clauses, Operators, Functions, Aliases)
-- 16. Select all complaints
SELECT * FROM public_feedback WHERE category = 'Complaint';

-- 17. Count total suggestions
SELECT COUNT(*) AS suggestion_count FROM public_feedback WHERE category = 'Suggestion';

-- 18. Get unique feedback types
SELECT DISTINCT category FROM public_feedback;

-- 19. Find average feedbacks per location
SELECT location_id, COUNT(*) / COUNT(DISTINCT feedback_date) AS avg_feedbacks_per_day
FROM public_feedback
GROUP BY location_id;

-- 20. Feedback per officer
SELECT officer_id, COUNT(*) AS total_feedbacks
FROM public_feedback
GROUP BY officer_id
ORDER BY total_feedbacks DESC;

-- 21. Most recent feedback per location
SELECT location_id, MAX(feedback_date) AS latest_feedback_date
FROM public_feedback
GROUP BY location_id;

-- 22. Feedback containing the word 'support'
SELECT * FROM public_feedback
WHERE LOWER(message) LIKE '%support%';

-- 23. Status-wise feedback percentage
SELECT status, ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM public_feedback), 2) AS percentage
FROM public_feedback
GROUP BY status;

-- 24. Feedback submitted in last 7 days
SELECT *
FROM public_feedback
WHERE feedback_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY);

-- 25. Feedback with NULL remarks
SELECT * FROM public_feedback
WHERE remarks IS NULL OR remarks = '';

-- 26. Length of each message
SELECT id, LENGTH(message) AS message_length FROM public_feedback;

-- 27. Extract year and month
SELECT id, EXTRACT(YEAR FROM feedback_date) AS year, EXTRACT(MONTH FROM feedback_date) AS month
FROM public_feedback;

-- 28. Feedbacks where officer_id is even
SELECT * FROM public_feedback WHERE MOD(officer_id, 2) = 0;

-- 29. Conditional aliasing for status
SELECT id, status, 
  CASE 
    WHEN status = 'Open' THEN 'Action Needed'
    WHEN status = 'Closed' THEN 'Resolved'
    ELSE 'In Progress'
  END AS status_label
FROM public_feedback;

-- 30. Top 3 locations with highest complaints
SELECT location_id, COUNT(*) AS total_complaints
FROM public_feedback
WHERE category = 'Complaint'
GROUP BY location_id
ORDER BY total_complaints DESC
LIMIT 3;

-- Joins & Subqueries
-- 31. Join feedback with locations
SELECT pf.*, l.location_name
FROM public_feedback pf
JOIN locations l ON pf.location_id = l.id;

-- 32. Join feedback with officers
SELECT pf.*, go.name AS officer_name
FROM public_feedback pf
JOIN government_officers go ON pf.officer_id = go.id;

-- 33. Nested subquery to get feedbacks from top feedback officer
SELECT * FROM public_feedback
WHERE officer_id = (
  SELECT officer_id FROM public_feedback
  GROUP BY officer_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- 34. Subquery to find feedback from cities with complaints only
SELECT * FROM public_feedback
WHERE location_id IN (
  SELECT location_id FROM public_feedback WHERE category = 'Complaint'
);

-- 35. Join with filtered location info
SELECT pf.id, pf.message, l.region
FROM public_feedback pf
JOIN locations l ON pf.location_id = l.id
WHERE l.region = 'Urban';

-- 36. Join feedback with officer name and sort
SELECT pf.id, pf.message, go.name
FROM public_feedback pf
JOIN government_officers go ON pf.officer_id = go.id
ORDER BY go.name;

-- 37. Feedbacks for officers handling multiple locations
SELECT * FROM public_feedback
WHERE officer_id IN (
  SELECT officer_id FROM public_feedback
  GROUP BY officer_id
  HAVING COUNT(DISTINCT location_id) > 1
);

-- 38. Join feedbacks with region info
SELECT pf.*, l.region
FROM public_feedback pf
LEFT JOIN locations l ON pf.location_id = l.id;

-- 39. Officer-wise open complaints
SELECT go.name, COUNT(*) AS open_complaints
FROM public_feedback pf
JOIN government_officers go ON pf.officer_id = go.id
WHERE pf.category = 'Complaint' AND pf.status = 'Open'
GROUP BY go.name;

-- 40. Join to find officers with feedbacks > 2
SELECT go.id, go.name, COUNT(pf.id) AS feedback_count
FROM government_officers go
JOIN public_feedback pf ON go.id = pf.officer_id
GROUP BY go.id, go.name
HAVING COUNT(pf.id) > 2;

-- Advanced Functions, Window Functions, Cascades, Constraints
-- 41. Rank feedbacks by date within location
SELECT id, location_id, feedback_date,
RANK() OVER (PARTITION BY location_id ORDER BY feedback_date DESC) AS rank_by_date
FROM public_feedback;

-- 42. Running total of feedbacks over time
SELECT feedback_date, COUNT(*) AS daily_feedbacks,
SUM(COUNT(*)) OVER (ORDER BY feedback_date) AS running_total
FROM public_feedback
GROUP BY feedback_date;

-- 43. Categorize feedback by sentiment
SELECT id, category,
  CASE 
    WHEN category = 'Compliment' THEN 'Positive'
    WHEN category = 'Complaint' THEN 'Negative'
    ELSE 'Neutral'
  END AS sentiment
FROM public_feedback;

-- 44. Feedbacks where officer handled more than 5 records
SELECT * FROM public_feedback
WHERE officer_id IN (
  SELECT officer_id FROM public_feedback GROUP BY officer_id HAVING COUNT(*) > 5
);

-- 45. Count and percentage per feedback type
SELECT category, COUNT(*) AS count,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM public_feedback
GROUP BY category;

-- 46. Use of COALESCE to replace empty remarks
SELECT id, COALESCE(remarks, 'No remarks') AS remarks_cleaned
FROM public_feedback;

-- 47. Feedbacks where message has more than 5 words
SELECT * FROM public_feedback
WHERE LENGTH(message) - LENGTH(REPLACE(message, ' ', '')) + 1 > 5;

-- 48. Feedback IDs in last 5 days with officer name
SELECT
  pf.id,
  go.name AS officer_name
FROM public_feedback pf
JOIN government_officers go ON pf.officer_id = go.id
WHERE pf.feedback_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY);


-- 49. Feedback category frequency using window functions
SELECT id, category,
COUNT(*) OVER (PARTITION BY category) AS category_frequency
FROM public_feedback;

-- 50. Use CHECK constraint for valid status
ALTER TABLE public_feedback
ADD CONSTRAINT chk_status
CHECK (status IN ('Open', 'Reviewed', 'Closed', 'Pending Review'));


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

-- 1. Create table (already provided)
-- No repeat needed

-- 2. Add a new column for training cost
ALTER TABLE training_programs ADD COLUMN cost DECIMAL(10,2);

-- 3. Modify 'status' column to allow more length
ALTER TABLE training_programs MODIFY status VARCHAR(30);

-- 4. Drop an unnecessary column (e.g., if added wrongly)
ALTER TABLE training_programs DROP COLUMN cost;

-- 5. Rename the table
ALTER TABLE training_programs RENAME TO relief_training_programs;

-- DML Queries
-- 6. Insert a new record
INSERT INTO relief_training_programs 
(id, title, description, start_date, end_date, trainer_name, officer_id, location_id, category, status)
VALUES (21, 'Flood Response Team Training', 'Training on effective flood response', '2025-09-25', '2025-09-28', 'Dr. Seema Rao', 321, 11, 'Disaster', 'Planned');

-- 7. Update status of a completed training
UPDATE relief_training_programs 
SET status = 'Completed' 
WHERE id = 1;

-- 8. Update multiple fields using alias
UPDATE relief_training_programs AS tp
SET tp.status = 'Rescheduled',
    tp.start_date = '2025-08-10',
    tp.end_date = '2025-08-13'
WHERE tp.title = 'Fire Safety Basics';

-- 9. Delete a training program by ID
DELETE FROM relief_training_programs WHERE id = 20;

-- 10. Delete all canceled programs (if status = 'Canceled')
DELETE FROM relief_training_programs WHERE status = 'Canceled';

-- 11. Insert multiple new trainings at once
INSERT INTO relief_training_programs (id, title, description, start_date, end_date, trainer_name, officer_id, location_id, category, status)
VALUES 
(22, 'Post-Disaster Trauma Therapy', 'Therapy strategies post disasters', '2025-09-30', '2025-10-02', 'Dr. Arun Sharma', 322, 14, 'Health', 'Planned'),
(23, 'Vaccination Drive Strategy', 'Planning mass vaccination', '2025-10-05', '2025-10-07', 'Dr. Leena Mathew', 323, 6, 'Medical', 'Planned');

-- 12. Restore deleted training from backup (hypothetical)
-- INSERT INTO relief_training_programs SELECT * FROM backup_training_programs WHERE id = 20;

-- 13. Copy all planned trainings to an archive table
INSERT INTO training_archive
SELECT * FROM relief_training_programs WHERE status = 'Planned';

-- 14. Update all trainings by a specific trainer
UPDATE relief_training_programs SET trainer_name = 'Dr. Priya Rao' WHERE trainer_name = 'Ms. Priya Singh';

-- 15. Change category for all environment-related programs
UPDATE relief_training_programs SET category = 'Environment & Nature' WHERE category = 'Environment';

-- DQL (SELECT with Clauses, Aliases, Operators)
-- 16. Select all training titles with alias
SELECT title AS training_title FROM relief_training_programs;

-- 17. Filter trainings scheduled in July 2025
SELECT * FROM relief_training_programs 
WHERE MONTH(start_date) = 7 AND YEAR(start_date) = 2025;

-- 18. Find trainings where trainer name includes 'Kulkarni'
SELECT * FROM relief_training_programs 
WHERE trainer_name LIKE '%Kulkarni%';

-- 19. List unique training categories
SELECT DISTINCT category FROM relief_training_programs;

-- 20. Trainings with duration more than 3 days
SELECT id, title, DATEDIFF(end_date, start_date) AS duration_days
FROM relief_training_programs
WHERE DATEDIFF(end_date, start_date) > 3;

-- 21. Sort trainings by start date descending
SELECT * FROM relief_training_programs
ORDER BY start_date DESC;

-- 22. Limit to top 5 recent trainings
SELECT * FROM relief_training_programs
ORDER BY start_date DESC
LIMIT 5;

-- 23. Count planned trainings per category
SELECT category, COUNT(*) AS planned_count
FROM relief_training_programs
WHERE status = 'Planned'
GROUP BY category;

-- 24. Find earliest scheduled training
SELECT * FROM relief_training_programs
ORDER BY start_date ASC
LIMIT 1;

-- 25. Trainings starting between two dates
SELECT * FROM relief_training_programs
WHERE start_date BETWEEN '2025-08-01' AND '2025-08-31';

--  Built-in Functions
-- 26. Get average duration of trainings
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_duration_days
FROM relief_training_programs;

-- 27. Total trainings per month
SELECT MONTH(start_date) AS month, COUNT(*) AS total_trainings
FROM relief_training_programs
GROUP BY MONTH(start_date);

-- 28. Trainer name in uppercase
SELECT UPPER(trainer_name) AS trainer_upper FROM relief_training_programs;

-- 29. Length of description field
SELECT id, LENGTH(description) AS desc_length FROM relief_training_programs;

-- 30. Add 5 days to all end dates (just for reference)
SELECT id, title, end_date, DATE_ADD(end_date, INTERVAL 5 DAY) AS extended_end_date
FROM relief_training_programs;

-- Subqueries
-- 31. Trainings by the same officer as 'Mental Health Support'
SELECT * FROM relief_training_programs 
WHERE officer_id = (
    SELECT officer_id FROM relief_training_programs WHERE title = 'Mental Health Support'
);

-- 32. Trainings at same location as 'Child Safety Camps'
SELECT * FROM relief_training_programs 
WHERE location_id = (
    SELECT location_id FROM relief_training_programs WHERE title = 'Child Safety Camps'
);

-- 33. Trainings longer than average duration
SELECT * FROM relief_training_programs 
WHERE DATEDIFF(end_date, start_date) > (
    SELECT AVG(DATEDIFF(end_date, start_date)) FROM relief_training_programs
);

-- 34. Trainers conducting more than one program
SELECT trainer_name FROM relief_training_programs
GROUP BY trainer_name
HAVING COUNT(*) > 1;

-- 35. Trainings in categories with more than 2 programs
SELECT * FROM relief_training_programs
WHERE category IN (
    SELECT category FROM relief_training_programs GROUP BY category HAVING COUNT(*) > 2
);

-- Joins (Assuming officers and locations tables exist)
-- 36. Join with officers table to get officer name
SELECT tp.title, o.name AS officer_name
FROM relief_training_programs tp
JOIN government_officers o ON tp.officer_id = o.officer_id;

-- 37. Join with locations table to get location name
SELECT tp.title, l.name AS location_name
FROM relief_training_programs tp
JOIN locations l ON tp.location_id = l.location_id;

-- 38. Trainings with both officer and location details
SELECT tp.title, o.name AS officer_name, l.name AS location_name
FROM relief_training_programs tp
JOIN government_officers o ON tp.officer_id = o.officer_id
JOIN locations l ON tp.location_id = l.location_id;

-- 39. List trainings by officers from 'Relief Coordination' department
SELECT tp.*
FROM relief_training_programs tp
JOIN government_officers o ON tp.officer_id = o.officer_id
WHERE o.department = 'Relief Coordination';

-- 40. Trainings conducted in locations marked as ‘Urban’
SELECT tp.*
FROM relief_training_programs tp
JOIN locations l ON tp.location_id = l.location_id
WHERE l.area_type = 'Urban';

--  Cascade Queries
-- 41. Create table with ON DELETE CASCADE foreign key
CREATE TABLE training_attendance (
    attendance_id INT PRIMARY KEY,
    training_id INT,
    participant_name VARCHAR(100),
    FOREIGN KEY (training_id) REFERENCES relief_training_programs(id)
    ON DELETE CASCADE
);

-- 42. Insert into training_attendance (example)
INSERT INTO training_attendance (attendance_id, training_id, participant_name)
VALUES (1, 3, 'Rajesh Tiwari');

-- 43. Delete parent training (will auto-delete attendance due to CASCADE)
DELETE FROM relief_training_programs WHERE id = 3;

-- 44. Create ON UPDATE CASCADE example
ALTER TABLE training_attendance
DROP FOREIGN KEY training_attendance_ibfk_1;

ALTER TABLE training_attendance
ADD CONSTRAINT fk_train_prog
FOREIGN KEY (training_id)
REFERENCES relief_training_programs(id)
ON UPDATE CASCADE;

-- 45. Update training ID (example, rare but for illustration)
UPDATE relief_training_programs SET id = 100 WHERE id = 2;

-- 46. Running cumulative number of trainings per category
SELECT
  id,
  category,
  start_date,
  COUNT(*) OVER (
    PARTITION BY category
    ORDER BY start_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_count;

-- 48. Compare each training to the previous one by start date
SELECT
  id,
  title,
  start_date,
  LAG(start_date) OVER (
    PARTITION BY category
    ORDER BY start_date
  ) AS prev_start,
  DATEDIFF(start_date, LAG(start_date) OVER (
    PARTITION BY category
    ORDER BY start_date
  )) AS days_since_prev
FROM relief_training_programs;


-- 49 Average and total cost (if cost column exists) per category
SELECT
  category,
  AVG(cost) AS avg_cost,
  SUM(cost) AS total_cost,
  COUNT(*) OVER (PARTITION BY category) AS total_sessions
FROM relief_training_programs
WHERE cost IS NOT NULL
GROUP BY category;

-- 50. Identify the top‑3 most recent trainings overall
SELECT *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (ORDER BY start_date DESC) AS rn
  FROM relief_training_programs
) t
WHERE rn <= 3;


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
    
    -- 1. Create the table (already provided, shown again for reference)
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

-- 2. Add a NOT NULL constraint to 'email'
ALTER TABLE emergency_contacts
MODIFY email VARCHAR(100) NOT NULL;

-- 3. Add foreign key constraint with CASCADE on update/delete
ALTER TABLE emergency_contacts
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id)
REFERENCES locations(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 4. Rename the column 'remarks' to 'additional_remarks'
ALTER TABLE emergency_contacts
CHANGE remarks additional_remarks TEXT;

-- 5. Drop the column 'added_by' if no longer required
ALTER TABLE emergency_contacts
DROP COLUMN added_by;

-- DML (Data Manipulation Language)
-- 6. Insert a new emergency contact
INSERT INTO emergency_contacts (id, name, contact_number, department, location_id, email, designation, status, additional_remarks)
VALUES (21, 'Leela Singh', '9123459021', 'Fire Services', 8, 'l.singh@firedept.gov', 'Deputy Chief', 'Active', 'Handles rural stations');

-- 7. Update contact number for a contact
UPDATE emergency_contacts
SET contact_number = '9876543210'
WHERE name = 'Anita Desai';

-- 8. Mark a contact as 'Inactive' with remarks
UPDATE emergency_contacts
SET status = 'Inactive', additional_remarks = 'Retired from duty'
WHERE name = 'Vikram Patel';

-- 9. Delete a contact with status 'Inactive'
DELETE FROM emergency_contacts
WHERE status = 'Inactive';

-- 10. Bulk update status of all contacts from department 'Sanitation'
UPDATE emergency_contacts
SET status = 'Pending'
WHERE department = 'Sanitation';

-- 11. Insert using subquery to get location_id from locations
INSERT INTO emergency_contacts (id, name, contact_number, department, location_id, email, designation, status, additional_remarks)
SELECT 22, 'Nisha Rao', '9123459022', 'Flood Rescue', id, 'n.rao@floodrescue.gov', 'Rescue Lead', 'Active', 'Flood control unit'
FROM locations
WHERE location_name = 'Pune';

-- 12. Copy a record with modifications
INSERT INTO emergency_contacts (id, name, contact_number, department, location_id, email, designation, status, additional_remarks)
SELECT 23, CONCAT(name, ' Jr.'), contact_number, department, location_id, CONCAT('copy_', email), designation, 'Pending', 'Duplicate'
FROM emergency_contacts
WHERE id = 1;

-- 13. Set remarks to NULL where status is 'Active'
UPDATE emergency_contacts
SET additional_remarks = NULL
WHERE status = 'Active';

-- 14. Delete all 'Pending' contacts with no remarks
DELETE FROM emergency_contacts
WHERE status = 'Pending' AND (additional_remarks IS NULL OR additional_remarks = '');

-- 15. Archive a record by moving to another table (pseudo-archive)
INSERT INTO archived_contacts SELECT * FROM emergency_contacts WHERE id = 3;
DELETE FROM emergency_contacts WHERE id = 3;

-- DQL (Select Queries using clauses, aliases, operators, functions)
-- 16. Select all contacts with alias for better readability
SELECT name AS 'Contact Name', contact_number AS 'Phone', department, status
FROM emergency_contacts;

-- 17. Count total contacts
SELECT COUNT(*) AS total_contacts FROM emergency_contacts;

-- 18. Get all pending contacts
SELECT * FROM emergency_contacts
WHERE status = 'Pending';

-- 19. Fetch names and departments of contacts added in location_id 7
SELECT name, department FROM emergency_contacts
WHERE location_id = 7;

-- 20. Find contacts where name starts with 'A'
SELECT * FROM emergency_contacts
WHERE name LIKE 'A%';

-- 21. Find contacts not from 'Health' or 'Fire Services'
SELECT * FROM emergency_contacts
WHERE department NOT IN ('Health', 'Fire Services');

-- 22. Select contacts with length of remarks > 10 characters
SELECT name, LENGTH(additional_remarks) AS remark_length
FROM emergency_contacts
WHERE LENGTH(additional_remarks) > 10;

-- 23. Sort contacts by department and name
SELECT * FROM emergency_contacts
ORDER BY department ASC, name ASC;

-- 24. Show unique departments
SELECT DISTINCT department FROM emergency_contacts;

-- 25. Group contacts by status and count
SELECT status, COUNT(*) AS total FROM emergency_contacts
GROUP BY status;

-- 26. Find the most recently added contact (by highest ID)
SELECT * FROM emergency_contacts
ORDER BY id DESC LIMIT 1;

-- 27. Get contacts added by a specific user (if added_by still exists)
SELECT * FROM emergency_contacts
WHERE added_by = 310;

-- 28. Use COALESCE to show 'No Remarks' if null
SELECT name, COALESCE(additional_remarks, 'No Remarks') AS remarks
FROM emergency_contacts;

-- 29. Use CASE to label status meaningfully
SELECT name,
  CASE
    WHEN status = 'Active' THEN 'On Duty'
    WHEN status = 'Pending' THEN 'Verification Required'
    ELSE 'Retired/Inactive'
  END AS status_description
FROM emergency_contacts;

-- 30. Get total contacts in each location
SELECT location_id, COUNT(*) AS total_contacts
FROM emergency_contacts
GROUP BY location_id;

-- Joins and Subqueries
-- 31. Join with locations table to get location name
SELECT ec.name, ec.department, l.location_name
FROM emergency_contacts ec
JOIN locations l ON ec.location_id = l.id;

-- 32. Find contacts in locations where aid is distributed
SELECT ec.name, ec.department
FROM emergency_contacts ec
WHERE ec.location_id IN (
  SELECT DISTINCT location_id FROM aid_distribution
);

-- 33. Get contacts with same department as 'Priya Shah'
SELECT * FROM emergency_contacts
WHERE department = (
  SELECT department FROM emergency_contacts WHERE name = 'Priya Shah'
);

-- 34. Count contacts by location name using join
SELECT l.location_name, COUNT(ec.id) AS total_contacts
FROM emergency_contacts ec
JOIN locations l ON ec.location_id = l.id
GROUP BY l.location_name;

-- 35. Join with government_officers to show added_by name
SELECT ec.name, go.name AS officer_name
FROM emergency_contacts ec
JOIN government_officers go ON ec.added_by = go.id;

-- 36. Contacts in same location as 'Deepak Joshi'
SELECT * FROM emergency_contacts
WHERE location_id = (
  SELECT location_id FROM emergency_contacts WHERE name = 'Deepak Joshi'
);

-- 37. Get contacts from departments with >1 contact
SELECT department
FROM emergency_contacts
GROUP BY department
HAVING COUNT(*) > 1;

-- 38. List contacts along with any suppliers in their location
SELECT ec.name AS contact_name, s.supplier_name
FROM emergency_contacts ec
JOIN suppliers s ON ec.location_id = s.location_id;

-- 39. Join to display emergency contacts with incident reports in same location
SELECT ec.name, ir.incident_type
FROM emergency_contacts ec
JOIN incident_reports ir ON ec.location_id = ir.location_id;

-- 40. Show contacts who are not assigned to any incident location
SELECT ec.name FROM emergency_contacts ec
WHERE NOT EXISTS (
  SELECT 1 FROM incident_reports ir WHERE ir.location_id = ec.location_id
);

-- Advanced Use Cases & Cascades
-- 41. Create a backup of current emergency contacts
CREATE TABLE backup_emergency_contacts AS
SELECT * FROM emergency_contacts;

-- 42. Simulate a cascade delete (delete from locations will delete matching contacts)
DELETE FROM locations WHERE id = 13;

-- 43. Simulate cascade update (update location id which will cascade to contacts)
UPDATE locations SET id = 100 WHERE id = 9;

-- 44. Use INSTR to find contacts whose remarks include 'pending'
SELECT * FROM emergency_contacts
WHERE INSTR(additional_remarks, 'pending') > 0;

-- 45. Find contacts added after a specific ID using BETWEEN
SELECT * FROM emergency_contacts
WHERE id BETWEEN 5 AND 15;

-- 46. Count of departments starting with 'S'
SELECT COUNT(*) FROM emergency_contacts
WHERE department LIKE 'S%';

-- 47. Find contact(s) with longest remarks
SELECT * FROM emergency_contacts
ORDER BY LENGTH(additional_remarks) DESC
LIMIT 1;

-- 48. Display contact number masked
SELECT name, CONCAT('XXXXXX', RIGHT(contact_number, 4)) AS masked_number
FROM emergency_contacts;

-- 49. Find duplicate departments using window function (if supported)
SELECT name, department, COUNT(*) OVER (PARTITION BY department) AS dept_count
FROM emergency_contacts;

-- 50. Export data using SELECT INTO (for compatible SQL systems)
SELECT * INTO exported_contacts FROM emergency_contacts WHERE status = 'Active';


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

-- 1. Create table with foreign key constraint (assuming government_officers exists)
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
    date_created DATE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 2. Add a new column for plan type
ALTER TABLE budget_plans
ADD COLUMN plan_type VARCHAR(50);

-- 3. Modify existing column to increase length
ALTER TABLE budget_plans
MODIFY COLUMN plan_name VARCHAR(150);

-- 4. Drop an unnecessary column
ALTER TABLE budget_plans
DROP COLUMN plan_type;

-- 5. Rename column document_reference to doc_ref
ALTER TABLE budget_plans
RENAME COLUMN document_reference TO doc_ref;

-- DML (Data Manipulation Language)
-- 6. Insert a new budget plan
INSERT INTO budget_plans VALUES
(21, 'Flood Relief Plan', '2025-2026', 800000.00, 750000.00, 321, 'Pending', 'New draft', 'DOC-BP021', '2025-05-30');

-- 7. Update status for plans pending approval
UPDATE budget_plans
SET status = 'Approved'
WHERE status = 'Pending' AND approved_amount > 700000;

-- 8. Delete rejected plans (none in current data, but syntactically correct)
DELETE FROM budget_plans
WHERE status = 'Rejected';

-- 9. Bulk update remarks for all approved plans
UPDATE budget_plans
SET remarks = 'Approved by committee'
WHERE status = 'Approved';

-- 10. Increase estimated amount by 5% for food-related plans
UPDATE budget_plans
SET estimated_amount = estimated_amount * 1.05
WHERE plan_name LIKE '%Food%';

-- DQL (Data Query Language) with Functions, Aliases, Clauses
-- 11. Select all plans with alias and formatted amount
SELECT id AS plan_id, plan_name, FORMAT(approved_amount, 2) AS approved_funds
FROM budget_plans;

-- 12. Get plans approved between two dates
SELECT * FROM budget_plans
WHERE date_created BETWEEN '2025-04-01' AND '2025-04-30';

-- 13. Plans with approved amount >= 500,000
SELECT * FROM budget_plans
WHERE approved_amount >= 500000;

-- 14. Plans not approved yet
SELECT * FROM budget_plans
WHERE status != 'Approved';

-- 15. Count of plans per status
SELECT status, COUNT(*) AS total
FROM budget_plans
GROUP BY status;

-- 16. Average approved amount for approved plans
SELECT AVG(approved_amount) AS avg_approved
FROM budget_plans
WHERE status = 'Approved';

-- 17. Plans with NULL or empty remarks
SELECT * FROM budget_plans
WHERE remarks IS NULL OR remarks = '';

-- 18. Show top 5 highest estimated budgets
SELECT plan_name, estimated_amount
FROM budget_plans
ORDER BY estimated_amount DESC
LIMIT 5;

-- 19. Check plans with mismatched estimates
SELECT id, plan_name
FROM budget_plans
WHERE estimated_amount != approved_amount;

-- 20. Select plans created in May
SELECT * FROM budget_plans
WHERE MONTH(date_created) = 5;

-- Operators, Aliases, IN, LIKE, AND, OR, CASE
-- 21. Plans with specific IDs using IN
SELECT * FROM budget_plans
WHERE id IN (2, 4, 6);

-- 22. Plans starting with 'Cash'
SELECT * FROM budget_plans
WHERE plan_name LIKE 'Cash%';

-- 23. Use of CASE to classify budget size
SELECT plan_name,
       CASE 
           WHEN approved_amount > 900000 THEN 'High Budget'
           WHEN approved_amount > 500000 THEN 'Medium Budget'
           ELSE 'Low Budget'
       END AS budget_category
FROM budget_plans;

-- 24. Plans with both high estimate and recent creation
SELECT * FROM budget_plans
WHERE estimated_amount > 700000 AND date_created > '2025-05-01';

-- 25. Plans with either low budget or pending status
SELECT * FROM budget_plans
WHERE approved_amount < 300000 OR status = 'Pending';

-- 26. Plans that are approved and have non-empty remarks
SELECT * FROM budget_plans
WHERE status = 'Approved' AND remarks IS NOT NULL AND remarks != '';

-- 27. Plan name and amount difference
SELECT plan_name, (estimated_amount - approved_amount) AS difference
FROM budget_plans;

-- 28. Plans with less than 5% variance in budget
SELECT * FROM budget_plans
WHERE ABS(estimated_amount - approved_amount) <= (estimated_amount * 0.05);

-- 29. Find duplicates by plan_name (if any)
SELECT plan_name, COUNT(*) 
FROM budget_plans
GROUP BY plan_name
HAVING COUNT(*) > 1;

-- 30. Plans sorted by approval status and amount
SELECT * FROM budget_plans
ORDER BY status, approved_amount DESC;

-- Joins & Subqueries
-- 31. Join with government_officers to get officer names
SELECT bp.plan_name, go.name AS officer_name, bp.approved_amount
FROM budget_plans bp
JOIN government_officers go ON bp.officer_id = go.id;

-- 32. Subquery: Plans with above-average approved_amount
SELECT * FROM budget_plans
WHERE approved_amount > (
    SELECT AVG(approved_amount) FROM budget_plans
);

-- 33. Officer-wise total approved budget
SELECT go.name, SUM(bp.approved_amount) AS total_approved
FROM budget_plans bp
JOIN government_officers go ON bp.officer_id = go.id
GROUP BY go.name;

-- 34. Subquery in FROM clause
SELECT bp.plan_name, stats.avg_amount
FROM budget_plans bp
JOIN (
    SELECT AVG(approved_amount) AS avg_amount
    FROM budget_plans
) stats ON bp.approved_amount > stats.avg_amount;

-- 35. Plans from officers who approved more than 2 plans
SELECT bp.*
FROM budget_plans bp
WHERE bp.officer_id IN (
    SELECT officer_id
    FROM budget_plans
    GROUP BY officer_id
    HAVING COUNT(*) > 2
);
-- Advanced (CTE, View, Function, Cascades)
-- 36. Create a view of only high-budget approved plans
CREATE VIEW high_budget_plans AS
SELECT * FROM budget_plans
WHERE approved_amount > 800000 AND status = 'Approved';

-- 37. CTE: Find officers with total budget > 1M
WITH officer_totals AS (
    SELECT officer_id, SUM(approved_amount) AS total_amount
    FROM budget_plans
    GROUP BY officer_id
)
SELECT * FROM officer_totals
WHERE total_amount > 1000000;

-- 38. ON DELETE CASCADE: Deleting an officer deletes their plans
DELETE FROM government_officers WHERE id = 310;

-- 39. ON UPDATE CASCADE: Updating officer ID updates all references
UPDATE government_officers
SET id = 999
WHERE id = 311;

-- 40. Create a function to calculate budget variance
DELIMITER $$
CREATE FUNCTION budget_variance(estimated DECIMAL(12,2), approved DECIMAL(12,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  RETURN estimated - approved;
END$$
DELIMITER ;

-- 41. Top Officers by Number of Actions
SELECT officer_id, COUNT(*) AS action_count
FROM audit_trails
GROUP BY officer_id
ORDER BY action_count DESC
LIMIT 5;

-- 42. Daily Action Summary
SELECT DATE(action_time) AS action_date, COUNT(*) AS total_actions
FROM audit_trails
GROUP BY DATE(action_time)
ORDER BY action_date DESC;

-- 43. Records Modified More Than Once
SELECT table_name, record_id, COUNT(*) AS modifications
FROM audit_trails
GROUP BY table_name, record_id
HAVING modifications > 1;

-- 44. Failed or Missing Status Entries
SELECT *
FROM audit_trails
WHERE status IS NULL OR status NOT IN ('Success', 'Completed');

-- 45. Most Frequent Action Types
SELECT action_type, COUNT(*) AS frequency
FROM audit_trails
GROUP BY action_type
ORDER BY frequency DESC;

-- 46. Actions Grouped by Location and Status
SELECT location_id, status, COUNT(*) AS total
FROM audit_trails
GROUP BY location_id, status
ORDER BY location_id, total DESC;

-- 47. Multiple Officers Acting on Same Record
SELECT table_name, record_id, COUNT(DISTINCT officer_id) AS unique_officers
FROM audit_trails
GROUP BY table_name, record_id
HAVING unique_officers > 1;

-- 48. Hourly System Usage Patterns
SELECT HOUR(action_time) AS hour_of_day, COUNT(*) AS action_count
FROM audit_trails
GROUP BY hour_of_day
ORDER BY action_count DESC;

-- 49. Most Accessed Tables
SELECT table_name, COUNT(*) AS access_count
FROM audit_trails
GROUP BY table_name
ORDER BY access_count DESC;

-- 50. Suspicious High Volume DELETEs
SELECT officer_id, COUNT(*) AS delete_actions
FROM audit_trails
WHERE action_type = 'DELETE'
GROUP BY officer_id
HAVING delete_actions > 3;


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
    
    -- 1. Create table with foreign key constraint (assuming government_officers exists)
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
    date_created DATE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 2. Add a new column for plan type
ALTER TABLE budget_plans
ADD COLUMN plan_type VARCHAR(50);

-- 3. Modify existing column to increase length
ALTER TABLE budget_plans
MODIFY COLUMN plan_name VARCHAR(150);

-- 4. Drop an unnecessary column
ALTER TABLE budget_plans
DROP COLUMN plan_type;

-- 5. Rename column document_reference to doc_ref
ALTER TABLE budget_plans
RENAME COLUMN document_reference TO doc_ref;

-- DML (Data Manipulation Language)
-- 6. Insert a new budget plan
INSERT INTO budget_plans VALUES
(21, 'Flood Relief Plan', '2025-2026', 800000.00, 750000.00, 321, 'Pending', 'New draft', 'DOC-BP021', '2025-05-30');

-- 7. Update status for plans pending approval
UPDATE budget_plans
SET status = 'Approved'
WHERE status = 'Pending' AND approved_amount > 700000;

-- 8. Delete rejected plans (none in current data, but syntactically correct)
DELETE FROM budget_plans
WHERE status = 'Rejected';

-- 9. Bulk update remarks for all approved plans
UPDATE budget_plans
SET remarks = 'Approved by committee'
WHERE status = 'Approved';

-- 10. Increase estimated amount by 5% for food-related plans
UPDATE budget_plans
SET estimated_amount = estimated_amount * 1.05
WHERE plan_name LIKE '%Food%';

-- DQL (Data Query Language) with Functions, Aliases, Clauses
-- 11. Select all plans with alias and formatted amount
SELECT id AS plan_id, plan_name, FORMAT(approved_amount, 2) AS approved_funds
FROM budget_plans;

-- 12. Get plans approved between two dates
SELECT * FROM budget_plans
WHERE date_created BETWEEN '2025-04-01' AND '2025-04-30';

-- 13. Plans with approved amount >= 500,000
SELECT * FROM budget_plans
WHERE approved_amount >= 500000;

-- 14. Plans not approved yet
SELECT * FROM budget_plans
WHERE status != 'Approved';

-- 15. Count of plans per status
SELECT status, COUNT(*) AS total
FROM budget_plans
GROUP BY status;

-- 16. Average approved amount for approved plans
SELECT AVG(approved_amount) AS avg_approved
FROM budget_plans
WHERE status = 'Approved';

-- 17. Plans with NULL or empty remarks
SELECT * FROM budget_plans
WHERE remarks IS NULL OR remarks = '';

-- 18. Show top 5 highest estimated budgets
SELECT plan_name, estimated_amount
FROM budget_plans
ORDER BY estimated_amount DESC
LIMIT 5;

-- 19. Check plans with mismatched estimates
SELECT id, plan_name
FROM budget_plans
WHERE estimated_amount != approved_amount;

-- 20. Select plans created in May
SELECT * FROM budget_plans
WHERE MONTH(date_created) = 5;

-- Operators, Aliases, IN, LIKE, AND, OR, CASE
-- 21. Plans with specific IDs using IN
SELECT * FROM budget_plans
WHERE id IN (2, 4, 6);

-- 22. Plans starting with 'Cash'
SELECT * FROM budget_plans
WHERE plan_name LIKE 'Cash%';

-- 23. Use of CASE to classify budget size
SELECT plan_name,
       CASE 
           WHEN approved_amount > 900000 THEN 'High Budget'
           WHEN approved_amount > 500000 THEN 'Medium Budget'
           ELSE 'Low Budget'
       END AS budget_category
FROM budget_plans;

-- 24. Plans with both high estimate and recent creation
SELECT * FROM budget_plans
WHERE estimated_amount > 700000 AND date_created > '2025-05-01';

-- 25. Plans with either low budget or pending status
SELECT * FROM budget_plans
WHERE approved_amount < 300000 OR status = 'Pending';

-- 26. Plans that are approved and have non-empty remarks
SELECT * FROM budget_plans
WHERE status = 'Approved' AND remarks IS NOT NULL AND remarks != '';

-- 27. Plan name and amount difference
SELECT plan_name, (estimated_amount - approved_amount) AS difference
FROM budget_plans;

-- 28. Plans with less than 5% variance in budget
SELECT * FROM budget_plans
WHERE ABS(estimated_amount - approved_amount) <= (estimated_amount * 0.05);

-- 29. Find duplicates by plan_name (if any)
SELECT plan_name, COUNT(*) 
FROM budget_plans
GROUP BY plan_name
HAVING COUNT(*) > 1;

-- 30. Plans sorted by approval status and amount
SELECT * FROM budget_plans
ORDER BY status, approved_amount DESC;

-- Joins & Subqueries
-- 31. Join with government_officers to get officer names
SELECT bp.plan_name, go.name AS officer_name, bp.approved_amount
FROM budget_plans bp
JOIN government_officers go ON bp.officer_id = go.id;

-- 32. Subquery: Plans with above-average approved_amount
SELECT * FROM budget_plans
WHERE approved_amount > (
    SELECT AVG(approved_amount) FROM budget_plans
);

-- 33. Officer-wise total approved budget
SELECT go.name, SUM(bp.approved_amount) AS total_approved
FROM budget_plans bp
JOIN government_officers go ON bp.officer_id = go.id
GROUP BY go.name;

-- 34. Subquery in FROM clause
SELECT bp.plan_name, stats.avg_amount
FROM budget_plans bp
JOIN (
    SELECT AVG(approved_amount) AS avg_amount
    FROM budget_plans
) stats ON bp.approved_amount > stats.avg_amount;

-- 35. Plans from officers who approved more than 2 plans
SELECT bp.*
FROM budget_plans bp
WHERE bp.officer_id IN (
    SELECT officer_id
    FROM budget_plans
    GROUP BY officer_id
    HAVING COUNT(*) > 2
);

-- Advanced (CTE, View, Function, Cascades)
-- 36. Create a view of only high-budget approved plans
CREATE VIEW high_budget_plans AS
SELECT * FROM budget_plans
WHERE approved_amount > 800000 AND status = 'Approved';

-- 37. CTE: Find officers with total budget > 1M
WITH officer_totals AS (
    SELECT officer_id, SUM(approved_amount) AS total_amount
    FROM budget_plans
    GROUP BY officer_id
)
SELECT * FROM officer_totals
WHERE total_amount > 1000000;

-- 38. ON DELETE CASCADE: Deleting an officer deletes their plans
DELETE FROM government_officers WHERE id = 310;

-- 39. ON UPDATE CASCADE: Updating officer ID updates all references
UPDATE government_officers
SET id = 999
WHERE id = 311;

-- 40. Create a function to calculate budget variance
DELIMITER $$
CREATE FUNCTION budget_variance(estimated DECIMAL(12,2), approved DECIMAL(12,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  RETURN estimated - approved;
END$$
DELIMITER ;

-- 41. 🕒 Recent actions per officer (last 7 days)
SELECT officer_id, COUNT(*) AS actions_count
FROM audit_trails
WHERE action_time >= NOW() - INTERVAL 7 DAY
GROUP BY officer_id;


-- 42. Most frequent action types per table
SELECT table_name, action_type, COUNT(*) AS freq
FROM audit_trails
GROUP BY table_name, action_type
ORDER BY freq DESC
LIMIT 10;

-- 43. Detect officers performing DELETE more than average
WITH avg_deletes AS (
    SELECT AVG(del_count) AS avg_del
    FROM (
      SELECT officer_id, COUNT(*) AS del_count
      FROM audit_trails
      WHERE action_type = 'DELETE'
      GROUP BY officer_id
    ) d
)
SELECT t.officer_id, COUNT(*) AS officer_del_count
FROM audit_trails t
WHERE t.action_type = 'DELETE'
GROUP BY t.officer_id
HAVING COUNT(*) > (SELECT avg_del FROM avg_deletes);

-- 44. Actions per location with success vs failure
SELECT location_id,
       status,
       COUNT(*) AS status_count
FROM audit_trails
GROUP BY location_id, status;

-- 45. Time between consecutive actions per officer
SELECT
  officer_id,
  action_time,
  LAG(action_time) OVER (PARTITION BY officer_id ORDER BY action_time) AS prev_time,
  TIMESTAMPDIFF(SECOND,
    LAG(action_time) OVER (PARTITION BY officer_id ORDER BY action_time),
    action_time) AS seconds_since_prev
FROM audit_trails;

-- 46. Top 5 busiest hours of the day
SELECT HOUR(action_time) AS hour_of_day, COUNT(*) AS actions_count
FROM audit_trails
GROUP BY hour_of_day
ORDER BY actions_count DESC
LIMIT 5;

-- 47. Detect multiple actions on same record by different officers
SELECT table_name, record_id, COUNT(DISTINCT officer_id) AS officers_involved
FROM audit_trails
GROUP BY table_name, record_id
HAVING officers_involved > 1;


-- 48. Audit trails missing IP addresses
SELECT *
FROM audit_trails
WHERE ip_address IS NULL OR ip_address = '';

-- 49. Daily count of each action type
SELECT DATE(action_time) AS action_date,
       action_type,
       COUNT(*) AS total_actions
FROM audit_trails
GROUP BY action_date, action_type
ORDER BY action_date, total_actions DESC;

-- 50. Anomaly detection: record IDs updated more than 3 times
SELECT table_name, record_id, COUNT(*) AS update_count
FROM audit_trails
WHERE action_type = 'UPDATE'
GROUP BY table_name, record_id
HAVING COUNT(*) > 3;


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
    
    -- 1. Add a foreign key constraint linking location_id to locations table
ALTER TABLE donations
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id)
REFERENCES locations(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 2. Modify remarks column to increase its size
ALTER TABLE donations
MODIFY remarks TEXT;

-- 3. Add a new column to store donation purpose
ALTER TABLE donations
ADD donation_purpose VARCHAR(100);

-- 4. Rename the column 'category' to 'donation_category'
ALTER TABLE donations
CHANGE category donation_category VARCHAR(50);

-- 5. Drop the donation_purpose column
ALTER TABLE donations
DROP COLUMN donation_purpose;

-- DML (Data Manipulation Language) Queries
-- 6. Insert a new donation record
INSERT INTO donations (id, donor_name, donation_date, amount, donation_category, mode_of_payment, remarks, status, location_id, document_reference)
VALUES (21, 'Tanvi Bhatt', '2025-07-01', 3900.00, 'Education', 'Online', 'Book sets', 'Received', 8, 'DOC-DN021');

-- 7. Update status of pending donations to 'Received'
UPDATE donations
SET status = 'Received'
WHERE status = 'Pending';

-- 8. Delete donations with amount less than 700
DELETE FROM donations
WHERE amount < 700;

-- 9. Update payment mode for all cheque donations to 'Bank Transfer'
UPDATE donations
SET mode_of_payment = 'Bank Transfer'
WHERE mode_of_payment = 'Cheque';

-- 10. Increase all donation amounts by 5%
UPDATE donations
SET amount = amount * 1.05;

-- 11. Insert multiple donation entries at once
INSERT INTO donations (id, donor_name, donation_date, amount, donation_category, mode_of_payment, remarks, status, location_id, document_reference)
VALUES 
(22, 'Bhavya Rane', '2025-07-02', 2500.00, 'Food', 'Cash', 'Ration kit', 'Received', 6, 'DOC-DN022'),
(23, 'Omkar Pillai', '2025-07-03', 5600.00, 'Hygiene', 'Online', 'Cleaning supplies', 'Pending', 5, 'DOC-DN023');

-- 12. Update remarks to NULL for all financial donations
UPDATE donations
SET remarks = NULL
WHERE donation_category = 'Financial';

-- 13. Delete all donations where status is 'Rejected'
DELETE FROM donations
WHERE status = 'Rejected';

-- 14. Change donation_date for a specific document
UPDATE donations
SET donation_date = '2025-07-05'
WHERE document_reference = 'DOC-DN020';

-- 15. Set status to 'Verified' for high-value donations
UPDATE donations
SET status = 'Verified'
WHERE amount > 10000;

-- DQL (Data Query Language) with Functions, Clauses, Operators, Aliases
-- 16. Get total donation amount
SELECT SUM(amount) AS total_donations FROM donations;

-- 17. Count of donations per category
SELECT donation_category, COUNT(*) AS donation_count
FROM donations
GROUP BY donation_category;

-- 18. List top 5 highest donations
SELECT donor_name, amount
FROM donations
ORDER BY amount DESC
LIMIT 5;

-- 19. Show average donation amount by mode of payment
SELECT mode_of_payment, AVG(amount) AS avg_amount
FROM donations
GROUP BY mode_of_payment;

-- 20. List donations made in June 2025
SELECT * FROM donations
WHERE MONTH(donation_date) = 6 AND YEAR(donation_date) = 2025;

-- 21. Find donations where remarks contain 'kit'
SELECT * FROM donations
WHERE remarks LIKE '%kit%';

-- 22. Use COALESCE to show 'No remarks' if NULL
SELECT id, donor_name, COALESCE(remarks, 'No remarks') AS remarks_status
FROM donations;

-- 23. Donations with amount between 2000 and 5000
SELECT * FROM donations
WHERE amount BETWEEN 2000 AND 5000;

-- 24. Donations with mode either 'Cash' or 'Online'
SELECT * FROM donations
WHERE mode_of_payment IN ('Cash', 'Online');

-- 25. Donations not received yet
SELECT * FROM donations
WHERE status != 'Received';

-- 26. Donations grouped and sorted by location
SELECT location_id, COUNT(*) AS donation_count
FROM donations
GROUP BY location_id
ORDER BY donation_count DESC;

-- 27. Alias for a complex calculation (5% bonus)
SELECT id, donor_name, amount, amount * 1.05 AS amount_with_bonus
FROM donations;

-- 28. Using IF to label donation size
SELECT id, donor_name,
  IF(amount > 10000, 'High', IF(amount > 5000, 'Medium', 'Low')) AS donation_size
FROM donations;

-- 29. Find earliest donation
SELECT * FROM donations
ORDER BY donation_date ASC
LIMIT 1;

-- 30. Find most recent donation by donor
SELECT donor_name, MAX(donation_date) AS last_donation
FROM donations
GROUP BY donor_name;

-- Joins & Subqueries
-- 31. Join donations with locations to get location name
SELECT d.id, d.donor_name, l.location_name
FROM donations d
JOIN locations l ON d.location_id = l.id;

-- 32. Find donations from donors whose amount is above average
SELECT * FROM donations
WHERE amount > (SELECT AVG(amount) FROM donations);

-- 33. List location names with total donations > 10000
SELECT l.location_name, SUM(d.amount) AS total_donations
FROM donations d
JOIN locations l ON d.location_id = l.id
GROUP BY l.location_name
HAVING total_donations > 10000;

-- 34. Subquery to find donors who gave the highest donation
SELECT * FROM donations
WHERE amount = (SELECT MAX(amount) FROM donations);

-- 35. Join and filter donations received at locations with id > 8
SELECT d.*, l.location_name
FROM donations d
JOIN locations l ON d.location_id = l.id
WHERE l.id > 8;

-- 36. List donors who made clothing donations at least twice
SELECT donor_name
FROM donations
WHERE donation_category = 'Clothing'
GROUP BY donor_name
HAVING COUNT(*) >= 2;

-- 37. List donation categories not having any pending status
SELECT DISTINCT donation_category
FROM donations
WHERE donation_category NOT IN (
    SELECT DISTINCT donation_category
    FROM donations
    WHERE status = 'Pending'
);

-- 38. List all donations and include a column showing location name even if location is missing
SELECT d.*, l.location_name
FROM donations d
LEFT JOIN locations l ON d.location_id = l.id;

-- 39. Show donor names who donated in the same location more than once
SELECT donor_name, location_id
FROM donations
GROUP BY donor_name, location_id
HAVING COUNT(*) > 1;

-- 40. Donations with a location in Maharashtra (assumes state column in locations)
SELECT d.*
FROM donations d
JOIN locations l ON d.location_id = l.id
WHERE l.state = 'Maharashtra';

-- Advanced Functions, Cascades, Aggregates
-- 41. Round the amount to the nearest hundred
SELECT id, donor_name, ROUND(amount, -2) AS rounded_amount
FROM donations;

-- 42. Donations ranked by amount
SELECT id, donor_name, amount,
RANK() OVER (ORDER BY amount DESC) AS rank_by_amount
FROM donations;

-- 43. Donations with payment mode frequency (window function)
SELECT id, donor_name, mode_of_payment,
COUNT(*) OVER (PARTITION BY mode_of_payment) AS payment_mode_count
FROM donations;

-- 44. Extract year and month from donation_date
SELECT id, donor_name,
YEAR(donation_date) AS year_donated,
MONTH(donation_date) AS month_donated
FROM donations;

-- 45. Get unique donation statuses
SELECT DISTINCT status FROM donations;

-- 46. Donations with length of remarks
SELECT id, donor_name, LENGTH(remarks) AS remarks_length
FROM donations;

-- 47. Donations that fall on weekends
SELECT * FROM donations
WHERE DAYOFWEEK(donation_date) IN (1, 7);

-- 48. Donations sorted by payment method and then by amount
SELECT * FROM donations
ORDER BY mode_of_payment, amount DESC;

-- 49. Donations that have document reference starting with 'DOC-DN01'
SELECT * FROM donations
WHERE document_reference LIKE 'DOC-DN01%';

-- 50. Total donations and average per location
SELECT location_id, COUNT(*) AS total_donations, AVG(amount) AS avg_donation
FROM donations
GROUP BY location_id;

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

-- ✅ 1. DDL: Alter to add constraints (for CASCADE demo later)
ALTER TABLE media_coverage
ADD CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ✅ 2. DDL: Add foreign key to locations
ALTER TABLE media_coverage
ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ✅ 3. DDL: Add foreign key to officers
ALTER TABLE media_coverage
ADD CONSTRAINT fk_officer FOREIGN KEY (officer_id) REFERENCES officers(id) ON DELETE SET NULL;

-- ✅ 4. DQL: Select all records
SELECT * FROM media_coverage;

-- ✅ 5. DQL: Filter by media type
SELECT * FROM media_coverage WHERE media_type = 'Video';

-- ✅ 6. DQL: Use ORDER BY
SELECT * FROM media_coverage ORDER BY date_published DESC;

-- ✅ 7. DQL: Use LIKE operator
SELECT * FROM media_coverage WHERE title LIKE '%Cyclone%';

-- ✅ 8. DQL: Use BETWEEN for date filtering
SELECT * FROM media_coverage WHERE date_published BETWEEN '2025-05-01' AND '2025-06-30';

-- ✅ 9. DQL: Count articles
SELECT COUNT(*) AS article_count FROM media_coverage WHERE media_type = 'Article';

-- ✅ 10. DQL: Group by media_type
SELECT media_type, COUNT(*) AS total FROM media_coverage GROUP BY media_type;

-- ✅ 11. DQL: Alias usage
SELECT title AS "Media Title", source AS "Published By" FROM media_coverage;

-- ✅ 12. DQL: Use IN clause
SELECT * FROM media_coverage WHERE media_type IN ('Article', 'Video');

-- ✅ 13. DQL: Use IS NOT NULL
SELECT * FROM media_coverage WHERE url IS NOT NULL;

-- ✅ 14. DQL: Length function
SELECT title, LENGTH(summary) AS summary_length FROM media_coverage;

-- ✅ 15. DQL: Substring usage
SELECT title, SUBSTRING(summary FROM 1 FOR 30) AS short_summary FROM media_coverage;

-- ✅ 16. DQL: DISTINCT values
SELECT DISTINCT source FROM media_coverage;

-- ✅ 17. DQL: Aggregate max date
SELECT MAX(date_published) AS latest_coverage FROM media_coverage;

-- ✅ 18. DQL: Aggregate min date
SELECT MIN(date_published) AS earliest_coverage FROM media_coverage;

-- ✅ 19. DML: Insert new record
INSERT INTO media_coverage VALUES (21, 'Firestorm Report', 'Video', '2025-07-01', 'Crisis TV', 'http://example.com/firestorm', 'Widespread fire', 20, 320, 320);

-- ✅ 20. DML: Update a title
UPDATE media_coverage SET title = 'Monsoon Flood Disaster' WHERE id = 1;

-- ✅ 21. DML: Delete record
DELETE FROM media_coverage WHERE id = 21;

-- ✅ 22. Subquery: Get recent 5 entries
SELECT *
FROM media_coverage
WHERE date_published >= (
  SELECT DATE_SUB(MAX(date_published), INTERVAL 30 DAY)
  FROM media_coverage
);

-- ✅ 23. Subquery: Sources with multiple entries
SELECT source FROM media_coverage GROUP BY source HAVING COUNT(*) > 1;

-- ✅ 24. Subquery: Title of most recent article
SELECT title FROM media_coverage WHERE date_published = (SELECT MAX(date_published) FROM media_coverage);

-- ✅ 25. JOIN with officers
SELECT m.title, o.name AS officer_name
FROM media_coverage m
JOIN officers o ON m.officer_id = o.id;

-- ✅ 26. JOIN with locations
SELECT m.title, l.name AS location_name
FROM media_coverage m
JOIN locations l ON m.location_id = l.id;

-- ✅ 27. JOIN with events
SELECT m.title, e.name AS event_name
FROM media_coverage m
JOIN events e ON m.event_id = e.id;

-- ✅ 28. JOIN with all foreign keys
SELECT m.title, e.name AS event_name, l.name AS location_name, o.name AS officer_name
FROM media_coverage m
JOIN events e ON m.event_id = e.id
JOIN locations l ON m.location_id = l.id
JOIN officers o ON m.officer_id = o.id;

-- ✅ 29. DQL: Use CASE
SELECT title, 
  CASE WHEN media_type = 'Video' THEN '🎥 Video'
       ELSE '📰 Article' END AS type_icon
FROM media_coverage;

-- ✅ 30. DQL: Filter by year
SELECT * FROM media_coverage WHERE EXTRACT(YEAR FROM date_published) = 2025;

-- ✅ 31. DQL: Use COALESCE
SELECT title, COALESCE(url, 'No URL Provided') AS full_url FROM media_coverage;

-- ✅ 32. DQL: Use NULLIF
SELECT title, NULLIF(url, '') AS cleaned_url FROM media_coverage;

-- ✅ 33. Use POSITION
SELECT title, POSITION('Flood' IN summary) AS flood_pos FROM media_coverage;

-- ✅ 34. Use INITCAP
SELECT INITCAP(title) AS title_case FROM media_coverage;

-- ✅ 35. Use TRIM
SELECT TRIM(summary) AS trimmed_summary FROM media_coverage;

-- ✅ 36. Use CHAR_LENGTH
SELECT title, CHAR_LENGTH(summary) AS summary_chars FROM media_coverage;

-- ✅ 37. Use CONCAT
SELECT CONCAT(title, ' - ', source) AS full_title FROM media_coverage;

-- ✅ 38. Use LEFT function
SELECT LEFT(summary, 40) AS intro_summary FROM media_coverage;

-- ✅ 39. Use RIGHT function
SELECT RIGHT(summary, 20) AS summary_tail FROM media_coverage;

--  40. Use NOW
SELECT NOW() 'current_timestamp'; -- This is also valid

-- 41. Use CURRENT_DATE
SELECT CURRENT_DATE AS today;

--  42. Filter videos only from 2025
SELECT * FROM media_coverage WHERE media_type = 'Video' AND EXTRACT(YEAR FROM date_published) = 2025;

--  43. Boolean operator usage
SELECT * FROM media_coverage WHERE media_type = 'Video' AND officer_id = 306;

--  44. NOT LIKE
SELECT * FROM media_coverage WHERE title NOT LIKE '%Storm%';

--  45. BETWEEN with event IDs
SELECT * FROM media_coverage WHERE event_id BETWEEN 10 AND 15;

-- ✅ 46. ORDER BY media_type, date_published
SELECT * FROM media_coverage ORDER BY media_type, date_published;

-- ✅ 47. DDL: Drop table (commented for safety)
-- DROP TABLE media_coverage;

--  ✅ 48. Create index
CREATE INDEX idx_media_type ON media_coverage(media_type);

-- ✅  49. Composite index
CREATE INDEX idx_event_location ON media_coverage(event_id, location_id);

-- ✅  50. DDL: Rename column
ALTER TABLE media_coverage RENAME COLUMN summary TO coverage_summary;


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

-- 1. DDL: Add a new column for media_type
ALTER TABLE media_coverage
ADD COLUMN media_type VARCHAR(50);

-- 2. DDL: Modify column type for title to support longer text
ALTER TABLE media_coverage
MODIFY COLUMN title VARCHAR(255);

-- 3. DDL: Drop an unnecessary column (example)
ALTER TABLE media_coverage
DROP COLUMN media_type;

-- 4. DDL: Add foreign key with ON DELETE CASCADE and ON UPDATE CASCADE
ALTER TABLE media_coverage
ADD CONSTRAINT fk_officer_id
FOREIGN KEY (officer_id) REFERENCES government_officers(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 5. DML: Insert a new media coverage entry
INSERT INTO media_coverage (id, title, coverage_date, media_outlet, content_summary, event_id, officer_id, location_id)
VALUES (21, 'Post-Relief Initiative', '2025-07-15', 'Zee News', 'Post-disaster measures praised.', 9, 305, 3);


-- 6. DML: Update media outlet name for accuracy
UPDATE media_coverage
SET media_outlet = 'Zee Business'
WHERE id = 21;

-- 7. DML: Delete entries with a specific media_outlet
DELETE FROM media_coverage
WHERE media_outlet = 'Local Weekly';

-- 8. DQL: Select all entries covered by 'Times of India'
SELECT *
FROM media_coverage
WHERE media_outlet = 'Times of India';


-- 9. DQL: Count media coverage entries per media outle
SELECT media_outlet, COUNT(*) AS total_reports
FROM media_coverage
GROUP BY media_outlet;

-- 10. DQL: Retrieve the latest media coverage report
SELECT *
FROM media_coverage
ORDER BY coverage_date DESC
LIMIT 1;

-- 11. DQL: Get all coverages with the word 'Flood' in title (using LIKE operator)
SELECT *
FROM media_coverage
WHERE title LIKE '%Flood%';

-- 12. DQL: Get reports between two specific dates (BETWEEN clause)
SELECT *
FROM media_coverage
WHERE coverage_date BETWEEN '2025-06-01' AND '2025-06-30';


-- 13. DQL: Get distinct media outlets covered in June 2025
SELECT DISTINCT media_outlet
FROM media_coverage
WHERE MONTH(coverage_date) = 6 AND YEAR(coverage_date) = 2025;

-- 14. DQL: Use alias to shorten output column names
SELECT id AS report_id, title AS headline, media_outlet AS source
FROM media_coverage;

-- 15. Function: Get length of content summary for each report
SELECT id, LENGTH(content_summary) AS summary_length
FROM media_coverage;

-- 16. Function: Uppercase all titles for standardization
SELECT id, UPPER(title) AS uppercase_title
FROM media_coverage;

-- 17. Function: Concatenate title and media outlet
SELECT CONCAT(title, ' - ', media_outlet) AS full_title
FROM media_coverage;


-- 18. Subquery: Get reports related to events covered after 2025-06-10
SELECT *
FROM media_coverage
WHERE event_id IN (
    SELECT id FROM disaster_events WHERE event_date > '2025-06-10'
);


-- 19. Subquery: Get reports from officers who handled more than 1 event
SELECT *
FROM media_coverage
WHERE officer_id IN (
    SELECT officer_id
    FROM media_coverage
    GROUP BY officer_id
    HAVING COUNT(*) > 1
);

-- 20. Subquery: Title and location for reports related to Maharashtra
SELECT title
FROM media_coverage
WHERE location_id IN (
    SELECT id FROM locations WHERE state = 'Maharashtra'
);

-- 21. Join: Get coverage with officer names
SELECT mc.title, go.name AS officer_name
FROM media_coverage mc
JOIN government_officers go ON mc.officer_id = go.id;


-- 22. Join: Combine event title and media outlet info
SELECT mc.title, de.event_type, mc.media_outlet
FROM media_coverage mc
JOIN disaster_events de ON mc.event_id = de.id;

-- 23. Join with alias and WHERE clause to filter by state
SELECT mc.title, l.state
FROM media_coverage mc
JOIN locations l ON mc.location_id = l.id
WHERE l.state = 'Rajasthan';

-- 24. Multi-table Join: Officer name, event type, media outlet
SELECT mc.title, go.name AS officer_name, de.event_type, mc.media_outlet
FROM media_coverage mc
JOIN government_officers go ON mc.officer_id = go.id
JOIN disaster_events de ON mc.event_id = de.id;


-- 25. Join and filter by officers who belong to a certain department (subquery join)
SELECT mc.*
FROM media_coverage mc
JOIN government_officers go ON mc.officer_id = go.id
WHERE go.department = 'Disaster Management';


-- 26. Add index for faster media outlet search
CREATE INDEX idx_media_outlet ON media_coverage(media_outlet);


-- 27. Add check constraint to ensure non-empty title
ALTER TABLE media_coverage
ADD CONSTRAINT chk_title_non_empty CHECK (title <> '');


-- 28. Conditional filter: coverage not from 'TOI' or 'Zee News'
SELECT *
FROM media_coverage
WHERE media_outlet NOT IN ('Times of India', 'Zee News');


-- 29. DQL: All coverages sorted by media outlet alphabetically
SELECT * FROM media_coverage
ORDER BY media_outlet ASC;


-- 30. Group by officer ID and count total coverages
SELECT officer_id, COUNT(*) AS report_count
FROM media_coverage
GROUP BY officer_id;

-- 31. Get coverage done in July 2025 only
SELECT *
FROM media_coverage
WHERE MONTH(coverage_date) = 7 AND YEAR(coverage_date) = 2025;


-- 32. Find reports with short summaries (< 50 characters)
SELECT *
FROM media_coverage
WHERE LENGTH(content_summary) < 50;

-- 33. Use CASE to label reports based on content length
SELECT id, title,
       CASE
           WHEN LENGTH(content_summary) > 100 THEN 'Detailed'
           ELSE 'Brief'
       END AS report_type
FROM media_coverage;


-- 34. Calculate average summary length per media outlet
SELECT media_outlet, AVG(LENGTH(content_summary)) AS avg_summary_length
FROM media_coverage
GROUP BY media_outlet;


-- 35. Find events with no media coverage using NOT EXISTS
SELECT *
FROM disaster_events de
WHERE NOT EXISTS (
    SELECT 1 FROM media_coverage mc WHERE mc.event_id = de.id
);


-- 36. Set officer_id to NULL where officer has left
UPDATE media_coverage
SET officer_id = NULL
WHERE officer_id IN (
    SELECT id FROM government_officers WHERE status = 'Inactive'
);

-- 37. Rename table for clarity
RENAME TABLE media_coverage TO media_coverage_reports;


-- 38. Rename column back and revert table name
RENAME TABLE media_coverage_reports TO media_coverage;

-- 39. Delete all reports related to a specific event using cascade
DELETE FROM disaster_events
WHERE id = 5; -- Media coverage for this event will also be deleted if FK CASCADE is set

-- 40. Remove coverages older than a specific date 
DELETE FROM media_coverage
WHERE coverage_date < '2025-06-01';

-- 41. Use IS NULL to find reports with no assigned officer
SELECT *
FROM media_coverage
WHERE officer_id IS NULL;

-- 42. Use NOW() to find recent updates (assuming coverage_date is updated) 
SELECT *
FROM media_coverage
WHERE coverage_date >= CURDATE() - INTERVAL 7 DAY;

-- 43. Count of coverages per location using JOIN
SELECT l.state, COUNT(mc.id) AS total_reports
FROM media_coverage mc
JOIN locations l ON mc.location_id = l.id
GROUP BY l.state;

-- 44. Total coverages grouped by officer and outlet
SELECT officer_id, media_outlet, COUNT(*) AS report_count
FROM media_coverage
GROUP BY officer_id, media_outlet;

-- 45. Check how many times a media outlet has repeated a headline
SELECT title, media_outlet, COUNT(*) AS freq
FROM media_coverage
GROUP BY title, media_outlet
HAVING COUNT(*) > 1;

-- 46. Retrieve coverage titles with officer names using JOIN
SELECT mc.title, go.name
FROM media_coverage mc
JOIN government_officers go ON mc.officer_id = go.id;

-- 47. Create view for simplified media reporting
CREATE VIEW view_media_summary AS
SELECT title, coverage_date, media_outlet FROM media_coverage;

-- 48. Drop view created
DROP VIEW view_media_summary;

-- 49. Use IN clause to find specific events covered
SELECT *
FROM media_coverage
WHERE event_id IN (2, 5, 7);

-- 50. Use LIMIT to preview top 5 reports
SELECT *
FROM media_coverage
ORDER BY coverage_date DESC
LIMIT 5;


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

-- 1. Create the transportation_logs table with cascading constraints
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
    document_reference VARCHAR(100),
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Add a column for fuel type
ALTER TABLE transportation_logs ADD COLUMN fuel_type VARCHAR(20);

-- 3. Rename status to trip_status
ALTER TABLE transportation_logs RENAME COLUMN status TO trip_status;

-- 4. Change column type of remarks to VARCHAR
ALTER TABLE transportation_logs MODIFY remarks VARCHAR(255);

-- 5. Drop the fuel_type column
ALTER TABLE transportation_logs DROP COLUMN fuel_type;

-- 6. Insert a new log
INSERT INTO transportation_logs (id, vehicle_number, driver_name, purpose, date_of_use, route, trip_status, location_id, officer_id, remarks, document_reference)
VALUES (21, 'MH15ZZ9999', 'Sonal Mehta', 'Food delivery', '2025-06-21', 'Mumbai–Goa', 'InTransit', 15, 321, '', 'DOC-T021');

-- 7. Update trip_status to Completed for specific route
UPDATE transportation_logs SET trip_status = 'Completed' WHERE route = 'Pune–Satara';

-- 8. Mark trips with flat tire as Cancelled
UPDATE transportation_logs SET trip_status = 'Cancelled' WHERE remarks LIKE '%flat tire%';

-- 9. Delete all cancelled trips
DELETE FROM transportation_logs WHERE trip_status = 'Cancelled';

-- 10. Insert multiple entries
INSERT INTO transportation_logs (id, vehicle_number, driver_name, purpose, date_of_use, route, trip_status, location_id, officer_id, remarks, document_reference)
VALUES
(22, 'MH15YY1111', 'Rohit Sen', 'Fuel refill', '2025-06-22', 'Nashik–Mumbai', 'Completed', 12, 322, '', 'DOC-T022'),
(23, 'MH15XX2222', 'Leela Krishnan', 'Camp setup', '2025-06-23', 'Mumbai–Pune', 'Completed', 14, 323, '', 'DOC-T023');

-- 11. Update remarks for a specific vehicle
UPDATE transportation_logs SET remarks = 'Driver replaced' WHERE vehicle_number = 'MH14EF5678';

-- 12. Update officer_id for rerouted delivery
UPDATE transportation_logs SET officer_id = 305 WHERE id = 3;

-- 13. Delete trips older than 30 days
DELETE FROM transportation_logs WHERE date_of_use < CURRENT_DATE - INTERVAL 30 DAY;

-- 14. Insert trip with NULL remarks
INSERT INTO transportation_logs (id, vehicle_number, driver_name, purpose, date_of_use, route, trip_status, location_id, officer_id, remarks, document_reference)
VALUES (24, 'MH16AB0001', 'Nidhi Verma', 'Fuel delivery', '2025-06-24', 'Goa–Mumbai', 'Completed', 16, 324, NULL, 'DOC-T024');

-- 15. Set remarks to 'Needs check' where status is InTransit
UPDATE transportation_logs SET remarks = 'Needs check' WHERE trip_status = 'InTransit';

-- 16. Select all completed trips
SELECT * FROM transportation_logs WHERE trip_status = 'Completed';

-- 17. List trips after June 10, 2025
SELECT * FROM transportation_logs WHERE date_of_use > '2025-06-10';

-- 18. Count trips per trip_status
SELECT trip_status, COUNT(*) AS total FROM transportation_logs GROUP BY trip_status;

-- 19. Show trips with formatted date and aliases
SELECT id AS trip_id, driver_name, DATE_FORMAT(date_of_use, '%d-%M-%Y') AS use_date FROM transportation_logs;

-- 20. Trips containing "transport" in purpose
SELECT * FROM transportation_logs WHERE LOWER(purpose) LIKE '%transport%';

-- 21. Count per driver
SELECT driver_name, COUNT(*) AS trip_count FROM transportation_logs GROUP BY driver_name;

-- 22. Trips with no remarks
SELECT * FROM transportation_logs WHERE remarks IS NULL OR remarks = '';

-- 23. Trips that are either Completed or InTransit
SELECT * FROM transportation_logs WHERE trip_status IN ('Completed', 'InTransit');

-- 24. Completed trips sorted by date
SELECT * FROM transportation_logs WHERE trip_status = 'Completed' ORDER BY date_of_use DESC;

-- 25. Last 5 trips
SELECT * FROM transportation_logs ORDER BY date_of_use DESC LIMIT 5;

-- 26. Trips between June 5 and June 15
SELECT * FROM transportation_logs WHERE date_of_use BETWEEN '2025-06-05' AND '2025-06-15';

-- 27. Exclude certain vehicles
SELECT * FROM transportation_logs WHERE vehicle_number NOT IN ('MH14AB1234', 'MH14BC2345');

-- 28. Officer trip count
SELECT officer_id, COUNT(*) AS trip_count FROM transportation_logs GROUP BY officer_id;

-- 29. Use LENGTH to find detailed remarks
SELECT * FROM transportation_logs WHERE LENGTH(remarks) > 20;

-- 30. Combine route with status
SELECT CONCAT(route, ' [', trip_status, ']') AS trip_summary FROM transportation_logs;

-- 31. Join with officers for names
SELECT t.id, t.purpose, g.name AS officer_name FROM transportation_logs t JOIN government_officers g ON t.officer_id = g.id;

-- 32. Join with locations for district
SELECT t.id, t.purpose, l.district FROM transportation_logs t JOIN locations l ON t.location_id = l.id;

-- 33. Subquery: trips by top 5 drivers
SELECT * FROM transportation_logs WHERE driver_name IN (
  SELECT driver_name FROM (
    SELECT driver_name, COUNT(*) FROM transportation_logs GROUP BY driver_name ORDER BY COUNT(*) DESC LIMIT 5
  ) AS top_drivers
);

-- 34. Trips in locations where flood occurred
SELECT * FROM transportation_logs WHERE location_id IN (
  SELECT id FROM locations WHERE hazard_type = 'Flood'
);

-- 35. Join with both officers and locations
SELECT t.id, g.name AS officer, l.district, t.trip_status FROM transportation_logs t JOIN government_officers g ON t.officer_id = g.id JOIN locations l ON t.location_id = l.id;

-- 36. Get latest trip
SELECT * FROM transportation_logs WHERE date_of_use = (SELECT MAX(date_of_use) FROM transportation_logs);

-- 37. Trips handled by officers from Pune
SELECT t.* FROM transportation_logs t JOIN government_officers g ON t.officer_id = g.id WHERE g.posting_location = 'Pune';

-- 38. Join with NGOs for coordination
SELECT t.id, t.purpose, n.ngo_name FROM transportation_logs t JOIN locations l ON t.location_id = l.id JOIN ngo_partners n ON l.id = n.location_id;

-- 39. Count trips per officer with join
SELECT g.name, COUNT(t.id) AS trip_count FROM government_officers g LEFT JOIN transportation_logs t ON t.officer_id = g.id GROUP BY g.name;

-- 40. Get officer contact for each trip
SELECT t.id, t.purpose, g.phone_number FROM transportation_logs t JOIN government_officers g ON t.officer_id = g.id;

-- 41. View for in-transit trips
CREATE VIEW in_transit_trips AS SELECT * FROM transportation_logs WHERE trip_status = 'InTransit';

-- 42. Trips older than 2 weeks
SELECT * FROM transportation_logs WHERE date_of_use < CURRENT_DATE - INTERVAL 14 DAY;

-- 43. Earliest trip per driver
SELECT driver_name, MIN(date_of_use) AS first_trip FROM transportation_logs GROUP BY driver_name;

-- 44. Replace NULL remarks
SELECT id, COALESCE(remarks, 'No remarks') AS clean_remarks FROM transportation_logs;

-- 45. Apply ON DELETE CASCADE again
ALTER TABLE transportation_logs ADD CONSTRAINT fk_officer FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 46. Total trips
SELECT COUNT(*) AS total_trips FROM transportation_logs;

-- 47. Drivers who drove more than once
SELECT driver_name FROM transportation_logs GROUP BY driver_name HAVING COUNT(*) > 1;

-- 48. Most frequent route
SELECT route, COUNT(*) AS count FROM transportation_logs GROUP BY route ORDER BY count DESC LIMIT 1;

-- 49. Officer trips summary
SELECT officer_id, MIN(date_of_use) AS first, MAX(date_of_use) AS last FROM transportation_logs GROUP BY officer_id;

-- 50. Longest remarks trip
SELECT * FROM transportation_logs ORDER BY LENGTH(remarks) DESC LIMIT 1;


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

-- 1. Create the volunteer_registrations table with foreign key constraint to locations
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
    status VARCHAR(20),
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Add a column for language proficiency
ALTER TABLE volunteer_registrations ADD COLUMN languages VARCHAR(100);

-- 3. Rename column contact_number to phone
ALTER TABLE volunteer_registrations RENAME COLUMN contact_number TO phone;

-- 4. Modify column phone to accommodate international format
ALTER TABLE volunteer_registrations MODIFY phone VARCHAR(20);

-- 5. Drop the newly added languages column
ALTER TABLE volunteer_registrations DROP COLUMN languages;

-- 6. Insert a new volunteer
INSERT INTO volunteer_registrations (id, name, age, gender, skills, phone, email, location_id, registration_date, status)
VALUES (21, 'Tanvi Agarwal', 27, 'Female', 'First Aid, Food Distribution', '+919123460021', 'tanvi.agarwal@example.com', 11, '2025-06-21', 'Active');

-- 7. Update volunteer status
UPDATE volunteer_registrations SET status = 'Inactive' WHERE id = 3;

-- 8. Delete a volunteer by ID
DELETE FROM volunteer_registrations WHERE id = 5;

-- 9. Select all active volunteers
SELECT * FROM volunteer_registrations WHERE status = 'Active';

-- 10. Count number of volunteers per status
SELECT status, COUNT(*) AS total FROM volunteer_registrations GROUP BY status;

-- 11. Find average age of volunteers
SELECT AVG(age) AS avg_age FROM volunteer_registrations;

-- 12. List female volunteers sorted by registration date
SELECT name, registration_date FROM volunteer_registrations WHERE gender = 'Female' ORDER BY registration_date;

-- 13. Find the youngest volunteer
SELECT * FROM volunteer_registrations ORDER BY age ASC LIMIT 1;

-- 14. Get volunteers from location_id 7
SELECT * FROM volunteer_registrations WHERE location_id = 7;

-- 15. Find volunteers who registered after June 10
SELECT * FROM volunteer_registrations WHERE registration_date > '2025-06-10';

-- 16. Find volunteers with 'Medical' in their skills
SELECT * FROM volunteer_registrations WHERE skills LIKE '%Medical%';

-- 17. Use alias for better readability
SELECT name AS VolunteerName, skills AS Expertise FROM volunteer_registrations;

-- 18. Volunteers grouped by gender
SELECT gender, COUNT(*) AS total FROM volunteer_registrations GROUP BY gender;

-- 19. Volunteers older than 30
SELECT * FROM volunteer_registrations WHERE age > 30;

-- 20. Volunteers between age 25 and 35
SELECT * FROM volunteer_registrations WHERE age BETWEEN 25 AND 35;

-- 21. Volunteers not yet active
SELECT * FROM volunteer_registrations WHERE status <> 'Active';

-- 22. Volunteers with NULL remarks (if any column were nullable)
-- SELECT * FROM volunteer_registrations WHERE remarks IS NULL; -- skipped, column not present

-- 23. Volunteers registered in the first week of June
SELECT * FROM volunteer_registrations WHERE registration_date BETWEEN '2025-06-01' AND '2025-06-07';

-- 24. Total volunteers per location
SELECT location_id, COUNT(*) AS volunteer_count FROM volunteer_registrations GROUP BY location_id;

-- 25. Find duplicate emails (if any)
SELECT email, COUNT(*) FROM volunteer_registrations GROUP BY email HAVING COUNT(*) > 1;

-- 26. Join with locations table to get location name (assumes locations table exists)
SELECT v.name, l.name AS location_name FROM volunteer_registrations v
JOIN locations l ON v.location_id = l.id;

-- 27. Find volunteers without Gmail accounts
SELECT * FROM volunteer_registrations WHERE email NOT LIKE '%gmail.com';

-- 28. List volunteers whose names start with 'A'
SELECT * FROM volunteer_registrations WHERE name LIKE 'A%';

-- 29. Get volunteers ordered by age descending
SELECT * FROM volunteer_registrations ORDER BY age DESC;

-- 30. Subquery: Get volunteers from location with max registrations
SELECT * FROM volunteer_registrations
WHERE location_id = (
    SELECT location_id FROM volunteer_registrations
    GROUP BY location_id ORDER BY COUNT(*) DESC LIMIT 1
);

-- 31. Volunteers registered on even-numbered days
SELECT * FROM volunteer_registrations WHERE MOD(DAY(registration_date), 2) = 0;

-- 32. Extract domain from email using string function
SELECT name, SUBSTRING_INDEX(email, '@', -1) AS email_domain FROM volunteer_registrations;

-- 33. Volunteers whose age is a prime number (example logic, approximate)
SELECT * FROM volunteer_registrations WHERE age IN (23, 29, 31, 37);

-- 34. Grouping volunteers by skill (non-normalized)
SELECT skills, COUNT(*) AS skill_group_count FROM volunteer_registrations GROUP BY skills;

-- 35. Volunteers whose names contain a vowel twice
SELECT * FROM volunteer_registrations WHERE name REGEXP '([aeiouAEIOU].*){2,}';

-- 36. Find longest skill description
SELECT name, LENGTH(skills) AS skill_length FROM volunteer_registrations ORDER BY skill_length DESC LIMIT 1;

-- 37. Replace domain in email from example.com to relief.org
SELECT name, REPLACE(email, 'example.com', 'relief.org') AS new_email FROM volunteer_registrations;

-- 38. Format phone number with dashes
SELECT name, CONCAT(SUBSTR(phone,1,5), '-', SUBSTR(phone,6)) AS formatted_phone FROM volunteer_registrations;

-- 39. Volunteers with 'Aid' in skills
SELECT * FROM volunteer_registrations WHERE skills LIKE '%Aid%';

-- 40. Volunteers with more than 1 skill (naive check)
SELECT * FROM volunteer_registrations WHERE skills LIKE '%,%';

-- 41. Volunteers with name ending in 'a'
SELECT * FROM volunteer_registrations WHERE name LIKE '%a';

-- 42. Add new skill to an existing volunteer (string concat)
UPDATE volunteer_registrations SET skills = CONCAT(skills, ', Emergency Response') WHERE id = 1;

-- 43. Volunteers aged 25, 30 or 35
SELECT * FROM volunteer_registrations WHERE age IN (25, 30, 35);

-- 44. Average age per gender
SELECT gender, AVG(age) AS avg_age FROM volunteer_registrations GROUP BY gender;

-- 45. Volunteers whose phone starts with '91234'
SELECT * FROM volunteer_registrations WHERE phone LIKE '91234%';

-- 46. First 5 registered volunteers
SELECT * FROM volunteer_registrations ORDER BY registration_date ASC LIMIT 5;

-- 47. Check for volunteers missing '@' in email
SELECT * FROM volunteer_registrations WHERE email NOT LIKE '%@%';

-- 48. Get registration month from date
SELECT name, MONTH(registration_date) AS reg_month FROM volunteer_registrations;

-- 49. Number of registrations per day
SELECT registration_date, COUNT(*) FROM volunteer_registrations GROUP BY registration_date;

-- 50. Total count of volunteers
SELECT COUNT(*) AS total_volunteers FROM volunteer_registrations;


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

-- 1. Create the resource_requests table with cascading foreign keys
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
    document_reference VARCHAR(100),
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officer_id) REFERENCES government_officers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Add column for priority
ALTER TABLE resource_requests ADD COLUMN priority VARCHAR(10);

-- 3. Rename column status to request_status
ALTER TABLE resource_requests RENAME COLUMN status TO request_status;

-- 4. Modify remarks column to VARCHAR
ALTER TABLE resource_requests MODIFY remarks VARCHAR(255);

-- 5. Drop the priority column
ALTER TABLE resource_requests DROP COLUMN priority;

-- 6. Insert a new resource request
INSERT INTO resource_requests (id, program_id, item_required, quantity, request_date, request_status, location_id, officer_id, remarks, document_reference)
VALUES (21, 21, 'First Aid Kits', 70, '2025-06-21', 'Approved', 11, 321, '', 'DOC-RR021');

-- 7. Update status for pending requests
UPDATE resource_requests SET request_status = 'Approved' WHERE request_status = 'Pending';

-- 8. Delete requests older than June 5, 2025
DELETE FROM resource_requests WHERE request_date < '2025-06-05';

-- 9. Select all approved requests
SELECT * FROM resource_requests WHERE request_status = 'Approved';

-- 10. Select item and quantity where quantity > 100
SELECT item_required, quantity FROM resource_requests WHERE quantity > 100;

-- 11. Alias example with sorting
SELECT item_required AS item, quantity AS qty FROM resource_requests ORDER BY qty DESC;

-- 12. Get count of approved vs pending
SELECT request_status, COUNT(*) AS total FROM resource_requests GROUP BY request_status;

-- 13. Total quantity requested
SELECT SUM(quantity) AS total_quantity FROM resource_requests;

-- 14. Average quantity per item
SELECT item_required, AVG(quantity) AS avg_qty FROM resource_requests GROUP BY item_required;

-- 15. Request count per officer
SELECT officer_id, COUNT(*) AS request_count FROM resource_requests GROUP BY officer_id;

-- 16. Requests between two dates
SELECT * FROM resource_requests WHERE request_date BETWEEN '2025-06-10' AND '2025-06-20';

-- 17. Find items with 'kit' in name
SELECT * FROM resource_requests WHERE item_required LIKE '%Kit%';

-- 18. Subquery: officers with >1 request
SELECT * FROM resource_requests WHERE officer_id IN (
    SELECT officer_id FROM resource_requests GROUP BY officer_id HAVING COUNT(*) > 1
);

-- 19. Join with locations
SELECT rr.id, rr.item_required, l.name AS location_name FROM resource_requests rr
JOIN locations l ON rr.location_id = l.id;

-- 20. Join with officers
SELECT rr.id, rr.item_required, go.name AS officer_name FROM resource_requests rr
JOIN government_officers go ON rr.officer_id = go.id;

-- 21. Join with training_programs (assuming program_id links)
SELECT rr.id, rr.item_required, tp.program_name FROM resource_requests rr
JOIN training_programs tp ON rr.program_id = tp.id;

-- 22. Count by location
SELECT location_id, COUNT(*) FROM resource_requests GROUP BY location_id;

-- 23. Filter by NULL remarks
SELECT * FROM resource_requests WHERE remarks IS NULL OR remarks = '';

-- 24. Using IN operator
SELECT * FROM resource_requests WHERE item_required IN ('Tents', 'Water Filters');

-- 25. Using NOT IN operator
SELECT * FROM resource_requests WHERE item_required NOT IN ('Tents', 'Water Filters');

-- 26. Using EXISTS (with subquery)
SELECT * FROM resource_requests rr
WHERE EXISTS (SELECT 1 FROM government_officers go WHERE go.id = rr.officer_id);

-- 27. Using CASE
SELECT id, item_required, 
    CASE 
        WHEN quantity >= 100 THEN 'High'
        WHEN quantity >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS demand_level
FROM resource_requests;

-- 28. Find most recent request
SELECT * FROM resource_requests ORDER BY request_date DESC LIMIT 1;

-- 29. Total items by officer
SELECT officer_id, SUM(quantity) AS total_quantity FROM resource_requests GROUP BY officer_id;

-- 30. Use COALESCE
SELECT id, COALESCE(remarks, 'No remarks') AS comments FROM resource_requests;

-- 31. Filter using multiple AND conditions
SELECT * FROM resource_requests WHERE quantity > 50 AND request_status = 'Approved';

-- 32. Use of OR
SELECT * FROM resource_requests WHERE item_required = 'Tents' OR item_required = 'Blankets';

-- 33. NOT operator
SELECT * FROM resource_requests WHERE NOT item_required = 'Blankets';

-- 34. Join with programs with alias
SELECT rr.id, rr.item_required, tp.program_name FROM resource_requests rr
JOIN training_programs tp ON rr.program_id = tp.id;

-- 35. Subquery for top quantity
SELECT * FROM resource_requests WHERE quantity = (
    SELECT MAX(quantity) FROM resource_requests
);

-- 36. Nested subquery: officer with highest quantity
SELECT * FROM government_officers WHERE id = (
    SELECT officer_id FROM resource_requests ORDER BY quantity DESC LIMIT 1
);

-- 37. Substring extraction
SELECT id, SUBSTRING(document_reference, 5, 3) AS doc_code FROM resource_requests;

-- 38. Date difference
SELECT id, DATEDIFF(CURDATE(), request_date) AS days_passed FROM resource_requests;

-- 39. Concatenation of item and quantity
SELECT CONCAT(item_required, ' - ', quantity) AS item_details FROM resource_requests;

-- 40. ROUND average quantity
SELECT ROUND(AVG(quantity), 2) AS avg_quantity FROM resource_requests;

-- 41. LIMIT and OFFSET
SELECT * FROM resource_requests LIMIT 5 OFFSET 10;

-- 42. Group by item and status
SELECT item_required, request_status, COUNT(*) FROM resource_requests GROUP BY item_required, request_status;

-- 43. HAVING clause
SELECT officer_id, COUNT(*) AS reqs FROM resource_requests GROUP BY officer_id HAVING reqs > 2;

-- 44. CASE in ORDER BY
SELECT * FROM resource_requests ORDER BY 
    CASE request_status 
        WHEN 'Pending' THEN 1 
        WHEN 'Approved' THEN 2 
        ELSE 3 
    END;

-- 45. INSTR function to find keyword
SELECT * FROM resource_requests WHERE INSTR(item_required, 'Water') > 0;

-- 46. LENGTH of item_required
SELECT id, LENGTH(item_required) AS item_length FROM resource_requests;

-- 47. REPLACE text in remarks
SELECT id, REPLACE(remarks, 'N/A', 'Not Applicable') AS updated_remarks FROM resource_requests;

-- 48. UPPER + LOWER
SELECT UPPER(item_required) AS upper_item, LOWER(document_reference) AS lower_ref FROM resource_requests;

-- 49. Using IFNULL
SELECT id, IFNULL(remarks, 'None Provided') AS notes FROM resource_requests;

-- 50. Update quantity with a subquery multiplier
UPDATE resource_requests SET quantity = quantity * 2 
WHERE item_required IN (SELECT item_required FROM resource_requests WHERE quantity < 50);


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
    
    -- 1. Create the Budget_Allocation table
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

-- 2. Insert new allocation (DML)
INSERT INTO Budget_Allocation (department_name, fiscal_year, allocated_amount, used_amount, remaining_amount, approved_by, approval_date, remarks, status)
VALUES ('Women & Child Development', 2025, 900000.00, 500000.00, 400000.00, 'Lalita Kumari', '2025-06-01', 'Childcare initiatives', 'Pending');

-- 3. Select all approved allocations (DQL)
SELECT * FROM Budget_Allocation WHERE status = 'Approved';

-- 4. Select allocations using aliases
SELECT department_name AS Dept, allocated_amount AS "Allocated", used_amount AS "Used" FROM Budget_Allocation;

-- 5. Find departments with remaining budget greater than 500000
SELECT department_name FROM Budget_Allocation WHERE remaining_amount > 500000;

-- 6. Find allocations where used amount is greater than remaining
SELECT * FROM Budget_Allocation WHERE used_amount > remaining_amount;

-- 7. Order departments by allocated amount descending
SELECT department_name, allocated_amount FROM Budget_Allocation ORDER BY allocated_amount DESC;

-- 8. Aggregate total allocation for 2025
SELECT SUM(allocated_amount) AS Total_Allocation_2025 FROM Budget_Allocation WHERE fiscal_year = 2025;

-- 9. Find departments with partial use (used < allocated)
SELECT department_name FROM Budget_Allocation WHERE used_amount < allocated_amount;

-- 10. Group allocations by status
SELECT status, COUNT(*) AS Total FROM Budget_Allocation GROUP BY status;

-- 11. Update remarks for a specific department
UPDATE Budget_Allocation SET remarks = 'Updated for Q2 review' WHERE department_name = 'Health';

-- 12. Set status to 'Approved' where remaining > 0 and status = 'Pending'
UPDATE Budget_Allocation SET status = 'Approved' WHERE remaining_amount > 0 AND status = 'Pending';

-- 13. Delete allocations with 0 used amount
DELETE FROM Budget_Allocation WHERE used_amount = 0;

-- 14. Select departments approved by a specific officer
SELECT department_name FROM Budget_Allocation WHERE approved_by = 'Bipul Pathak';

-- 15. Use BETWEEN to find mid-range budgets
SELECT department_name FROM Budget_Allocation WHERE allocated_amount BETWEEN 700000 AND 1500000;

-- 16. Use LIKE to find departments starting with 'U'
SELECT department_name FROM Budget_Allocation WHERE department_name LIKE 'U%';

-- 17. Use IN clause
SELECT department_name FROM Budget_Allocation WHERE department_name IN ('Health', 'Education', 'Transport');

-- 18. Use NOT IN clause
SELECT department_name FROM Budget_Allocation WHERE department_name NOT IN ('Health', 'Education', 'Transport');

-- 19. Use IS NULL to check empty remarks
SELECT department_name FROM Budget_Allocation WHERE remarks IS NULL;

-- 20. Use COALESCE for remarks
SELECT department_name, COALESCE(remarks, 'No remarks') FROM Budget_Allocation;

-- 21. Add foreign key to link to departments table
ALTER TABLE Budget_Allocation ADD CONSTRAINT fk_department FOREIGN KEY (department_name) REFERENCES departments(name) ON DELETE CASCADE ON UPDATE CASCADE;

-- 22. Count departments with exact 600000 remaining
SELECT COUNT(*) FROM Budget_Allocation WHERE remaining_amount = 600000;

-- 23. Get max allocated budget
SELECT MAX(allocated_amount) AS Max_Allocated FROM Budget_Allocation;

-- 24. Get min used budget
SELECT MIN(used_amount) AS Min_Used FROM Budget_Allocation;

-- 25. Calculate average used amount
SELECT AVG(used_amount) AS Avg_Used FROM Budget_Allocation;

-- 26. Truncate table (DML)
-- TRUNCATE TABLE Budget_Allocation;

-- 27. Rename table
-- RENAME TABLE Budget_Allocation TO Budget_Details;

-- 28. Rename column
-- ALTER TABLE Budget_Allocation CHANGE COLUMN approved_by approved_by_name VARCHAR(100);

-- 29. Add new column for category
ALTER TABLE Budget_Allocation ADD COLUMN category VARCHAR(50);

-- 30. Update category
UPDATE Budget_Allocation SET category = 'Infrastructure' WHERE department_name = 'Urban Development';

-- 31. Subquery to find highest budget department
SELECT department_name FROM Budget_Allocation WHERE allocated_amount = (SELECT MAX(allocated_amount) FROM Budget_Allocation);

-- 32. Subquery with EXISTS
SELECT * FROM Budget_Allocation A WHERE EXISTS (SELECT 1 FROM Budget_Allocation B WHERE B.allocated_amount > A.allocated_amount);

-- 33. Show top 5 allocations
SELECT * FROM Budget_Allocation ORDER BY allocated_amount DESC LIMIT 5;

-- 34. Show allocations approved in April 2025
SELECT * FROM Budget_Allocation WHERE MONTH(approval_date) = 4 AND YEAR(approval_date) = 2025;

-- 35. Show pending allocations
SELECT * FROM Budget_Allocation WHERE status = 'Pending';

-- 36. Find departments where over 50% of budget is used
SELECT department_name FROM Budget_Allocation WHERE used_amount > 0.5 * allocated_amount;

-- 37. Add constraint for non-negative amounts
ALTER TABLE Budget_Allocation ADD CONSTRAINT chk_non_negative_amounts CHECK (allocated_amount >= 0 AND used_amount >= 0 AND remaining_amount >= 0);

-- 38. Drop a constraint (if needed)
-- ALTER TABLE Budget_Allocation DROP CHECK chk_non_negative_amounts;

-- 39. Add a default value for remarks
ALTER TABLE Budget_Allocation ALTER COLUMN remarks SET DEFAULT 'No remarks';

-- 40. Select using DATE_FORMAT
SELECT department_name, DATE_FORMAT(approval_date, '%d-%m-%Y') AS formatted_date FROM Budget_Allocation;

-- 41. Round off used amounts
SELECT department_name, ROUND(used_amount, 0) FROM Budget_Allocation;

-- 42. Get fiscal year with most allocations
SELECT fiscal_year, COUNT(*) FROM Budget_Allocation GROUP BY fiscal_year ORDER BY COUNT(*) DESC LIMIT 1;

-- 43. Use CASE statement to create usage status
SELECT department_name, 
  CASE 
    WHEN used_amount >= allocated_amount THEN 'Fully Utilized'
    WHEN used_amount = 0 THEN 'Unused'
    ELSE 'Partially Used'
  END AS usage_status
FROM Budget_Allocation;

-- 44. Use CHAR_LENGTH to get remarks length
SELECT department_name, CHAR_LENGTH(remarks) AS remarks_length FROM Budget_Allocation;

-- 45. Use IFNULL to replace NULL in approved_by
SELECT department_name, IFNULL(approved_by, 'Not Yet Approved') FROM Budget_Allocation;

-- 46. Add unique constraint on department-year pair
ALTER TABLE Budget_Allocation ADD CONSTRAINT uq_department_year UNIQUE (department_name, fiscal_year);

-- 47. Backup budget allocations into a new table
CREATE TABLE Budget_Allocation_Backup AS SELECT * FROM Budget_Allocation;

-- 48. Create a view for active allocations
CREATE VIEW Active_Allocations AS SELECT * FROM Budget_Allocation WHERE status = 'Approved';

-- 49. Join with departments table (assume it exists)
SELECT b.department_name, d.head_name FROM Budget_Allocation b JOIN departments d ON b.department_name = d.name;

-- 50. Create index on fiscal_year
CREATE INDEX idx_fiscal_year ON Budget_Allocation(fiscal_year);
