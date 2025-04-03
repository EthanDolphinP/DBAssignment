CREATE SCHEMA IF NOT EXISTS registrar;
USE registrar;

-- Drop tables if they exist (in correct order to avoid foreign key issues)
DROP TABLE IF EXISTS Offerings;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Programs;
DROP TABLE IF EXISTS AcademicHist;
DROP TABLE IF EXISTS CurrCourses;
DROP TABLE IF EXISTS AddCourse;
DROP TABLE IF EXISTS Students;

-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INTEGER PRIMARY KEY,
    email TEXT,
    first_name TEXT,
    last_name TEXT,
    home_phone VARCHAR(15),
    cell_phone TEXT,
    program_code VARCHAR(3),
    program TEXT
);

-- Create AddCourse table
CREATE TABLE IF NOT EXISTS AddCourse (
    course_code TEXT,
    course_name TEXT,
    prereq VARCHAR(10) PRIMARY KEY
);

-- Create CurrCourses table
CREATE TABLE IF NOT EXISTS CurrCourses (
    course_code VARCHAR(10) PRIMARY KEY,
    course_name TEXT
);

-- Create AcademicHist table
CREATE TABLE IF NOT EXISTS AcademicHist (
    course_code VARCHAR(10),
    course_name TEXT,
    term VARCHAR(6),
    grade VARCHAR(2)
);

-- Create Instructors table
CREATE TABLE IF NOT EXISTS Instructors (
    instructor_id INTEGER PRIMARY KEY,
    last_name TEXT,
    first_name TEXT,
    home_phone VARCHAR(15),
    cell_phone TEXT,
    email TEXT,
    department_code VARCHAR(3),
    department TEXT
);

-- Create Offerings table with foreign key constraint
CREATE TABLE IF NOT EXISTS Offerings (
    offering_code VARCHAR(5) PRIMARY KEY,
    course_code TEXT,
    course_name TEXT,
    semester VARCHAR(6),
    instructor_id INTEGER,
    instructor TEXT,
    enrollment INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Create Programs table
CREATE TABLE IF NOT EXISTS Programs (
    program_code VARCHAR(3) PRIMARY KEY,
    program TEXT,
    enrollment INTEGER
);

-- Insert Current Course Values
INSERT INTO CurrCourses VALUES ('DBAS27198', 'Database Design and Implementation');
INSERT INTO CurrCourses VALUES ('PROG50000', 'Enterprise Application Development');

-- Insert AcademicHist Values
INSERT INTO AcademicHist VALUES ('PROG10008', 'Java Programming 1', 'W 2012', 'A+');
INSERT INTO AcademicHist VALUES ('PROG10009', 'Java Programming 2', 'S 2012', 'A+');

-- Insert AddCourse Values
INSERT INTO AddCourse VALUES ('PROG80000', 'Advanced Enterprise Apps', 'PROG50000');

-- Insert Programs Values
INSERT INTO Programs VALUES ('SA', 'System Analyst', 535);
INSERT INTO Programs VALUES ('CP', 'Computer Programmer', 316);
INSERT INTO Programs VALUES ('EDM', 'Enterprise Database Management', 350);

-- Insert Instructor Values
INSERT INTO Instructors VALUES (12121212, 'Pham', 'Timothy',9055553344,9055558866, 'tim.pham@sheridancollege.ca', 'MIS', 'Management Information Systems');
INSERT INTO Instructors VALUES (22332211, 'Smith', 'Mary',9054515543,9052327765, 'mary.smith@sheridancollege.ca', 'AC', 'Applied Computing');

-- Insert Offerings Values (Fixed foreign key issue)
INSERT INTO Offerings VALUES (10001, 'PROG10000', 'Introduction to Programming', 'F 2013', 12121212, 'Brian Pham', 25);
INSERT INTO Offerings VALUES (10002, 'PROG10000', 'Introduction to Programming', 'W 2014', NULL, 'Brian Pham', 2);
INSERT INTO Offerings VALUES (10003, 'PROG20000', 'Web Programming', 'F 2013', 12121212, 'Brian Pham', 15);
INSERT INTO Offerings VALUES (10004, 'PROG30000', 'Mobile Programming', 'F 2013', 22332211, 'John Smith', 35);

-- Insert Student Values
INSERT INTO Students VALUES (991234567, 'Jones', 'Timothy',"9055551456","9055551457", 'tim.jones@sheridancollege.ca', 'SA', 'System Analyst');
INSERT INTO Students VALUES (991234568, 'Green', 'Mary',"9054511212","9052321212", 'mary.green@sheridancollege.ca', 'CP', 'Computer Programmer');

-- Select all records from registrar schema
SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Offerings;
SELECT * FROM Programs;
SELECT * FROM CurrCourses;
SELECT * FROM AcademicHist;
SELECT * FROM AddCourse;
