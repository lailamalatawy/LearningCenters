drop database Database_Project;

CREATE DATABASE Database_Project;
USE Database_Project;


CREATE TABLE Schools
(
  school_id INT AUTO_INCREMENT, 
  name VARCHAR(40), 
  address VARCHAR(80), 
  phone_number VARCHAR(20), 
  email VARCHAR(40), 
  general_info VARCHAR(100),
  vision VARCHAR(100), 
  mission VARCHAR(100), 
  main_language VARCHAR(20),
  type VARCHAR(20),          
  fees DECIMAL(9,2), 
  PRIMARY KEY(school_id),
  UNIQUE(email),
  CHECK(type = 'National' OR type = 'International')  -- CHECK
);

CREATE TABLE Levels
(
    name VARCHAR(20),
    PRIMARY KEY (name)
);

CREATE TABLE Elementary_Schools 
(
    school_id INT, 
    level_name VARCHAR(20),
    PRIMARY KEY(school_id),     
    FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(level_name) REFERENCES Levels(name) 
);

CREATE TABLE Middle_Schools 
(
    school_id INT, 
    level_name VARCHAR(20),
    PRIMARY KEY(school_id), 
    FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE CASCADE  ON UPDATE CASCADE,
    FOREIGN KEY(level_name) REFERENCES Levels(name)
);

CREATE TABLE High_Schools 
(
    school_id INT, 
    level_name VARCHAR(20),
    PRIMARY KEY(school_id), 
	FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE CASCADE  ON UPDATE CASCADE,
	FOREIGN KEY(level_name) REFERENCES Levels(name)
);

CREATE TABLE Supplies_ElementaryS
(
    supplies VARCHAR(300), 
    school_id INT, 
    PRIMARY KEY(supplies, school_id),
    FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE CASCADE  ON UPDATE CASCADE
);

CREATE TABLE Students 
(
    ssn INT, 
    name VARCHAR(20),
	age INT AS (YEAR('2016-1-1') - Year(birth_date)), 
    gender VARCHAR(10), 
    birth_date date, 
    username VARCHAR(20), 
    password VARCHAR(20),
    grade INT, 
    school_id INT, 
    level_name VARCHAR(20),
    PRIMARY KEY(ssn), 
    FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE SET NULL  ON UPDATE CASCADE,
    FOREIGN KEY(level_name) REFERENCES Levels(name), 
    UNIQUE(username)
);

CREATE TABLE Clubs
(
	high_school_id INT,
	club_name VARCHAR(40), 
	purpose VARCHAR(250),
	PRIMARY KEY(high_school_id, club_name),
	FOREIGN KEY(high_school_id) REFERENCES High_Schools(school_id) ON DELETE CASCADE  ON UPDATE CASCADE
);
CREATE TABLE Club_enrolls_Student
(	
    student_ssn INT,
    high_school_id INT,
    club_name VARCHAR(40),
    PRIMARY KEY(high_school_id, club_name, student_ssn),
    FOREIGN KEY(high_school_id,club_name) REFERENCES Clubs (high_school_id,club_name)  ON DELETE CASCADE  ON UPDATE CASCADE,    
    FOREIGN KEY(student_ssn) REFERENCES Students (ssn)
);

 
CREATE TABLE Parents 
(
    username VARCHAR(50), 
    password VARCHAR(20), 
    first_name VARCHAR(20), 
    last_name VARCHAR(20),
    landline_number INT, 
    address VARCHAR(80), 
    email VARCHAR(40),
    PRIMARY KEY(username),
    UNIQUE(email),
    UNIQUE(username)
);

