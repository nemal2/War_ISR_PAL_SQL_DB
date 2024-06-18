-- Drop table refugee_camps;
CREATE DATABASE HELP_PAL_WAR_DB;
USE HELP_PAL_WAR_DB;

-- Adult_Refugee
CREATE TABLE adult_refugee (
    Ref_Nid_number VARCHAR(255) NOT NULL,
    Ref_Age int(3),
    Ref_full_name VARCHAR(255) NOT NULL,
    Ref_Perm_Address VARCHAR(255),
    Ref_Gender VARCHAR(255) NOT NULL,
    Ref_Email VARCHAR(255) NOT NULL UNIQUE,
    Ref_Health_Condition VARCHAR(255),
    PRIMARY KEY (Ref_Nid_number),
    INDEX (Ref_full_name)
);

select * from adult_refugee;
select * from child_refugee;

-- Child_Refugee
CREATE TABLE child_refugee (
    Child_Ref_Age int(3),
    Child_Ref_name VARCHAR(255) NOT NULL,
    Child_Ref_guardian_name VARCHAR(255),   
    Child_Ref_Diseases VARCHAR(255),
    Child_Ref_Gender VARCHAR(255) NOT NULL,
    Child_Ref_Education_Level VARCHAR(255),
    CONSTRAINT fk_Child_Ref FOREIGN KEY (Child_Ref_guardian_name) REFERENCES adult_refugee(Ref_full_name) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Refugee_Camps
CREATE TABLE refugee_camps (
    Camp_Ref_Officer_Detail VARCHAR(255) NOT NULL,
    Camp_Ref_Total_Residents  int(9) NOT NULL,
    Camp_Ref_Location_Code VARCHAR(255) NOT NULL,
    PRIMARY KEY (Camp_Ref_Location_Code)
);

-- Refugee_Camp_Employees
CREATE TABLE employees (
    Camp_Emp_employee_id VARCHAR(255) NOT NULL,
    Camp_Emp_Name  VARCHAR(255) NOT NULL,
    PRIMARY KEY (Camp_Emp_employee_id)
);

-- Project_Team
CREATE TABLE project_team (
    Project_team_detail VARCHAR(255) NOT NULL,
    Project_Member_Id  VARCHAR(255) NOT NULL,
	Project_Member_Name  VARCHAR(255) NOT NULL,
    Project_Member_Contact  VARCHAR(255) NOT NULL,
    PRIMARY KEY (Project_Member_Id)
);

-- UN_Gaza
CREATE TABLE gaza_chapter (
    Gaza_Country_Id  VARCHAR(255) NOT NULL,
    Gaza_Member_Id  VARCHAR(255) NOT NULL,
	Gaza_Operations  VARCHAR(255) NOT NULL,
    Gaza_Funds VARCHAR(255) NOT NULL,
    PRIMARY KEY (Gaza_Member_Id)
);

-- NGO
CREATE TABLE ngo (
    ngo_UN_Reg_No VARCHAR(255) NOT NULL,
    ngo_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ngo_UN_Reg_No)
);

-- Pal_Def_Ministry Approvals
CREATE TABLE pal_def_ministry (
	Pal_Def_doc_no VARCHAR(255) NOT NULL,
    Pal_Def_officer_in_charge  VARCHAR(255) NOT NULL,
    Pal_Def_clerk_detail  VARCHAR(255) NOT NULL,
    Pal_Def_date_issued  VARCHAR(255) NOT NULL,
    PRIMARY KEY (Pal_Def_doc_no)
);

-- Isr_Def_Ministry Approvals
CREATE TABLE isr_def_ministry (
	Isr_Def_doc_no VARCHAR(255) NOT NULL,
    Isr_Def_officer_in_charge  VARCHAR(255) NOT NULL,
    Isr_Def_clerk_detail  VARCHAR(255) NOT NULL,
    Isr_Def_date_issued  VARCHAR(255) NOT NULL,
    PRIMARY KEY (Isr_Def_doc_no)
);

