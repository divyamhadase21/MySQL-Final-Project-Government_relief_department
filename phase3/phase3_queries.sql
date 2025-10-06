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
    
    -- 1. Select all citizens
SELECT * FROM citizens;

-- 2. Select only name and status
SELECT name, status FROM citizens;

-- 3. Count total citizens
SELECT COUNT(*) AS total_citizens FROM citizens;

-- 4. List unique statuses
SELECT DISTINCT status FROM citizens;

-- 5. Show name and birth year
SELECT name, YEAR(date_of_birth) AS birth_year FROM citizens;

-- 6. List only female citizens
SELECT * FROM citizens WHERE gender = 'Female';

-- 7. Citizens born after 1990
SELECT * FROM citizens WHERE date_of_birth > '1990-01-01';

-- 8. Citizens with "Active" status
SELECT name, status FROM citizens WHERE status = 'Active';

-- 9. Citizens with names starting with 'A'
SELECT * FROM citizens WHERE name LIKE 'A%';

-- 11. Citizens ordered by name
SELECT * FROM citizens ORDER BY name ASC;

-- 12. Citizens ordered by registration date
SELECT * FROM citizens ORDER BY registration_date DESC;

-- 14. Male citizens in descending ID order
SELECT * FROM citizens WHERE gender = 'Male' ORDER BY id DESC;

-- 15. Citizens ordered by status then name
SELECT * FROM citizens ORDER BY status, name;

-- 16. Citizens born between 1980 and 1990
SELECT * FROM citizens WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';

-- 17. Citizens with status Active or Suspended
SELECT * FROM citizens WHERE status IN ('Active', 'Suspended');

-- 18. Citizens whose address contains 'Nashik'
SELECT * FROM citizens WHERE address LIKE '%Nashik%';

-- 19. Active citizens with contact number starting with '91234'
SELECT * FROM citizens WHERE status='Active' AND contact_number LIKE '91234%';

-- 20. Count of inactive citizens
SELECT COUNT(*) AS inactive_count FROM citizens WHERE status = 'Inactive';

-- 21. Count citizens grouped by gender
SELECT gender, COUNT(*) AS total FROM citizens GROUP BY gender;

-- 22. Count citizens by status
SELECT status, COUNT(*) AS total FROM citizens GROUP BY status;

-- 23. Find youngest and oldest birth dates
SELECT MAX(date_of_birth) AS youngest, MIN(date_of_birth) AS oldest FROM citizens;

-- 24. Average age of citizens
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age FROM citizens;

-- 25. Count of citizens per location
SELECT location_id, COUNT(*) AS residents FROM citizens GROUP BY location_id;

CREATE TABLE locations (
   location_id INT PRIMARY KEY,
   city_name VARCHAR(50),
   state_name VARCHAR(50)
);

INSERT INTO locations VALUES
(101, 'Mumbai', 'Maharashtra'),
(102, 'Pune', 'Maharashtra'),
(103, 'Nagpur', 'Maharashtra'),
(104, 'Nashik', 'Maharashtra'),
(105, 'Aurangabad', 'Maharashtra'),
(106, 'Thane', 'Maharashtra'),
(107, 'Kolhapur', 'Maharashtra'),
(108, 'Ahmednagar', 'Maharashtra'),
(109, 'Latur', 'Maharashtra'),
(110, 'Solapur', 'Maharashtra');

-- 26. Show citizens with their city name
SELECT c.name, l.city_name FROM citizens c
JOIN locations l ON c.location_id = l.location_id;

-- 27. Citizens with locations (left join)
SELECT c.name, l.city_name FROM citizens c
LEFT JOIN locations l ON c.location_id = l.location_id;

-- 28. Cities with residents count
SELECT l.city_name, COUNT(c.id) AS total_residents
FROM locations l
LEFT JOIN citizens c ON l.location_id = c.location_id
GROUP BY l.city_name;

-- 29. Citizens living in Pune
SELECT c.name, l.city_name FROM citizens c
JOIN locations l ON c.location_id = l.location_id
WHERE l.city_name = 'Pune';

-- 30. Citizens grouped by state
SELECT l.state_name, COUNT(c.id) AS total_residents
FROM citizens c
JOIN locations l ON c.location_id = l.location_id
GROUP BY l.state_name;

-- 31. Citizens in same location as 'Priya Singh'
SELECT * FROM citizens
WHERE location_id = (SELECT location_id FROM citizens WHERE name='Priya Singh');

-- 32. Citizens who are not active
SELECT * FROM citizens WHERE id NOT IN 
(SELECT id FROM citizens WHERE status='Active');

-- 33. Citizen with earliest registration
SELECT * FROM citizens WHERE registration_date = 
(SELECT MIN(registration_date) FROM citizens);

-- 34. Locations with more than 1 citizen
SELECT location_id FROM citizens
GROUP BY location_id HAVING COUNT(*) > 1;

-- 35. Citizens from those busy locations
SELECT * FROM citizens WHERE location_id IN 
(SELECT location_id FROM citizens GROUP BY location_id HAVING COUNT(*) > 1);


-- 36. Uppercase names
SELECT UPPER(name) AS upper_name FROM citizens;

-- 37. Lowercase names
SELECT LOWER(name) AS lower_name FROM citizens;

-- 38. Name length
SELECT name, LEN(name) AS name_length FROM citizens;

-- 39. Age of each citizen
SELECT name, DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age FROM citizens;

-- 40. Registration month
SELECT name, FORMAT(registration_date, 'MMMM yyyy') AS registered_month FROM citizens;

-- 41. Row number partitioned by gender
SELECT name, gender,
ROW_NUMBER() OVER (PARTITION BY gender ORDER BY date_of_birth) AS row_num
FROM citizens;

-- 42. Rank citizens by birthdate (oldest first)
SELECT name, RANK() OVER (ORDER BY date_of_birth ASC) AS age_rank FROM citizens;

-- 43. Dense rank citizens by registration date
SELECT name, DENSE_RANK() OVER (ORDER BY registration_date ASC) AS reg_rank
FROM citizens;

-- 44. Count of citizens per status (window function)
SELECT name, status, COUNT(*) OVER (PARTITION BY status) AS total_in_status
FROM citizens;

-- 45. Previous registration date (LAG)
SELECT name, registration_date,
LAG(registration_date) OVER (ORDER BY registration_date) AS previous_reg
FROM citizens;

-- 47. Use the UDF
SELECT name, dbo.fn_GetAge(date_of_birth) AS age FROM citizens;

-- 48. Combine name and national_id
SELECT CONCAT(name, ' - ', national_id) AS identity FROM citizens;

-- 49. Replace "St" with "Street" in address
SELECT REPLACE(address, 'St', 'Street') AS full_address FROM citizens;

-- 50. Show only first 5 characters of name
SELECT name, SUBSTRING(name, 1, 5) AS short_name FROM citizens;

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
    
    -- 1. Select all programs
SELECT * FROM relief_programs;

-- 2. Show only program names and status
SELECT name, status FROM relief_programs;

-- 3. Count total programs
SELECT COUNT(*) AS total_programs FROM relief_programs;

-- 4. List unique categories
SELECT DISTINCT category FROM relief_programs;

-- 5. Show program and its start year
SELECT name, YEAR(start_date) AS start_year FROM relief_programs;

-- 6. Programs that are currently Active
SELECT * FROM relief_programs WHERE status = 'Active';

-- 7. Programs planned but not started yet
SELECT * FROM relief_programs WHERE status = 'Planned';

-- 8. Programs that were completed
SELECT * FROM relief_programs WHERE status = 'Completed';

-- 9. Programs starting after April 2025
SELECT * FROM relief_programs WHERE start_date > '2025-04-01';

-- 10. Earliest program to start
SELECT TOP 1 * FROM relief_programs ORDER BY start_date ASC;

-- 11. Programs ordered by name
SELECT * FROM relief_programs ORDER BY name ASC;

-- 12. Programs ordered by start date
SELECT * FROM relief_programs ORDER BY start_date DESC;

-- 13. Top 5 most recently added programs
SELECT TOP 5 * FROM relief_programs ORDER BY id DESC;

-- 14. Active programs ordered by end date
SELECT * FROM relief_programs WHERE status='Active' ORDER BY end_date;

-- 15. Programs ordered by category then status
SELECT * FROM relief_programs ORDER BY category, status;

-- 16. Programs that start between Feb and Apr 2025
SELECT * FROM relief_programs WHERE start_date BETWEEN '2025-02-01' AND '2025-04-30';

-- 17. Programs in categories Health or Education
SELECT * FROM relief_programs WHERE category IN ('Health','Education');

-- 18. Programs with names containing 'Aid'
SELECT * FROM relief_programs WHERE name LIKE '%Aid%';

-- 19. Planned programs starting in May
SELECT * FROM relief_programs WHERE status='Planned' AND MONTH(start_date)=5;

-- 20. Count of completed programs
SELECT COUNT(*) AS completed_count FROM relief_programs WHERE status='Completed';

-- 21. Count programs by category
SELECT category, COUNT(*) AS total FROM relief_programs GROUP BY category;

-- 22. Count programs by status
SELECT status, COUNT(*) AS total FROM relief_programs GROUP BY status;

-- 23. Find max and min duration (days) of programs
SELECT MAX(DATEDIFF(DAY, start_date, end_date)) AS max_days,
       MIN(DATEDIFF(DAY, start_date, end_date)) AS min_days
FROM relief_programs;

-- 24. Average duration of programs
SELECT AVG(DATEDIFF(DAY, start_date, end_date)) AS avg_duration FROM relief_programs;

-- 25. Count programs per officer
SELECT officer_id, COUNT(*) AS total FROM relief_programs GROUP BY officer_id;

CREATE TABLE locations (
   location_id INT PRIMARY KEY,
   city_name VARCHAR(50),
   state_name VARCHAR(50)
);

INSERT INTO locations VALUES
(201,'Mumbai','Maharashtra'),
(202,'Pune','Maharashtra'),
(203,'Nagpur','Maharashtra'),
(204,'Nashik','Maharashtra'),
(205,'Aurangabad','Maharashtra'),
(206,'Thane','Maharashtra'),
(207,'Kolhapur','Maharashtra'),
(208,'Ahmednagar','Maharashtra'),
(209,'Latur','Maharashtra'),
(210,'Solapur','Maharashtra');

-- 26. Show program names with their city
SELECT r.name, l.city_name FROM relief_programs r
JOIN locations l ON r.location_id = l.location_id;

-- 27. Programs with city name (left join)
SELECT r.name, l.city_name FROM relief_programs r
LEFT JOIN locations l ON r.location_id = l.location_id;

-- 28. Cities with count of programs
SELECT l.city_name, COUNT(r.id) AS program_count
FROM locations l
LEFT JOIN relief_programs r ON l.location_id = r.location_id
GROUP BY l.city_name;

-- 29. Programs running in Pune
SELECT r.name, l.city_name FROM relief_programs r
JOIN locations l ON r.location_id = l.location_id
WHERE l.city_name = 'Pune';

-- 30. Programs grouped by state
SELECT l.state_name, COUNT(r.id) AS total_programs
FROM relief_programs r
JOIN locations l ON r.location_id = l.location_id
GROUP BY l.state_name;

-- 31. Programs in same city as 'Medical Camp Support'
SELECT * FROM relief_programs
WHERE location_id = (SELECT location_id FROM relief_programs WHERE name='Medical Camp Support');

-- 32. Programs not Active
SELECT * FROM relief_programs WHERE id NOT IN
(SELECT id FROM relief_programs WHERE status='Active');

-- 33. Program with earliest end date
SELECT * FROM relief_programs WHERE end_date =
(SELECT MIN(end_date) FROM relief_programs);

-- 34. Officers handling more than 1 program
SELECT officer_id FROM relief_programs
GROUP BY officer_id HAVING COUNT(*) > 1;

-- 35. Programs handled by those busy officers
SELECT * FROM relief_programs WHERE officer_id IN
(SELECT officer_id FROM relief_programs GROUP BY officer_id HAVING COUNT(*) > 1);

-- 36. Uppercase program names
SELECT UPPER(name) AS upper_name FROM relief_programs;

-- 37. Lowercase program names
SELECT LOWER(name) AS lower_name FROM relief_programs;

-- 38. Length of program name
SELECT name, LEN(name) AS name_length FROM relief_programs;

-- 39. Duration of each program in days
SELECT name, DATEDIFF(DAY, start_date, end_date) AS duration_days FROM relief_programs;

-- 40. Program start month in text
SELECT name, FORMAT(start_date,'MMMM yyyy') AS start_month FROM relief_programs;

-- 41. Row number partitioned by category
SELECT name, category,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY start_date) AS row_num
FROM relief_programs;

-- 42. Rank programs by start date
SELECT name, RANK() OVER (ORDER BY start_date ASC) AS rank_by_start FROM relief_programs;

-- 43. Dense rank programs by end date
SELECT name, DENSE_RANK() OVER (ORDER BY end_date ASC) AS dense_rank_end FROM relief_programs;

-- 44. Count of programs per status (window)
SELECT name, status, COUNT(*) OVER (PARTITION BY status) AS total_in_status
FROM relief_programs;

-- 45. Previous program start date (LAG)
SELECT name, start_date,
LAG(start_date) OVER (ORDER BY start_date) AS previous_program
FROM relief_programs;

-- 47. Use the UDF
SELECT name, dbo.fn_ProgramDuration(start_date, end_date) AS duration_days FROM relief_programs;

-- 48. Combine program name and document reference
SELECT CONCAT(name,' - ',document_reference) AS program_doc FROM relief_programs;

-- 49. Replace 'Aid' with 'Support' in names
SELECT REPLACE(name,'Aid','Support') AS updated_name FROM relief_programs;

-- 50. Show first 6 characters of each program name
SELECT name, SUBSTRING(name,1,6) AS short_name FROM relief_programs;



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
    
    -- 1. Get all disaster events
SELECT * FROM disaster_events;

-- 2. Get only 'Flood' events
SELECT * FROM disaster_events WHERE event_type = 'Flood';

-- 3. Get events with severity 'Critical'
SELECT name, severity_level FROM disaster_events WHERE severity_level = 'Critical';

-- 4. Get active events in 2025
SELECT * FROM disaster_events WHERE status = 'Active' AND YEAR(start_date) = 2025;

-- 5. Order events by start_date
SELECT * FROM disaster_events ORDER BY start_date ASC;

-- 6. Find unique disaster types
SELECT DISTINCT event_type FROM disaster_events;

-- 7. Count number of 'Resolved' disasters
SELECT COUNT(*) AS resolved_events FROM disaster_events WHERE status = 'Resolved';

-- 8. Get events that lasted more than 5 days
SELECT id, name, DATEDIFF(end_date, start_date) AS duration_days
FROM disaster_events
WHERE DATEDIFF(end_date, start_date) > 5;

-- 9. Get top 3 most recent events
SELECT * FROM disaster_events ORDER BY start_date DESC LIMIT 3;

-- 10. Search disasters with 'Flood' in name
SELECT * FROM disaster_events WHERE name LIKE '%Flood%';

-- 11. Count events by type
SELECT event_type, COUNT(*) AS total_events
FROM disaster_events
GROUP BY event_type;

-- 12. Count events by severity
SELECT severity_level, COUNT(*) AS total FROM disaster_events GROUP BY severity_level;

-- 13. Find max duration event
SELECT name, MAX(DATEDIFF(end_date, start_date)) AS longest_duration
FROM disaster_events;

-- 14. Find earliest disaster in records
SELECT MIN(start_date) AS first_event FROM disaster_events;

-- 15. Average duration of 'Flood' events
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_days
FROM disaster_events WHERE event_type = 'Flood';

-- 16. Events per year
SELECT YEAR(start_date) AS year, COUNT(*) AS total_events
FROM disaster_events GROUP BY YEAR(start_date);

-- 17. Count of active vs resolved
SELECT status, COUNT(*) FROM disaster_events GROUP BY status;

-- 18. Total events in each location
SELECT location_id, COUNT(*) AS total FROM disaster_events GROUP BY location_id;

-- 19. Severity distribution per disaster type
SELECT event_type, severity_level, COUNT(*) 
FROM disaster_events 
GROUP BY event_type, severity_level;

-- 20. Average duration per event type
SELECT event_type, AVG(DATEDIFF(end_date, start_date)) AS avg_days
FROM disaster_events GROUP BY event_type;

-- 21. Join disaster events with relief programs by location
SELECT d.name AS disaster, r.name AS program, r.status
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id;

-- 22. Join citizens with disaster events by location
SELECT c.name AS citizen, d.name AS disaster, d.severity_level
FROM citizens c
JOIN disaster_events d ON c.location_id = d.location_id;

-- 23. Find disasters and related relief program categories
SELECT d.name AS disaster, r.category 
FROM disaster_events d
LEFT JOIN relief_programs r ON d.location_id = r.location_id;

-- 24. Active disasters with active relief programs
SELECT d.name AS disaster, r.name AS relief_program
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id
WHERE d.status = 'Active' AND r.status = 'Active';

-- 25. Citizens affected by floods
SELECT c.name, c.address, d.name AS flood_event
FROM citizens c
JOIN disaster_events d ON c.location_id = d.location_id
WHERE d.event_type = 'Flood';

-- 26. Match disasters with relief documents
SELECT d.name, r.document_reference 
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id;

-- 27. List disasters and officers handling relief
SELECT d.name, r.officer_id 
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id;

-- 28. Number of citizens in disaster areas
SELECT d.name, COUNT(c.id) AS affected_citizens
FROM disaster_events d
JOIN citizens c ON d.location_id = c.location_id
GROUP BY d.name;

-- 29. Disasters without matching relief programs
SELECT d.name 
FROM disaster_events d
LEFT JOIN relief_programs r ON d.location_id = r.location_id
WHERE r.id IS NULL;

-- 30. Join all three tables
SELECT d.name AS disaster, r.name AS relief_program, c.name AS citizen
FROM disaster_events d
JOIN relief_programs r ON d.location_id = r.location_id
JOIN citizens c ON c.location_id = d.location_id;

-- 31. Disasters longer than avg duration
SELECT * FROM disaster_events
WHERE DATEDIFF(end_date, start_date) > (
    SELECT AVG(DATEDIFF(end_date, start_date)) FROM disaster_events
);

-- 32. Disasters in locations with more than 2 citizens
SELECT * FROM disaster_events
WHERE location_id IN (
    SELECT location_id FROM citizens GROUP BY location_id HAVING COUNT(*) > 2
);

-- 33. Disasters with matching relief programs
SELECT name FROM disaster_events
WHERE location_id IN (SELECT location_id FROM relief_programs);

-- 34. Citizen names living in flood-affected areas
SELECT name FROM citizens
WHERE location_id IN (SELECT location_id FROM disaster_events WHERE event_type = 'Flood');

-- 35. Get most recent disaster
SELECT * FROM disaster_events
WHERE start_date = (SELECT MAX(start_date) FROM disaster_events);

-- 36. Events in same location as 'Cyclone Mira'
SELECT * FROM disaster_events
WHERE location_id = (SELECT location_id FROM disaster_events WHERE name = 'Cyclone Mira');

-- 37. Count of programs per disaster location
SELECT location_id, COUNT(*) FROM relief_programs
WHERE location_id IN (SELECT location_id FROM disaster_events)
GROUP BY location_id;

-- 38. Citizens in critical disaster zones
SELECT * FROM citizens
WHERE location_id IN (SELECT location_id FROM disaster_events WHERE severity_level = 'Critical');

-- 39. Relief programs related to most recent disaster
SELECT * FROM relief_programs
WHERE location_id IN (
    SELECT location_id FROM disaster_events ORDER BY start_date DESC LIMIT 1
);

-- 40. List disasters without citizens
SELECT * FROM disaster_events
WHERE location_id NOT IN (SELECT location_id FROM citizens);

-- 41. Convert disaster names to uppercase
SELECT UPPER(name) FROM disaster_events;

-- 42. Find length of disaster descriptions
SELECT name, LENGTH(description) AS desc_length FROM disaster_events;

-- 43. Format disaster start date
SELECT name, DATE_FORMAT(start_date, '%d-%M-%Y') AS formatted_date FROM disaster_events;

-- 44. Replace 'Flood' with 'Water Disaster' in names
SELECT REPLACE(name, 'Flood', 'Water Disaster') FROM disaster_events;

-- 45. Round average duration of disasters
SELECT ROUND(AVG(DATEDIFF(end_date, start_date)), 0) AS avg_duration FROM disaster_events;

