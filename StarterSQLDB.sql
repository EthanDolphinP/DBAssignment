USE registrar;

DROP TABLE IF EXISTS Offerings;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Programs;
DROP TABLES IF EXISTS AcademicHist;
DROP TABLES IF EXISTS CurrCourses;
DROP TABLES IF EXISTS AddCourse;
DROP TABLES IF EXISTS Students;

CREATE TABLE IF NOT EXISTS Students (
	student_id INTEGER,
    email TEXT,
    first_name TEXT,
    last_name TEXT,
    home_phone INTEGER,
    cell_phone INTEGER,
    PRIMARY KEY(student_id)
    );

CREATE TABLE IF NOT EXISTS AddCourse (
	course_code	TEXT,
	course_name	TEXT,
	prereq VARCHAR(10),
    PRIMARY KEY(prereq)
);

CREATE TABLE IF NOT EXISTS CurrCourses (
	course_code VARCHAR(10),
    course_name TEXT,
    PRIMARY KEY(course_code)
);

CREATE TABLE IF NOT EXISTS AcademicHist (
	course_code VARCHAR(10),
    course_name TEXT,
    term INTEGER,
    grade VARCHAR(2),
    FOREIGN KEY (course_code) REFERENCES CurrCourses(course_code)
);

CREATE TABLE IF NOT EXISTS Instructors (
	instructor_id INTEGER,
    last_name TEXT,
    first_name TEXT,
    home_phone INTEGER,
    cell_phone INTEGER,
    email TEXT,
    department_code VARCHAR(3),
    department TEXT,
    PRIMARY KEY (instructor_id)
);

CREATE TABLE IF NOT EXISTS Programs (
	program_code VARCHAR(3),
    program TEXT,
    enrollment INTEGER
);

CREATE TABLE IF NOT EXISTS Offerings (
	offering_code TEXT,
    course_code TEXT,
    course_name TEXT,
    semester INTEGER,
    instructor_id INTEGER,
    instructor TEXT,
    enrollment INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);