-- Peace keeping force unit
CREATE TABLE peace_keeping_force (
	Peace_Keep_task_code VARCHAR(255) NOT NULL,
    Peace_Keep_dog_tag  int(9),
    Peace_Keep_battalion  VARCHAR(255) NOT NULL,
    Peace_Keep_head_count  int(10),
    PRIMARY KEY (Peace_Keep_task_code)
);
-- Unicef funded students
CREATE TABLE students (
	Student_Ref_curr_school_index VARCHAR(255) NOT NULL,
	Student_Ref_name VARCHAR(255) NOT NULL,
    Student_Ref_grade VARCHAR(255) NOT NULL,
    PRIMARY KEY (Student_Ref_curr_school_index)
);

-- hospital
CREATE TABLE hospital (
	Hospital_reg_no int,
	Hospital_area VARCHAR(255) NOT NULL,
    Hospital_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Hospital_reg_no)
);

-- special needs
CREATE TABLE special_needs (
	Ref_id VARCHAR(255) NOT NULL,
	Host_id VARCHAR(255) NOT NULL,
    Diseases VARCHAR(255) NOT NULL,
    PRIMARY KEY (Ref_id,Host_id)
    -- composite primary key
);

-- insertion of data

-- Sample data for adult_refugee table
INSERT INTO adult_refugee (Ref_Nid_number, Ref_Age, Ref_full_name, Ref_Perm_Address, Ref_Gender, Ref_Email, Ref_Health_Condition) 
VALUES 
('123456789', 30, 'John Doe', '123 Main St, City', 'Male', 'john@gmail.com', 'Healthy'),
('987654321', 25, 'Jane Smith', '456 Elm St, Town', 'Female', 'jane@gmail.com', NULL),
('456789123', 40, 'Alice Johnson', '789 Oak St, Village', 'Female', 'alice@gmail.com', 'Diabetes'),
('789123456', 35, 'Bob Williams', '321 Pine St, County', 'Male', 'bob@gmail.com', NULL),
('654321987', 28, 'Emma Brown', '654 Cedar St, District', 'Female', 'emma@gmail.com', 'Asthma'),
('321987654', 45, 'Michael Davis', '987 Birch St, State', 'Male', 'michael@gmail.com', 'Hypertension');

-- Sample data for child_refugee table
INSERT INTO child_refugee (Child_Ref_Age, Child_Ref_name, Child_Ref_guardian_name, Child_Ref_Diseases, Child_Ref_Gender, Child_Ref_Education_Level) 
VALUES 
(10, 'David Smith', 'John Doe', NULL, 'Male', 'Primary School'),
(8, 'Sophia Johnson', 'Jane Smith', 'Asthma', 'Female', 'Kindergarten'),
(12, 'Ethan Williams', 'Bob Williams', NULL, 'Male', 'Secondary School'),
(7, 'Olivia Brown', 'Alice Johnson', 'Diabetes', 'Female', 'Primary School'),
(9, 'James Wilson', 'Michael Davis', NULL, 'Male', 'Primary School'),
(11, 'Ava Jones', 'Emma Brown', 'Allergy', 'Female', 'Secondary School');

-- Sample data for refugee_camps table
INSERT INTO refugee_camps (Camp_Ref_Officer_Detail, Camp_Ref_Total_Residents, Camp_Ref_Location_Code) 
VALUES 
('John Smith', 100, 'RC001'),
('Jane Doe', 80, 'RC002'),
('Michael ', 120, 'RC003'),
('Emily ', 90, 'RC004'),
('David Brown', 110, 'RC005'),
('Emma Davis', 95, 'RC006');

-- Sample data for employees table
INSERT INTO employees (Camp_Emp_employee_id, Camp_Emp_Name) 
VALUES 
('EMP001', 'John Smith'),
('EMP002', 'Jane Doe'),
('EMP003', 'Michael Johnson'),
('EMP004', 'Emily Williams'),
('EMP005', 'David Brown'),
('EMP006', 'Emma Davis');

