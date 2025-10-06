
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