-- 46. Create UDF to calculate duration of disaster
DELIMITER //
CREATE FUNCTION disaster_duration(start_date DATE, end_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(end_date, start_date);
END //
DELIMITER ;

-- 47. Use UDF to show duration
SELECT name, disaster_duration(start_date, end_date) AS duration_days
FROM disaster_events;

-- 48. Create UDF to classify severity in short form
DELIMITER //
CREATE FUNCTION severity_code(severity VARCHAR(20))
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
  IF severity = 'Critical' THEN RETURN 'CR';
  ELSEIF severity = 'High' THEN RETURN 'HI';
  ELSEIF severity = 'Medium' THEN RETURN 'MD';
  ELSE RETURN 'LO';
  END IF;
END //
DELIMITER ;

-- 49. Use severity_code UDF
SELECT name, severity_level, severity_code(severity_level) AS severity_short
FROM disaster_events;

-- 50. Create UDF to check if disaster is active
DELIMITER //
CREATE FUNCTION is_active(status VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF status = 'Active' THEN RETURN 'YES';
  ELSE RETURN 'NO';
  END IF;
END //
DELIMITER ;

-- Use it
SELECT name, is_active(status) AS currently_active FROM disaster_events;




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

-- 1. Show all fund allocations
SELECT * FROM fund_allocations;

-- 2. Show only ongoing allocations
SELECT * FROM fund_allocations WHERE status = 'Ongoing';

-- 3. Show planned allocations greater than 300000
SELECT * FROM fund_allocations WHERE status = 'Planned' AND amount_allocated > 300000;

-- 4. Get allocation details for program_id = 5
SELECT * FROM fund_allocations WHERE program_id = 5;

-- 5. Order allocations by amount allocated (descending)
SELECT * FROM fund_allocations ORDER BY amount_allocated DESC;

-- 6. Get unique fiscal years
SELECT DISTINCT fiscal_year FROM fund_allocations;

-- 7. Count completed fund allocations
SELECT COUNT(*) AS completed_projects FROM fund_allocations WHERE status = 'Completed';

-- 8. Show allocations with unspent funds
SELECT id, program_id, (amount_allocated - amount_spent) AS unspent
FROM fund_allocations WHERE amount_spent < amount_allocated;

-- 9. Find top 3 largest allocations
SELECT * FROM fund_allocations ORDER BY amount_allocated DESC LIMIT 3;

-- 10. Search remarks containing 'Education'
SELECT * FROM fund_allocations WHERE remarks LIKE '%Education%';

-- 11. Total allocated amount across all programs
SELECT SUM(amount_allocated) AS total_allocated FROM fund_allocations;

-- 12. Total spent amount across all programs
SELECT SUM(amount_spent) AS total_spent FROM fund_allocations;

-- 13. Average allocated fund
SELECT AVG(amount_allocated) AS avg_allocated FROM fund_allocations;

-- 14. Count funds by status
SELECT status, COUNT(*) AS total FROM fund_allocations GROUP BY status;

-- 15. Max fund allocation
SELECT MAX(amount_allocated) AS max_allocation FROM fund_allocations;

-- 16. Min spent allocation
SELECT MIN(amount_spent) AS min_spent FROM fund_allocations;

-- 17. Average utilization percentage per year
SELECT fiscal_year, AVG(amount_spent/amount_allocated*100) AS avg_utilization
FROM fund_allocations GROUP BY fiscal_year;

-- 18. Count programs handled by each officer
SELECT officer_id, COUNT(*) AS total FROM fund_allocations GROUP BY officer_id;

-- 19. Total allocated per year
SELECT fiscal_year, SUM(amount_allocated) FROM fund_allocations GROUP BY fiscal_year;

-- 20. Total spent vs allocated
SELECT SUM(amount_allocated) AS total_allocated, SUM(amount_spent) AS total_spent
FROM fund_allocations;

-- 21. Join fund allocations with relief program names
SELECT f.id, r.name, f.amount_allocated, f.status
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id;

-- 22. Show only completed programs with fund details
SELECT r.name, f.amount_allocated, f.amount_spent
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id
WHERE f.status = 'Completed';

-- 23. Get programs where fund spent < 50% allocated
SELECT r.name, f.amount_allocated, f.amount_spent
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id
WHERE f.amount_spent < (f.amount_allocated/2);

-- 24. Find officer handling most funds
SELECT officer_id, SUM(amount_allocated) AS total_alloc
FROM fund_allocations GROUP BY officer_id ORDER BY total_alloc DESC LIMIT 1;

-- 25. Match relief categories with funds
SELECT r.category, SUM(f.amount_allocated) AS total_alloc
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id
GROUP BY r.category;

-- 26. Active relief programs with ongoing funds
SELECT r.name, f.amount_allocated
FROM relief_programs r
JOIN fund_allocations f ON r.id = f.program_id
WHERE r.status = 'Active' AND f.status = 'Ongoing';

-- 27. Planned relief with planned funds
SELECT r.name, f.amount_allocated
FROM relief_programs r
JOIN fund_allocations f ON r.id = f.program_id
WHERE f.status = 'Planned';

-- 28. Join to see utilization %
SELECT r.name, ROUND((f.amount_spent/f.amount_allocated)*100,2) AS utilization_percent
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id;

-- 29. Programs and funds for officer 105
SELECT r.name, f.amount_allocated, f.status
FROM fund_allocations f
JOIN relief_programs r ON r.id = f.program_id
WHERE f.officer_id = 105;

-- 30. Programs without any fund allocation
SELECT r.name 
FROM relief_programs r
LEFT JOIN fund_allocations f ON r.id = f.program_id
WHERE f.id IS NULL;

-- 31. Funds higher than avg allocated
SELECT * FROM fund_allocations
WHERE amount_allocated > (SELECT AVG(amount_allocated) FROM fund_allocations);

-- 32. Programs with completed fund allocation
SELECT name FROM relief_programs
WHERE id IN (SELECT program_id FROM fund_allocations WHERE status = 'Completed');

-- 33. Officers managing > 2 funds
SELECT officer_id FROM fund_allocations
GROUP BY officer_id HAVING COUNT(*) > 2;

-- 34. Fund with maximum spending
SELECT * FROM fund_allocations
WHERE amount_spent = (SELECT MAX(amount_spent) FROM fund_allocations);

-- 35. Find allocations of same officer as program_id = 1
SELECT * FROM fund_allocations
WHERE officer_id = (SELECT officer_id FROM fund_allocations WHERE program_id = 1);

-- 36. Relief with funds in 2024-25
SELECT name FROM relief_programs
WHERE id IN (SELECT program_id FROM fund_allocations WHERE fiscal_year = '2024-25');

-- 37. Programs that spent entire allocation
SELECT program_id FROM fund_allocations
WHERE amount_spent = amount_allocated;

-- 38. Funds belonging to 'Financial' programs
SELECT * FROM fund_allocations
WHERE program_id IN (SELECT id FROM relief_programs WHERE category = 'Financial');

-- 39. Highest allocation in each fiscal year
SELECT * FROM fund_allocations f
WHERE amount_allocated = (
    SELECT MAX(amount_allocated) FROM fund_allocations WHERE fiscal_year = f.fiscal_year
);

-- 40. Allocations not linked to any active relief
SELECT * FROM fund_allocations
WHERE program_id NOT IN (SELECT id FROM relief_programs WHERE status = 'Active');

-- 41. Convert remarks to uppercase
SELECT UPPER(remarks) FROM fund_allocations;

-- 42. Get length of remarks
SELECT id, LENGTH(remarks) AS remark_length FROM fund_allocations;

-- 43. Format date_created
SELECT id, DATE_FORMAT(date_created, '%d-%M-%Y') AS formatted_date FROM fund_allocations;

-- 44. Replace 'Completed' with 'Done'
SELECT REPLACE(status, 'Completed', 'Done') AS new_status FROM fund_allocations;

-- 45. Round utilization to nearest integer
SELECT id, ROUND((amount_spent/amount_allocated)*100,0) AS utilization
FROM fund_allocations;

-- 46. UDF to calculate unspent balance
DELIMITER //
CREATE FUNCTION unspent_balance(alloc DECIMAL(12,2), spent DECIMAL(12,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  RETURN alloc - spent;
END //
DELIMITER ;

-- 47. Use unspent_balance
SELECT id, unspent_balance(amount_allocated, amount_spent) AS balance
FROM fund_allocations;

-- 48. UDF to check if fully utilized
DELIMITER //
CREATE FUNCTION is_fully_utilized(alloc DECIMAL(12,2), spent DECIMAL(12,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF alloc = spent THEN RETURN 'YES';
  ELSE RETURN 'NO';
  END IF;
END //
DELIMITER ;

-- 49. Use is_fully_utilized
SELECT id, is_fully_utilized(amount_allocated, amount_spent) AS fully_used
FROM fund_allocations;

-- 50. UDF to classify fund status
DELIMITER //
CREATE FUNCTION fund_category(util DECIMAL(12,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF util = 100 THEN RETURN 'Fully Utilized';
  ELSEIF util >= 75 THEN RETURN 'Well Utilized';
  ELSEIF util >= 50 THEN RETURN 'Moderate';
  ELSE RETURN 'Poor Utilization';
  END IF;
END //
DELIMITER ;

-- Apply fund_category
SELECT id, fund_category(ROUND((amount_spent/amount_allocated)*100,2)) AS category
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
    
    -- 1. Show all aid distributions
SELECT * FROM aid_distribution;

-- 2. Show only pending aid distributions
SELECT * FROM aid_distribution WHERE status = 'Pending';

-- 3. Aid distributed on June 5, 2025
SELECT * FROM aid_distribution WHERE distribution_date = '2025-06-05';

-- 4. All aid given to citizen_id 1001
SELECT * FROM aid_distribution WHERE citizen_id = 1001;

-- 5. Total quantity delivered of ‘Rice bags’
SELECT SUM(quantity) FROM aid_distribution WHERE item_description LIKE '%Rice%';

-- 6. Distinct officers involved in aid distribution
SELECT DISTINCT officer_id FROM aid_distribution;

-- 7. Citizens who received more than 100 items
SELECT citizen_id, SUM(quantity) AS total_items
FROM aid_distribution GROUP BY citizen_id HAVING SUM(quantity) > 100;

-- 8. Order aid distributions by quantity (descending)
SELECT * FROM aid_distribution ORDER BY quantity DESC;

-- 9. Get top 3 highest quantity aid distributions
SELECT * FROM aid_distribution ORDER BY quantity DESC LIMIT 3;

-- 10. Find aid with remarks mentioning "urgent"
SELECT * FROM aid_distribution WHERE remarks LIKE '%urgent%';

-- 11. Count total aid distributions
SELECT COUNT(*) AS total_records FROM aid_distribution;

-- 12. Count delivered vs pending
SELECT status, COUNT(*) AS total FROM aid_distribution GROUP BY status;

-- 13. Total aid delivered by officer 301
SELECT officer_id, SUM(quantity) AS total_quantity
FROM aid_distribution WHERE officer_id = 301 GROUP BY officer_id;

-- 14. Average quantity distributed
SELECT AVG(quantity) AS avg_quantity FROM aid_distribution;

-- 15. Maximum items given in a single distribution
SELECT MAX(quantity) AS max_quantity FROM aid_distribution;

-- 16. Minimum items given in a single distribution
SELECT MIN(quantity) AS min_quantity FROM aid_distribution;

-- 17. Quantity distribution per location
SELECT location_id, SUM(quantity) AS total_quantity
FROM aid_distribution GROUP BY location_id;

-- 18. Quantity per program
SELECT program_id, SUM(quantity) AS total_quantity
FROM aid_distribution GROUP BY program_id;

-- 19. Daily aid summary
SELECT distribution_date, SUM(quantity) AS total_quantity
FROM aid_distribution GROUP BY distribution_date;

-- 20. Average items distributed per officer
SELECT officer_id, AVG(quantity) AS avg_quantity
FROM aid_distribution GROUP BY officer_id;

-- 21. Join with relief programs to see aid program names
SELECT a.id, r.name, a.item_description, a.quantity, a.status
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id;

-- 22. Citizens who received aid with program names
SELECT c.name, r.name AS program_name, a.item_description, a.quantity
FROM aid_distribution a
JOIN citizens c ON a.citizen_id = c.id
JOIN relief_programs r ON a.program_id = r.id;

-- 23. Officers and the relief programs they distributed
SELECT o.officer_id, r.name, SUM(a.quantity) AS total_quantity
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id
JOIN fund_allocations f ON r.id = f.program_id
GROUP BY o.officer_id, r.name;

-- 24. Programs with more than 100 items delivered
SELECT r.name, SUM(a.quantity) AS total_quantity
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id
WHERE a.status = 'Delivered'
GROUP BY r.name HAVING SUM(a.quantity) > 100;

-- 25. Aid delivered under 'Financial' category
SELECT r.name, a.item_description, a.quantity
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id
WHERE r.category = 'Financial';

-- 26. Delivered aid with citizen names
SELECT c.name, a.item_description, a.quantity
FROM aid_distribution a
JOIN citizens c ON a.citizen_id = c.id
WHERE a.status = 'Delivered';

-- 27. Pending aid by program
SELECT r.name, COUNT(*) AS pending_count
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id
WHERE a.status = 'Pending'
GROUP BY r.name;

-- 28. Aid distribution vs fund allocation (join program_id)
SELECT r.name, f.amount_allocated, SUM(a.quantity) AS total_items
FROM aid_distribution a
JOIN relief_programs r ON a.program_id = r.id
JOIN fund_allocations f ON r.id = f.program_id
GROUP BY r.name, f.amount_allocated;

-- 29. Officers distributing 'Cash Relief'
SELECT officer_id, quantity
FROM aid_distribution WHERE item_description LIKE '%Cash%';

-- 30. Citizens who received aid but are NOT linked to any active relief
SELECT c.name, a.item_description
FROM aid_distribution a
JOIN citizens c ON a.citizen_id = c.id
WHERE a.program_id NOT IN (SELECT id FROM relief_programs WHERE status = 'Active');

-- 31. Citizens who received more than avg quantity
SELECT citizen_id FROM aid_distribution
GROUP BY citizen_id
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM aid_distribution);

-- 32. Programs with pending aid
SELECT name FROM relief_programs
WHERE id IN (SELECT program_id FROM aid_distribution WHERE status = 'Pending');

-- 33. Officers who delivered the maximum quantity
SELECT officer_id FROM aid_distribution
WHERE quantity = (SELECT MAX(quantity) FROM aid_distribution);

-- 34. Aid for same program as citizen_id = 1001
SELECT * FROM aid_distribution
WHERE program_id = (SELECT program_id FROM aid_distribution WHERE citizen_id = 1001);

-- 35. Citizens who received aid on same day as citizen_id = 1010
SELECT * FROM aid_distribution
WHERE distribution_date = (SELECT distribution_date FROM aid_distribution WHERE citizen_id = 1010);

-- 36. Aid delivered for programs with completed funds
SELECT * FROM aid_distribution
WHERE program_id IN (SELECT program_id FROM fund_allocations WHERE status = 'Completed');

-- 37. Top 1 officer with max total delivery
SELECT officer_id FROM aid_distribution
GROUP BY officer_id ORDER BY SUM(quantity) DESC LIMIT 1;

-- 38. Find aid distribution with earliest date
SELECT * FROM aid_distribution
WHERE distribution_date = (SELECT MIN(distribution_date) FROM aid_distribution);

-- 39. Citizens with multiple distributions
SELECT citizen_id FROM aid_distribution
GROUP BY citizen_id HAVING COUNT(*) > 1;

-- 40. Pending aid with more than 100 items
SELECT * FROM aid_distribution
WHERE status = 'Pending' AND quantity > (SELECT AVG(quantity) FROM aid_distribution);

-- 41. Convert item descriptions to uppercase
SELECT UPPER(item_description) FROM aid_distribution;

-- 42. Length of remarks
SELECT id, LENGTH(remarks) AS remark_length FROM aid_distribution;

-- 43. Format distribution date
SELECT id, DATE_FORMAT(distribution_date, '%d-%M-%Y') AS formatted_date FROM aid_distribution;

-- 44. Replace ‘Pending’ with ‘Awaiting’
SELECT REPLACE(status, 'Pending', 'Awaiting') FROM aid_distribution;

-- 45. Show only year from distribution date
SELECT id, YEAR(distribution_date) AS year_only FROM aid_distribution;

-- 46. UDF to check if aid is large (>100 items)
DELIMITER //
CREATE FUNCTION is_large_aid(qty INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF qty > 100 THEN RETURN 'YES';
  ELSE RETURN 'NO';
  END IF;
END //
DELIMITER ;

-- 47. Use is_large_aid
SELECT id, item_description, is_large_aid(quantity) FROM aid_distribution;

-- 49. Use aid_type
SELECT id, item_description, aid_type(item_description) FROM aid_distribution;

-- 50. UDF to return short remark (first 20 chars)
DELIMITER //
CREATE FUNCTION short_remark(txt TEXT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN LEFT(txt,20);
END //
DELIMITER ;

-- Apply short_remark
SELECT id, short_remark(remarks) FROM aid_distribution;



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

-- 1. Show all locations
SELECT * FROM locations;

-- 2. Show all active villages
SELECT * FROM locations WHERE status = 'Active';

-- 3. Find all urban areas
SELECT * FROM locations WHERE zone_type = 'Urban';

-- 4. Get location with pincode '411001'
SELECT * FROM locations WHERE pincode = '411001';

-- 5. Count number of villages in Mulshi taluka
SELECT COUNT(*) FROM locations WHERE taluka = 'Mulshi';

-- 6. List all unique districts
SELECT DISTINCT district FROM locations;

-- 7. Show top 5 locations by population
SELECT * FROM locations ORDER BY population DESC LIMIT 5;

-- 8. Find rural locations with population > 5000
SELECT * FROM locations WHERE zone_type = 'Rural' AND population > 5000;

-- 9. Get smallest populated location
SELECT * FROM locations ORDER BY population ASC LIMIT 1;

-- 10. Get largest populated location
SELECT * FROM locations ORDER BY population DESC LIMIT 1;

-- 11. Count rural vs urban areas
SELECT zone_type, COUNT(*) AS total FROM locations GROUP BY zone_type;

-- 12. Average population of rural villages
SELECT AVG(population) AS avg_rural_population FROM locations WHERE zone_type = 'Rural';

-- 13. Max population in each district
SELECT district, MAX(population) AS max_pop FROM locations GROUP BY district;

-- 14. Total population in Pune district
SELECT SUM(population) AS pune_population FROM locations WHERE district = 'Pune';

-- 15. District with highest average population
SELECT district, AVG(population) AS avg_pop
FROM locations GROUP BY district ORDER BY avg_pop DESC LIMIT 1;

-- 16. Talukas with more than 2 villages
SELECT taluka, COUNT(*) AS village_count
FROM locations GROUP BY taluka HAVING COUNT(*) > 2;

-- 17. Total population grouped by zone_type
SELECT zone_type, SUM(population) AS total_pop
FROM locations GROUP BY zone_type;

-- 18. District-wise village count
SELECT district, COUNT(*) AS village_count
FROM locations GROUP BY district;

-- 19. Find location with max latitude (most north)
SELECT * FROM locations WHERE latitude = (SELECT MAX(latitude) FROM locations);

-- 20. Find location with min longitude (most west)
SELECT * FROM locations WHERE longitude = (SELECT MIN(longitude) FROM locations);

-- 21. Join relief programs with their location
SELECT r.name, l.district, l.village
FROM relief_programs r
JOIN locations l ON r.location_id = l.id;

-- 22. Disaster events with location details
SELECT d.name AS disaster, l.district, l.village, d.severity_level
FROM disaster_events d
JOIN locations l ON d.location_id = l.id;

-- 23. Aid distribution with location
SELECT a.item_description, a.quantity, l.village, l.district
FROM aid_distribution a
JOIN locations l ON a.location_id = l.id;

-- 24. Citizens with their location (if citizen table exists)
SELECT c.name, l.village, l.district
FROM citizens c
JOIN locations l ON c.location_id = l.id;

-- 25. Programs running in Pune
SELECT r.name, l.district, l.taluka
FROM relief_programs r
JOIN locations l ON r.location_id = l.id
WHERE l.district = 'Pune';

-- 26. Disaster events in rural zones
SELECT d.name, l.zone_type
FROM disaster_events d
JOIN locations l ON d.location_id = l.id
WHERE l.zone_type = 'Rural';

-- 27. Aid distribution count per district
SELECT l.district, COUNT(a.id) AS total_distributions
FROM aid_distribution a
JOIN locations l ON a.location_id = l.id
GROUP BY l.district;

-- 28. Programs and disasters overlapping in the same location
SELECT r.name AS program, d.name AS disaster, l.village
FROM relief_programs r
JOIN disaster_events d ON r.location_id = d.location_id
JOIN locations l ON r.location_id = l.id;

-- 29. Fund allocations vs location
SELECT f.amount_allocated, r.name, l.village
FROM fund_allocations f
JOIN relief_programs r ON f.program_id = r.id
JOIN locations l ON r.location_id = l.id;

-- 30. Locations that had both aid distribution & disasters
SELECT DISTINCT l.village, l.district
FROM locations l
WHERE l.id IN (SELECT location_id FROM aid_distribution)
  AND l.id IN (SELECT location_id FROM disaster_events);

-- 31. Find districts with population above avg
SELECT DISTINCT district FROM locations
WHERE population > (SELECT AVG(population) FROM locations);

-- 32. List villages where programs are still active
SELECT village FROM locations
WHERE id IN (SELECT location_id FROM relief_programs WHERE status = 'Active');

-- 33. List villages that had disasters of severity 'Critical'
SELECT village FROM locations
WHERE id IN (SELECT location_id FROM disaster_events WHERE severity_level = 'Critical');

-- 34. Village with max aid distributions
SELECT village FROM locations
WHERE id = (
  SELECT location_id FROM aid_distribution
  GROUP BY location_id ORDER BY COUNT(*) DESC LIMIT 1
);

-- 35. Locations not linked to any program
SELECT * FROM locations
WHERE id NOT IN (SELECT location_id FROM relief_programs);

-- 36. Locations where completed programs happened
SELECT village FROM locations
WHERE id IN (SELECT location_id FROM relief_programs WHERE status = 'Completed');

-- 37. Largest population location per district (subquery)
SELECT * FROM locations l
WHERE population = (
  SELECT MAX(population) FROM locations WHERE district = l.district
);

-- 38. Count locations in Pune having disasters
SELECT COUNT(*) FROM locations
WHERE district = 'Pune' AND id IN (SELECT location_id FROM disaster_events);

-- 39. Find districts where relief funds > 500000 allocated
SELECT DISTINCT l.district
FROM locations l
JOIN relief_programs r ON l.id = r.location_id
WHERE r.id IN (SELECT program_id FROM fund_allocations WHERE amount_allocated > 500000);

-- 40. Subquery for pending aid distributions
SELECT l.village FROM locations l
WHERE id IN (SELECT location_id FROM aid_distribution WHERE status = 'Pending');

-- 41. Convert village names to uppercase
SELECT UPPER(village) FROM locations;

-- 42. Length of each district name
SELECT district, LENGTH(district) AS name_length FROM locations;

-- 43. Get first 3 letters of taluka
SELECT taluka, SUBSTRING(taluka,1,3) AS short_name FROM locations;

-- 44. Replace '---' with 'NA' in taluka
SELECT REPLACE(taluka, '---', 'NA') FROM locations;

-- 45. Round latitude/longitude to 2 decimals
SELECT village, ROUND(latitude,2) AS lat, ROUND(longitude,2) AS lon FROM locations;

-- 46. UDF to classify population size
DELIMITER //
CREATE FUNCTION pop_category(pop INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF pop < 2000 THEN RETURN 'Small';
  ELSEIF pop < 10000 THEN RETURN 'Medium';
  ELSE RETURN 'Large';
  END IF;
END //
DELIMITER ;

-- 47. Apply pop_category
SELECT village, pop_category(population) AS size_category FROM locations;

-- 48. UDF to check if location is Urban
DELIMITER //
CREATE FUNCTION is_urban(zone VARCHAR(20))
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
  IF zone = 'Urban' THEN RETURN 'YES';
  ELSE RETURN 'NO';
  END IF;
END //
DELIMITER ;

-- 49. Apply is_urban
SELECT village, is_urban(zone_type) AS urban_flag FROM locations;

-- 50. UDF to combine district and taluka into one string
DELIMITER //
CREATE FUNCTION full_area(district VARCHAR(50), taluka VARCHAR(50))
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN
  RETURN CONCAT(district, ' - ', taluka);
END //
DELIMITER ;

-- Use full_area
SELECT village, full_area(district,taluka) AS area FROM locations;



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

-- 1. Show all government officers
SELECT * FROM government_officers;

-- 2. List only active officers
SELECT * FROM government_officers WHERE status = 'Active';

-- 3. Find officer by email
SELECT * FROM government_officers WHERE email = 'n.kareer@maha.gov.in';

-- 4. Officers who joined after 2023
SELECT * FROM government_officers WHERE joining_date > '2023-01-01';

-- 5. Find all Principal Secretaries
SELECT * FROM government_officers WHERE designation = 'Principal Secretary';

-- 6. Officers working in 'Finance & Planning' department
SELECT * FROM government_officers WHERE department = 'Finance & Planning';

-- 7. Count how many officers per department
SELECT department, COUNT(*) AS officer_count 
FROM government_officers GROUP BY department;

-- 8. Officers ordered by joining date (newest first)
SELECT * FROM government_officers ORDER BY joining_date DESC;

-- 9. Officers with contact number starting with '91234560'
SELECT * FROM government_officers WHERE contact_number LIKE '91234560%';

-- 10. Officers whose designation contains 'Director'
SELECT * FROM government_officers WHERE designation LIKE '%Director%';

-- 11. Total number of officers
SELECT COUNT(*) AS total_officers FROM government_officers;

-- 12. Earliest joining officer
SELECT * FROM government_officers 
WHERE joining_date = (SELECT MIN(joining_date) FROM government_officers);

-- 13. Latest joining officer
SELECT * FROM government_officers 
WHERE joining_date = (SELECT MAX(joining_date) FROM government_officers);

-- 14. Count designations
SELECT designation, COUNT(*) AS total 
FROM government_officers GROUP BY designation;

-- 15. Department with most officers
SELECT department, COUNT(*) AS total 
FROM government_officers GROUP BY department ORDER BY total DESC LIMIT 1;

-- 16. Officers per status
SELECT status, COUNT(*) FROM government_officers GROUP BY status;

-- 17. Departments having more than 2 officers
SELECT department, COUNT(*) AS total 
FROM government_officers GROUP BY department HAVING COUNT(*) > 2;

-- 18. Officer count per year of joining
SELECT YEAR(joining_date) AS joining_year, COUNT(*) AS total 
FROM government_officers GROUP BY YEAR(joining_date);

-- 19. Officers whose names start with 'R'
SELECT * FROM government_officers WHERE name LIKE 'R%';

-- 20. Count officers with designation containing 'Secretary'
SELECT COUNT(*) FROM government_officers WHERE designation LIKE '%Secretary%';

-- 21. Officer with location details
SELECT g.name, g.designation, l.district, l.village 
FROM government_officers g 
JOIN locations l ON g.location_id = l.id;

-- 22. Officers in Pune district
SELECT g.name, g.department, l.district 
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
WHERE l.district = 'Pune';

-- 23. Officers working in Urban zones
SELECT g.name, g.designation, l.zone_type 
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
WHERE l.zone_type = 'Urban';

-- 24. Count officers per district
SELECT l.district, COUNT(g.id) AS officer_count
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
GROUP BY l.district;

-- 25. Officers in Mulshi taluka
SELECT g.name, g.department, l.taluka 
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
WHERE l.taluka = 'Mulshi';

-- 26. Officers posted in rural areas
SELECT g.name, g.designation, l.village, l.zone_type
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
WHERE l.zone_type = 'Rural';

-- 27. Departments linked with locations
SELECT g.department, l.village, l.district
FROM government_officers g 
JOIN locations l ON g.location_id = l.id;

-- 28. Count officers per taluka
SELECT l.taluka, COUNT(g.id) AS officer_count
FROM government_officers g 
JOIN locations l ON g.location_id = l.id
GROUP BY l.taluka;

-- 29. Officers who joined after 2024 with location info
SELECT g.name, g.designation, g.joining_date, l.district
FROM government_officers g
JOIN locations l ON g.location_id = l.id
WHERE g.joining_date > '2024-01-01';

-- 30. Officers and population of their posting locations
SELECT g.name, g.designation, l.population
FROM government_officers g
JOIN locations l ON g.location_id = l.id;

-- 31. Officers in the same department as 'Sandeep Kumar'
SELECT * FROM government_officers
WHERE department = (
  SELECT department FROM government_officers WHERE name = 'Sandeep Kumar'
);

-- 32. Officers senior to 'Ashish Chandra Verma'
SELECT * FROM government_officers
WHERE joining_date < (
  SELECT joining_date FROM government_officers WHERE name = 'Ashish Chandra Verma'
);

-- 33. Officers in departments with more than 1 officer
SELECT * FROM government_officers
WHERE department IN (
  SELECT department FROM government_officers GROUP BY department HAVING COUNT(*) > 1
);

-- 34. Officer(s) from the same joining year as 'Ravi Sinha'
SELECT * FROM government_officers
WHERE YEAR(joining_date) = (
  SELECT YEAR(joining_date) FROM government_officers WHERE name = 'Ravi Sinha'
);

-- 35. Officers posted in districts with population > 1,000,000
SELECT * FROM government_officers
WHERE location_id IN (
  SELECT id FROM locations WHERE population > 1000000
);

-- 36. Departments with officers joined after 2024
SELECT DISTINCT department FROM government_officers
WHERE joining_date > '2024-01-01';

-- 37. Officer with longest name
SELECT * FROM government_officers
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM government_officers);

-- 38. Officers who joined before average joining year
SELECT * FROM government_officers
WHERE YEAR(joining_date) < (
  SELECT AVG(YEAR(joining_date)) FROM government_officers
);

-- 39. Officers whose department is unique
SELECT * FROM government_officers
WHERE department IN (
  SELECT department FROM government_officers GROUP BY department HAVING COUNT(*) = 1
);

-- 40. Count officers from same district as 'Pune'
SELECT COUNT(*) FROM government_officers
WHERE location_id IN (
  SELECT id FROM locations WHERE district = 'Pune'
);

-- 41. Convert officer names to uppercase
SELECT UPPER(name) AS officer_name FROM government_officers;

-- 42. Length of each officer’s name
SELECT name, LENGTH(name) AS name_length FROM government_officers;

-- 43. Extract joining year
SELECT name, YEAR(joining_date) AS joining_year FROM government_officers;

-- 44. Show first 3 letters of department
SELECT department, SUBSTRING(department,1,3) AS short_form FROM government_officers;

-- 45. Replace '@maha.gov.in' with '@gov.in'
SELECT name, REPLACE(email,'@maha.gov.in','@gov.in') AS new_email 
FROM government_officers;

-- 46. UDF to check seniority (before 2023 = Senior, else Junior)
DELIMITER //
CREATE FUNCTION officer_seniority(join_date DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF join_date < '2023-01-01' THEN
    RETURN 'Senior';
  ELSE
    RETURN 'Junior';
  END IF;
END //
DELIMITER ;

-- 47. Use officer_seniority
SELECT name, officer_seniority(joining_date) AS seniority 
FROM government_officers;

-- 48. UDF to mask officer’s contact number
DELIMITER //
CREATE FUNCTION mask_contact(cnum VARCHAR(15))
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
  RETURN CONCAT('XXXXXXX', RIGHT(cnum,4));
END //
DELIMITER ;

-- 49. Use mask_contact
SELECT name, mask_contact(contact_number) AS masked_number 
FROM government_officers;

-- 50. UDF to combine name + designation
DELIMITER //
CREATE FUNCTION officer_identity(n VARCHAR(100), d VARCHAR(50))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  RETURN CONCAT(n, ' (', d, ')');
END //
DELIMITER ;

-- Use officer_identity
SELECT officer_identity(name, designation) AS officer_info 
FROM government_officers;


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
    
    -- 1. View all suppliers
SELECT * FROM suppliers;

-- 2. Show only active suppliers
SELECT * FROM suppliers WHERE status = 'Active';

-- 3. Find suppliers pending approval
SELECT * FROM suppliers WHERE status = 'Pending';

-- 4. Show supplier details by license number
SELECT * FROM suppliers WHERE license_number = 'LIC-GF001';

-- 5. List suppliers who supply Medicines
SELECT * FROM suppliers WHERE item_supplied = 'Medicines';

-- 6. Find suppliers with remarks available
SELECT * FROM suppliers WHERE remarks <> '';

-- 7. List suppliers in Kolhapur
SELECT * FROM suppliers WHERE address LIKE '%Kolhapur%';

-- 8. Show suppliers whose name starts with 'Quick'
SELECT * FROM suppliers WHERE name LIKE 'Quick%';

-- 9. Count all suppliers
SELECT COUNT(*) AS total_suppliers FROM suppliers;

-- 10. Show suppliers ordered by name
SELECT * FROM suppliers ORDER BY name ASC;

-- 11. Count suppliers by status
SELECT status, COUNT(*) AS total FROM suppliers GROUP BY status;

-- 12. Count suppliers by item supplied
SELECT item_supplied, COUNT(*) AS total FROM suppliers GROUP BY item_supplied;

-- 13. Find items supplied by more than 1 supplier
SELECT item_supplied, COUNT(*) FROM suppliers 
GROUP BY item_supplied HAVING COUNT(*) > 1;

-- 14. Suppliers grouped by city (extract city from address)
SELECT SUBSTRING_INDEX(address, ',', -1) AS city, COUNT(*) AS total
FROM suppliers GROUP BY city;

-- 15. Find the maximum license number (lexicographically)
SELECT MAX(license_number) AS max_license FROM suppliers;

-- 16. Find the earliest supplier alphabetically
SELECT MIN(name) AS first_supplier FROM suppliers;

-- 17. Total suppliers with email domain "in"
SELECT COUNT(*) FROM suppliers WHERE email LIKE '%.in';

-- 18. Count pending suppliers by item type
SELECT item_supplied, COUNT(*) 
FROM suppliers WHERE status='Pending'
GROUP BY item_supplied;

-- 19. Items supplied starting with 'S'
SELECT DISTINCT item_supplied FROM suppliers WHERE item_supplied LIKE 'S%';

-- 20. Count suppliers with remarks
SELECT COUNT(*) FROM suppliers WHERE remarks IS NOT NULL AND remarks <> '';

-- 21. Match suppliers with aid_distribution by item
SELECT s.name, a.item_description, a.quantity
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%');

-- 22. Count how many times each supplier’s items were distributed
SELECT s.name, COUNT(a.id) AS distributions
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
GROUP BY s.name;

-- 23. Suppliers whose items are pending in aid_distribution
SELECT DISTINCT s.name, a.status
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
WHERE a.status='Pending';

-- 24. Suppliers and officers who handled their items
SELECT s.name AS supplier, a.officer_id
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%');

-- 25. Suppliers who provided items distributed in Pune locations
SELECT DISTINCT s.name
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
JOIN locations l ON a.location_id = l.id
WHERE l.district = 'Pune';

-- 26. Suppliers with most distribution quantities
SELECT s.name, SUM(a.quantity) AS total_quantity
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
GROUP BY s.name ORDER BY total_quantity DESC;

-- 27. Items supplied but never distributed
SELECT s.item_supplied
FROM suppliers s
LEFT JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
WHERE a.id IS NULL;

-- 28. Total distributed quantity per item vs supplier
SELECT s.item_supplied, SUM(a.quantity) AS total_quantity
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
GROUP BY s.item_supplied;

-- 29. Supplier details with location of distributions
SELECT s.name, l.district, l.village
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
JOIN locations l ON a.location_id = l.id;

-- 30. Suppliers supplying items delivered by officer 305
SELECT DISTINCT s.name
FROM suppliers s
JOIN aid_distribution a ON a.item_description LIKE CONCAT('%', s.item_supplied, '%')
WHERE a.officer_id = 305;

-- 31. Suppliers with the same item as 'Global Foods Pvt Ltd'
SELECT * FROM suppliers
WHERE item_supplied = (
  SELECT item_supplied FROM suppliers WHERE name = 'Global Foods Pvt Ltd'
);

-- 32. Suppliers supplying items distributed in Lonavala
SELECT * FROM suppliers
WHERE item_supplied IN (
  SELECT item_description FROM aid_distribution a
  JOIN locations l ON a.location_id = l.id
  WHERE l.village = 'Lonavala'
);

-- 33. Suppliers not having pending status
SELECT * FROM suppliers
WHERE id NOT IN (SELECT id FROM suppliers WHERE status='Pending');

-- 34. Supplier with the longest name
SELECT * FROM suppliers
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM suppliers);

-- 35. Suppliers whose items were distributed in more than 100 quantity
SELECT DISTINCT s.*
FROM suppliers s
WHERE item_supplied IN (
  SELECT item_description FROM aid_distribution GROUP BY item_description HAVING SUM(quantity) > 100
);

-- 36. Supplier(s) with the earliest license
SELECT * FROM suppliers
WHERE license_number = (SELECT MIN(license_number) FROM suppliers);

-- 37. Suppliers whose remarks match with another supplier
SELECT * FROM suppliers
WHERE remarks IN (
  SELECT remarks FROM suppliers GROUP BY remarks HAVING COUNT(*) > 1 AND remarks <> ''
);

-- 38. Count suppliers supplying items also distributed
SELECT COUNT(*) FROM suppliers
WHERE item_supplied IN (SELECT item_description FROM aid_distribution);

-- 39. Suppliers located in same city as 'Safe Shelter Co.'
SELECT * FROM suppliers
WHERE SUBSTRING_INDEX(address, ',', -1) = (
  SELECT SUBSTRING_INDEX(address, ',', -1) FROM suppliers WHERE name='Safe Shelter Co.'
);

-- 40. Suppliers with item supplied NOT in aid_distribution
SELECT * FROM suppliers
WHERE item_supplied NOT IN (SELECT item_description FROM aid_distribution);

-- 41. Convert supplier names to uppercase
SELECT UPPER(name) AS supplier_name FROM suppliers;

-- 42. Find length of each supplier’s contact person name
SELECT contact_person, LENGTH(contact_person) AS name_length FROM suppliers;

-- 43. Show first 3 letters of each item supplied
SELECT item_supplied, LEFT(item_supplied,3) AS short_code FROM suppliers;

-- 44. Replace '@' in emails with '[at]'
SELECT name, REPLACE(email,'@','[at]') AS new_email FROM suppliers;

-- 45. Concatenate supplier name and item
SELECT CONCAT(name,' supplies ',item_supplied) AS supplier_info FROM suppliers;

-- 46. UDF: Check license validity based on status
DELIMITER //
CREATE FUNCTION license_validity(st VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF st='Active' THEN
    RETURN 'Valid';
  ELSE
    RETURN 'Invalid';
  END IF;
END //
DELIMITER ;

-- 47. Use license_validity
SELECT name, license_validity(status) AS license_status FROM suppliers;

-- 48. UDF: Mask supplier phone number
DELIMITER //
CREATE FUNCTION mask_phone(ph VARCHAR(15))
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
  RETURN CONCAT('XXXXXXX', RIGHT(ph,4));
END //
DELIMITER ;

-- 49. Use mask_phone
SELECT name, mask_phone(phone) AS hidden_phone FROM suppliers;

-- 50. UDF: Supplier Identity (name + item)
DELIMITER //
CREATE FUNCTION supplier_identity(n VARCHAR(100), i VARCHAR(100))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  RETURN CONCAT(n, ' - ', i);
END //
DELIMITER ;

-- Use supplier_identity
SELECT supplier_identity(name, item_supplied) AS identity FROM suppliers;


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
    
    -- 1. Show all inventory items
SELECT * FROM inventory_items;

-- 2. Find all items in category 'Food'
SELECT * FROM inventory_items WHERE category = 'Food';

-- 3. List all items supplied by supplier 2
SELECT * FROM inventory_items WHERE supplier_id = 2;

-- 4. Show only available items
SELECT * FROM inventory_items WHERE status = 'Available';

-- 5. Find items purchased in June 2025
SELECT * FROM inventory_items WHERE MONTH(purchase_date) = 6 AND YEAR(purchase_date) = 2025;

-- 6. Items expiring before 2027
SELECT * FROM inventory_items WHERE expiry_date < '2027-01-01';

-- 7. Show all items with quantity greater than 200
SELECT * FROM inventory_items WHERE quantity > 200;

-- 8. List items located at location_id = 12
SELECT * FROM inventory_items WHERE location_id = 12;

-- 9. Find distinct categories in inventory
SELECT DISTINCT category FROM inventory_items;

-- 10. Order items by expiry date (earliest first)
SELECT * FROM inventory_items ORDER BY expiry_date ASC;

-- 11. Count total items in inventory
SELECT COUNT(*) AS total_items FROM inventory_items;

-- 12. Total quantity by category
SELECT category, SUM(quantity) AS total_quantity FROM inventory_items GROUP BY category;

-- 13. Average quantity of each category
SELECT category, AVG(quantity) AS avg_quantity FROM inventory_items GROUP BY category;

-- 14. Maximum quantity item per category
SELECT category, MAX(quantity) AS max_quantity FROM inventory_items GROUP BY category;

-- 15. Find minimum quantity per supplier
SELECT supplier_id, MIN(quantity) AS min_quantity FROM inventory_items GROUP BY supplier_id;

-- 16. Count items supplied by each supplier
SELECT supplier_id, COUNT(*) AS items_count FROM inventory_items GROUP BY supplier_id;

-- 17. Find total quantity of 'Hygiene' category
SELECT SUM(quantity) AS hygiene_total FROM inventory_items WHERE category = 'Hygiene';

-- 18. Count items per status
SELECT status, COUNT(*) AS total FROM inventory_items GROUP BY status;

-- 19. Total items stored in each location
SELECT location_id, COUNT(*) AS items_count FROM inventory_items GROUP BY location_id;

-- 20. Find category with more than 3 types of items
SELECT category, COUNT(*) FROM inventory_items GROUP BY category HAVING COUNT(*) > 3;

-- 21. Join inventory with suppliers (show supplier name and item)
SELECT i.name AS item_name, s.name AS supplier_name
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 22. Join inventory with suppliers and show category details
SELECT i.category, i.name, s.contact_person
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 23. Items supplied by 'Global Foods Pvt Ltd'
SELECT i.* FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id
WHERE s.name = 'Global Foods Pvt Ltd';

-- 24. Items and supplier emails
SELECT i.name, s.email
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id;

-- 25. Count items per supplier
SELECT s.name, COUNT(i.id) AS total_items
FROM suppliers s
LEFT JOIN inventory_items i ON s.id = i.supplier_id
GROUP BY s.name;

-- 26. Suppliers providing 'Medical' category items
SELECT DISTINCT s.name
FROM suppliers s
JOIN inventory_items i ON s.id = i.supplier_id
WHERE i.category = 'Medical';

-- 27. Items with supplier status = 'Pending'
SELECT i.name, s.status
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id
WHERE s.status = 'Pending';

-- 28. Join with locations (district & item name)
SELECT i.name, l.district, l.village
FROM inventory_items i
JOIN locations l ON i.location_id = l.id;

-- 29. Count items stored per district
SELECT l.district, COUNT(i.id) AS total_items
FROM inventory_items i
JOIN locations l ON i.location_id = l.id
GROUP BY l.district;

-- 30. Items and suppliers stored in location_id = 13
SELECT i.name, s.name AS supplier
FROM inventory_items i
JOIN suppliers s ON i.supplier_id = s.id
WHERE i.location_id = 13;

-- 31. Find items with max quantity
SELECT * FROM inventory_items
WHERE quantity = (SELECT MAX(quantity) FROM inventory_items);

-- 32. Find suppliers who provided 'Clothing' items
SELECT * FROM suppliers
WHERE id IN (SELECT supplier_id FROM inventory_items WHERE category = 'Clothing');

-- 33. Items purchased after the earliest purchase date
SELECT * FROM inventory_items
WHERE purchase_date > (SELECT MIN(purchase_date) FROM inventory_items);

-- 34. Items supplied by same supplier as 'Rice Bag'
SELECT * FROM inventory_items
WHERE supplier_id = (SELECT supplier_id FROM inventory_items WHERE name='Rice Bag' LIMIT 1);

-- 35. Items stored in the same location as 'Tent'
SELECT * FROM inventory_items
WHERE location_id = (SELECT location_id FROM inventory_items WHERE name='Tent' LIMIT 1);

-- 36. Item with the longest name
SELECT * FROM inventory_items
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM inventory_items);

-- 37. Suppliers with more than 2 items
SELECT * FROM suppliers
WHERE id IN (SELECT supplier_id FROM inventory_items GROUP BY supplier_id HAVING COUNT(*) > 2);

-- 38. Locations storing 'Food' items
SELECT * FROM locations
WHERE id IN (SELECT location_id FROM inventory_items WHERE category='Food');

-- 39. Items that expire the same year as 'Soap Pack'
SELECT * FROM inventory_items
WHERE YEAR(expiry_date) = (SELECT YEAR(expiry_date) FROM inventory_items WHERE name='Soap Pack' LIMIT 1);

-- 40. Find suppliers of items with quantity > average
SELECT * FROM suppliers
WHERE id IN (SELECT supplier_id FROM inventory_items WHERE quantity > (SELECT AVG(quantity) FROM inventory_items));

-- 41. Convert item names to uppercase
SELECT UPPER(name) AS item_name FROM inventory_items;

-- 42. Show first 5 characters of each item name
SELECT LEFT(name, 5) AS short_name FROM inventory_items;

-- 43. Calculate remaining shelf life in days
SELECT name, DATEDIFF(expiry_date, CURDATE()) AS days_remaining FROM inventory_items;

-- 44. Replace 'Rice' with 'Grain' in item names
SELECT REPLACE(name,'Rice','Grain') AS updated_name FROM inventory_items;

-- 45. Show purchase month of each item
SELECT name, MONTHNAME(purchase_date) AS purchase_month FROM inventory_items;

-- 46. UDF: Check if item is expired
DELIMITER //
CREATE FUNCTION is_expired(expiry DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF expiry < CURDATE() THEN
    RETURN 'Expired';
  ELSE
    RETURN 'Valid';
  END IF;
END //
DELIMITER ;

-- 47. Use is_expired
SELECT name, is_expired(expiry_date) AS expiry_status FROM inventory_items;

-- 48. UDF: Format item identity
DELIMITER //
CREATE FUNCTION item_identity(n VARCHAR(100), c VARCHAR(50))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  RETURN CONCAT(n, ' [', c, ']');
END //
DELIMITER ;

-- 49. Use item_identity
SELECT item_identity(name, category) AS item_details FROM inventory_items;

-- 50. UDF: Calculate total stock value (quantity * 10 as fixed price)
DELIMITER //
CREATE FUNCTION stock_value(qty INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN qty * 10;
END //
DELIMITER ;

-- Use stock_value
SELECT name, stock_value(quantity) AS value FROM inventory_items;

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

-- 1. Show all applications
SELECT * FROM beneficiary_applications;

-- 2. Find all 'Pending' applications
SELECT * FROM beneficiary_applications WHERE status = 'Pending';

-- 3. Find all 'Approved' applications
SELECT * FROM beneficiary_applications WHERE status = 'Approved';

-- 4. Find applications handled by officer 305
SELECT * FROM beneficiary_applications WHERE officer_id = 305;

-- 5. Find applications submitted after 10 June 2025
SELECT * FROM beneficiary_applications WHERE application_date > '2025-06-10';

-- 6. Applications that were approved within 3 days
SELECT * FROM beneficiary_applications
WHERE DATEDIFF(approved_date, application_date) <= 3;
-- 8. Order applications by application_date
SELECT * FROM beneficiary_applications ORDER BY application_date ASC;

-- 9. Get distinct status values
SELECT DISTINCT status FROM beneficiary_applications;

-- 10. Find applications submitted at location 7
SELECT * FROM beneficiary_applications WHERE location_id = 7;

-- 11. Count total applications
SELECT COUNT(*) AS total_applications FROM beneficiary_applications;

-- 12. Count applications by status
SELECT status, COUNT(*) AS total FROM beneficiary_applications GROUP BY status;

-- 13. Count applications by officer
SELECT officer_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY officer_id;

-- 14. Count applications by program
SELECT program_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY program_id;

-- 15. Find programs with more than 2 applications
SELECT program_id, COUNT(*) FROM beneficiary_applications GROUP BY program_id HAVING COUNT(*) > 2;

-- 16. Average approval delay (days) for approved applications
SELECT AVG(DATEDIFF(approved_date, application_date)) AS avg_delay
FROM beneficiary_applications WHERE status = 'Approved';

-- 17. Maximum approval delay
SELECT MAX(DATEDIFF(approved_date, application_date)) AS max_delay
FROM beneficiary_applications WHERE status = 'Approved';

-- 18. Minimum approval delay
SELECT MIN(DATEDIFF(approved_date, application_date)) AS min_delay
FROM beneficiary_applications WHERE status = 'Approved';

-- 19. Applications grouped by location
SELECT location_id, COUNT(*) AS total FROM beneficiary_applications GROUP BY location_id;

-- 20. Programs with only rejected applications
SELECT program_id FROM beneficiary_applications
WHERE status='Rejected'
GROUP BY program_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM beneficiary_applications b2 WHERE b2.program_id = beneficiary_applications.program_id);

-- 21. Join with officers to see officer name
SELECT b.id, b.citizen_id, o.name AS officer_name, b.status
FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id;

-- 22. Join with officers & locations
SELECT b.id, b.status, o.name AS officer, l.district, l.village
FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id
JOIN locations l ON b.location_id = l.id;

-- 23. Find all applications handled by 'Ravi Sinha'
SELECT b.* FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id
WHERE o.name = 'Ravi Sinha';

-- 24. Count applications per officer name
SELECT o.name, COUNT(b.id) AS total_apps
FROM government_officers o
LEFT JOIN beneficiary_applications b ON o.id = b.officer_id
GROUP BY o.name;

-- 25. Applications with officer designation
SELECT b.id, b.status, o.designation
FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id;

-- 26. Applications per district
SELECT l.district, COUNT(b.id) AS total_apps
FROM beneficiary_applications b
JOIN locations l ON b.location_id = l.id
GROUP BY l.district;

-- 27. Rejected applications with officer details
SELECT b.id, b.citizen_id, o.name AS officer
FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id
WHERE b.status = 'Rejected';

-- 28. Pending applications with district info
SELECT b.id, l.district, l.village
FROM beneficiary_applications b
JOIN locations l ON b.location_id = l.id
WHERE b.status = 'Pending';

-- 29. Officers who handled applications in 'Pune'
SELECT DISTINCT o.name
FROM beneficiary_applications b
JOIN government_officers o ON b.officer_id = o.id
JOIN locations l ON b.location_id = l.id
WHERE l.district = 'Pune';

-- 30. Location with most approved applications
SELECT l.district, COUNT(b.id) AS approved_count
FROM beneficiary_applications b
JOIN locations l ON b.location_id = l.id
WHERE b.status='Approved'
GROUP BY l.district
ORDER BY approved_count DESC
LIMIT 1;

-- 31. Find latest application
SELECT * FROM beneficiary_applications
WHERE application_date = (SELECT MAX(application_date) FROM beneficiary_applications);

-- 32. Officers with more than 2 applications
SELECT * FROM government_officers
WHERE id IN (SELECT officer_id FROM beneficiary_applications GROUP BY officer_id HAVING COUNT(*) > 2);

-- 33. Applications with same program as app ID 5
SELECT * FROM beneficiary_applications
WHERE program_id = (SELECT program_id FROM beneficiary_applications WHERE id=5);

-- 34. Applications in same location as citizen_id 1007
SELECT * FROM beneficiary_applications
WHERE location_id = (SELECT location_id FROM beneficiary_applications WHERE citizen_id=1007);

-- 35. Applications handled by same officer as citizen 1001
SELECT * FROM beneficiary_applications
WHERE officer_id = (SELECT officer_id FROM beneficiary_applications WHERE citizen_id=1001);

-- 36. Find program with highest applications
SELECT program_id FROM beneficiary_applications
GROUP BY program_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 37. Find officer with most approvals
SELECT officer_id FROM beneficiary_applications
WHERE status='Approved'
GROUP BY officer_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 38. Find applications with more delay than average
SELECT * FROM beneficiary_applications
WHERE status='Approved'
AND DATEDIFF(approved_date, application_date) > 
(SELECT AVG(DATEDIFF(approved_date, application_date)) FROM beneficiary_applications WHERE status='Approved');

-- 39. Programs where all applications are pending
SELECT program_id FROM beneficiary_applications
WHERE status='Pending'
GROUP BY program_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM beneficiary_applications b2 WHERE b2.program_id=beneficiary_applications.program_id);

-- 40. Applications handled by officers in 'Home Affairs' department
SELECT * FROM beneficiary_applications
WHERE officer_id IN (SELECT id FROM government_officers WHERE department='Home Affairs');

-- 41. Show document references in uppercase
SELECT UPPER(document_reference) FROM beneficiary_applications;

-- 42. Show first 5 chars of document_reference
SELECT LEFT(document_reference, 5) FROM beneficiary_applications;

-- 43. Show days taken for approval
SELECT id, DATEDIFF(approved_date, application_date) AS approval_days
FROM beneficiary_applications WHERE status='Approved';

-- 44. Replace 'DOC' with 'FILE' in document_reference
SELECT REPLACE(document_reference,'DOC','FILE') FROM beneficiary_applications;

-- 45. Extract month of application date
SELECT id, MONTHNAME(application_date) AS app_month FROM beneficiary_applications;

-- 46. UDF: Check if application is approved
DELIMITER //
CREATE FUNCTION is_approved(app_status VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF app_status = 'Approved' THEN
    RETURN 'Yes';
  ELSE
    RETURN 'No';
  END IF;
END //
DELIMITER ;

-- 47. Use is_approved
SELECT id, is_approved(status) AS approved_flag FROM beneficiary_applications;

-- 48. UDF: Calculate approval delay
DELIMITER //
CREATE FUNCTION approval_delay(app_date DATE, appr_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  IF appr_date IS NULL THEN
    RETURN NULL;
  END IF;
  RETURN DATEDIFF(appr_date, app_date);
END //
DELIMITER ;

-- 49. Use approval_delay
SELECT id, approval_delay(application_date, approved_date) AS delay_days
FROM beneficiary_applications;

-- 50. UDF: Format application identity
DELIMITER //
CREATE FUNCTION application_identity(cid INT, prog INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('CIT-', cid, '-PROG-', prog);
END //
DELIMITER ;

-- Use application_identity
SELECT id, application_identity(citizen_id, program_id) AS app_identity FROM beneficiary_applications;



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

-- 1. Show all status logs
SELECT * FROM application_status_logs;

-- 2. Find all 'Approved' status logs
SELECT * FROM application_status_logs WHERE status = 'Approved';

-- 3. Find all 'Rejected' status logs
SELECT * FROM application_status_logs WHERE status = 'Rejected';

-- 4. Show logs for application_id = 5
SELECT * FROM application_status_logs WHERE application_id = 5;

-- 5. Show logs updated by officer 310
SELECT * FROM application_status_logs WHERE officer_id = 310;

-- 6. Show all logs from program 2
SELECT * FROM application_status_logs WHERE program_id = 2;

-- 7. Find all 'Submitted' applications
SELECT * FROM application_status_logs WHERE status = 'Submitted';

-- 8. Find logs updated after 2025-06-10
SELECT * FROM application_status_logs WHERE update_date > '2025-06-10';

-- 9. Show distinct statuses
SELECT DISTINCT status FROM application_status_logs;

-- 10. Show all logs for location_id = 7
SELECT * FROM application_status_logs WHERE location_id = 7;

-- 11. Count total status logs
SELECT COUNT(*) AS total_logs FROM application_status_logs;

-- 12. Count logs by status
SELECT status, COUNT(*) AS total FROM application_status_logs GROUP BY status;

-- 13. Count logs by program
SELECT program_id, COUNT(*) AS total FROM application_status_logs GROUP BY program_id;

-- 14. Count logs by officer
SELECT officer_id, COUNT(*) AS total FROM application_status_logs GROUP BY officer_id;

-- 15. Show programs with more than 2 logs
SELECT program_id, COUNT(*) FROM application_status_logs GROUP BY program_id HAVING COUNT(*) > 2;

-- 16. Logs per location
SELECT location_id, COUNT(*) FROM application_status_logs GROUP BY location_id;

-- 17. Find earliest log update
SELECT MIN(update_date) AS earliest_log FROM application_status_logs;

-- 18. Find latest log update
SELECT MAX(update_date) AS latest_log FROM application_status_logs;

-- 19. Average application_id value by status
SELECT status, AVG(application_id) FROM application_status_logs GROUP BY status;

-- 20. Count 'Approved' logs by officer
SELECT officer_id, COUNT(*) AS approvals FROM application_status_logs WHERE status='Approved' GROUP BY officer_id;

-- 21. Join with beneficiary_applications to see citizen_id
SELECT l.id, l.status, b.citizen_id
FROM application_status_logs l
JOIN beneficiary_applications b ON l.application_id = b.id;

-- 22. Join with officers (assuming government_officers table exists)
SELECT l.id, l.status, o.name AS officer_name
FROM application_status_logs l
JOIN government_officers o ON l.officer_id = o.id;

-- 23. Join with locations
SELECT l.id, l.status, loc.district, loc.village
FROM application_status_logs l
JOIN locations loc ON l.location_id = loc.id;

-- 24. Join with beneficiary_applications for program check
SELECT l.id, l.status, b.program_id
FROM application_status_logs l
JOIN beneficiary_applications b ON l.application_id = b.id;

-- 25. Applications with both 'Submitted' and 'Approved' statuses
SELECT DISTINCT b.id, b.citizen_id
FROM beneficiary_applications b
JOIN application_status_logs l ON b.id = l.application_id
WHERE l.status IN ('Submitted','Approved');

-- 26. Logs with officer designation
SELECT l.id, l.status, o.designation
FROM application_status_logs l
JOIN government_officers o ON l.officer_id = o.id;

-- 27. Approved logs with citizen details
SELECT l.id, b.citizen_id, l.status
FROM application_status_logs l
JOIN beneficiary_applications b ON l.application_id = b.id
WHERE l.status = 'Approved';

-- 28. Count logs per officer with officer name
SELECT o.name, COUNT(l.id) AS total_logs
FROM application_status_logs l
JOIN government_officers o ON l.officer_id = o.id
GROUP BY o.name;

-- 29. Logs in Pune district
SELECT l.id, l.status, loc.district
FROM application_status_logs l
JOIN locations loc ON l.location_id = loc.id
WHERE loc.district = 'Pune';

-- 30. Applications with multiple logs
SELECT application_id, COUNT(*) AS log_count
FROM application_status_logs
GROUP BY application_id
HAVING COUNT(*) > 1;


-- 31. Find applications that were rejected
SELECT DISTINCT application_id FROM application_status_logs WHERE status='Rejected';

-- 32. Find applications approved after submission
SELECT DISTINCT application_id
FROM application_status_logs
WHERE status='Approved'
AND application_id IN (SELECT application_id FROM application_status_logs WHERE status='Submitted');

-- 33. Officers who handled more than 2 logs
SELECT officer_id FROM application_status_logs
GROUP BY officer_id
HAVING COUNT(*) > 2;

-- 34. Applications with latest status update
SELECT * FROM application_status_logs
WHERE update_date = (SELECT MAX(update_date) FROM application_status_logs);

-- 35. Logs for same program as application_id = 5
SELECT * FROM application_status_logs
WHERE program_id = (SELECT program_id FROM application_status_logs WHERE application_id = 5);

-- 36. Logs for same location as application_id = 7
SELECT * FROM application_status_logs
WHERE location_id = (SELECT location_id FROM application_status_logs WHERE application_id=7);

-- 37. Applications approved by officer 305
SELECT * FROM application_status_logs
WHERE officer_id=305 AND status='Approved';

-- 38. Find programs with only 'Submitted' logs
SELECT program_id FROM application_status_logs
WHERE status='Submitted'
GROUP BY program_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM application_status_logs l2 WHERE l2.program_id=application_status_logs.program_id);

-- 39. Applications with rejected logs but also later approved
SELECT DISTINCT application_id
FROM application_status_logs l1
WHERE status='Rejected'
AND application_id IN (
    SELECT application_id FROM application_status_logs l2 WHERE l2.status='Approved'
);

-- 40. Officers who approved applications in program 5
SELECT DISTINCT officer_id
FROM application_status_logs
WHERE program_id=5 AND status='Approved';

-- 41. Show document references in uppercase
SELECT UPPER(document_reference) FROM application_status_logs;

-- 42. Show first 4 chars of document_reference
SELECT LEFT(document_reference, 4) FROM application_status_logs;

-- 43. Show length of remarks
SELECT id, LENGTH(remarks) AS remark_length FROM application_status_logs;

-- 44. Replace 'DOC' with 'FILE' in document_reference
SELECT REPLACE(document_reference,'DOC','FILE') FROM application_status_logs;

-- 45. Extract day name of update_date
SELECT id, DAYNAME(update_date) AS day_name FROM application_status_logs;

-- 46. UDF: Check if status is final (Approved/Rejected)
DELIMITER //
CREATE FUNCTION is_final_status(stat VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF stat IN ('Approved','Rejected') THEN
    RETURN 'Final';
  ELSE
    RETURN 'In-Progress';
  END IF;
END //
DELIMITER ;

-- 47. Use is_final_status
SELECT id, status, is_final_status(status) AS status_type FROM application_status_logs;

-- 48. UDF: Format log identity
DELIMITER //
CREATE FUNCTION log_identity(app_id INT, stat VARCHAR(20))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('APP-', app_id, '-', stat);
END //
DELIMITER ;

-- 49. Use log_identity
SELECT id, log_identity(application_id, status) AS log_code FROM application_status_logs;

-- 50. UDF: Count words in remarks
DELIMITER //
CREATE FUNCTION word_count(text_in TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE words INT;
  SET words = (LENGTH(text_in) - LENGTH(REPLACE(text_in,' ',''))
              + 1);
  RETURN words;
END //
DELIMITER ;

-- Use word_count
SELECT id, remarks, word_count(remarks) AS remark_words FROM application_status_logs;


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

-- 1. Show all incident reports
SELECT * FROM incident_reports;

-- 2. Find all 'Open' incidents
SELECT * FROM incident_reports WHERE status = 'Open';

-- 3. Find all 'Resolved' incidents
SELECT * FROM incident_reports WHERE status = 'Resolved';

-- 4. Show all incidents with severity 'High'
SELECT * FROM incident_reports WHERE severity_level = 'High';

-- 5. Find incidents reported by 'Neha Kulkarni'
SELECT * FROM incident_reports WHERE reporter_name = 'Neha Kulkarni';

-- 6. Find incidents from location_id = 9
SELECT * FROM incident_reports WHERE location_id = 9;

-- 7. Show all incidents after 2025-06-10
SELECT * FROM incident_reports WHERE report_date > '2025-06-10';

-- 8. Show distinct severity levels
SELECT DISTINCT severity_level FROM incident_reports;

-- 9. Show distinct statuses
SELECT DISTINCT status FROM incident_reports;

-- 10. Find incidents linked to event_id = 3
SELECT * FROM incident_reports WHERE event_id = 3;

-- 11. Count total incidents
SELECT COUNT(*) AS total_incidents FROM incident_reports;

-- 12. Count incidents by status
SELECT status, COUNT(*) AS total FROM incident_reports GROUP BY status;

-- 13. Count incidents by severity level
SELECT severity_level, COUNT(*) AS total FROM incident_reports GROUP BY severity_level;

-- 14. Count incidents by officer
SELECT officer_id, COUNT(*) AS total FROM incident_reports GROUP BY officer_id;

-- 15. Show locations with more than 2 incidents
SELECT location_id, COUNT(*) FROM incident_reports GROUP BY location_id HAVING COUNT(*) > 2;

-- 16. Find earliest reported incident
SELECT MIN(report_date) AS earliest_report FROM incident_reports;

-- 17. Find latest reported incident
SELECT MAX(report_date) AS latest_report FROM incident_reports;

-- 18. Average event_id value by status
SELECT status, AVG(event_id) AS avg_event FROM incident_reports GROUP BY status;

-- 19. Count 'High' severity incidents per officer
SELECT officer_id, COUNT(*) AS high_severity_cases 
FROM incident_reports WHERE severity_level='High' GROUP BY officer_id;

-- 20. Locations with both 'High' and 'Medium' incidents
SELECT location_id
FROM incident_reports
WHERE severity_level IN ('High','Medium')
GROUP BY location_id
HAVING COUNT(DISTINCT severity_level) = 2;

-- 21. Join with officers (assuming government_officers table exists)
SELECT i.id, i.description, o.name AS officer_name
FROM incident_reports i
JOIN government_officers o ON i.officer_id = o.id;

-- 22. Join with locations
SELECT i.id, i.description, l.district, l.village
FROM incident_reports i
JOIN locations l ON i.location_id = l.id;

-- 23. Join with events (assuming events table exists)
SELECT i.id, e.event_name, i.severity_level
FROM incident_reports i
JOIN events e ON i.event_id = e.id;

-- 24. Incidents with officer designation
SELECT i.id, i.status, o.designation
FROM incident_reports i
JOIN government_officers o ON i.officer_id = o.id;

-- 25. High severity incidents with location details
SELECT i.id, i.severity_level, l.district
FROM incident_reports i
JOIN locations l ON i.location_id = l.id
WHERE i.severity_level='High';

-- 26. Officer-wise incident counts
SELECT o.name, COUNT(i.id) AS incident_count
FROM incident_reports i
JOIN government_officers o ON i.officer_id = o.id
GROUP BY o.name;

-- 27. Incidents in Pune district
SELECT i.id, i.description, l.district
FROM incident_reports i
JOIN locations l ON i.location_id = l.id
WHERE l.district='Pune';

-- 28. Incidents linked to distribution events
SELECT i.id, e.event_name, i.status
FROM incident_reports i
JOIN events e ON i.event_id = e.id
WHERE e.event_type='Distribution';

-- 29. Resolved incidents with officer names
SELECT i.id, i.status, o.name AS officer_name
FROM incident_reports i
JOIN government_officers o ON i.officer_id=o.id
WHERE i.status='Resolved';

-- 30. Group incidents by location with location names
SELECT l.district, COUNT(i.id) AS incident_count
FROM incident_reports i
JOIN locations l ON i.location_id=l.id
GROUP BY l.district;

-- 31. Find incident_ids with High severity
SELECT id FROM incident_reports WHERE severity_level='High';

-- 32. Find officers who handled Open cases
SELECT DISTINCT officer_id FROM incident_reports WHERE status='Open';

-- 33. Find incidents in same location as incident 5
SELECT * FROM incident_reports
WHERE location_id = (SELECT location_id FROM incident_reports WHERE id=5);

-- 34. Find incidents in same event as incident 10
SELECT * FROM incident_reports
WHERE event_id = (SELECT event_id FROM incident_reports WHERE id=10);

-- 35. Find officers who resolved incidents
SELECT DISTINCT officer_id FROM incident_reports WHERE status='Resolved';

-- 36. Find incidents with the latest report date
SELECT * FROM incident_reports
WHERE report_date = (SELECT MAX(report_date) FROM incident_reports);

-- 37. Find incidents reported by the same reporter as incident 1
SELECT * FROM incident_reports
WHERE reporter_name = (SELECT reporter_name FROM incident_reports WHERE id=1);

-- 38. Find incidents with severity greater than the average severity order
SELECT * FROM incident_reports
WHERE severity_level = 'High'
AND id IN (SELECT id FROM incident_reports WHERE severity_level!='Low');

-- 39. Locations that had at least one closed incident
SELECT DISTINCT location_id FROM incident_reports WHERE status='Closed';

-- 40. Incidents handled by officers who also had 'Investigating' cases
SELECT * FROM incident_reports
WHERE officer_id IN (
  SELECT officer_id FROM incident_reports WHERE status='Investigating'
);

-- 41. Convert reporter_name to uppercase
SELECT UPPER(reporter_name) FROM incident_reports;

-- 42. Extract year of report_date
SELECT id, YEAR(report_date) AS report_year FROM incident_reports;

-- 43. Get day name of report_date
SELECT id, DAYNAME(report_date) AS report_day FROM incident_reports;

-- 44. Count characters in description
SELECT id, LENGTH(description) AS desc_length FROM incident_reports;

-- 45. Replace 'DOC' with 'FILE' in document_reference
SELECT REPLACE(document_reference,'DOC','FILE') FROM incident_reports;

-- 46. UDF: Classify severity as numeric score
DELIMITER //
CREATE FUNCTION severity_score(level VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
  IF level='High' THEN RETURN 3;
  ELSEIF level='Medium' THEN RETURN 2;
  ELSE RETURN 1;
  END IF;
END //
DELIMITER ;

-- 47. Use severity_score
SELECT id, severity_level, severity_score(severity_level) AS score FROM incident_reports;

-- 48. UDF: Format incident label
DELIMITER //
CREATE FUNCTION incident_label(i_id INT, sev VARCHAR(20))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('INC-', i_id, '-', sev);
END //
DELIMITER ;

-- 49. Use incident_label
SELECT id, incident_label(id, severity_level) AS label FROM incident_reports;

-- 50. UDF: Count words in description
DELIMITER //
CREATE FUNCTION word_count(text_in TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE words INT;
  SET words = (LENGTH(text_in) - LENGTH(REPLACE(text_in,' ','')) + 1);
  RETURN words;
END //
DELIMITER ;

-- Use word_count
SELECT id, description, word_count(description) AS word_total FROM incident_reports;



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

-- 1. Show all NGO partners
SELECT * FROM ngo_partners;

-- 2. Find all NGOs with 'Active' status
SELECT * FROM ngo_partners WHERE status='Active';

-- 3. Find all NGOs with 'Pending' status
SELECT * FROM ngo_partners WHERE status='Pending';

-- 4. Find NGOs working in 'Health'
SELECT * FROM ngo_partners WHERE area_of_work='Health';

-- 5. Find NGOs from Pune city
SELECT * FROM ngo_partners WHERE address='Pune';

-- 6. List all distinct work areas
SELECT DISTINCT area_of_work FROM ngo_partners;

-- 7. Find NGOs where contact person name starts with 'A'
SELECT * FROM ngo_partners WHERE contact_person LIKE 'A%';

-- 8. Find NGOs with phone numbers ending in '5'
SELECT * FROM ngo_partners WHERE phone LIKE '%5';

-- 9. Find NGOs that have remarks (non-empty)
SELECT * FROM ngo_partners WHERE remarks IS NOT NULL AND remarks!='';

-- 10. Find NGOs registered with prefix 'REG-GE'
SELECT * FROM ngo_partners WHERE registration_number LIKE 'REG-GE%';

-- 11. Count total NGOs
SELECT COUNT(*) AS total_ngos FROM ngo_partners;

-- 12. Count NGOs by status
SELECT status, COUNT(*) AS total FROM ngo_partners GROUP BY status;

-- 13. Count NGOs by area_of_work
SELECT area_of_work, COUNT(*) AS total FROM ngo_partners GROUP BY area_of_work;

-- 14. Count NGOs by city
SELECT address, COUNT(*) AS total FROM ngo_partners GROUP BY address;

-- 15. Show areas of work with more than 2 NGOs
SELECT area_of_work, COUNT(*) AS ngo_count 
FROM ngo_partners GROUP BY area_of_work HAVING COUNT(*)>2;

-- 16. Find alphabetically first NGO name
SELECT MIN(name) AS first_ngo FROM ngo_partners;

-- 17. Find alphabetically last NGO name
SELECT MAX(name) AS last_ngo FROM ngo_partners;

-- 18. Average length of NGO names
SELECT AVG(LENGTH(name)) AS avg_name_length FROM ngo_partners;

-- 19. Count NGOs with 'Environment' or 'Health' as work area
SELECT COUNT(*) FROM ngo_partners WHERE area_of_work IN ('Environment','Health');

-- 20. Count NGOs per status and work area
SELECT status, area_of_work, COUNT(*) AS total 
FROM ngo_partners GROUP BY status, area_of_work;

-- 21. Join NGOs with aid distributions
SELECT n.name, a.aid_type, a.quantity
FROM ngo_partners n
JOIN aid_distribution a ON n.id = a.ngo_id;

-- 22. Join NGOs with events
SELECT n.name, e.event_name, e.event_date
FROM ngo_partners n
JOIN events e ON n.id = e.ngo_id;

-- 23. Join NGOs with locations (assuming location_id linked)
SELECT n.name, l.district, l.state
FROM ngo_partners n
JOIN locations l ON n.address=l.city;

-- 24. Find NGOs that participated in aid distribution
SELECT DISTINCT n.name 
FROM ngo_partners n
JOIN aid_distribution a ON n.id=a.ngo_id;

-- 25. Find NGOs that have never distributed aid
SELECT n.name 
FROM ngo_partners n
LEFT JOIN aid_distribution a ON n.id=a.ngo_id
WHERE a.id IS NULL;

-- 26. Count aid distributions handled by each NGO
SELECT n.name, COUNT(a.id) AS aid_count
FROM ngo_partners n
JOIN aid_distribution a ON n.id=a.ngo_id
GROUP BY n.name;

-- 27. NGOs participating in events in Pune
SELECT n.name, e.event_name
FROM ngo_partners n
JOIN events e ON n.id=e.ngo_id
JOIN locations l ON e.location_id=l.id
WHERE l.district='Pune';

-- 28. NGOs working in 'Health' that distributed aid
SELECT n.name, a.aid_type
FROM ngo_partners n
JOIN aid_distribution a ON n.id=a.ngo_id
WHERE n.area_of_work='Health';

-- 29. NGOs with 'Pending' status but linked to events
SELECT n.name, e.event_name
FROM ngo_partners n
JOIN events e ON n.id=e.ngo_id
WHERE n.status='Pending';

-- 30. NGOs grouped by area_of_work with total aid quantity
SELECT n.area_of_work, SUM(a.quantity) AS total_quantity
FROM ngo_partners n
JOIN aid_distribution a ON n.id=a.ngo_id
GROUP BY n.area_of_work;

-- 31. NGOs with same area_of_work as 'Helping Hands'
SELECT * FROM ngo_partners
WHERE area_of_work = (SELECT area_of_work FROM ngo_partners WHERE name='Helping Hands');

-- 32. NGOs with same address as 'QuickMed NGO'
SELECT * FROM ngo_partners
WHERE address = (SELECT address FROM ngo_partners WHERE name='QuickMed NGO');

-- 33. NGOs that distributed aid more than 100 units
SELECT * FROM ngo_partners
WHERE id IN (SELECT ngo_id FROM aid_distribution GROUP BY ngo_id HAVING SUM(quantity)>100);

-- 34. NGOs that participated in events in 2025
SELECT * FROM ngo_partners
WHERE id IN (SELECT ngo_id FROM events WHERE YEAR(event_date)=2025);

-- 35. NGOs that have the same contact person as 'Clothe Care'
SELECT * FROM ngo_partners
WHERE contact_person = (SELECT contact_person FROM ngo_partners WHERE name='Clothe Care');

-- 36. NGOs from cities where there is at least one 'Environment' NGO
SELECT * FROM ngo_partners
WHERE address IN (SELECT address FROM ngo_partners WHERE area_of_work='Environment');

-- 37. NGOs with longer names than 'Farm Aid'
SELECT * FROM ngo_partners
WHERE LENGTH(name) > (SELECT LENGTH(name) FROM ngo_partners WHERE name='Farm Aid');

-- 38. NGOs whose area_of_work is not present in aid_distribution
SELECT * FROM ngo_partners
WHERE area_of_work NOT IN (SELECT DISTINCT aid_type FROM aid_distribution);

-- 39. NGOs with status same as 'Legal Aid Trust'
SELECT * FROM ngo_partners
WHERE status = (SELECT status FROM ngo_partners WHERE name='Legal Aid Trust');

-- 40. NGOs in the same address as NGOs with 'Pending' status
SELECT * FROM ngo_partners
WHERE address IN (SELECT address FROM ngo_partners WHERE status='Pending');

-- 41. Convert NGO names to uppercase
SELECT UPPER(name) FROM ngo_partners;

-- 42. Extract domain name from NGO email
SELECT SUBSTRING_INDEX(email,'@',-1) AS domain FROM ngo_partners;

-- 43. Get length of contact person names
SELECT contact_person, LENGTH(contact_person) AS name_length FROM ngo_partners;

-- 44. Replace 'NGO' with 'ORG' in names
SELECT REPLACE(name,'NGO','ORG') FROM ngo_partners;

-- 45. Get first 3 characters of registration_number
SELECT LEFT(registration_number,3) AS reg_prefix FROM ngo_partners;

-- 46. UDF: Classify NGO status into numeric
DELIMITER //
CREATE FUNCTION status_score(stat VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
  IF stat='Active' THEN RETURN 1;
  ELSEIF stat='Pending' THEN RETURN 0;
  ELSE RETURN -1;
  END IF;
END //
DELIMITER ;

-- 47. Use status_score
SELECT id, name, status, status_score(status) AS score FROM ngo_partners;

-- 48. UDF: Create NGO code
DELIMITER //
CREATE FUNCTION ngo_code(n_id INT, work VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('NGO-',n_id,'-',UPPER(LEFT(work,3)));
END //
DELIMITER ;

-- 49. Use ngo_code
SELECT id, name, ngo_code(id,area_of_work) AS code FROM ngo_partners;

-- 50. UDF: Count words in remarks
DELIMITER //
CREATE FUNCTION word_count(text_in TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE words INT;
  SET words = (LENGTH(text_in) - LENGTH(REPLACE(text_in,' ','')) + 1);
  RETURN words;
END //
DELIMITER ;

-- Use word_count
SELECT id, name, remarks, word_count(remarks) AS remark_words FROM ngo_partners;



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

-- 1. Show all feedback records
SELECT * FROM public_feedback;

-- 2. Find all complaints
SELECT * FROM public_feedback WHERE feedback_type='Complaint';

-- 3. Find all suggestions
SELECT * FROM public_feedback WHERE feedback_type='Suggestion';

-- 4. Find feedback that is still open
SELECT * FROM public_feedback WHERE status='Open';

-- 5. Find compliments that are closed
SELECT * FROM public_feedback WHERE feedback_type='Compliment' AND status='Closed';

-- 6. Find feedback submitted on 2025-06-10
SELECT * FROM public_feedback WHERE feedback_date='2025-06-10';

-- 7. Find feedback without remarks
SELECT * FROM public_feedback WHERE remarks='' OR remarks IS NULL;

-- 8. List feedback by officer_id = 310
SELECT * FROM public_feedback WHERE officer_id=310;

-- 9. Find feedback with document reference starting with 'DOC-F01'
SELECT * FROM public_feedback WHERE document_reference LIKE 'DOC-F01%';

-- 10. Find complaints made at location_id = 7
SELECT * FROM public_feedback WHERE feedback_type='Complaint' AND location_id=7;

-- 11. Count total feedback records
SELECT COUNT(*) AS total_feedback FROM public_feedback;

-- 12. Count feedback by type
SELECT feedback_type, COUNT(*) AS total FROM public_feedback GROUP BY feedback_type;

-- 13. Count feedback by status
SELECT status, COUNT(*) AS total FROM public_feedback GROUP BY status;

-- 14. Count feedback by officer
SELECT officer_id, COUNT(*) AS total FROM public_feedback GROUP BY officer_id;

-- 15. Count feedback by location
SELECT location_id, COUNT(*) AS total FROM public_feedback GROUP BY location_id;

-- 16. Find locations with more than 2 complaints
SELECT location_id, COUNT(*) AS complaints
FROM public_feedback
WHERE feedback_type='Complaint'
GROUP BY location_id
HAVING COUNT(*)>2;

-- 17. Get earliest feedback date
SELECT MIN(feedback_date) AS first_feedback FROM public_feedback;

-- 18. Get latest feedback date
SELECT MAX(feedback_date) AS last_feedback FROM public_feedback;

-- 19. Average length of messages
SELECT AVG(LENGTH(message)) AS avg_message_length FROM public_feedback;

-- 20. Count feedback per type and status
SELECT feedback_type, status, COUNT(*) AS total
FROM public_feedback
GROUP BY feedback_type, status;

-- 21. Join feedback with citizens
SELECT f.id, c.full_name, f.feedback_type, f.message
FROM public_feedback f
JOIN citizens c ON f.citizen_id=c.id;

-- 22. Join feedback with officers
SELECT f.id, f.feedback_type, o.name AS officer_name, f.status
FROM public_feedback f
JOIN officers o ON f.officer_id=o.id;

-- 23. Join feedback with locations
SELECT f.id, f.feedback_type, l.district, l.state
FROM public_feedback f
JOIN locations l ON f.location_id=l.id;

-- 24. Find all suggestions with citizen names
SELECT c.full_name, f.message
FROM public_feedback f
JOIN citizens c ON f.citizen_id=c.id
WHERE f.feedback_type='Suggestion';

-- 25. Find officers who handled complaints
SELECT DISTINCT o.name
FROM public_feedback f
JOIN officers o ON f.officer_id=o.id
WHERE f.feedback_type='Complaint';

-- 26. Count feedback handled by each officer
SELECT o.name, COUNT(f.id) AS total_feedback
FROM public_feedback f
JOIN officers o ON f.officer_id=o.id
GROUP BY o.name;

-- 27. Feedback messages from Pune citizens (assuming location table)
SELECT f.message, l.district
FROM public_feedback f
JOIN locations l ON f.location_id=l.id
WHERE l.district='Pune';

-- 28. Complaints reviewed by officers
SELECT f.id, o.name, f.status
FROM public_feedback f
JOIN officers o ON f.officer_id=o.id
WHERE f.feedback_type='Complaint' AND f.status='Reviewed';

-- 29. Suggestions linked to training programs (assuming training_programs table)
SELECT f.id, f.message, t.program_name
FROM public_feedback f
JOIN training_programs t ON f.location_id=t.location_id
WHERE f.feedback_type='Suggestion';

-- 30. Join with citizens + officers to show full interaction
SELECT f.id, c.full_name, f.feedback_type, o.name AS officer
FROM public_feedback f
JOIN citizens c ON f.citizen_id=c.id
JOIN officers o ON f.officer_id=o.id;

-- 31. Feedback submitted by the same citizen as feedback #1
SELECT * FROM public_feedback
WHERE citizen_id=(SELECT citizen_id FROM public_feedback WHERE id=1);

-- 32. Feedback handled by the same officer as feedback #5
SELECT * FROM public_feedback
WHERE officer_id=(SELECT officer_id FROM public_feedback WHERE id=5);

-- 33. Feedback in the same location as feedback #10
SELECT * FROM public_feedback
WHERE location_id=(SELECT location_id FROM public_feedback WHERE id=10);

-- 34. Citizens who gave both Complaints and Suggestions
SELECT citizen_id FROM public_feedback
WHERE feedback_type='Complaint'
AND citizen_id IN (SELECT citizen_id FROM public_feedback WHERE feedback_type='Suggestion');

-- 35. Feedback with message length greater than the average
SELECT * FROM public_feedback
WHERE LENGTH(message) > (SELECT AVG(LENGTH(message)) FROM public_feedback);

-- 36. Officers who handled at least one 'Closed' feedback
SELECT officer_id FROM public_feedback
WHERE officer_id IN (SELECT officer_id FROM public_feedback WHERE status='Closed');

-- 37. Feedback with same status as feedback #3
SELECT * FROM public_feedback
WHERE status=(SELECT status FROM public_feedback WHERE id=3);

-- 38. Feedback from citizens who also submitted complaints
SELECT * FROM public_feedback
WHERE citizen_id IN (SELECT citizen_id FROM public_feedback WHERE feedback_type='Complaint');

-- 39. Find locations with more feedback than location_id=13
SELECT location_id, COUNT(*) AS total
FROM public_feedback
GROUP BY location_id
HAVING COUNT(*) > (
  SELECT COUNT(*) FROM public_feedback WHERE location_id=13
);

-- 40. Feedback by officers who handled more than 2 suggestions
SELECT * FROM public_feedback
WHERE officer_id IN (
  SELECT officer_id FROM public_feedback
  WHERE feedback_type='Suggestion'
  GROUP BY officer_id
  HAVING COUNT(*)>2
);

-- 41. Convert messages to uppercase
SELECT UPPER(message) FROM public_feedback;

-- 42. Get first 5 characters of document_reference
SELECT LEFT(document_reference,5) AS ref_prefix FROM public_feedback;

-- 43. Count words in each message
SELECT id, message, (LENGTH(message) - LENGTH(REPLACE(message,' ','')) + 1) AS word_count
FROM public_feedback;

-- 44. Replace 'aid' with 'support' in messages
SELECT REPLACE(message,'aid','support') FROM public_feedback;

-- 45. Extract year from feedback_date
SELECT id, YEAR(feedback_date) AS feedback_year FROM public_feedback;

-- 46. UDF: Classify feedback type
DELIMITER //
CREATE FUNCTION feedback_score(ftype VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
  IF ftype='Complaint' THEN RETURN -1;
  ELSEIF ftype='Suggestion' THEN RETURN 0;
  ELSE RETURN 1;
  END IF;
END //
DELIMITER ;

-- 47. Use feedback_score
SELECT id, feedback_type, feedback_score(feedback_type) AS score FROM public_feedback;

-- 48. UDF: Generate feedback code
DELIMITER //
CREATE FUNCTION feedback_code(fid INT, ftype VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('FB-',fid,'-',UPPER(LEFT(ftype,3)));
END //
DELIMITER ;

-- 49. Use feedback_code
SELECT id, feedback_type, feedback_code(id,feedback_type) AS fb_code FROM public_feedback;

-- 50. UDF: Count words in remarks
DELIMITER //
CREATE FUNCTION word_count(txt TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (LENGTH(txt)-LENGTH(REPLACE(txt,' ',''))+1);
END //
DELIMITER ;

-- Use word_count
SELECT id, remarks, word_count(remarks) AS remark_words FROM public_feedback;
-- 46. UDF: Classify feedback type
DELIMITER //
CREATE FUNCTION feedback_score(ftype VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
  IF ftype='Complaint' THEN RETURN -1;
  ELSEIF ftype='Suggestion' THEN RETURN 0;
  ELSE RETURN 1;
  END IF;
END //
DELIMITER ;

-- 47. Use feedback_score
SELECT id, feedback_type, feedback_score(feedback_type) AS score FROM public_feedback;

-- 48. UDF: Generate feedback code
DELIMITER //
CREATE FUNCTION feedback_code(fid INT, ftype VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('FB-',fid,'-',UPPER(LEFT(ftype,3)));
END //
DELIMITER ;

-- 49. Use feedback_code
SELECT id, feedback_type, feedback_code(id,feedback_type) AS fb_code FROM public_feedback;

-- 50. UDF: Count words in remarks
DELIMITER //
CREATE FUNCTION word_count(txt TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (LENGTH(txt)-LENGTH(REPLACE(txt,' ',''))+1);
END //
DELIMITER ;

-- Use word_count
SELECT id, remarks, word_count(remarks) AS remark_words FROM public_feedback;



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
-- 1. Show all training programs
SELECT * FROM training_programs;

-- 2. Find all Finance-related programs
SELECT * FROM training_programs WHERE category='Finance';

-- 3. Show all programs scheduled in June 2025
SELECT * FROM training_programs 
WHERE MONTH(start_date)=6 AND YEAR(start_date)=2025;

-- 4. Find all programs that are "Planned"
SELECT * FROM training_programs WHERE status='Planned';

-- 5. Show programs with duration longer than 3 days
SELECT * FROM training_programs 
WHERE DATEDIFF(end_date, start_date) > 3;

-- 6. Find all programs by trainer "Mr. Sanjay Rao"
SELECT * FROM training_programs WHERE trainer_name='Mr. Sanjay Rao';

-- 7. Show training programs in location_id = 9
SELECT * FROM training_programs WHERE location_id=9;

-- 8. Find programs with "Safety" in category
SELECT * FROM training_programs WHERE category='Safety';

-- 9. List programs starting after 2025-08-01
SELECT * FROM training_programs WHERE start_date > '2025-08-01';

-- 10. Find all training programs handled by officer_id=310
SELECT * FROM training_programs WHERE officer_id=310;

-- 11. Count total training programs
SELECT COUNT(*) AS total_programs FROM training_programs;

-- 12. Count programs by category
SELECT category, COUNT(*) AS total FROM training_programs GROUP BY category;

-- 13. Count programs by status
SELECT status, COUNT(*) AS total FROM training_programs GROUP BY status;

-- 14. Count programs by officer
SELECT officer_id, COUNT(*) AS total FROM training_programs GROUP BY officer_id;

-- 15. Find the earliest program start date
SELECT MIN(start_date) AS first_program FROM training_programs;

-- 16. Find the latest program end date
SELECT MAX(end_date) AS last_program FROM training_programs;

-- 17. Find average duration of programs
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_duration FROM training_programs;

-- 18. Count programs per month
SELECT MONTH(start_date) AS month, COUNT(*) AS total
FROM training_programs
GROUP BY MONTH(start_date);

-- 19. Find categories with more than 2 programs
SELECT category, COUNT(*) AS total
FROM training_programs
GROUP BY category
HAVING COUNT(*)>2;

-- 20. Find officer with maximum programs assigned
SELECT officer_id, COUNT(*) AS total
FROM training_programs
GROUP BY officer_id
ORDER BY total DESC
LIMIT 1;

-- 21. Join training programs with officers
SELECT t.id, t.title, o.name AS officer_name, t.status
FROM training_programs t
JOIN officers o ON t.officer_id=o.id;

-- 22. Join training programs with locations
SELECT t.id, t.title, l.district, l.state
FROM training_programs t
JOIN locations l ON t.location_id=l.id;

-- 23. Find all Finance programs with officer details
SELECT t.title, o.name
FROM training_programs t
JOIN officers o ON t.officer_id=o.id
WHERE t.category='Finance';

-- 24. Find Safety programs with trainer names and location
SELECT t.title, t.trainer_name, l.district
FROM training_programs t
JOIN locations l ON t.location_id=l.id
WHERE t.category='Safety';

-- 25. Officers who handled programs in July 2025
SELECT DISTINCT o.name
FROM training_programs t
JOIN officers o ON t.officer_id=o.id
WHERE MONTH(t.start_date)=7 AND YEAR(t.start_date)=2025;

-- 26. Number of programs per officer
SELECT o.name, COUNT(t.id) AS total_programs
FROM training_programs t
JOIN officers o ON t.officer_id=o.id
GROUP BY o.name;

-- 27. Programs in Pune locations
SELECT t.title, l.district
FROM training_programs t
JOIN locations l ON t.location_id=l.id
WHERE l.district='Pune';

-- 28. Join with officers and locations together
SELECT t.title, o.name AS officer, l.district, l.state
FROM training_programs t
JOIN officers o ON t.officer_id=o.id
JOIN locations l ON t.location_id=l.id;

-- 29. Programs linked with citizens enrolled (assuming enrollment table)
SELECT c.full_name, t.title
FROM citizen_enrollments ce
JOIN citizens c ON ce.citizen_id=c.id
JOIN training_programs t ON ce.program_id=t.id;

-- 30. Find officers with Finance & Safety category programs
SELECT DISTINCT o.name
FROM training_programs t
JOIN officers o ON t.officer_id=o.id
WHERE t.category IN ('Finance','Safety');

-- 31. Programs handled by the same officer as program #5
SELECT * FROM training_programs
WHERE officer_id=(SELECT officer_id FROM training_programs WHERE id=5);

-- 32. Programs in the same location as program #2
SELECT * FROM training_programs
WHERE location_id=(SELECT location_id FROM training_programs WHERE id=2);

-- 33. Programs in the same category as "Loan Management"
SELECT * FROM training_programs
WHERE category=(SELECT category FROM training_programs WHERE title='Loan Management');

-- 34. Programs with longer duration than average
SELECT * FROM training_programs
WHERE DATEDIFF(end_date, start_date) > (
  SELECT AVG(DATEDIFF(end_date, start_date)) FROM training_programs
);

-- 35. Officers handling more than 2 programs
SELECT officer_id FROM training_programs
GROUP BY officer_id
HAVING COUNT(*)>2;

-- 36. Find all programs run by officers from #35
SELECT * FROM training_programs
WHERE officer_id IN (
  SELECT officer_id FROM training_programs GROUP BY officer_id HAVING COUNT(*)>2
);

-- 37. Programs scheduled after the latest Finance program
SELECT * FROM training_programs
WHERE start_date > (
  SELECT MAX(end_date) FROM training_programs WHERE category='Finance'
);

-- 38. Programs whose trainers also trained other programs
SELECT * FROM training_programs
WHERE trainer_name IN (
  SELECT trainer_name FROM training_programs GROUP BY trainer_name HAVING COUNT(*)>1
);

-- 39. Locations with more programs than location_id=7
SELECT location_id, COUNT(*) AS total
FROM training_programs
GROUP BY location_id
HAVING COUNT(*) > (
  SELECT COUNT(*) FROM training_programs WHERE location_id=7
);

-- 40. Programs in categories that have at least 3 programs
SELECT * FROM training_programs
WHERE category IN (
  SELECT category FROM training_programs GROUP BY category HAVING COUNT(*)>=3
);

-- 41. Convert program titles to uppercase
SELECT UPPER(title) FROM training_programs;

-- 42. Get first 10 characters of description
SELECT LEFT(description,10) AS short_desc FROM training_programs;

-- 43. Extract year from start_date
SELECT id, YEAR(start_date) AS start_year FROM training_programs;

-- 44. Replace "Training" with "Workshop" in titles
SELECT REPLACE(title,'Training','Workshop') FROM training_programs;

-- 45. Show title length
SELECT title, LENGTH(title) AS title_length FROM training_programs;

-- 46. UDF: Calculate program duration
DELIMITER //
CREATE FUNCTION program_duration(s DATE, e DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(e,s);
END //
DELIMITER ;

-- 47. Use program_duration
SELECT id, title, program_duration(start_date,end_date) AS duration_days
FROM training_programs;

-- 48. UDF: Generate program code
DELIMITER //
CREATE FUNCTION program_code(pid INT, cat VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('TP-',pid,'-',UPPER(LEFT(cat,3)));
END //
DELIMITER ;

-- 49. Use program_code
SELECT id, category, program_code(id,category) AS prog_code
FROM training_programs;

-- 50. UDF: Check if program is "Long" (>3 days) or "Short"
DELIMITER //
CREATE FUNCTION program_type(s DATE, e DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF DATEDIFF(e,s) > 3 THEN RETURN 'Long';
  ELSE RETURN 'Short';
  END IF;
END //
DELIMITER ;

-- Use program_type
SELECT id, title, program_type(start_date,end_date) AS prog_type
FROM training_programs;

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
    
-- 1. Retrieve all emergency contacts
SELECT * FROM emergency_contacts;

-- 2. Get all active emergency contacts
SELECT * FROM emergency_contacts WHERE status = 'Active';

-- 3. Count how many contacts are Pending
SELECT COUNT(*) AS pending_contacts FROM emergency_contacts WHERE status = 'Pending';

-- 4. Find all contacts from department 'Health'
SELECT * FROM emergency_contacts WHERE department = 'Health';

-- 5. List distinct departments available
SELECT DISTINCT department FROM emergency_contacts;

-- 6. Order contacts by department name
SELECT * FROM emergency_contacts ORDER BY department ASC;

-- 7. Show the top 5 recently added contacts (by id)
SELECT * FROM emergency_contacts ORDER BY id DESC LIMIT 5;

-- 8. Get all contacts whose name starts with 'A'
SELECT * FROM emergency_contacts WHERE name LIKE 'A%';

-- 9. Count contacts per department
SELECT department, COUNT(*) AS total FROM emergency_contacts GROUP BY department;

-- 10. Find contacts without remarks
SELECT * FROM emergency_contacts WHERE remarks = '';

-- 11. Join contacts with feedbacks by location_id
SELECT e.name, e.department, f.feedback_type, f.message
FROM emergency_contacts e
JOIN public_feedback f ON e.location_id = f.location_id;

-- 12. Count feedbacks handled by each emergency contact (based on officer_id)
SELECT e.name, COUNT(f.id) AS feedback_count
FROM emergency_contacts e
LEFT JOIN public_feedback f ON e.id = f.officer_id
GROUP BY e.name;

-- 13. Find departments that received complaints
SELECT DISTINCT e.department
FROM emergency_contacts e
JOIN public_feedback f ON e.location_id = f.location_id
WHERE f.feedback_type = 'Complaint';

-- 14. List contacts who are from the same location where compliments were received
SELECT DISTINCT e.name, e.department
FROM emergency_contacts e
JOIN public_feedback f ON e.location_id = f.location_id
WHERE f.feedback_type = 'Compliment';

-- 15. Find feedback messages related to ‘Health’ department contacts
SELECT f.message
FROM public_feedback f
JOIN emergency_contacts e ON f.location_id = e.location_id
WHERE e.department = 'Health';

-- 16. Get contacts from locations where complaints exist
SELECT * FROM emergency_contacts
WHERE location_id IN (
    SELECT location_id FROM public_feedback WHERE feedback_type = 'Complaint'
);

-- 17. Find the department with maximum contacts
SELECT department
FROM emergency_contacts
GROUP BY department
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 18. Find names of officers who handled more than 2 feedbacks
SELECT name FROM emergency_contacts
WHERE id IN (
    SELECT officer_id FROM public_feedback
    GROUP BY officer_id
    HAVING COUNT(*) > 2
);

-- 19. Get contacts with same location as 'Ravi Kumar'
SELECT * FROM emergency_contacts
WHERE location_id = (
    SELECT location_id FROM emergency_contacts WHERE name = 'Ravi Kumar'
);

-- 20. Get departments that do not have any pending contacts
SELECT DISTINCT department FROM emergency_contacts e
WHERE department NOT IN (
    SELECT department FROM emergency_contacts WHERE status = 'Pending'
);

-- 21. Find average length of contact names
SELECT AVG(LENGTH(name)) AS avg_name_length FROM emergency_contacts;

-- 22. Find maximum contact number (lexical max)
SELECT MAX(contact_number) FROM emergency_contacts;

-- 23. Count unique emails
SELECT COUNT(DISTINCT email) AS unique_emails FROM emergency_contacts;

-- 24. Find departments with more than 1 pending contact
SELECT department, COUNT(*) FROM emergency_contacts
WHERE status = 'Pending'
GROUP BY department HAVING COUNT(*) > 1;

-- 25. Get current date for record check
SELECT CURRENT_DATE AS today;

-- 26. Display contacts with uppercase names
SELECT UPPER(name) AS upper_name, department FROM emergency_contacts;

-- 27. Show only first 5 characters of name
SELECT SUBSTRING(name, 1, 5) AS short_name, department FROM emergency_contacts;

-- 28. Concatenate name and email
SELECT name || ' - ' || email AS full_contact FROM emergency_contacts;

-- 30. Replace '@gov' with '@official' in emails
SELECT REPLACE(email, '@gov', '@official') AS new_email FROM emergency_contacts;

-- 31. Find earliest feedback date
SELECT MIN(feedback_date) FROM public_feedback;

-- 32. Find latest feedback date
SELECT MAX(feedback_date) FROM public_feedback;

-- 33. Count feedback per month
SELECT EXTRACT(MONTH FROM feedback_date) AS month, COUNT(*) 
FROM public_feedback GROUP BY month;

-- 34. Calculate days since each feedback
SELECT id, feedback_date, CURRENT_DATE - feedback_date AS days_passed
FROM public_feedback;

-- 35. Find average officer_id assigned in feedbacks
SELECT AVG(officer_id) FROM public_feedback;

-- 37. Cross join between departments and feedback types
SELECT DISTINCT e.department, f.feedback_type
FROM emergency_contacts e
CROSS JOIN public_feedback f;

-- 38. Self join: contacts from same department
SELECT a.name AS contact1, b.name AS contact2, a.department
FROM emergency_contacts a
JOIN emergency_contacts b ON a.department = b.department
WHERE a.id < b.id;

-- 39. Rank departments by number of contacts
SELECT department, COUNT(*) AS total,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_no
FROM emergency_contacts
GROUP BY department;

-- 40. Show row_number for contacts
SELECT id, name, ROW_NUMBER() OVER (ORDER BY department) AS row_num
FROM emergency_contacts;

-- 41. Show running total of contacts by id
SELECT id, name, SUM(id) OVER (ORDER BY id) AS running_total
FROM emergency_contacts;

-- 43. Use the function for a specific contact
SELECT is_contact_active(7);

-- 44. List contacts with function result
SELECT id, name, is_contact_active(id) AS active_status
FROM emergency_contacts;

-- 45. Get feedback count for each location with subquery
SELECT location_id,
       (SELECT COUNT(*) FROM public_feedback f WHERE f.location_id = e.location_id) AS feedbacks
FROM emergency_contacts e GROUP BY location_id;

-- 46. Find the officer who handled the earliest feedback
SELECT name FROM emergency_contacts
WHERE id = (
    SELECT officer_id FROM public_feedback ORDER BY feedback_date ASC LIMIT 1
);

-- 47. Find contact with the longest email address
SELECT name, email FROM emergency_contacts
ORDER BY LENGTH(email) DESC LIMIT 1;

-- 48. Show contacts with no feedback linked
SELECT * FROM emergency_contacts e
WHERE NOT EXISTS (SELECT 1 FROM public_feedback f WHERE f.officer_id = e.id);

-- 50. Show department with highest feedback involvement
SELECT e.department, COUNT(f.id) AS feedbacks
FROM emergency_contacts e
JOIN public_feedback f ON e.location_id = f.location_id
GROUP BY e.department
ORDER BY feedbacks DESC
LIMIT 1;

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

-- 1. Show all budget plans
SELECT * FROM budget_plans;

-- 2. Retrieve only approved plans
SELECT * FROM budget_plans WHERE status = 'Approved';

-- 3. Find total estimated amount across all plans
SELECT SUM(estimated_amount) AS total_estimated FROM budget_plans;

-- 4. Find total approved amount across all plans
SELECT SUM(approved_amount) AS total_approved FROM budget_plans;

-- 5. Show plans created after 2025-05-01
SELECT * FROM budget_plans WHERE date_created > '2025-05-01';

-- 6. Show pending plans with remarks
SELECT id, plan_name, remarks FROM budget_plans WHERE status = 'Pending';

-- 7. Show the plan with highest estimated amount
SELECT * FROM budget_plans ORDER BY estimated_amount DESC LIMIT 1;

-- 8. Show the plan with lowest approved amount
SELECT * FROM budget_plans ORDER BY approved_amount ASC LIMIT 1;

-- 9. Count how many budget plans are pending
SELECT COUNT(*) AS pending_count FROM budget_plans WHERE status = 'Pending';

-- 10. Count distinct officers handling plans
SELECT COUNT(DISTINCT officer_id) AS unique_officers FROM budget_plans;

-- 11. Join with emergency_contacts to show officer details
SELECT b.plan_name, b.estimated_amount, e.name AS officer_name, e.department
FROM budget_plans b
JOIN emergency_contacts e ON b.officer_id = e.id;

-- 12. Join with public_feedback to check feedback on the same officer
SELECT b.plan_name, f.feedback_type, f.message
FROM budget_plans b
JOIN public_feedback f ON b.officer_id = f.officer_id;

-- 13. Find officers who have both budget plans and feedback complaints
SELECT DISTINCT e.name, e.department
FROM emergency_contacts e
JOIN budget_plans b ON e.id = b.officer_id
JOIN public_feedback f ON e.id = f.officer_id
WHERE f.feedback_type = 'Complaint';

-- 14. Find budget plans where officers also appear in emergency contacts
SELECT b.plan_name, e.name, e.department
FROM budget_plans b
LEFT JOIN emergency_contacts e ON b.officer_id = e.id;

-- 15. Show budget plans and feedback count for each officer
SELECT b.plan_name, b.officer_id, COUNT(f.id) AS feedback_count
FROM budget_plans b
LEFT JOIN public_feedback f ON b.officer_id = f.officer_id
GROUP BY b.plan_name, b.officer_id;

-- 16. Get plans with estimated amount greater than average
SELECT * FROM budget_plans
WHERE estimated_amount > (SELECT AVG(estimated_amount) FROM budget_plans);

-- 17. Find officer who handled the highest approved budget
SELECT officer_id FROM budget_plans
WHERE approved_amount = (SELECT MAX(approved_amount) FROM budget_plans);

-- 18. Show plans with approved < estimated
SELECT * FROM budget_plans
WHERE approved_amount < estimated_amount;

-- 19. Find plans created on the same date as 'Annual Relief Budget'
SELECT * FROM budget_plans
WHERE date_created = (SELECT date_created FROM budget_plans WHERE plan_name = 'Annual Relief Budget');

-- 20. Get officer ids with more than 2 budget plans
SELECT officer_id FROM budget_plans
GROUP BY officer_id HAVING COUNT(*) > 2;

-- 21. Find average approved amount
SELECT AVG(approved_amount) AS avg_approved FROM budget_plans;

-- 22. Find difference between estimated and approved per plan
SELECT plan_name, (estimated_amount - approved_amount) AS variance
FROM budget_plans;

-- 23. Show total approved per fiscal year
SELECT fiscal_year, SUM(approved_amount) FROM budget_plans GROUP BY fiscal_year;

-- 24. Show highest and lowest budget per year
SELECT fiscal_year, MAX(approved_amount) AS max_amt, MIN(approved_amount) AS min_amt
FROM budget_plans GROUP BY fiscal_year;

-- 25. Show standard deviation of estimated amounts
SELECT STDDEV(estimated_amount) FROM budget_plans;

-- 26. Convert plan names to uppercase
SELECT UPPER(plan_name) FROM budget_plans;

-- 27. Show only first 10 characters of remarks
SELECT SUBSTRING(remarks, 1, 10) AS short_remarks FROM budget_plans;

-- 29. Concatenate plan name and fiscal year
SELECT plan_name || ' (' || fiscal_year || ')' AS full_name FROM budget_plans;

-- 30. Replace 'Budget' with 'Plan' in plan names
SELECT REPLACE(plan_name, 'Budget', 'Plan') AS updated_name FROM budget_plans;


-- 31. Find earliest plan creation date
SELECT MIN(date_created) FROM budget_plans;

-- 32. Find latest plan creation date
SELECT MAX(date_created) FROM budget_plans;

-- 33. Count plans per month
SELECT EXTRACT(MONTH FROM date_created) AS month, COUNT(*)
FROM budget_plans GROUP BY month;

-- 34. Find days since each plan created
SELECT plan_name, CURRENT_DATE - date_created AS days_passed
FROM budget_plans;

-- 35. Show plans created in April 2025
SELECT * FROM budget_plans WHERE EXTRACT(MONTH FROM date_created) = 4;

-- 37. Cross join plans with feedback types
SELECT b.plan_name, f.feedback_type
FROM budget_plans b
CROSS JOIN (SELECT DISTINCT feedback_type FROM public_feedback) f;

-- 38. Self join: compare budget variance
SELECT a.plan_name AS plan1, b.plan_name AS plan2, 
       a.estimated_amount - b.estimated_amount AS diff
FROM budget_plans a
JOIN budget_plans b ON a.id < b.id;


-- 40. Assign row numbers per officer
SELECT officer_id, plan_name,
       ROW_NUMBER() OVER (PARTITION BY officer_id ORDER BY date_created) AS row_num
FROM budget_plans;

-- 41. Show running total of approved amount
SELECT plan_name, approved_amount,
       SUM(approved_amount) OVER (ORDER BY date_created) AS running_total
FROM budget_plans;

-- 43. Use the function for a specific plan
SELECT is_over_budget(1);

-- 44. Apply UDF to all plans
SELECT id, plan_name, is_over_budget(id) AS budget_status FROM budget_plans;

-- 45. Find officer with the largest total approved amount
SELECT officer_id FROM budget_plans
GROUP BY officer_id ORDER BY SUM(approved_amount) DESC LIMIT 1;

-- 46. Find top 3 highest estimated plans
SELECT plan_name, estimated_amount FROM budget_plans
ORDER BY estimated_amount DESC LIMIT 3;

-- 47. Find plans with approved < 90% of estimated
SELECT plan_name, approved_amount, estimated_amount
FROM budget_plans
WHERE approved_amount < 0.9 * estimated_amount;

-- 48. Find percentage approval (approved/estimated) per plan
SELECT plan_name, ROUND((approved_amount/estimated_amount)*100,2) AS approval_percentage
FROM budget_plans;

-- 49. Show department and total approved using joins
SELECT e.department, SUM(b.approved_amount) AS total_approved
FROM budget_plans b
JOIN emergency_contacts e ON b.officer_id = e.id
GROUP BY e.department;

-- 50. Get year-wise budget summary
SELECT fiscal_year,
       SUM(estimated_amount) AS total_estimated,
       SUM(approved_amount) AS total_approved
FROM budget_plans GROUP BY fiscal_year;


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


-- 1. Get all audit logs
SELECT * FROM audit_trails;

-- 2. Show distinct action types performed
SELECT DISTINCT action_type FROM audit_trails;

-- 3. Count how many actions were taken on each table
SELECT table_name, COUNT(*) AS action_count
FROM audit_trails
GROUP BY table_name;

-- 4. Find the latest 5 actions
SELECT * FROM audit_trails
ORDER BY action_time DESC
LIMIT 5;

-- 5. Find total records inserted
SELECT COUNT(*) AS total_inserts
FROM audit_trails
WHERE action_type = 'INSERT';


-- 6. Extract date from action_time
SELECT id, DATE(action_time) AS action_date
FROM audit_trails;

-- 7. Find logs performed in June 2025
SELECT * FROM audit_trails
WHERE MONTH(action_time) = 6 AND YEAR(action_time) = 2025;

-- 8. Count logs per officer
SELECT officer_id, COUNT(*) AS total_logs
FROM audit_trails
GROUP BY officer_id;

-- 9. Find earliest and latest action timestamp
SELECT MIN(action_time) AS first_action, MAX(action_time) AS last_action
FROM audit_trails;

-- 10. Find number of failed vs successful actions
SELECT status, COUNT(*) AS total
FROM audit_trails
GROUP BY status;

-- 11. Get table names in uppercase
SELECT UPPER(table_name) AS table_upper
FROM audit_trails;

-- 12. Extract first 3 characters of IP address
SELECT id, LEFT(ip_address, 3) AS subnet
FROM audit_trails;

-- 13. Find actions where remarks contain the word 'updated'
SELECT * FROM audit_trails
WHERE remarks LIKE '%updated%';

-- 14. Replace 'Success' with 'Completed' in status
SELECT REPLACE(status, 'Success', 'Completed') AS new_status
FROM audit_trails;

-- 15. Concatenate officer_id and action_type
SELECT CONCAT('Officer-', officer_id, ' did ', action_type) AS details
FROM audit_trails;


-- 16. Join audit_trails with budget_plans to see actions on budget plans
SELECT a.id, a.action_type, b.plan_name, b.fiscal_year
FROM audit_trails a
JOIN budget_plans b ON a.record_id = b.id
WHERE a.table_name = 'budget_plans';

-- 17. Left join to include unmatched audit records
SELECT a.id, a.action_type, b.plan_name
FROM audit_trails a
LEFT JOIN budget_plans b ON a.record_id = b.id;

-- 18. Count audit actions per budget plan
SELECT b.plan_name, COUNT(a.id) AS audit_count
FROM budget_plans b
LEFT JOIN audit_trails a ON b.id = a.record_id
GROUP BY b.plan_name;

-- 19. Find officers who created budget plans
SELECT DISTINCT a.officer_id, b.plan_name
FROM audit_trails a
JOIN budget_plans b ON a.record_id = b.id
WHERE a.action_type = 'INSERT';

-- 20. Show approved budget plans with audit status
SELECT b.plan_name, b.status AS budget_status, a.status AS audit_status
FROM budget_plans b
JOIN audit_trails a ON b.id = a.record_id
WHERE b.status = 'Approved';


-- 21. Find officers who performed more than 2 actions
SELECT officer_id
FROM audit_trails
GROUP BY officer_id
HAVING COUNT(*) > 2;

-- 22. Find tables that have both INSERT and DELETE actions
SELECT DISTINCT table_name
FROM audit_trails
WHERE table_name IN (
    SELECT table_name
    FROM audit_trails
    WHERE action_type = 'DELETE'
);

-- 23. Get the officer who performed the latest action
SELECT officer_id
FROM audit_trails
WHERE action_time = (SELECT MAX(action_time) FROM audit_trails);

-- 24. List records whose action_time is greater than the average
SELECT * FROM audit_trails
WHERE action_time > (SELECT AVG(action_time) FROM audit_trails);

-- 25. Find which officer_id has inserted the maximum number of rows
SELECT officer_id
FROM audit_trails
WHERE action_type = 'INSERT'
GROUP BY officer_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- 26. Rank officers by number of actions
SELECT officer_id, COUNT(*) AS total_actions,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_position
FROM audit_trails
GROUP BY officer_id;

-- 27. Running total of actions by date
SELECT DATE(action_time) AS action_date,
COUNT(*) AS actions,
SUM(COUNT(*)) OVER (ORDER BY DATE(action_time)) AS running_total
FROM audit_trails
GROUP BY DATE(action_time);

-- 28. Show last action per officer
SELECT id, officer_id, action_time,
ROW_NUMBER() OVER (PARTITION BY officer_id ORDER BY action_time DESC) AS rn
FROM audit_trails;

-- 29. Show percentage of each action type
SELECT action_type,
ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM audit_trails
GROUP BY action_type;

-- 30. Find lead and lag actions for officers
SELECT officer_id, action_type,
LAG(action_type) OVER (PARTITION BY officer_id ORDER BY action_time) AS previous_action,
LEAD(action_type) OVER (PARTITION BY officer_id ORDER BY action_time) AS next_action
FROM audit_trails;

-- 31. Use the function
SELECT id, dbo.MaskIP(ip_address) AS masked_ip
FROM audit_trails;

-- 32. Get weekday name of each action
SELECT id, DATENAME(WEEKDAY, action_time) AS weekday
FROM audit_trails;

-- 34. Find actions in the last 7 days
SELECT * FROM audit_trails
WHERE action_time >= DATEADD(DAY, -7, GETDATE());

-- 35. Get total actions per month
SELECT YEAR(action_time) AS year, MONTH(action_time) AS month, COUNT(*) AS total
FROM audit_trails
GROUP BY YEAR(action_time), MONTH(action_time);

-- 36. Find difference in minutes between first and last action
SELECT DATEDIFF(MINUTE, MIN(action_time), MAX(action_time)) AS total_minutes
FROM audit_trails;

-- 37. Round action_time to nearest hour
SELECT id, DATEADD(HOUR, DATEDIFF(HOUR, 0, action_time), 0) AS rounded_hour
FROM audit_trails;


-- 38. Pivot count of action_type by status
SELECT action_type,
SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) AS success_count,
SUM(CASE WHEN status<>'Success' THEN 1 ELSE 0 END) AS fail_count
FROM audit_trails
GROUP BY action_type;

-- 41. Find officers who acted on more than 5 different tables
SELECT officer_id, COUNT(DISTINCT table_name) AS tables_acted
FROM audit_trails
GROUP BY officer_id
HAVING COUNT(DISTINCT table_name) > 5;

-- 42. Find duplicate IP addresses
SELECT ip_address, COUNT(*) AS total
FROM audit_trails
GROUP BY ip_address
HAVING COUNT(*) > 1;


-- 43. Track suspicious actions (DELETEs at night)
SELECT * FROM audit_trails
WHERE action_type='DELETE' AND DATEPART(HOUR, action_time) BETWEEN 0 AND 6;

-- 44. Get officers who performed INSERT and UPDATE on same table
SELECT DISTINCT officer_id, table_name
FROM audit_trails
WHERE action_type IN ('INSERT','UPDATE');

-- 45. Find records with missing remarks
SELECT * FROM audit_trails
WHERE remarks IS NULL OR remarks='';

-- 46. Show logs where officer worked in multiple locations
SELECT officer_id, COUNT(DISTINCT location_id) AS location_count
FROM audit_trails
GROUP BY officer_id
HAVING COUNT(DISTINCT location_id) > 1;

-- 47. Show IP addresses used by more than one officer
SELECT ip_address, COUNT(DISTINCT officer_id) AS officers
FROM audit_trails
GROUP BY ip_address
HAVING COUNT(DISTINCT officer_id) > 1;

-- 48. Get officer’s first and last action
SELECT officer_id,
MIN(action_time) AS first_action,
MAX(action_time) AS last_action
FROM audit_trails
GROUP BY officer_id;

-- 49. Total actions grouped by action_type and weekday
SELECT action_type, DATENAME(WEEKDAY, action_time) AS weekday, COUNT(*) AS total
FROM audit_trails
GROUP BY action_type, DATENAME(WEEKDAY, action_time);

-- 50. Show officer’s most recent IP used
SELECT officer_id, ip_address
FROM (
  SELECT officer_id, ip_address,
  ROW_NUMBER() OVER (PARTITION BY officer_id ORDER BY action_time DESC) AS rn
  FROM audit_trails
) t
WHERE rn = 1;


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

-- 1. View all donations
SELECT * FROM donations;

-- 2. Find distinct donation categories
SELECT DISTINCT category FROM donations;

-- 3. Count donations by status
SELECT status, COUNT(*) AS total_donations
FROM donations
GROUP BY status;

-- 4. Show the top 5 highest donations
SELECT * FROM donations
ORDER BY amount DESC
LIMIT 5;

-- 5. Find all donations greater than 10,000
SELECT * FROM donations
WHERE amount > 10000;

-- 6. Get total donation amount
SELECT SUM(amount) AS total_donations
FROM donations;

-- 7. Find the average donation amount
SELECT AVG(amount) AS avg_donation
FROM donations;

-- 8. Round donation amount to nearest 100
SELECT id, donor_name, ROUND(amount, -2) AS rounded_amount
FROM donations;

-- 9. Get min and max donation amounts
SELECT MIN(amount) AS min_donation, MAX(amount) AS max_donation
FROM donations;

-- 10. Extract year and month of donations
SELECT id, YEAR(donation_date) AS year, MONTH(donation_date) AS month
FROM donations;


-- 11. Convert donor names to uppercase
SELECT UPPER(donor_name) AS donor
FROM donations;

-- 12. Get first 5 characters of donor names
SELECT LEFT(donor_name, 5) AS short_name
FROM donations;

-- 13. Find donors whose name contains 'Rao'
SELECT * FROM donations
WHERE donor_name LIKE '%Rao%';

-- 14. Replace 'Cash' with 'Physical Cash'
SELECT REPLACE(mode_of_payment, 'Cash', 'Physical Cash')
FROM donations;

-- 15. Concatenate donor and amount
SELECT CONCAT(donor_name, ' donated Rs.', amount) AS donation_info
FROM donations;


-- 16. Join donations with audit_trails on location_id
SELECT d.donor_name, d.amount, a.action_type, a.status
FROM donations d
JOIN audit_trails a ON d.location_id = a.location_id;

-- 17. Find donations with matching audit trail records
SELECT d.donor_name, d.amount, a.remarks
FROM donations d
LEFT JOIN audit_trails a ON d.location_id = a.location_id;

-- 18. Count audit actions per location and donation sum
SELECT d.location_id, SUM(d.amount) AS total_donations, COUNT(a.id) AS audit_count
FROM donations d
LEFT JOIN audit_trails a ON d.location_id = a.location_id
GROUP BY d.location_id;

-- 19. Show pending donations and their audit remarks
SELECT d.donor_name, d.amount, a.remarks
FROM donations d
JOIN audit_trails a ON d.location_id = a.location_id
WHERE d.status = 'Pending';

-- 20. Donations with IP addresses from audit_trails
SELECT d.donor_name, d.amount, a.ip_address
FROM donations d
JOIN audit_trails a ON d.location_id = a.location_id;


-- 21. Get donors who donated more than the avg donation
SELECT donor_name, amount
FROM donations
WHERE amount > (SELECT AVG(amount) FROM donations);

-- 22. Find highest donor
SELECT donor_name, amount
FROM donations
WHERE amount = (SELECT MAX(amount) FROM donations);

-- 23. Find donations made on the earliest donation date
SELECT * FROM donations
WHERE donation_date = (SELECT MIN(donation_date) FROM donations);

-- 24. Donations in same location as the highest donation
SELECT * FROM donations
WHERE location_id IN (
  SELECT location_id FROM donations WHERE amount = (SELECT MAX(amount) FROM donations)
);

-- 25. Donors who made donations equal to max shelter donation
SELECT donor_name, amount
FROM donations
WHERE amount IN (
  SELECT MAX(amount) FROM donations WHERE category = 'Shelter'
);


-- 26. Rank donations by amount
SELECT donor_name, amount,
RANK() OVER (ORDER BY amount DESC) AS donation_rank
FROM donations;

-- 27. Running total of donations by date
SELECT donation_date, amount,
SUM(amount) OVER (ORDER BY donation_date) AS running_total
FROM donations;

-- 28. Find previous and next donations for each record
SELECT donor_name, amount,
LAG(amount) OVER (ORDER BY donation_date) AS prev_donation,
LEAD(amount) OVER (ORDER BY donation_date) AS next_donation
FROM donations;

-- 29. Percent contribution of each donation
SELECT donor_name, amount,
ROUND(100.0 * amount / SUM(amount) OVER (), 2) AS percentage
FROM donations;

-- 30. Show donation rank within category
SELECT donor_name, category, amount,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY amount DESC) AS rank_in_category
FROM donations;


-- 31. Use the DonationSize function
SELECT donor_name, amount, dbo.DonationSize(amount) AS size_category
FROM donations;


-- 33. Get donations in June
SELECT * FROM donations
WHERE MONTH(donation_date) = 6;

-- 34. Donations made in last 7 days
SELECT * FROM donations
WHERE donation_date >= DATEADD(DAY, -7, GETDATE());

-- 35. Get weekday of donations
SELECT donor_name, DATENAME(WEEKDAY, donation_date) AS donation_day
FROM donations;

-- 36. Count donations per month
SELECT YEAR(donation_date) AS year, MONTH(donation_date) AS month, COUNT(*) AS total
FROM donations
GROUP BY YEAR(donation_date), MONTH(donation_date);

-- 37. Difference in days between first and last donation
SELECT DATEDIFF(DAY, MIN(donation_date), MAX(donation_date)) AS donation_span_days
FROM donations;


-- 38. Pivot donations by status
SELECT category,
SUM(CASE WHEN status = 'Received' THEN amount ELSE 0 END) AS received_amount,
SUM(CASE WHEN status = 'Pending' THEN amount ELSE 0 END) AS pending_amount
FROM donations
GROUP BY category;

-- 39. Donor with max donation in each category
SELECT category, donor_name, amount
FROM donations d
WHERE amount = (
  SELECT MAX(amount) FROM donations WHERE category = d.category
);

-- 40. Find categories with average donation > 5000
SELECT category, AVG(amount) AS avg_amount
FROM donations
GROUP BY category
HAVING AVG(amount) > 5000;

-- 41. Count distinct donors per payment mode
SELECT mode_of_payment, COUNT(DISTINCT donor_name) AS donor_count
FROM donations
GROUP BY mode_of_payment;

-- 42. Find duplicate donor names
SELECT donor_name, COUNT(*) AS total
FROM donations
GROUP BY donor_name
HAVING COUNT(*) > 1;

-- 43. Donations with pending status
SELECT * FROM donations
WHERE status = 'Pending';

-- 44. High-value donations (> 10000) with audit logs
SELECT d.donor_name, d.amount, a.action_type
FROM donations d
JOIN audit_trails a ON d.location_id = a.location_id
WHERE d.amount > 10000;

-- 45. Donations with no remarks
SELECT * FROM donations
WHERE remarks IS NULL OR remarks = '';

-- 46. Donations grouped by location
SELECT location_id, SUM(amount) AS total_amount
FROM donations
GROUP BY location_id;

-- 47. Donors who paid via more than one mode
SELECT donor_name, COUNT(DISTINCT mode_of_payment) AS modes_used
FROM donations
GROUP BY donor_name
HAVING COUNT(DISTINCT mode_of_payment) > 1;

-- 48. Find donor’s first and last donation
SELECT donor_name,
MIN(donation_date) AS first_donation,
MAX(donation_date) AS last_donation
FROM donations
GROUP BY donor_name;

-- 49. Donations grouped by category and weekday
SELECT category, DATENAME(WEEKDAY, donation_date) AS weekday, COUNT(*) AS total
FROM donations
GROUP BY category, DATENAME(WEEKDAY, donation_date);

-- 50. Show most recent donation per location
SELECT donor_name, amount, location_id
FROM (
  SELECT donor_name, amount, location_id,
  ROW_NUMBER() OVER (PARTITION BY location_id ORDER BY donation_date DESC) AS rn
  FROM donations
) t
WHERE rn = 1;



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

-- 1. List all donations received
SELECT * FROM donations;

-- 2. List all shelter centers with capacity greater than 300
SELECT name, capacity FROM shelter_centers WHERE capacity > 300;

-- 3. Show all audit trails for DELETE actions
SELECT * FROM audit_trails WHERE action_type = 'DELETE';

-- 4. Show donations with corresponding shelter center locations
SELECT d.donor_name, d.amount, s.name AS shelter_name, s.location_id
FROM donations d
JOIN shelter_centers s ON d.location_id = s.location_id;

-- 5. Audit trails with officer info (assumes officer_id exists in shelter_centers)
SELECT a.id, a.action_type, a.table_name, s.contact_person
FROM audit_trails a
JOIN shelter_centers s ON a.officer_id = s.officer_id;

-- 6. Donations joined with shelter centers showing occupancy
SELECT d.donor_name, d.amount, s.name, s.current_occupancy
FROM donations d
INNER JOIN shelter_centers s ON d.location_id = s.location_id
WHERE s.status = 'Open';

-- 7. Total donations received
SELECT SUM(amount) AS total_donations FROM donations WHERE status='Received';

-- 8. Average donation amount by category
SELECT category, AVG(amount) AS avg_donation
FROM donations
GROUP BY category;

-- 9. Number of shelter centers per location
SELECT location_id, COUNT(*) AS shelter_count
FROM shelter_centers
GROUP BY location_id;

-- 10. Find donation records where amount is above average
SELECT * FROM donations
WHERE amount > (SELECT AVG(amount) FROM donations);

-- 11. Find shelter centers with current occupancy above average
SELECT * FROM shelter_centers
WHERE current_occupancy > (SELECT AVG(current_occupancy) FROM shelter_centers);

-- 12. Find officers who performed more than 2 actions
SELECT officer_id
FROM audit_trails
GROUP BY officer_id
HAVING COUNT(*) > 2;

-- 13. Rank donations by amount
SELECT donor_name, amount,
       RANK() OVER (ORDER BY amount DESC) AS rank_amount
FROM donations;

-- 14. Running total of donations by date
SELECT donation_date, SUM(amount) OVER (ORDER BY donation_date) AS running_total
FROM donations;

-- 15. Percentile of shelter occupancy
SELECT name, current_occupancy,
       PERCENT_RANK() OVER (ORDER BY current_occupancy) AS occupancy_percentile
FROM shelter_centers;

-- 16. Format donation amount with commas
SELECT donor_name, FORMAT(amount, 2) AS formatted_amount FROM donations;

-- 17. Extract year and month from donation_date
SELECT donor_name, YEAR(donation_date) AS year, MONTH(donation_date) AS month
FROM donations;

-- 18. Check audit trail IP address length
SELECT id, ip_address, LENGTH(ip_address) AS ip_length FROM audit_trails;

-- 19. Create a UDF to calculate remaining shelter capacity
DELIMITER //
CREATE FUNCTION remaining_capacity(center_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE rem INT;
    SELECT capacity - current_occupancy INTO rem
    FROM shelter_centers
    WHERE id = center_id;
    RETURN rem;
END//
DELIMITER ;

-- Usage
SELECT name, remaining_capacity(id) AS remaining_slots FROM shelter_centers;

-- 20. Donations categorized as 'High' or 'Low' based on amount
SELECT donor_name, amount,
       CASE WHEN amount >= 5000 THEN 'High' ELSE 'Low' END AS donation_level
FROM donations;

-- 21. List all donations along with shelter center info and audit action by officer
SELECT d.donor_name, d.amount, s.name AS shelter_name, a.action_type
FROM donations d
JOIN shelter_centers s ON d.location_id = s.location_id
LEFT JOIN audit_trails a ON s.officer_id = a.officer_id;

-- 22. Count of donations per shelter center
SELECT s.name, COUNT(d.id) AS donation_count
FROM shelter_centers s
LEFT JOIN donations d ON s.location_id = d.location_id
GROUP BY s.name;

-- 23. Show donations and officer names who updated them
SELECT d.donor_name, d.amount, a.officer_id, s.contact_person
FROM donations d
JOIN audit_trails a ON a.table_name='donations' AND a.record_id = d.id
JOIN shelter_centers s ON s.officer_id = a.officer_id;

-- 24. Donations from locations that have more than 1 shelter center
SELECT * FROM donations
WHERE location_id IN (
    SELECT location_id
    FROM shelter_centers
    GROUP BY location_id
    HAVING COUNT(*) > 1
);

-- 25. Find shelters where all donations are above 1000
SELECT * FROM shelter_centers s
WHERE NOT EXISTS (
    SELECT 1 FROM donations d
    WHERE d.location_id = s.location_id AND d.amount < 1000
);

-- 26. Officers who have never deleted any record
SELECT DISTINCT officer_id FROM audit_trails
WHERE officer_id NOT IN (
    SELECT officer_id FROM audit_trails WHERE action_type='DELETE'
);

-- 27. Total donation amount per category
SELECT category, SUM(amount) AS total_amount
FROM donations
GROUP BY category;

-- 28. Average current occupancy by location
SELECT location_id, AVG(current_occupancy) AS avg_occupancy
FROM shelter_centers
GROUP BY location_id;

-- 29. Max donation amount per mode of payment
SELECT mode_of_payment, MAX(amount) AS max_amount
FROM donations
GROUP BY mode_of_payment;

-- 30. Dense rank donations by category
SELECT donor_name, category, amount,
       DENSE_RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS category_rank
FROM donations;

-- 31. Running total per category
SELECT category, amount, SUM(amount) OVER (PARTITION BY category ORDER BY donation_date) AS running_total
FROM donations;

-- 32. Lead and lag donation amounts to see previous and next donations
SELECT donor_name, amount,
       LAG(amount) OVER (ORDER BY donation_date) AS prev_amount,
       LEAD(amount) OVER (ORDER BY donation_date) AS next_amount
FROM donations;


-- 33. Uppercase donor names
SELECT UPPER(donor_name) AS donor_upper FROM donations;

-- 34. Concatenate donor name and category
SELECT CONCAT(donor_name, ' - ', category) AS donor_category FROM donations;

-- 35. Extract day of week from donation_date
SELECT donor_name, DAYNAME(donation_date) AS day_of_week FROM donations;

-- 36. Format contact numbers in shelter centers
SELECT name, CONCAT('+91-', contact_number) AS formatted_contact FROM shelter_centers;

-- 37. UDF to categorize donation size
DELIMITER //
CREATE FUNCTION donation_size(amount DECIMAL(12,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN amount >= 10000 THEN 'Large'
        WHEN amount >= 5000 THEN 'Medium'
        ELSE 'Small'
    END;
END//
DELIMITER ;

-- Usage
SELECT donor_name, amount, donation_size(amount) AS size_category
FROM donations;

-- 38. Create view of donations per shelter
CREATE VIEW view_donations_shelter AS
SELECT d.id AS donation_id, d.donor_name, d.amount, s.name AS shelter_name
FROM donations d
JOIN shelter_centers s ON d.location_id = s.location_id;

-- Usage
SELECT * FROM view_donations_shelter;

-- 39. Shelter centers with max occupancy
SELECT * FROM shelter_centers
WHERE current_occupancy = (
    SELECT MAX(current_occupancy) FROM shelter_centers
);

-- 40. Top 3 highest donations
SELECT * FROM donations
WHERE amount IN (
    SELECT DISTINCT amount FROM donations ORDER BY amount DESC LIMIT 3
);

-- 41. Count donations received online and by cash
SELECT
    SUM(CASE WHEN mode_of_payment='Online' THEN 1 ELSE 0 END) AS online_count,
    SUM(CASE WHEN mode_of_payment='Cash' THEN 1 ELSE 0 END) AS cash_count
FROM donations;

-- 42. Sum of donations received vs pending
SELECT
    SUM(CASE WHEN status='Received' THEN amount ELSE 0 END) AS received_total,
    SUM(CASE WHEN status='Pending' THEN amount ELSE 0 END) AS pending_total
FROM donations;

-- 43. Trigger to log every new donation insert into audit_trails
DELIMITER //
CREATE TRIGGER trg_donation_insert
AFTER INSERT ON donations
FOR EACH ROW
BEGIN
    INSERT INTO audit_trails (action_type, table_name, record_id, officer_id, timestamp, ip_address)
    VALUES ('INSERT', 'donations', NEW.id, NULL, NOW(), '127.0.0.1');
END//
DELIMITER ;

-- 44. Rank shelter centers by occupancy percentage
SELECT name, current_occupancy, capacity,
       (current_occupancy/capacity)*100 AS occupancy_percentage,
       RANK() OVER (ORDER BY (current_occupancy/capacity) DESC) AS rank_occupancy
FROM shelter_centers;

-- 45. Percentile rank of donations
SELECT donor_name, amount,
       PERCENT_RANK() OVER (ORDER BY amount DESC) AS donation_percentile
FROM donations;

-- 46. Donations that have a matching shelter center
SELECT * FROM donations d
WHERE EXISTS (
    SELECT 1 FROM shelter_centers s
    WHERE s.location_id = d.location_id
);

-- 47. Donations without corresponding audit record
SELECT * FROM donations d
WHERE NOT EXISTS (
    SELECT 1 FROM audit_trails a
    WHERE a.table_name='donations' AND a.record_id = d.id
);

-- 48. Categorize shelters based on occupancy
SELECT name, current_occupancy, capacity,
       CASE
           WHEN current_occupancy/capacity >= 0.9 THEN 'High'
           WHEN current_occupancy/capacity >= 0.5 THEN 'Medium'
           ELSE 'Low'
       END AS occupancy_level
FROM shelter_centers;

-- 49. Donations higher than average donation in their category
SELECT d1.*
FROM donations d1
WHERE d1.amount > (
    SELECT AVG(d2.amount)
    FROM donations d2
    WHERE d2.category = d1.category
);

-- 50. Update donation status to 'Reviewed' if amount > average
UPDATE donations
SET status='Reviewed'
WHERE amount > (SELECT AVG(amount) FROM donations);


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

-- 1. Select all records
SELECT * FROM transportation_logs;

-- 2. Select specific columns
SELECT vehicle_number, driver_name, purpose FROM transportation_logs;

-- 3. Filter by status
SELECT * FROM transportation_logs WHERE status='Completed';

-- 4. Filter by route containing 'Pune'
SELECT * FROM transportation_logs WHERE route LIKE '%Pune%';

-- 5. Filter by date range
SELECT * FROM transportation_logs WHERE date_of_use BETWEEN '2025-06-01' AND '2025-06-10';

-- 6. Count total logs
SELECT COUNT(*) AS total_logs FROM transportation_logs;

-- 7. Count logs by status
SELECT status, COUNT(*) AS count_per_status FROM transportation_logs GROUP BY status;

-- 8. Max and Min date_of_use
SELECT MAX(date_of_use) AS last_use, MIN(date_of_use) AS first_use FROM transportation_logs;

-- 9. Average officer_id
SELECT AVG(officer_id) AS avg_officer_id FROM transportation_logs;

-- 10. Group by location_id
SELECT location_id, COUNT(*) AS total_trips FROM transportation_logs GROUP BY location_id;

-- 11. Order by date_of_use descending
SELECT * FROM transportation_logs ORDER BY date_of_use DESC;

-- 12. Order by vehicle_number ascending
SELECT * FROM transportation_logs ORDER BY vehicle_number ASC;

-- 13. Limit records
SELECT * FROM transportation_logs LIMIT 5;

-- 14. Offset records
SELECT * FROM transportation_logs LIMIT 5 OFFSET 5;

-- 15. Select distinct driver_name
SELECT DISTINCT driver_name FROM transportation_logs;

-- 16. Subquery: logs by drivers who used vehicle 'MH14AB1234'
SELECT * FROM transportation_logs WHERE driver_name IN (SELECT driver_name FROM transportation_logs WHERE vehicle_number='MH14AB1234');

-- 17. Subquery: latest log per vehicle
SELECT * FROM transportation_logs t1 WHERE date_of_use = (SELECT MAX(date_of_use) FROM transportation_logs t2 WHERE t2.vehicle_number = t1.vehicle_number);

-- 18. Check if any cancelled trips exist
SELECT CASE WHEN EXISTS(SELECT 1 FROM transportation_logs WHERE status='Cancelled') THEN 'Yes' ELSE 'No' END AS cancelled_exists;

-- 19. Concatenate driver and vehicle
SELECT CONCAT(driver_name, ' - ', vehicle_number) AS driver_vehicle FROM transportation_logs;

-- 20. Extract month from date_of_use
SELECT MONTH(date_of_use) AS use_month, COUNT(*) FROM transportation_logs GROUP BY MONTH(date_of_use);

-- 21. Extract year from date_of_use
SELECT YEAR(date_of_use) AS use_year, COUNT(*) FROM transportation_logs GROUP BY YEAR(date_of_use);

-- 22. Length of route
SELECT route, LENGTH(route) AS route_length FROM transportation_logs;

-- 23. Uppercase purpose
SELECT UPPER(purpose) AS purpose_upper FROM transportation_logs;

-- 24. Lowercase driver_name
SELECT LOWER(driver_name) AS driver_lower FROM transportation_logs;

-- 25. Replace in remarks
SELECT REPLACE(remarks, 'Flat tire', 'Repaired') AS remarks_updated FROM transportation_logs;

-- 26. Join with locations table (simulate)
CREATE TABLE locations (location_id INT PRIMARY KEY, location_name VARCHAR(100));
INSERT INTO locations VALUES (5,'Kolhapur'),(6,'Ahmednagar'),(7,'Maval'),(8,'Thane'),(9,'Latur'),(10,'Nagpur'),(12,'Pune'),(13,'Aurangabad');
SELECT t.vehicle_number, t.driver_name, l.location_name 
FROM transportation_logs t
JOIN locations l ON t.location_id = l.location_id;

-- 27. Left join with officers table (simulate)
CREATE TABLE officers (officer_id INT PRIMARY KEY, officer_name VARCHAR(100));
INSERT INTO officers VALUES (301,'Officer A'),(302,'Officer B'),(303,'Officer C'),(304,'Officer D');
SELECT t.driver_name, o.officer_name, t.status
FROM transportation_logs t
LEFT JOIN officers o ON t.officer_id = o.officer_id;

-- 28. Right join example
SELECT t.driver_name, o.officer_name
FROM transportation_logs t
RIGHT JOIN officers o ON t.officer_id = o.officer_id;

-- 29. Self-join: same location, different drivers
SELECT a.driver_name AS driver1, b.driver_name AS driver2, a.location_id
FROM transportation_logs a
JOIN transportation_logs b ON a.location_id = b.location_id AND a.id <> b.id;

-- 30. Nested subquery: logs with highest officer_id
SELECT * FROM transportation_logs WHERE officer_id = (SELECT MAX(officer_id) FROM transportation_logs);


-- 31 
SELECT dbo.fn_vehicle_status('MH14AB1234') AS vehicle_status;

-- 32. Built-in function: current date
SELECT GETDATE() AS current_datetime;

-- 33. Built-in function: dateadd example
SELECT DATEADD(DAY,5,date_of_use) AS new_date FROM transportation_logs;

-- 34. Built-in function: datediff example
SELECT DATEDIFF(DAY,'2025-06-01',date_of_use) AS days_since_start FROM transportation_logs;

-- 35. Built-in function: substring route
SELECT SUBSTRING(route,1,5) AS route_short FROM transportation_logs;

-- 36. Built-in function: round officer_id
SELECT ROUND(officer_id/100.0,0) AS officer_group FROM transportation_logs;

-- 37. Case statement: trip status description
SELECT vehicle_number,
CASE WHEN status='Completed' THEN 'Done'
     WHEN status='Cancelled' THEN 'Failed'
     ELSE 'Ongoing' END AS status_desc
FROM transportation_logs;

-- 38. Coalesce example for remarks
SELECT vehicle_number, COALESCE(remarks,'No remarks') AS remarks_text FROM transportation_logs;

-- 39. Aggregate with HAVING: locations with more than 2 trips
SELECT location_id, COUNT(*) AS trips_count
FROM transportation_logs
GROUP BY location_id
HAVING COUNT(*) > 2;

-- 40. Exists with correlated subquery
SELECT driver_name FROM transportation_logs t1
WHERE EXISTS (SELECT 1 FROM transportation_logs t2 WHERE t2.location_id = t1.location_id AND t2.status='Cancelled');

-- 41. IN operator example
SELECT * FROM transportation_logs WHERE status IN ('Completed','InTransit');

-- 42. NOT IN operator example
SELECT * FROM transportation_logs WHERE location_id NOT IN (5,6,7);

-- 43. BETWEEN operator example
SELECT * FROM transportation_logs WHERE officer_id BETWEEN 305 AND 310;

-- 44. ORDER BY with multiple columns
SELECT * FROM transportation_logs ORDER BY status ASC, date_of_use DESC;

-- 45. TOP N records
SELECT TOP 3 * FROM transportation_logs ORDER BY date_of_use ASC;

-- 46. Aliases in SELECT
SELECT driver_name AS Driver, vehicle_number AS Vehicle FROM transportation_logs;

-- 47. Aggregate SUM (simulate numeric field as officer_id)
SELECT SUM(officer_id) AS total_officers FROM transportation_logs;

-- 48. Group concatenation (SQL Server STRING_AGG)
SELECT location_id, STRING_AGG(vehicle_number,', ') AS vehicles
FROM transportation_logs
GROUP BY location_id;

-- 49. Ranking: ROW_NUMBER by date_of_use
SELECT vehicle_number, driver_name, ROW_NUMBER() OVER (ORDER BY date_of_use) AS row_num
FROM transportation_logs;

-- 50. Ranking: RANK by officer_id
SELECT vehicle_number, driver_name, RANK() OVER (ORDER BY officer_id DESC) AS rank_officer
FROM transportation_logs;


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

-- 1. Select all volunteers
SELECT * FROM volunteer_registrations;

-- 2. Select volunteers with Active status
SELECT * FROM volunteer_registrations WHERE status='Active';

-- 3. Count of volunteers by gender
SELECT gender, COUNT(*) AS total_volunteers FROM volunteer_registrations GROUP BY gender;

-- 4. Count volunteers in each location
SELECT location_id, COUNT(*) AS total_volunteers FROM volunteer_registrations GROUP BY location_id;

-- 5. Max age of volunteers
SELECT MAX(age) AS oldest_volunteer FROM volunteer_registrations;

-- 6. Min age of volunteers
SELECT MIN(age) AS youngest_volunteer FROM volunteer_registrations;

-- 7. Average age of volunteers
SELECT AVG(age) AS average_age FROM volunteer_registrations;

-- 8. Volunteers whose age > 30
SELECT * FROM volunteer_registrations WHERE age>30;

-- 9. Volunteers registered in June 2025
SELECT * FROM volunteer_registrations WHERE registration_date BETWEEN '2025-06-01' AND '2025-06-30';

-- 10. Volunteer names in uppercase (built-in function)
SELECT UPPER(name) AS uppercase_name FROM volunteer_registrations;

-- 11. Volunteer names in lowercase (built-in function)
SELECT LOWER(name) AS lowercase_name FROM volunteer_registrations;

-- 12. Length of volunteer name
SELECT name, LENGTH(name) AS name_length FROM volunteer_registrations;

-- 13. Concatenate name and contact
SELECT CONCAT(name,' - ',contact_number) AS contact_info FROM volunteer_registrations;

-- 14. Volunteers sorted by age descending
SELECT * FROM volunteer_registrations ORDER BY age DESC;

-- 15. Volunteers sorted by registration date
SELECT * FROM volunteer_registrations ORDER BY registration_date ASC;

-- 16. Top 5 youngest volunteers
SELECT * FROM volunteer_registrations ORDER BY age ASC LIMIT 5;

-- 17. Volunteers with skills like 'Medical'
SELECT * FROM volunteer_registrations WHERE skills LIKE '%Medical%';

-- 18. Count of volunteers by status
SELECT status, COUNT(*) AS total FROM volunteer_registrations GROUP BY status;

-- 19. Volunteers whose names start with 'A'
SELECT * FROM volunteer_registrations WHERE name LIKE 'A%';

-- 20. Volunteers whose names end with 'i'
SELECT * FROM volunteer_registrations WHERE name LIKE '%i';

-- 21. Volunteers whose age is between 25 and 30
SELECT * FROM volunteer_registrations WHERE age BETWEEN 25 AND 30;

-- 22. Join volunteers with transportation_logs by location_id
SELECT v.name, t.vehicle_number, t.purpose
FROM volunteer_registrations v
JOIN transportation_logs t ON v.location_id = t.location_id;

-- 23. Volunteers who have transportation_logs entries
SELECT DISTINCT v.name
FROM volunteer_registrations v
WHERE v.location_id IN (SELECT location_id FROM transportation_logs);

-- 24. Volunteers with no transportation_logs
SELECT * FROM volunteer_registrations v
WHERE NOT EXISTS (SELECT 1 FROM transportation_logs t WHERE t.location_id = v.location_id);

-- 25. Count of transports per volunteer location
SELECT v.location_id, COUNT(t.id) AS transport_count
FROM volunteer_registrations v
LEFT JOIN transportation_logs t ON v.location_id = t.location_id
GROUP BY v.location_id;

-- 26. Max age per location
SELECT location_id, MAX(age) AS max_age FROM volunteer_registrations GROUP BY location_id;

-- 27. Min age per location
SELECT location_id, MIN(age) AS min_age FROM volunteer_registrations GROUP BY location_id;

-- 28. Average age per gender
SELECT gender, AVG(age) AS avg_age FROM volunteer_registrations GROUP BY gender;

-- 29. Volunteers with multiple skills containing comma
SELECT * FROM volunteer_registrations WHERE skills LIKE '%,%';

-- 30. Volunteers with specific skill 'Legal Aid'
SELECT * FROM volunteer_registrations WHERE FIND_IN_SET('Legal Aid', REPLACE(skills,', ',','))>0;

-- 31. Volunteers and total transports for their location (subquery)
SELECT v.name, (SELECT COUNT(*) FROM transportation_logs t WHERE t.location_id = v.location_id) AS transport_count
FROM volunteer_registrations v;

-- 32. Volunteers older than average age (subquery)
SELECT * FROM volunteer_registrations WHERE age > (SELECT AVG(age) FROM volunteer_registrations);

-- 33. Volunteers with latest registration date
SELECT * FROM volunteer_registrations WHERE registration_date = (SELECT MAX(registration_date) FROM volunteer_registrations);

-- 34. Volunteers grouped by location with comma-separated names
SELECT location_id, GROUP_CONCAT(name) AS volunteers
FROM volunteer_registrations GROUP BY location_id;

-- 35. Count of volunteers with 'Pending' status
SELECT COUNT(*) AS pending_volunteers FROM volunteer_registrations WHERE status='Pending';

-- 36. Volunteers whose name contains 'R'
SELECT * FROM volunteer_registrations WHERE name LIKE '%R%';

-- 37. Volunteers with age not null
SELECT * FROM volunteer_registrations WHERE age IS NOT NULL;

-- 38. Volunteers whose location_id is 7 or 9
SELECT * FROM volunteer_registrations WHERE location_id IN (7,9);

-- 39. Volunteers who registered in the first 10 days of June 2025
SELECT * FROM volunteer_registrations WHERE DAY(registration_date)<=10;

-- 40. Volunteers whose email ends with 'example.com'
SELECT * FROM volunteer_registrations WHERE email LIKE '%example.com';

-- 41. Volunteers and their transports using LEFT JOIN
SELECT v.name, t.vehicle_number, t.status AS transport_status
FROM volunteer_registrations v
LEFT JOIN transportation_logs t ON v.location_id = t.location_id;

-- 42. Volunteers with more than one transport in their location
SELECT v.name
FROM volunteer_registrations v
JOIN transportation_logs t ON v.location_id = t.location_id
GROUP BY v.name
HAVING COUNT(t.id)>1;

-- 43. Volunteers count by skill using LIKE
SELECT 'First Aid' AS skill, COUNT(*) FROM volunteer_registrations WHERE skills LIKE '%First Aid%'
UNION
SELECT 'Medical', COUNT(*) FROM volunteer_registrations WHERE skills LIKE '%Medical%';

-- 44. Volunteers with last name 'Patel'
SELECT * FROM volunteer_registrations WHERE name LIKE '% Patel';

-- 45. Volunteers with age as even number (using MOD)
SELECT * FROM volunteer_registrations WHERE MOD(age,2)=0;

-- 46. Volunteers and transports on same location with specific status
SELECT v.name, t.vehicle_number
FROM volunteer_registrations v
JOIN transportation_logs t ON v.location_id = t.location_id
WHERE t.status='Completed';

-- 47. Create user-defined function to calculate volunteer experience days
DELIMITER //
CREATE FUNCTION VolunteerDays(reg_date DATE) RETURNS INT DETERMINISTIC
BEGIN
   RETURN DATEDIFF(CURDATE(), reg_date);
END;
//
DELIMITER ;

-- 48. Use UDF to get experience days
SELECT name, VolunteerDays(registration_date) AS experience_days FROM volunteer_registrations;

-- 49. Volunteers whose age is greater than median (subquery)
SELECT * FROM volunteer_registrations
WHERE age > (SELECT age FROM volunteer_registrations ORDER BY age LIMIT 1 OFFSET 9);

-- 50. Volunteers with skill count more than 1 (using LENGTH and REPLACE)
SELECT * FROM volunteer_registrations WHERE LENGTH(skills)-LENGTH(REPLACE(skills,',',''))>=1;


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
-- 1. Select all volunteers
SELECT * FROM volunteer_registrations;

-- 2. Select active volunteers
SELECT * FROM volunteer_registrations WHERE status='Active';

-- 3. Count total volunteers
SELECT COUNT(*) AS total_volunteers FROM volunteer_registrations;

-- 4. Count volunteers by gender
SELECT gender, COUNT(*) AS total FROM volunteer_registrations GROUP BY gender;

-- 5. Max volunteer age
SELECT MAX(age) AS max_age FROM volunteer_registrations;

-- 6. Min volunteer age
SELECT MIN(age) AS min_age FROM volunteer_registrations;

-- 7. Average age of volunteers
SELECT AVG(age) AS avg_age FROM volunteer_registrations;

-- 8. Volunteers with age > 30
SELECT * FROM volunteer_registrations WHERE age > 30;

-- 9. Volunteers sorted by name
SELECT * FROM volunteer_registrations ORDER BY name;

-- 10. Volunteers in location_id = 7
SELECT * FROM volunteer_registrations WHERE location_id = 7;

-- 11. Join volunteers with resource_requests by location_id
SELECT v.name, r.item_required, r.quantity
FROM volunteer_registrations v
JOIN resource_requests r ON v.location_id = r.location_id;

-- 12. Left join volunteers and resource_requests
SELECT v.name, r.item_required
FROM volunteer_registrations v
LEFT JOIN resource_requests r ON v.location_id = r.location_id;

-- 13. Right join volunteers and resource_requests
SELECT v.name, r.item_required
FROM volunteer_registrations v
RIGHT JOIN resource_requests r ON v.location_id = r.location_id;

-- 14. Volunteers and their total requested quantity
SELECT v.name, SUM(r.quantity) AS total_quantity
FROM volunteer_registrations v
JOIN resource_requests r ON v.location_id = r.location_id
GROUP BY v.name;

-- 15. Subquery: volunteers with requests quantity > 100
SELECT * FROM volunteer_registrations
WHERE location_id IN (
    SELECT location_id FROM resource_requests WHERE quantity > 100
);

-- 16. Subquery: latest request per location
SELECT * FROM resource_requests r
WHERE request_date = (
    SELECT MAX(request_date) FROM resource_requests WHERE location_id = r.location_id
);

-- 17. Correlated subquery: volunteers younger than average age
SELECT * FROM volunteer_registrations v
WHERE age < (SELECT AVG(age) FROM volunteer_registrations);

-- 18. Built-in string function: upper case names
SELECT UPPER(name) AS upper_name FROM volunteer_registrations;

-- 19. Built-in string function: substring of skills
SELECT name, SUBSTRING(skills,1,10) AS skill_snippet FROM volunteer_registrations;

-- 20. Date function: year of registration
SELECT name, YEAR(registration_date) AS reg_year FROM volunteer_registrations;

-- 21. Aggregate: total quantity requested
SELECT SUM(quantity) AS total_quantity FROM resource_requests;

-- 22. Aggregate: average quantity per item
SELECT item_required, AVG(quantity) AS avg_quantity
FROM resource_requests GROUP BY item_required;

-- 23. Count pending requests
SELECT COUNT(*) AS pending_requests FROM resource_requests WHERE status='Pending';

-- 24. Requests in June 2025
SELECT * FROM resource_requests WHERE MONTH(request_date)=6 AND YEAR(request_date)=2025;

-- 25. Join volunteers and approved requests
SELECT v.name, r.item_required
FROM volunteer_registrations v
JOIN resource_requests r ON v.location_id = r.location_id
WHERE r.status='Approved';

-- 26. Volunteers with multiple skills (LIKE)
SELECT * FROM volunteer_registrations WHERE skills LIKE '%Aid%';

-- 27. Top 5 volunteers by age
SELECT * FROM volunteer_registrations ORDER BY age DESC LIMIT 5;

-- 28. Count of requests per location
SELECT location_id, COUNT(*) AS request_count
FROM resource_requests GROUP BY location_id;

-- 29. Requests with remarks
SELECT * FROM resource_requests WHERE remarks IS NOT NULL;

-- 30. Concatenate name and skills
SELECT CONCAT(name, ' - ', skills) AS name_skills FROM volunteer_registrations;

-- 31. User-defined function example: calculate volunteer eligibility (age>25)
 CREATE FUNCTION volunteer_eligible(age INT) RETURNS VARCHAR(10)

SELECT name, volunteer_eligible(age) AS eligible FROM volunteer_registrations;

-- 32. Nested subquery: requests with max quantity per item
SELECT * FROM resource_requests
WHERE quantity = (
    SELECT MAX(quantity) FROM resource_requests r2 WHERE r2.item_required = resource_requests.item_required
);

-- 33. Volunteers who registered before 2025-06-10
SELECT * FROM volunteer_registrations WHERE registration_date < '2025-06-10';

-- 34. Requests grouped by status
SELECT status, COUNT(*) AS total FROM resource_requests GROUP BY status;

-- 35. Requests sorted by quantity desc
SELECT * FROM resource_requests ORDER BY quantity DESC;

-- 36. Volunteers not assigned to any location_id in requests
SELECT * FROM volunteer_registrations
WHERE location_id NOT IN (SELECT DISTINCT location_id FROM resource_requests);

-- 37. Self-join: volunteers in same location
SELECT v1.name AS volunteer1, v2.name AS volunteer2, v1.location_id
FROM volunteer_registrations v1
JOIN volunteer_registrations v2 ON v1.location_id = v2.location_id AND v1.id<>v2.id;

-- 38. Total quantity per officer
SELECT officer_id, SUM(quantity) AS total_quantity
FROM resource_requests GROUP BY officer_id;

-- 39. Built-in numeric function: round average quantity
SELECT ROUND(AVG(quantity),0) AS avg_quantity_rounded FROM resource_requests;

-- 40. Requests with item_required starting with 'S'
SELECT * FROM resource_requests WHERE item_required LIKE 'S%';

-- 41. Volunteers whose name starts with 'A'
SELECT * FROM volunteer_registrations WHERE name LIKE 'A%';

-- 42. Requests in last 10 days (assuming current date 2025-06-20)
SELECT * FROM resource_requests WHERE request_date >= '2025-06-10';

-- 43. Count volunteers per location
SELECT location_id, COUNT(*) AS total_volunteers
FROM volunteer_registrations GROUP BY location_id;

-- 44. Requests with quantity between 50 and 200
SELECT * FROM resource_requests WHERE quantity BETWEEN 50 AND 200;

-- 45. Volunteers with status Pending
SELECT * FROM volunteer_registrations WHERE status='Pending';

-- 46. Requests without document_reference
SELECT * FROM resource_requests WHERE document_reference IS NULL OR document_reference='';

-- 47. Sum of quantities per item
SELECT item_required, SUM(quantity) AS total_quantity
FROM resource_requests GROUP BY item_required;

-- 48. Top 3 items by total quantity
SELECT item_required, SUM(quantity) AS total_quantity
FROM resource_requests GROUP BY item_required ORDER BY total_quantity DESC LIMIT 3;

-- 50. Join volunteers and requests, count requests per volunteer location
SELECT v.name, COUNT(r.id) AS request_count
FROM volunteer_registrations v
LEFT JOIN resource_requests r ON v.location_id = r.location_id
GROUP BY v.name;


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

-- 1. Select all budget allocations
SELECT * FROM Budget_Allocation;

-- 2. Select department name and allocated amount only
SELECT department_name, allocated_amount FROM Budget_Allocation;

-- 3. Select allocations greater than 1,000,000
SELECT * FROM Budget_Allocation WHERE allocated_amount > 1000000;

-- 4. Select allocations with status 'Approved'
SELECT * FROM Budget_Allocation WHERE status = 'Approved';

-- 5. Count total allocations
SELECT COUNT(*) AS total_allocations FROM Budget_Allocation;

-- 6. Sum of allocated amounts
SELECT SUM(allocated_amount) AS total_allocated FROM Budget_Allocation;

-- 7. Average used amount
SELECT AVG(used_amount) AS avg_used FROM Budget_Allocation;

-- 8. Minimum remaining amount
SELECT MIN(remaining_amount) AS min_remaining FROM Budget_Allocation;

-- 9. Maximum allocated amount
SELECT MAX(allocated_amount) AS max_allocated FROM Budget_Allocation;

-- 10. Select allocations ordered by remaining_amount descending
SELECT * FROM Budget_Allocation ORDER BY remaining_amount DESC;

-- 11. Select first 5 records
SELECT * FROM Budget_Allocation LIMIT 5;

-- 12. Select records where department name starts with 'S'
SELECT * FROM Budget_Allocation WHERE department_name LIKE 'S%';

-- 13. Select allocations with remaining amount between 500000 and 1000000
SELECT * FROM Budget_Allocation WHERE remaining_amount BETWEEN 500000 AND 1000000;

-- 14. Select departments that have used more than half of allocated amount
SELECT * FROM Budget_Allocation WHERE used_amount > (allocated_amount / 2);

-- 15. Subquery: Select departments with remaining_amount above average
SELECT * FROM Budget_Allocation WHERE remaining_amount > 
  (SELECT AVG(remaining_amount) FROM Budget_Allocation);

-- 16. Subquery: Select departments using maximum allocated amount
SELECT * FROM Budget_Allocation WHERE used_amount = 
  (SELECT MAX(used_amount) FROM Budget_Allocation);

-- 17. Count allocations by status
SELECT status, COUNT(*) AS count_per_status FROM Budget_Allocation GROUP BY status;

-- 18. Total allocated per fiscal year
SELECT fiscal_year, SUM(allocated_amount) AS total_allocated
FROM Budget_Allocation GROUP BY fiscal_year;

-- 19. Built-in function: Round remaining_amount
SELECT department_name, ROUND(remaining_amount, 0) AS remaining_rounded
FROM Budget_Allocation;

-- 20. Built-in function: Upper department names
SELECT UPPER(department_name) AS dept_upper FROM Budget_Allocation;

-- 21. Built-in function: Format allocated amount
SELECT department_name, FORMAT(allocated_amount, 2) AS formatted_allocated
FROM Budget_Allocation;

-- 22. Built-in function: Current date vs approval_date
SELECT department_name, DATEDIFF(CURDATE(), approval_date) AS days_since_approval
FROM Budget_Allocation;

-- 23. Update status for pending allocations
UPDATE Budget_Allocation SET status='Approved' WHERE status='Pending';

-- 24. Delete a sample record by allocation_id
DELETE FROM Budget_Allocation WHERE allocation_id=20;

-- 25. Create a UDF to calculate remaining percentage
DELIMITER //
CREATE FUNCTION remaining_percent(used DECIMAL(12,2), allocated DECIMAL(12,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  RETURN ((allocated - used) / allocated) * 100;
END //
DELIMITER ;

-- 26. Use UDF to show remaining percentage
SELECT department_name, remaining_percent(used_amount, allocated_amount) AS remaining_pct
FROM Budget_Allocation;

-- 27. Join with hypothetical Departments table
SELECT b.department_name, d.manager_name
FROM Budget_Allocation b
JOIN Departments d ON b.department_name = d.department_name;

-- 28. Left join example
SELECT b.department_name, d.manager_name
FROM Budget_Allocation b
LEFT JOIN Departments d ON b.department_name = d.department_name;

-- 29. Right join example
SELECT b.department_name, d.manager_name
FROM Budget_Allocation b
RIGHT JOIN Departments d ON b.department_name = d.department_name;

-- 30. Self join to compare allocations
SELECT a.department_name AS dept1, b.department_name AS dept2, a.allocated_amount, b.allocated_amount
FROM Budget_Allocation a
JOIN Budget_Allocation b ON a.allocated_amount < b.allocated_amount;

-- 31. Subquery: Select departments with below-average used amount
SELECT * FROM Budget_Allocation WHERE used_amount < 
  (SELECT AVG(used_amount) FROM Budget_Allocation);

-- 32. Select allocations with remarks not empty
SELECT * FROM Budget_Allocation WHERE remarks <> '';

-- 33. Select allocations with fiscal year = 2025
SELECT * FROM Budget_Allocation WHERE fiscal_year=2025;

-- 34. Built-in function: Concatenate department and status
SELECT CONCAT(department_name, ' - ', status) AS dept_status
FROM Budget_Allocation;

-- 35. Select top 3 allocations by used_amount
SELECT * FROM Budget_Allocation ORDER BY used_amount DESC LIMIT 3;

-- 36. Select allocations where remaining_amount is NULL (if any)
SELECT * FROM Budget_Allocation WHERE remaining_amount IS NULL;

-- 37. Add a comment in SQL
-- This query selects departments with allocations greater than 1,500,000
SELECT * FROM Budget_Allocation WHERE allocated_amount > 1500000;

-- 38. Select using IN clause
SELECT * FROM Budget_Allocation WHERE department_name IN ('Health','Education','Finance & Planning');

-- 39. Select using NOT IN clause
SELECT * FROM Budget_Allocation WHERE department_name NOT IN ('Health','Education');

-- 40. Select allocations with status like 'App%'
SELECT * FROM Budget_Allocation WHERE status LIKE 'App%';

-- 41. Group by status and sum remaining_amount
SELECT status, SUM(remaining_amount) AS total_remaining FROM Budget_Allocation GROUP BY status;

-- 42. Having clause: Departments with total allocated_amount > 2,000,000
SELECT department_name, allocated_amount FROM Budget_Allocation
GROUP BY department_name HAVING allocated_amount > 2000000;

-- 43. Select using IF function
SELECT department_name, IF(remaining_amount>500000,'Good','Low') AS remaining_status
FROM Budget_Allocation;

-- 44. Select using CASE
SELECT department_name,
CASE 
  WHEN status='Approved' THEN 'Budget OK'
  WHEN status='Pending' THEN 'Waiting Approval'
  ELSE 'Unknown'
END AS status_desc
FROM Budget_Allocation;

-- 45. Subquery: Select allocation_id with max remaining_amount
SELECT * FROM Budget_Allocation WHERE remaining_amount = 
  (SELECT MAX(remaining_amount) FROM Budget_Allocation);

-- 46. Count allocations per fiscal year
SELECT fiscal_year, COUNT(*) AS total FROM Budget_Allocation GROUP BY fiscal_year;

-- 47. Built-in function: Month of approval_date
SELECT department_name, MONTH(approval_date) AS approval_month FROM Budget_Allocation;

-- 48. Built-in function: Year of approval_date
SELECT department_name, YEAR(approval_date) AS approval_year FROM Budget_Allocation;

-- 49. Select allocations where department_name contains 'Dev'
SELECT * FROM Budget_Allocation WHERE department_name LIKE '%Dev%';

-- 50. Select allocations with remaining_amount greater than used_amount
SELECT * FROM Budget_Allocation WHERE remaining_amount > used_amount;


    