-- Sample data for project_team table
INSERT INTO project_team (Project_team_detail, Project_Member_Id, Project_Member_Name, Project_Member_Contact) 
VALUES 
('Project A', 'P001', 'John Doe', 'john.doe@gmail.com'),
('Project B', 'P002', 'Jane Smith', 'jane.smith@gmail.com'),
('Project C', 'P003', 'Michael Johnson', 'michael.johnson@gmail.com'),
('Project D', 'P004', 'Emily Williams', 'emily.williams@gmail.com'),
('Project E', 'P005', 'David Brown', 'david.brown@gmail.com'),
('Project F', 'P006', 'Emma Davis', 'emma.davis@gmail.com');

-- Sample data for gaza_chapter table
INSERT INTO gaza_chapter (Gaza_Country_Id, Gaza_Member_Id, Gaza_Operations, Gaza_Funds) 
VALUES 
('GA001', 'GM001', 'Operation A', '10000'),
('GA002', 'GM002', 'Operation B', '15000'),
('GA003', 'GM003', 'Operation C', '20000'),
('GA004', 'GM004', 'Operation D', '25000'),
('GA005', 'GM005', 'Operation E', '30000'),
('GA006', 'GM006', 'Operation F', '35000');

-- Sample data for ngo table
INSERT INTO ngo (ngo_UN_Reg_No, ngo_Name) 
VALUES 
('NGO001', 'Alpha'),
('NGO002', 'IndiaX'),
('NGO003', 'WeTo'),
('NGO004', 'Inspire'),
('NGO005', 'BridgeX'),
('NGO006', 'NGO Six');

-- Sample data for pal_def_ministry table
INSERT INTO pal_def_ministry (Pal_Def_doc_no, Pal_Def_officer_in_charge, Pal_Def_clerk_detail, Pal_Def_date_issued) 
VALUES 
('PD001', 'John Smith', 'Clerk A', '2023-01-01'),
('PD002', 'Jane Doe', 'Clerk B', '2023-02-01'),
('PD003', 'Michael Johnson', 'Clerk C', '2023-03-01'),
('PD004', 'Emily Williams', 'Clerk D', '2023-04-01'),
('PD005', 'David Brown', 'Clerk E', '2023-05-01'),
('PD006', 'Emma Davis', 'Clerk F', '2023-06-01');

-- Sample data for isr_def_ministry table
INSERT INTO isr_def_ministry (Isr_Def_doc_no, Isr_Def_officer_in_charge, Isr_Def_clerk_detail, Isr_Def_date_issued) 
VALUES 
('ID001', 'John Parker', 'Clerk 1', '2023-01-01'),
('ID002', 'Adam Doe', 'Clerk 2', '2023-02-01'),
('ID003', 'Michael John', 'Clerk 3', '2023-03-01'),
('ID004', 'Emily Wills', 'Clerk 4', '2023-04-01'),
('ID005', 'David Noor', 'Clerk 5', '2023-05-01'),
('ID006', 'Harry Davis', 'Clerk 6', '2023-06-01');

-- Sample data for peace_keeping_force table
INSERT INTO peace_keeping_force (Peace_Keep_task_code, Peace_Keep_dog_tag, Peace_Keep_battalion, Peace_Keep_head_count) 
VALUES 
('PK001', 123456789, 'Alpha Battalion', 100),
('PK002', 987654321, 'Bravo Battalion', 120),
('PK003', 456789123, 'Charlie Battalion', 110),
('PK004', 789123456, 'Delta Battalion', 130),
('PK005', 654321987, 'Echo Battalion', 105),
('PK006', 321987654, 'Foxtrot Battalion', 115);

-- Sample data for students table
INSERT INTO students (Student_Ref_curr_school_index, Student_Ref_name, Student_Ref_grade) 
VALUES 
('S001', 'Alan Smith', 'Grade 5'),
('S002', 'Sophia Johnson', 'Grade 3'),
('S003', 'Ethan Maria', 'Grade 7'),
('S004', 'Olivia Bold', 'Grade 2'),
('S005', 'James Wills', 'Grade 4'),
('S006', 'Ava Adams', 'Grade 6');