CREATE TABLE Parent_mobileNo
(
    parent_username VARCHAR(50),
    phone VARCHAR(20),
    PRIMARY KEY (parent_username, phone),
    FOREIGN KEY (parent_username) REFERENCES Parents(username)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Parent_has_Student
(
    parent_username VARCHAR(50),
    student_ssn INT,
    PRIMARY KEY (parent_username, student_ssn),
    FOREIGN KEY (parent_username) REFERENCES Parents(username) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON UPDATE cascade ON DELETE CASCADE
);

CREATE TABLE Parent_review_School
(
	school_id INT,
	parent_username VARCHAR(50),
	review_txt VARCHAR(100), 
	PRIMARY KEY (parent_username, school_id),
	FOREIGN KEY (parent_username) REFERENCES Parents(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Parent_applies_School
(
	student_ssn INT,
	school_id INT,
    parent_username VARCHAR(50),
    accepted BOOLEAN,
    PRIMARY KEY (student_ssn, school_id),
    FOREIGN KEY (parent_username) REFERENCES Parents(username),
    FOREIGN KEY (student_ssn) REFERENCES Students(ssn),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id) ON DELETE CASCADE ON UPDATE CASCADE
);

 
CREATE TABLE Employees
(
	id INT AUTO_INCREMENT,
    username VARCHAR(20),
	password VARCHAR(10),
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR,		
    address VARCHAR(50),
    birth_date DATE,		
    email VARCHAR(50),
    salary DECIMAL(10,2),
    school_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id) ON DELETE SET NULL  ON UPDATE CASCADE,
    UNIQUE(email),
    UNIQUE(username)
);

CREATE TABLE Administrators
( 
    id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(id) REFERENCES Employees(id) ON DELETE CASCADE  ON UPDATE CASCADE
);

 
CREATE TABLE Teachers
(
	id INT,
    hire_date DATETIME,
    experience_years INT AS (YEAR('2016-1-1') - YEAR(hire_date)),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Employees(id) ON DELETE CASCADE  ON UPDATE CASCADE
);

CREATE TABLE Teacher_supervise_Teacher
(
    superviser_id INT,
	teacher_id INT,
    PRIMARY KEY (superviser_id, teacher_id),
    FOREIGN KEY (superviser_id) REFERENCES Teachers(id) ON DELETE CASCADE  ON UPDATE CASCADE, 
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE  ON UPDATE CASCADE
);

CREATE TABLE Parent_rate_Teacher
(
    teacher_id INT,
    parent_username VARCHAR(50),
	rating INT,
    PRIMARY KEY (teacher_id, parent_username),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE  ON UPDATE CASCADE,
    FOREIGN KEY (parent_username) REFERENCES Parents(username) ON DELETE CASCADE  ON UPDATE CASCADE
);

 
CREATE TABLE Courses
(
    course_code INT AUTO_INCREMENT,
	course_name VARCHAR(20),
	description VARCHAR(50),
	level_name VARCHAR(20),
    grade INT,
    PRIMARY KEY(course_code),
    FOREIGN KEY(level_name) REFERENCES Levels(name),
	CHECK(level_name = 'Elementary' OR level_name = 'Middle' OR level_name = 'High')
);

CREATE TABLE Course_Prerequisite_Of_Course
(
	prerequisite_code INT, 
	course_code INT,
	PRIMARY KEY(prerequisite_code,course_code),
	FOREIGN KEY(prerequisite_code) REFERENCES Courses(course_code) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(course_code) REFERENCES Courses(course_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Course_Student_Teacher
(
    student_ssn INT,
    course_code INT,
    teacher_id INT,
    PRIMARY KEY (student_ssn, course_code),
    FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_code) REFERENCES Courses(course_code) ON DELETE CASCADE  ON UPDATE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE  ON UPDATE CASCADE
);

CREATE TABLE Courses_passedBy_Students 
(
    student_ssn INT, 
    course_code INT,
	PRIMARY KEY(student_ssn,course_code),
    FOREIGN KEY(student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(course_code) REFERENCES Courses(course_code) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Assignments
(
	assignment_id INT AUTO_INCREMENT, 
	course_code INT,
	posting_date DATE, 
	due_date DATE, 
	content VARCHAR(50), 
	teacher_id INT,
    PRIMARY KEY(assignment_id, course_code),
	FOREIGN KEY(course_code) REFERENCES Courses(course_code) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Assignment_Course_Student          -- ASKKKKKKK!!!!!!!!!!!
(
	assignment_id INT,
    course_code INT,
    student_ssn INT,
    grade DECIMAL(5,2),
    solution VARCHAR(200),
    teacher_id INT,
    PRIMARY KEY(assignment_id, course_code, student_ssn),
    FOREIGN KEY(assignment_id) REFERENCES Assignments(assignment_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(course_code) REFERENCES Courses(course_code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Activities
(
	activity_id INT AUTO_INCREMENT,
	activity_type VARCHAR(30),
	activity_date DATE,
	location VARCHAR(30),
	description VARCHAR(300),
	activity_name VARCHAR(30), 
	school_id INT,
    administrator_id INT,
    PRIMARY KEY(activity_id),
	FOREIGN KEY(school_id) REFERENCES Schools(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(administrator_id) REFERENCES Administrators(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Activity_Equipments
(
	activity_id INT,
	equipment VARCHAR(400),
	PRIMARY KEY(activity_id, equipment),
	FOREIGN KEY(activity_id) REFERENCES Activities(activity_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Activity_contains_Student
(
	activity_id INT,
    student_ssn INT,
    PRIMARY KEY(activity_id, student_ssn),
    FOREIGN KEY(activity_id) REFERENCES Activities (activity_id)  ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(student_ssn) REFERENCES Students (ssn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Administrators_Activity_Teachers
(
	activity_id INT, 
	teacher_id INT, 
	administrator_id INT,
    PRIMARY KEY (activity_id),
	FOREIGN KEY(activity_id) REFERENCES Activities(activity_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(teacher_id) REFERENCES Teachers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(administrator_id) REFERENCES Administrators(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Reports
(	
    report_id INT AUTO_INCREMENT,
    student_ssn INT,
    report_date DATE,
    teacher_comment VARCHAR(50),
    report_content VARCHAR(50),
    teacher_id INT,
    PRIMARY KEY(report_id,student_ssn),
    FOREIGN KEY (student_ssn) REFERENCES Students (ssn) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES Teachers (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Parent_repliesTo_Report
(	
    parent_username VARCHAR(50),
    report_id INT,
    student_ssn INT,
    reply VARCHAR(50),
    PRIMARY KEY(parent_username,report_id, student_ssn),
    FOREIGN KEY(parent_username) REFERENCES Parents (username) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(report_id,student_ssn) REFERENCES Reports (report_id,student_ssn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Questions
(
	question_id INT AUTO_INCREMENT,
    course_code INT,
    question VARCHAR(50),
	answer VARCHAR(50),
    teacher_id INT,
    PRIMARY KEY(question_id,course_code),
    FOREIGN KEY(course_code) REFERENCES Courses(course_code) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(teacher_id) REFERENCES Teachers(id) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE Question_isPosted_By_Student
(
	course_code INT,
    question_id INT,
    student_ssn INT,
    teacher_id INT,
    PRIMARY KEY(course_code, question_id,student_ssn),
    FOREIGN KEY (question_id,course_code) REFERENCES Questions (question_id,course_code) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (student_ssn) REFERENCES Students (ssn) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES Teachers (id)ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Announcements
(
	announcement_ID INT AUTO_INCREMENT, 
	title VARCHAR(40), 
	announcement_type VARCHAR(50), 
	announcement_date DATE, 
	description VARCHAR(150), 
	administrator_id INT,
    PRIMARY KEY(announcement_ID),
	FOREIGN key(administrator_id) REFERENCES Administrators(id) ON DELETE CASCADE ON UPDATE CASCADE
);