-- Sample data for hospital table
INSERT INTO hospital (Hospital_reg_no, Hospital_area, Hospital_name) 
VALUES 
(1001, 'Darga', 'City Hospital'),
(1002, 'Suburan', 'Town Hospital'),
(1003, 'Sharia', 'Village Hospital'),
(1004, 'Sevilla', 'County Hospital'),
(1005, 'Azam', 'District Hospital'),
(1006, 'Madrasa', 'State Hospital');

-- Sample data for special_needs table
INSERT INTO special_needs (Ref_id, Host_id, Diseases) 
VALUES 
('123456789', '1001', 'Asthma'),
('987654321', '1002', 'Diabetes'),
('456789123', '1003', 'Allergy'),
('789123456', '1004', 'Hypertension'),
('654321987', '1005', 'Asthma'),
('321987654', '1006', 'Diabetes');

-- update 2 rows per each

-- Update sample data for adult_refugee table
UPDATE adult_refugee
SET Ref_Age = 32
WHERE Ref_Nid_number = '123456789';

UPDATE adult_refugee
SET Ref_Health_Condition = 'Heart Disease'
WHERE Ref_Nid_number = '456789123';
-- ////////////////////////////////////////////////////////////////////////////

-- Update sample data for child_refugee table
UPDATE child_refugee
SET Child_Ref_Education_Level = 'Elementary School'
WHERE Child_Ref_name = 'Sophia Johnson';

UPDATE child_refugee
SET Child_Ref_Diseases = 'Allergy'
WHERE Child_Ref_name = 'Olivia Brown';

-- Update sample data for refugee_camps table
UPDATE refugee_camps
SET Camp_Ref_Total_Residents = 110
WHERE Camp_Ref_Location_Code = 'RC001';

UPDATE refugee_camps
SET Camp_Ref_Officer_Detail = 'John Adams, jadams@example.com'
WHERE Camp_Ref_Location_Code = 'RC002';

-- Update sample data for employees table
UPDATE employees
SET Camp_Emp_Name = 'Jane Adams'
WHERE Camp_Emp_employee_id = 'EMP001';

UPDATE employees
SET Camp_Emp_Name = 'Michael Adams'
WHERE Camp_Emp_employee_id = 'EMP002';

UPDATE employees
SET Camp_Emp_Name = 'Neel Adams'
WHERE Camp_Emp_employee_id = 'EMP002';

UPDATE employees
SET Camp_Emp_Name = 'Kyle Adams'
WHERE Camp_Emp_employee_id = 'EMP001';



-- Update sample data for project_team table
UPDATE project_team
SET Project_Member_Name = 'John Adams'
WHERE Project_Member_Id = 'P001';

UPDATE project_team
SET Project_Member_Contact = 'john.adams@example.com'
WHERE Project_Member_Id = 'P002';

-- Update sample data for gaza_chapter table
UPDATE gaza_chapter
SET Gaza_Operations = 'Operation G'
WHERE Gaza_Country_Id = 'GA001';

UPDATE gaza_chapter
SET Gaza_Funds = '40000'
WHERE Gaza_Country_Id = 'GA002';

-- Update sample data for ngo table
UPDATE ngo
SET ngo_Name = 'NGO Seven'
WHERE ngo_UN_Reg_No = 'NGO001';

UPDATE ngo
SET ngo_Name = 'NGO Eight'
WHERE ngo_UN_Reg_No = 'NGO002';

-- Update sample data for pal_def_ministry table
UPDATE pal_def_ministry
SET Pal_Def_officer_in_charge = 'David Smith'
WHERE Pal_Def_doc_no = 'PD001';

UPDATE pal_def_ministry
SET Pal_Def_clerk_detail = 'Clerk G'
WHERE Pal_Def_doc_no = 'PD002';

-- Update sample data for isr_def_ministry table
UPDATE isr_def_ministry
SET Isr_Def_officer_in_charge = 'Emily Wilson'
WHERE Isr_Def_doc_no = 'ID001';

UPDATE isr_def_ministry
SET Isr_Def_clerk_detail = 'Clerk H'
WHERE Isr_Def_doc_no = 'ID002';

-- Update sample data for peace_keeping_force table
UPDATE peace_keeping_force
SET Peace_Keep_head_count = 120
WHERE Peace_Keep_task_code = 'PK001';

UPDATE peace_keeping_force
SET Peace_Keep_dog_tag = 987654321
WHERE Peace_Keep_task_code = 'PK002';

-- Update sample data for students table
UPDATE students
SET Student_Ref_grade = 'Grade 6'
WHERE Student_Ref_curr_school_index = 'S001';

UPDATE students
SET Student_Ref_name = 'Sophia Adams'
WHERE Student_Ref_curr_school_index = 'S002';

-- Update sample data for hospital table
UPDATE hospital
SET Hospital_area = 'Metropolitan'
WHERE Hospital_reg_no = 1001;

UPDATE hospital
SET Hospital_name = 'Metropolitan Hospital'
WHERE Hospital_reg_no = 1002;

-- Update sample data for special_needs table
UPDATE special_needs
SET Diseases = 'Epilepsy'
WHERE Ref_id = '123456789' AND Host_id = '1001';

UPDATE special_needs
SET Host_id = '1002'
WHERE Ref_id = '987654321' AND Host_id = '1003';

-- delete

-- Delete a sample row from adult_refugee table
DELETE FROM adult_refugee WHERE Ref_Nid_number = 'sample_Nid_number';

-- Delete a sample row from child_refugee table
DELETE FROM child_refugee WHERE Child_Ref_name = 'sample_child_name';

-- Delete a sample row from refugee_camps table
DELETE FROM refugee_camps WHERE Camp_Ref_Location_Code = 'sample_location_code';

-- Delete a sample row from employees table
DELETE FROM employees WHERE Camp_Emp_employee_id = 'sample_employee_id';

-- Delete a sample row from project_team table
DELETE FROM project_team WHERE Project_Member_Id = 'sample_member_id';

-- Delete a sample row from gaza_chapter table
DELETE FROM gaza_chapter WHERE Gaza_Member_Id = 'sample_member_id';

-- Delete a sample row from ngo table
DELETE FROM ngo WHERE ngo_UN_Reg_No = 'sample_UN_Reg_No';

-- Delete a sample row from pal_def_ministry table
DELETE FROM pal_def_ministry WHERE Pal_Def_doc_no = 'sample_doc_no';

-- Delete a sample row from isr_def_ministry table
DELETE FROM isr_def_ministry WHERE Isr_Def_doc_no = 'sample_doc_no';

-- Delete a sample row from peace_keeping_force table
DELETE FROM peace_keeping_force WHERE Peace_Keep_task_code = 'sample_task_code';

-- Delete a sample row from students table
DELETE FROM students WHERE Student_Ref_curr_school_index = 'sample_index';

-- Delete a sample row from hospital table
DELETE FROM hospital WHERE Hospital_reg_no = 1002;

-- Delete a sample row from special_needs table
DELETE FROM special_needs WHERE Ref_id = 'sample_ref_id' AND Host_id = 'sample_host_id';

select * from special_needs;
select * from hospital;
select * from students;
select * from peace_keeping_force;
select * from isr_def_ministry;
select * from pal_def_ministry;
select * from ngo;
select * from gaza_chapter;
select * from project_team;
select * from employees;
select * from refugee_camps;
select * from child_refugee;
select * from adult_refugee;

-- simple queries

SELECT * FROM adult_refugee;

SELECT Ref_full_name, Ref_Email FROM adult_refugee;

SELECT * FROM adult_refugee, refugee_camps;

CREATE VIEW refugee_info AS
SELECT Ref_full_name, Ref_Age, Ref_Email FROM adult_refugee;

ALTER TABLE adult_refugee
CHANGE COLUMN Ref_Age Age INT(3);

SELECT AVG(Age) AS Average_Age FROM adult_refugee;

SELECT * FROM adult_refugee
WHERE Ref_Email LIKE '%@gmail.com%';

-- complex queries

-- Union Operation >> Retrieve the unique list of refugee names from both the adult_refugee and child_refugee tables
SELECT Ref_full_name FROM adult_refugee
UNION
SELECT Child_Ref_guardian_name FROM child_refugee;

-- Intersection Operation >> Retrieve the names of refugees who are present in both the adult_refugee and child_refugee tables.
SELECT a.Ref_full_name, a.Ref_Health_Condition,a.Ref_Nid_number, c.Child_Ref_Diseases FROM adult_refugee as a
JOIN
child_refugee as c  on a.Ref_full_name = c.Child_Ref_guardian_name
where a.Ref_full_name in (
	select Ref_full_name
    from adult_refugee
    where Child_Ref_Diseases= 'Allergy'
);

-- set difference>> Retrieve the names of refugees who are in the adult_refugee table but not in the child_refugee table.
SELECT Ref_full_name FROM adult_refugee
WHERE Ref_full_name NOT IN (
    SELECT Child_Ref_guardian_name FROM child_refugee
);

-- Division Operation >> Retrieve the names of refugees who have all possible diseases from the child_refugee table.
 SELECT DISTINCT Child_Ref_guardian_name
 FROM child_refugee AS c
 WHERE NOT EXISTS (
     SELECT Child_Ref_Diseases
     FROM (SELECT DISTINCT Child_Ref_Diseases FROM child_refugee) AS d
     WHERE NOT EXISTS (
         SELECT *
         FROM child_refugee AS c2
         WHERE c.Child_Ref_guardian_name = c2.Child_Ref_guardian_name AND c2.Child_Ref_Diseases = d.Child_Ref_Diseases
     )
 );


-- inner join
CREATE VIEW refugee_camp_info6 AS
SELECT rc.Camp_Ref_Location_Code, e.Camp_Emp_Name
FROM employees AS e
INNER JOIN refugee_camps AS rc ON e.Camp_Ref_Location_Code = rc.Camp_Ref_Location_Code;

SELECT * FROM refugee_camp_info6;

-- Natural Join Retrieve the names of refugees along with their guardian names
CREATE VIEW refugee_guardian_info5 AS
SELECT a.Ref_full_name, c.Child_Ref_guardian_name
FROM adult_refugee AS a
LEFT JOIN child_refugee AS c ON a.Ref_full_name = c.Child_Ref_guardian_name;


SELECT * FROM refugee_guardian_info5;

-- Left Outer Join Retrieve all adult refugees along with their respective camps, even if they don't have a camp assigned.
CREATE VIEW refugee_camp_left_join3 AS
SELECT e.Camp_Emp_Name, COALESCE(r.Camp_Ref_Location_Code, 'No Camp Assigned') AS Camp_Location
FROM employees AS e
LEFT JOIN refugee_camps AS r ON e.Camp_Emp_Name = r.Camp_Ref_Officer_Detail;

SELECT * FROM refugee_camp_left_join3;


-- Right Outer Join>> Retrieve all refugee camps along with the names of the assigned officers, even if some officers don't have a camp assigned.
CREATE VIEW camp_officer_right_join AS
SELECT IFNULL(a.Camp_Emp_Name, 'No Officer Assigned') AS Officer_Name, r.Camp_Ref_Location_Code
FROM employees AS a
RIGHT JOIN refugee_camps AS r ON a.Camp_Emp_Name = r.Camp_Ref_Officer_Detail;

SELECT * FROM camp_officer_right_join;

-- Full Outer Join>>
SELECT * FROM refugee_camp_left_join3
UNION
SELECT * FROM camp_officer_right_join;

-- Nested Queries

SELECT Ref_full_name FROM adult_refugee
UNION
SELECT Child_Ref_guardian_name FROM child_refugee;

SELECT a.Ref_full_name, a.Ref_Health_Condition, a.Ref_Nid_number, c.Child_Ref_Diseases 
FROM adult_refugee AS a
JOIN child_refugee AS c ON a.Ref_full_name = c.Child_Ref_guardian_name
WHERE a.Ref_full_name IN (
    SELECT Ref_full_name
    FROM adult_refugee
    WHERE Child_Ref_Diseases = 'Allergy'
);

SELECT Ref_full_name FROM adult_refugee
WHERE Ref_full_name NOT IN (
    SELECT Child_Ref_guardian_name FROM child_refugee
);


