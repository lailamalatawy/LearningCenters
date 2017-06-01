

-- User defined procedures
USE Database_Project;

-- System Administrator
-- 1 Create a school with its information: school name, address, phone number, email, general informa- tion, 
-- vision, mission, main language, type(national, international) and fees.

DELIMITER $$
DROP PROCEDURE IF EXISTS create_School$$
CREATE PROCEDURE create_School(
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
  elem BOOLEAN,
  middle BOOLEAN,
  high BOOLEAN
  )
	BEGIN
		DECLARE sID  INT DEFAULT 3;
		IF(type != 'National' AND type != 'International') THEN
			SELECT 'INVALID SCHOOL TYPE';
		ELSE
			INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees);
			IF(elem) THEN
				INSERT INTO Elementary_Schools(school_id,level_name) VALUES(LAST_INSERT_ID(), 'Elementary');
			END IF;

			IF(middle) THEN
				INSERT INTO Middle_Schools(school_id,level_name) VALUES(LAST_INSERT_ID(),'Middle');
			END IF;	

			IF(high) THEN
				INSERT INTO High_Schools(school_id,level_name) VALUES(LAST_INSERT_ID(),'High');
			END IF;
		END IF;
	END$$
DELIMITER ;

-- 2 Add courses to the system with all of its information: 
-- course code, course name, course level (ele- mentary, middle, high), 
-- grade, description.

DELIMITER $$

DROP PROCEDURE IF EXISTS add_Course$$
CREATE PROCEDURE add_Course(
   course_name VARCHAR(20),
	level_name VARCHAR(20),
	grade INT,
	description VARCHAR(50))
	BEGIN
		INSERT INTO Courses(course_name,level_name,description,grade) VALUES(course_name,level_name,description,grade);
	END$$

DELIMITER ;

-- 2 Add prerequisite course(s)

DELIMITER $$

DROP PROCEDURE IF EXISTS add_Prerequisite$$
CREATE PROCEDURE add_Prerequisite(
    course1_id INT,
	course2_id INT)
	BEGIN
		INSERT INTO Course_Prerequisite_Of_Course(course_code,prerequisite_code) VALUES(course1_id,course2_id);
	END$$

DELIMITER ;


-- 3 Add admins to the system with their information: first name, middle name, 
-- last name, birthdate, address, email, username, password, and gender. 
-- Given the school name, I should assign admins to work in this school. 
-- Note that the salary of the admin depends on the type of the school. 
-- The salary of an admin working in a national school is 3000 EGP, and 
-- that working in an International school is 5000 EGP.

DELIMITER $$

DROP PROCEDURE IF EXISTS add_Admin$$
CREATE PROCEDURE add_Admin(
	username VARCHAR(20),
	password VARCHAR(10),
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR,		
    address VARCHAR(50),
    birth_date DATE,		
    email VARCHAR(50),
    school_id INT
)
	BEGIN

		DECLARE type1 VARCHAR(20);
		DECLARE sal DECIMAL(10,2);
		SELECT type INTO type1 FROM Schools s WHERE s.school_id = school_id;
		IF(type1 = 'National') THEN
			SET sal = 3000;
		ELSE
			SET sal = 5000;
		END IF;
		INSERT INTO Employees (first_name, middle_name, last_name, birth_date, address, email, username, password, gender, salary,school_id) 
		VALUES (first_name, middle_name, last_name, birth_date, address, email, username, password, gender, sal,school_id);
		INSERT INTO Administrators(id) VALUES (LAST_INSERT_ID());
	END$$

DELIMITER ;

-- 4 Delete a school from the database with all of its corresponding information. Students and employees of this school should not be 
-- deleted from the system, but should not have a username and password on the system until they are assigned to a new school again.

DELIMITER $$

DROP PROCEDURE IF EXISTS delete_School$$
CREATE PROCEDURE delete_School(sID INT)
	BEGIN
		UPDATE Employees e SET e.username = NULL , e.password = NULL WHERE e.school_id = sID;
		UPDATE Students s SET s.username = NULL, s.password = NULL WHERE s.school_id = sID;   
		DELETE FROM Schools WHERE school_id = sID; 
	END$$

DELIMITER ;


-- System User 
-- 1 Search for any school by its name, address or
-- its type (national/International).

DELIMITER $$

DROP PROCEDURE IF EXISTS find_School$$
CREATE PROCEDURE find_School(
  name VARCHAR(40), 
  address VARCHAR(80), 
  type VARCHAR(20))
	BEGIN
	IF((name = '' OR name is null) and (address = '' OR address is null )and (type = '' or type is null)) THEN
    SELECT * from Schools;-- 000
    ELSE IF((name = '' OR name is null) and (address = '' OR address is null )) THEN
    Select * from Schools s where s.type=type;-- 001
    ELSE IF((name = '' OR name is null) and (type = '' or type is null)) then
    select * from schools s where s.address=address;-- 010
    else if((name = '' OR name is null)) then
    select * from schools s where s.address=address and s.type=type;
    else if((address = '' OR address is null ) and (type = '' or type is null)) then
    select * from schools s where s.name=name;
    else if((address = '' OR address is null )) then
    select * from schools s where s.name=name and s.type =type;
    else if((type = '' or type is null)) then
    select * from schools s where s.type=type;
    else
	select * from Schools s where s.name=name and s.address=address and s.type=type;
    end if;
    end if;
    end if;
    end if;
    end if;
    end if;
    end if;
    END$$
    

DELIMITER ;

-- 2 View a list of all available schools on the system 
-- categorized by their level.

DELIMITER $$

DROP PROCEDURE IF EXISTS view_all_Schools$$
CREATE PROCEDURE view_all_Schools()
	BEGIN
		SELECT level_name, s.* FROM Schools s INNER JOIN Middle_Schools m ON m.school_id = s.school_id
		UNION
		SELECT level_name, s1.* FROM Schools s1 INNER JOIN Elementary_Schools e ON s1.school_id = e.school_id
		UNION
		SELECT level_name, s2.* FROM Schools s2 INNER JOIN High_Schools h ON s2.school_id = h.school_id 
		GROUP BY(level_name) ORDER BY(level_name);
	END$$

DELIMITER ;

-- 3 View the information of a certain school 
-- along with the reviews written about it and teachers
-- teaching in this school.

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Schools_Info$$
CREATE PROCEDURE view_Schools_Info(school_id INT)
	BEGIN
		SELECT s.*, z.first_name AS 'Teacher''s first name', z.last_name AS 'Teacher''s last name', z.review_txt 
        FROM (Select x.school_id, x.first_name, x.last_name, y.review_txt FROM (Select sc.school_id, g.first_name, g.last_name FROM 
        Schools sc LEFT OUTER JOIN (SELECT e.first_name, e.last_name, e.school_id FROM Employees e 
        INNER JOIN Teachers t ON e.id = t.id WHERE e.school_id = school_id) g ON sc.school_id = g.school_id) x 
        LEFT OUTER JOIN (SELECT prs.school_id, prs.review_txt FROM Schools sh LEFT OUTER JOIN Parent_review_School prs 
        ON sh.school_id = prs.school_id) y 
        ON x.school_id = y.school_id) z INNER JOIN Schools s ON z.school_id = s.school_id WHERE z.school_id = school_id;
	END$$

DELIMITER ;


-- Administrator
-- 1 View teachers who signed up as employees of the school I am responsible of,

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Teachers$$
CREATE PROCEDURE view_Teachers(school INT) -- admin's school id
	BEGIN 
        SELECT e.* FROM Teachers t INNER JOIN Employees e ON t.id = e.id WHERE e.school_id = school;
	END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS view_UnverifiedTeachers$$
CREATE PROCEDURE view_UnverifiedTeachers(school INT) -- admin's school id
	BEGIN 
        SELECT e.id, e.first_name, e.last_name,e.gender,e.birth_date,e.email FROM Teachers t INNER JOIN Employees e ON t.id = e.id WHERE e.school_id = school AND  e.username IS NULL AND e.password IS NULL;
	END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS add_Teachers$$ 
CREATE PROCEDURE add_Teachers(Tid INT, username VARCHAR(20), password VARCHAR(10))
	BEGIN 
		DECLARE exp INT;
        DECLARE c INT;
        
        UPDATE Teachers t
		SET t.hire_date = CURRENT_TIMESTAMP WHERE t.id= Tid;   -- I CHANGED THAT LAILA
--        UPDATE Teachers t
-- 		SET t.experience_years = (YEAR('2016-1-1') - YEAR(hire_date)) WHERE t.id= Tid;
        SELECT experience_years INTO exp FROM Teachers WHERE id = Tid;
        SELECT count(*) INTO c FROM Employees e WHERE e.username = username;
        IF (c > 0) THEN
			SELECT 'Duplicate username';
        ELSE 
			UPDATE Employees SET username = username, password = password, salary = 1000 + 500*exp WHERE id = Tid;
		END IF;
	END$$
DELIMITER ;



-- 2 View students who enrolled to the school I am responsible of

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Students$$
CREATE PROCEDURE view_Students(school_id INT)
	BEGIN 
		SELECT s.ssn, s.name, s.age, s.gender, s.birth_date, s.grade, s.level_name 
        FROM Students s 
        WHERE s.school_id = school_id AND s.username is NULL AND s.password IS NULL;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS add_Students$$
CREATE PROCEDURE add_Students(ssn INT, username VARCHAR(20), password VARCHAR(20))
	BEGIN 
	  DECLARE levelName VARCHAR(20);
	  DECLARE gradeNumber INT;
	  DECLARE courseCode INT;
	  DECLARE studentGrade INT;
	  DECLARE studentLevel VARCHAR(20);
	  DECLARE done INT DEFAULT FALSE;
	  DECLARE cursor_i CURSOR FOR SELECT course_code,level_name,grade FROM Courses;
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	  
	  SELECT s.level_name INTO studentLevel FROM Students s WHERE s.ssn = ssn;
	  SELECT s.grade INTO studentGrade FROM Students s WHERE s.ssn = ssn;

	  OPEN cursor_i;
		READ_LOOP:
		LOOP
			FETCH cursor_i INTO courseCode,levelName,gradeNumber;
			IF done THEN
			  LEAVE READ_LOOP;
			END IF;
			IF(levelName = studentLevel AND gradeNumber = studentGrade
		--  AND check_Prerequisites(ssn, courseCode) IS TRUE -- If we were to include prerequisites
            ) THEN
				INSERT INTO Course_Student_Teacher(student_ssn,course_code) VALUES(ssn,courseCode);
			END IF;
		END LOOP;
	   CLOSE cursor_i;
	   UPDATE Students s SET s.username = username, s.password = password WHERE s.ssn=ssn;
	END$$
    
DELIMITER ;

-- /*
DELIMITER $$
DROP FUNCTION IF EXISTS check_Prerequisites$$
CREATE FUNCTION check_Prerequisites(
student_ssn INT,
course_code INT
)
	RETURNS BOOLEAN DETERMINISTIC
	BEGIN 
		DECLARE c INT;
        SELECT count(*) INTO c FROM Course_Prerequisite_Of_Course cpc WHERE cpc.course_code = course_code 
        AND cpc.prerequisite_code NOT IN (SELECT course_code FROM Courses_passedBy_Students c WHERE c.student_ssn = student_ssn);
        IF (c > 0) THEN
			RETURN FALSE;
        ELSE
			RETURN TRUE;
        END IF;
    END$$
DELIMITER ;
-- */
-- 3 Add other admins to the school I am working in. An admin has first name, middle name, last name, birthdate, address, email, username, password, and gender. Note that the salary of the admin depends on the type of the school.

DELIMITER $$

DROP PROCEDURE IF EXISTS add_Admin_by_other$$
CREATE PROCEDURE add_Admin_by_other(
    id INT,
	username VARCHAR(20),
	password VARCHAR(10),
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR,		
    address VARCHAR(50),
    birth_date DATE,		
    email VARCHAR(50)
)
	BEGIN
		DECLARE schoolID INT;
        SELECT E.school_id INTO schoolID FROM Employees E WHERE E.id = id;
		CALL add_Admin(username, password, first_name, middle_name, last_name, gender, address, birth_date, email, schoolID);
	END$$
DELIMITER ;



-- 4 Delete employees and students from the system.
DELIMITER $$

DROP PROCEDURE IF EXISTS delete_Students$$
CREATE PROCEDURE delete_Students(stdssn INT)
	BEGIN 
		DELETE FROM Students WHERE ssn = stdssn;
	END$$
DELIMITER ;
-- 5 Edit the information of the school I am working in.
 -- takes as input all updated data
DELIMITER $$
DROP PROCEDURE IF EXISTS edit_School$$
CREATE PROCEDURE edit_School(
  id INT,
  name VARCHAR(40), 
  address VARCHAR(80), 
  phone_number VARCHAR(20), 
  email VARCHAR(40), 
  general_info VARCHAR(100),
  vision VARCHAR(100), 
  mission VARCHAR(100), 
  main_language VARCHAR(20),
  type VARCHAR(20),          
  fees DECIMAL(9,2)
  )
	BEGIN 
		UPDATE Schools s SET s.name = name, s.address = address, s.phone_number = phone_number,
        s.email = email, s.general_info = general_info, s.vision = vision, s.mission = mission,
        s.main_language = main_language, s.type = type, s.fees = fees WHERE s.school_id = id;
	END$$
DELIMITER ;

-- 6 Post announcements with the following information: date, title, description and type (events, news, trips ...etc).
DELIMITER $$

DROP PROCEDURE IF EXISTS add_Announcement$$
CREATE PROCEDURE add_Announcement(title VARCHAR(40), 
	announcement_type VARCHAR(50), 
	announcement_date DATE, 
	description VARCHAR(150), 
	administrator_id INT
)
	BEGIN 
		INSERT INTO Announcements (title,announcement_type,announcement_date,description,administrator_id)
        VALUES (title,announcement_type,announcement_date,description,administrator_id);
	END$$
DELIMITER ;
DELIMITER $$

DROP PROCEDURE IF EXISTS create_Activity2$$
CREATE PROCEDURE create_Activity2(
	activityType VARCHAR(30),
	activityDate DATE,
	activityLocation VARCHAR(30),
	activityDescription VARCHAR(300),
	activityName VARCHAR(30),
	schoolId INT,
	administrator VARCHAR(20)
)
	BEGIN 
        DECLARE tmp INT; 
        SELECT e.id INTO tmp FROM Employees e WHERE e.username = administrator;
		INSERT INTO Activities (activity_type,activity_date,location,description,activity_name,school_id,administrator_id) 
        VALUES (activityType,activityDate,activityLocation,activityDescription,activityName,schoolId,tmp);
	END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS add_Announcement2$$
CREATE PROCEDURE add_Announcement2(title VARCHAR(40), 
	announcement_type VARCHAR(50), 
	announcement_date DATE, 
	description VARCHAR(150), 
	administrator VARCHAR(20)
)
	BEGIN 
        DECLARE tmp INT;
        SELECT e.id INTO tmp FROM Employees e WHERE e.username = administrator;
		INSERT INTO Announcements (title,announcement_type,announcement_date,description,administrator_id)
        VALUES (title,announcement_type,announcement_date,description,tmp);
	END$$
DELIMITER ;

-- 7 Create activities and assign every activity to a certain teacher. An activity has its own date, location in school, type, equipment(if any), and description.
DELIMITER $$

DROP PROCEDURE IF EXISTS create_Activity$$
CREATE PROCEDURE create_Activity(
	activityType VARCHAR(30),
	activityDate DATE,
	activityLocation VARCHAR(30),
	activityDescription VARCHAR(300),
	activityName VARCHAR(30),
	schoolId INT,
	administratorId INT
)
	BEGIN 
		INSERT INTO Activities (activity_type,activity_date,location,description,activity_name,school_id,administrator_id) 
        VALUES (activityType,activityDate,activityLocation,activityDescription,activityName,schoolId,administratorId);
	END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS create_Activity2$$
CREATE PROCEDURE create_Activity2(
	activityType VARCHAR(30),
	activityDate DATE,
	activityLocation VARCHAR(30),
	activityDescription VARCHAR(300),
	activityName VARCHAR(30),
	schoolId INT,
	administrator VARCHAR(20)
)
	BEGIN 
        DECLARE tmp INT;
        SELECT e.id INTO tmp FROM Employees e WHERE e.username = administrator;
		INSERT INTO Activities (activity_type,activity_date,location,description,activity_name,school_id,administrator_id)
        VALUES (activityType,activityDate,activityLocation,activityDescription,activityName,schoolId,tmp);
	END$$
DELIMITER ;




-- activity equipment
DELIMITER $$

DROP PROCEDURE IF EXISTS create_Activity_Equip$$
CREATE PROCEDURE create_Activity_Equip(
	activity_id INT,
	equipment VARCHAR(40)
)
	BEGIN 
		INSERT INTO Activity_Equipments (activity_id, equipment) VALUES (activity_id, equipment);
	END$$
DELIMITER ;

-- assign teacher
DELIMITER $$

DROP PROCEDURE IF EXISTS assign_Activity_Teacher$$
CREATE PROCEDURE assign_Activity_Teacher(
	activity_id INT, 
	teacher_id INT, 
	administrator_id INT
)
	BEGIN 
		INSERT INTO Administrators_Activity_Teachers (activity_id, teacher_id, administrator_id)
        VALUES (activity_id, teacher_id, administrator_id);
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS assign_Activity_Teacher2$$
CREATE PROCEDURE assign_Activity_Teacher2(
	activity_id INT, 
	teacher_id INT, 
	administrator VARCHAR(20)
)
	BEGIN 
		DECLARE tmp INT;
        SELECT e.id INTO tmp FROM Employees e WHERE e.username = administrator;
		INSERT INTO Administrators_Activity_Teachers (activity_id, teacher_id, administrator_id)
        VALUES (activity_id, teacher_id, tmp);
	END$$
DELIMITER ;


-- 8 Change the teacher assigned to an activity.
DELIMITER $$

DROP PROCEDURE IF EXISTS change_Activity_Teacher$$
CREATE PROCEDURE change_Activity_Teacher(
	activity_id INT, 
	teacher_id INT
)
	BEGIN 
		UPDATE Administrators_Activity_Teachers a SET a.teacher_id = teacher_id WHERE a.activity_id = activity_id;
	END$$
DELIMITER ;
-- 9 Assign teachers to courses that are taught in my school based on the levels it offers.

DELIMITER $$

DROP PROCEDURE IF EXISTS assign_Teacher_Course$$
CREATE PROCEDURE assign_Teacher_Course(
	course_code INT, 
	teacher_id INT,
    school_id INT
)
	BEGIN 
		declare count int;
		SELECT count(DISTINCT cst.course_code) into count FROM Course_Student_Teacher cst INNER JOIN Students ss on ss.ssn=cst.student_ssn  and ss.school_id=school_id  WHERE cst.course_code = course_code;
        if(count=0) then
        signal sqlstate '45000' set message_text = 'no student';
		else
        UPDATE Course_Student_Teacher cst SET cst.teacher_id = teacher_id 
        WHERE cst.course_code = course_code AND cst.student_ssn IN ((SELECT s.ssn FROM Students s INNER JOIN Schools sc 
        ON s.school_id = sc.school_id WHERE s.school_id = school_id));
		END IF;
    END$$
DELIMITER ;


-- 10 Assign teachers to be supervisors to other teachers.
DELIMITER $$

DROP PROCEDURE IF EXISTS assign_Teacher_Supervisor$$
CREATE PROCEDURE assign_Teacher_Supervisor(
	supervisor_id INT,
	teacher_id INT
)
	BEGIN 
		DECLARE exp INT;
		SELECT t.experience_years INTO exp FROM Teachers t WHERE t.id = supervisor_id;
		IF(teacher_id = supervisor_id OR exp <= 15) THEN
			SELECT 'Invalid supervisor assignment';
		ELSE 
			INSERT INTO Teacher_supervise_Teacher (superviser_id ,teacher_id ) VALUES (supervisor_id, teacher_id);
		END IF;
	END$$
DELIMITER ;
-- 11 Accept or reject the application submitted by parents to their children.

DELIMITER $$

DROP PROCEDURE IF EXISTS accept_Parent_Application$$
CREATE PROCEDURE accept_Parent_Application(
	student_ssn INT,
	school_id INT,
    accepted BOOLEAN
)
	BEGIN 
		UPDATE Parent_applies_School p SET p.accepted = accepted 
        WHERE p.student_ssn = student_ssn AND p.school_id = school_id;
	END$$
DELIMITER ;




DELIMITER $$

DROP PROCEDURE IF EXISTS number_Applicants$$
CREATE PROCEDURE number_Applicants(OUT result INT)
	BEGIN 
        SELECT COUNT(*) INTO result FROM Students;
	END$$
DELIMITER ;


-- “As a teacher, I should be able to ...”
-- 1 Sign up by providing my first name, 
-- middle name, last name, birthdate, address, email, and gender.

DELIMITER $$

DROP PROCEDURE IF EXISTS signUp_Teacher$$
CREATE PROCEDURE signUp_Teacher(
	first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    birth_date DATE,		
    address VARCHAR(50),
    email VARCHAR(50),
    gender CHAR,
    school_id INT
)
	BEGIN
		INSERT INTO Employees(first_name,middle_name,last_name,birth_date,address,email,gender,school_id)
		VALUES (first_name,middle_name,last_name,birth_date,address,email,gender,school_id);
		INSERT INTO Teachers(id) VALUES(LAST_INSERT_ID());
	END$$

DELIMITER ;


-- 2 View a list of courses’ names I teach 
-- categorized by level and grade.

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Courses_per_Teacher$$
CREATE PROCEDURE view_Courses_per_Teacher(
	id INT
)
	BEGIN
	SELECT c.* FROM Courses c 
	INNER JOIN Course_Student_Teacher cst 
	ON c.course_code = cst.course_code AND cst.teacher_id = id
	ORDER BY c.level_name, c.grade;
	END$$

DELIMITER ;

-- 3 Post assignments for the course(s) I teach. 
-- Every assignment has a posting date, due date and
-- content.

DELIMITER $$
DROP PROCEDURE IF EXISTS post_Assignment$$
CREATE PROCEDURE post_Assignment(
	coursecode INT,
	posting_date DATE, 
	due_date DATE, 
	content VARCHAR(50), 
	id INT
)
	BEGIN
	  DECLARE ssn INT;
	  DECLARE course INT;
	  DECLARE done INT DEFAULT FALSE;
	  DECLARE cursor_i CURSOR FOR SELECT student_ssn,course_code FROM Course_Student_Teacher;
      
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	  INSERT INTO Assignments(course_code,posting_date,due_date,content,teacher_id) VALUES
	(coursecode,posting_date,due_date,content,id);
	  OPEN cursor_i;
	  READ_LOOP: LOOP
		FETCH cursor_i INTO ssn,course;
		IF done THEN
		  LEAVE READ_LOOP;
		END IF;
		IF(course = coursecode)THEN
		INSERT INTO Assignment_Course_Student(assignment_id,
		course_code,
		student_ssn,
		teacher_id) VALUES(LAST_INSERT_ID(),coursecode,ssn, id);
		END IF;
	  END LOOP;
	  CLOSE cursor_i;
	END$$

DELIMITER ;


-- 4 View the students’ solutions for the assignments
--  I posted ordered by students’ ids.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Students_Solutions$$
CREATE PROCEDURE view_Students_Solutions(id INT, aid INT)
	BEGIN
		DROP TABLE IF EXISTS tmp; 
		CREATE TABLE tmp
		SELECT  student_ssn, course_code FROM Course_Student_Teacher WHERE teacher_id = id;
		SELECT t.student_ssn, ais.course_code,ais.assignment_id, ais.solution, ais.grade FROM Assignment_Course_Student ais 
        INNER JOIN tmp t ON t.course_code = ais.course_code AND t.student_ssn = ais.student_ssn WHERE ais.assignment_id = aid
		ORDER BY t.student_ssn;
	END$$

DELIMITER ;

-- 5 Grade the students’ solutions 
-- for the assignments I posted.

DELIMITER $$
DROP PROCEDURE IF EXISTS grade_Students_Solutions$$
CREATE PROCEDURE grade_Students_Solutions(
	Aassignment_id INT,
    Acourse_code INT,
    Astudent_ssn INT,
    Agrade DECIMAL(5,2)
    )
	BEGIN
		UPDATE Assignment_Course_Student SET grade = Agrade WHERE assignment_id = Aassignment_id AND
		course_code = Acourse_code AND student_ssn = Astudent_ssn;
	END$$

DELIMITER ;


-- 6 Delete assignments.

DELIMITER $$
DROP PROCEDURE IF EXISTS delete_Assignments$$
CREATE PROCEDURE delete_Assignments(
	assign_id INT,
    code INT)
	BEGIN
		DELETE FROM Assignments WHERE assignment_id = assign_id AND course_code = code;
	END$$

DELIMITER ;

-- Write monthly reports about every student I teach.
--  A report is issued on a specific date to a specific
-- student and contains my comment.

DELIMITER $$
DROP PROCEDURE IF EXISTS add_Report$$
CREATE PROCEDURE add_Report(
    student_ssn INT,
    report_date DATE,
    report_content VARCHAR(50),
    teacher_comment VARCHAR(50),
    teacher_id INT
)
	BEGIN
		INSERT INTO Reports(student_ssn,report_date,report_content,teacher_comment,teacher_id) VALUES
		(student_ssn,report_date,report_content,teacher_comment,teacher_id);
	END$$
    
DELIMITER ;

-- 8 View the questions asked by the students for each course I teach.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Questions$$
CREATE PROCEDURE view_Questions(
id INT,
course_code INT)
	BEGIN
		SELECT q.question, q.question_id,q.answer,t.name FROM Questions q INNER JOIN Question_isPosted_By_Student s
        ON q.question_id = s.question_id AND q.course_code = s.course_code INNER JOIN Students t ON
        s.student_ssn = t.ssn
		WHERE q.teacher_id = id AND q.course_code = course_code;
	END$$
DELIMITER ;

-- 9 Answer the questions asked by the students for each course I teach.

DELIMITER $$
DROP PROCEDURE IF EXISTS answer_Questions$$
CREATE PROCEDURE answer_Questions(
question_id INT,
answer VARCHAR(50))
	BEGIN
		UPDATE Questions q SET q.answer = answer 
		WHERE q.question_id = question_id AND q.course_code = course_code;
	END$$
DELIMITER ;

-- 10 View a list of students that i teach categorized by the grade
-- and ordered by their name (first name
-- and last name).

DELIMITER $$
DROP PROCEDURE IF EXISTS view_My_Students$$
CREATE PROCEDURE view_My_Students(teacher_id INT)
	BEGIN
		SELECT DISTINCT s.* FROM Students s INNER JOIN Course_Student_Teacher cst ON s.ssn = cst.student_ssn WHERE cst.teacher_id = teacher_id
        ORDER BY s.grade, s.name;
	END$$
DELIMITER ;


-- 11 View a list of students that did not join any activity.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Inactive_Students$$
CREATE PROCEDURE view_Inactive_Students()
	BEGIN
		SELECT st.* FROM Students st
		WHERE st.ssn NOT IN (SELECT s.ssn
		FROM  Activity_contains_Student acs INNER JOIN Students s 
		ON acs.student_ssn = s.ssn);
	END$$
DELIMITER ;

-- 12 Display the name of the high school student who is currently a member of the greatest number of
-- clubs

DELIMITER $$
DROP PROCEDURE IF EXISTS most_Active_Student$$
CREATE PROCEDURE most_Active_Student()
	BEGIN
		DECLARE maxAct INT;
		DROP TABLE IF EXISTS tmp;
		CREATE TABLE tmp
		SELECT ces.student_ssn, COUNT(*) AS 'Number_of_Clubs' FROM Club_enrolls_Student ces 
		GROUP BY ces.student_ssn;
		SELECT MAX(Number_of_Clubs) INTO maxAct FROM tmp; 
		SELECT s.name FROM tmp t INNER JOIN Students s ON s.ssn = t.student_ssn WHERE t.Number_of_Clubs = maxAct ;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS signup_Parent$$
CREATE PROCEDURE signup_Parent(
	username VARCHAR(50), 
    password VARCHAR(20), 
    first_name VARCHAR(20), 
    last_name VARCHAR(20),
    landline_number INT, 
    address VARCHAR(80), 
    email VARCHAR(40)
)
	BEGIN 
		INSERT INTO Parents (username,password,first_name, last_name, landline_number, address, email)
        VALUES (username,password,first_name, last_name, landline_number, address, email);
	END$$
DELIMITER ;

-- parent's phone number 

DELIMITER $$

DROP PROCEDURE IF EXISTS add_Parent_Mobile$$
CREATE PROCEDURE add_Parent_Mobile(
	parent_username VARCHAR(50),
    phone VARCHAR(20)
)
	BEGIN 
		INSERT INTO Parent_mobileNo (parent_username, phone) VALUES (parent_username, phone);
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS apply_School$$
CREATE PROCEDURE apply_School(
	parent_username VARCHAR(50),
	ssn INT, 
    name VARCHAR(20),
    gender VARCHAR(10), 
    birth_date DATE, 
    school_id INT,
    grade INT,
	level_name VARCHAR(20)
)
	BEGIN 
		IF (ssn) not in(select s.ssn from Students s) THEN
		INSERT INTO Students (ssn,name,gender,birth_date,grade,level_name) VALUES (ssn,name,gender,birth_date,grade,level_name);
        INSERT INTO Parent_has_Student (parent_username, student_ssn) VALUES (parent_username, ssn);
        END IF;
		INSERT INTO Parent_applies_School (student_ssn,school_id,parent_username) VALUES (ssn,school_id,parent_username);
	END$$
    
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS search_Accepted$$
CREATE PROCEDURE search_Accepted(parent_username VARCHAR(50))
	BEGIN 
		SELECT DISTINCT st.name AS 'Child', st.ssn ,c.* FROM Parent_applies_School p INNER JOIN Parent_has_Student s ON p.parent_username = s.parent_username 
        INNER JOIN Schools c ON c.school_id = p.school_id INNER JOIN Students st on st.ssn=p.student_ssn WHERE p.accepted IS TRUE AND p.parent_username = parent_username  ORDER BY p.student_ssn;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS enroll_Student$$
CREATE PROCEDURE enroll_Student(student_ssn INT, school_id INT)
	BEGIN 
		DECLARE accepted BOOLEAN;
        DECLARE already int;
        DECLARE msg varchar(340);
        SELECT s.school_id into already FROM Students s where s.ssn=student_ssn;
        IF(already is null)THEN
		UPDATE Students s SET s.school_id = school_id WHERE ssn = student_ssn;
		ELSE set msg='no can do';
		signal sqlstate '45000' set message_text = msg;
        END IF;
        END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS view_Report$$
CREATE PROCEDURE view_Report(parent_username VARCHAR(50))
	BEGIN 
		SELECT s.name, r.*, e.first_name,e.middle_name,e.last_name FROM Reports r INNER JOIN Parent_has_student phs ON phs.parent_username=parent_username 
        and r.student_ssn = phs.student_ssn       INNER JOIN Students s on s.ssn=phs.student_ssn INNER JOIN Employees e on e.id= r.teacher_id ;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS replyTo_Report$$
CREATE PROCEDURE replyTo_Report(parent_username VARCHAR(50),
    report_id INT,
    student_ssn INT,
    reply VARCHAR(50)
)
	BEGIN 
		DECLARE count int;
        SELECT count(*) INTO count FROM Parent_repliesTo_Report pr WHERE
        pr.parent_username=parent_username and pr.report_id=report_id and pr.student_ssn=student_ssn;
        IF(count =0) THEN
        INSERT INTO Parent_repliesTo_Report (parent_username, report_id, student_ssn, reply) VALUES (parent_username, report_id, student_ssn, reply);
		ELSE UPDATE Parent_repliesTo_Report pr SET pr.reply= reply WHERE
        pr.parent_username=parent_username and pr.report_id=report_id and pr.student_ssn=student_ssn;
		END IF;
    END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS view_School$$
CREATE PROCEDURE view_School(parent_username VARCHAR(50))
	BEGIN 
		SELECT ss.name, s.*  FROM Parent_applies_School p INNER JOIN Students ss ON p.student_ssn = ss.ssn INNER JOIN Schools s 
        ON p.school_id = s.school_id WHERE p.parent_username = parent_username AND p.accepted IS TRUE
	    ORDER BY s.name;
    END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS view_Announcement$$
CREATE PROCEDURE view_Announcement(parent_username VARCHAR(50), school_id INT, curr_date DATE)
	BEGIN 
		SELECT * FROM Announcements a INNER JOIN Employees e ON a.administrator_id = e.id WHERE e.school_id IN (SELECT s.school_id FROM Students s INNER JOIN Parent_has_Student p ON  s.ssn = p.student_ssn WHERE p.parent_username = parent_username) 
		AND curr_date - a.announcement_date <= 10 && curr_date>a.announcement_date ;
    END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS rate_Teacher$$
CREATE PROCEDURE rate_Teacher(teacher_id INT,
    parent_username VARCHAR(50),
	rating INT
    )
	BEGIN 
		DECLARE count int default 0;
        SELECT COUNT(*) INTO count FROM Parent_rate_Teacher prt WHERE prt.teacher_id=teacher_id and prt.parent_username=parent_username;
		IF(count= 0) then
        INSERT INTO Parent_rate_Teacher (teacher_id,parent_username,rating) VALUES (teacher_id,parent_username,rating);
		ELSE UPDATE Parent_rate_Teacher prt SET prt.rating=rating where prt.teacher_id=teacher_id and prt.parent_username=parent_username;
    END IF;
    END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS write_School_Review$$
CREATE PROCEDURE write_School_Review(school_id INT,
	parent_username VARCHAR(50),
	review_txt VARCHAR(100)
    )
	BEGIN 
		DECLARE count int;
        Select count(*) INTO count FROM Parent_review_School prs where prs.school_id=school_id and prs.parent_username=parent_username;
		if(count=0)Then
		INSERT INTO Parent_review_School (school_id,parent_username,review_txt) VALUES (school_id,parent_username,review_txt);
		ELSE update Parent_review_School prs SET prs.review_txt=review_txt where prs.school_id=school_id and prs.parent_username=parent_username;
        END IF;
    END$$
DELIMITER ;




DELIMITER $$

DROP PROCEDURE IF EXISTS delete_School_Review$$
CREATE PROCEDURE delete_School_Review(schl_id INT,
	parent_user VARCHAR(50)
    )
	BEGIN 
		DELETE FROM Parent_review_School WHERE school_id = schl_id AND parent_username = parent_user;
    END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS calc_Overall_Rating$$
CREATE PROCEDURE calc_Overall_Rating(teacher_id int)
	BEGIN 
		SELECT AVG(p.rating)  FROM Parent_rate_Teacher p WHERE p.teacher_id = teacher_id;
    END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS high_Review$$
CREATE PROCEDURE high_Review(parent_username VARCHAR(50))
	BEGIN 
		SELECT COUNT(*), sh.* FROM Schools sh INNER JOIN Parent_review_School p ON sh.school_id = p.school_id WHERE sh.school_id 
        NOT IN (SELECT s.school_id FROM Students s INNER JOIN Parent_has_Student p ON  s.ssn = p.student_ssn WHERE p.parent_username = parent_username)
        GROUP BY sh.school_id ORDER BY COUNT(*) DESC
        LIMIT 10; 
    END$$
DELIMITER ;

-- 13 View the top 10 schools with the highest number of enrolled students. This should exclude schools that my children are enrolled in.

DELIMITER $$

DROP PROCEDURE IF EXISTS high_Enrolled$$
CREATE PROCEDURE high_Enrolled(	parent_username VARCHAR(50)
)
	BEGIN 
		SELECT COUNT(*), s.* FROM Schools s INNER JOIN Students p ON s.school_id = p.school_id WHERE s.school_id 
        NOT IN (SELECT s.school_id FROM Students s INNER JOIN Parent_has_Student p 
        ON  s.ssn = p.student_ssn WHERE p.parent_username = parent_username)
        GROUP BY s.school_id ORDER BY COUNT(*) DESC
        LIMIT 10; 
    END$$
DELIMITER ;

-- 14 Find the international school which has a reputation higher than all national schools, i.e. has the highest number of reviews.

DELIMITER $$

DROP PROCEDURE IF EXISTS highest_Rept$$
CREATE PROCEDURE highest_Rept()
	BEGIN 
		DECLARE m INT;
		SELECT MAX(tmp.count) INTO m FROM (SELECT COUNT(*) AS count FROM Parent_review_School p INNER JOIN Schools s ON p.school_id = s.school_id 
        WHERE s.type = 'National' GROUP BY p.school_id) tmp;
        SELECT * FROM (SELECT COUNT(*) AS count, s.* FROM Parent_review_School p INNER JOIN Schools s ON p.school_id = s.school_id 
        WHERE s.type = 'International' GROUP BY p.school_id) x  WHERE x.count > m;
    END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS view_Child_Teachers$$
CREATE PROCEDURE view_Child_Teachers(parent_username VARCHAR(50))
	BEGIN 
		SELECT DISTINCT e.first_name ,e.middle_name, e.last_name,s.name, c.course_name, e.id FROM course_student_teacher cts INNER JOIN Parent_has_Student phs ON phs.parent_username = parent_username AND phs.student_ssn=cts.student_ssn
        INNER JOIN Employees e ON e.id = cts.teacher_id INNER JOIN Courses c on c.course_code=cts.course_code INNER JOIN students s ON s.ssn=phs.student_ssn  ORDER BY phs.student_ssn;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS view_School2$$
CREATE PROCEDURE view_School2(parent_username VARCHAR(50))
	BEGIN 
		SELECT ss.name, ss.ssn , s.*  FROM Parent_has_Student p INNER JOIN Students ss ON p.student_ssn = ss.ssn INNER JOIN Schools s 
        ON ss.school_id=s.school_id WHERE p.parent_username = parent_username ORDER BY s.name;
    END$$
DELIMITER ;




DELIMITER $$

DROP PROCEDURE IF EXISTS view_Announcement2$$
CREATE PROCEDURE view_Announcement2(school_id INT)
	BEGIN 
		SELECT a.* FROM Announcements a INNER JOIN Employees e ON a.administrator_id = e.id and e.school_id=school_id ORDER BY a.announcement_date DESC;
    END$$
DELIMITER ;






DELIMITER $$

DROP PROCEDURE IF EXISTS checker$$
CREATE PROCEDURE checker(
	username varchar(50), 
	sID INT
)
	BEGIN 
		DECLARE count int;
        Select count(*) into count FROM Employees e where e.username=username and e.school_id=sID;
        IF(count =0)THEN 
        SIGNAL sqlstate '45000' set message_text='hello';
        END IF;
    END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS delete_Employees$$
CREATE PROCEDURE delete_Employees(eid INT)
	BEGIN 
		DELETE FROM Employees WHERE id = eid;
	END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS search_Course$$
CREATE PROCEDURE search_Course(
	course_code INT,
	course_name VARCHAR(20),
    student_ssn INT
)
	BEGIN 
		SELECT c.* FROM Course_Student_Teacher cst INNER JOIN Courses c 
        ON cst.course_code = c.course_code AND cst.student_ssn = student_ssn 
        AND (c.course_code = course_code OR c.course_name = course_name);
    END$$
DELIMITER ;




DELIMITER $$




DROP PROCEDURE IF EXISTS apply_Activity$$
CREATE PROCEDURE apply_Activity(
    activity_id INT,
    student_ssn INT
)
	BEGIN 
		DECLARE type VARCHAR(30);
		DECLARE counter INT;
		DECLARE activityDate DATE; 
        SELECT activity_type INTO type FROM Activities a WHERE a.activity_id = activity_id;
		SELECT activity_date INTO activityDate FROM Activities a WHERE a.activity_id = activity_id;
        SELECT COUNT(*) INTO counter FROM Activities a INNER JOIN Activity_contains_Student s ON a.activity_id = s.activity_id
        AND s.student_ssn = student_ssn AND a.activity_type = type AND a.activity_date = activityDate;
		IF (counter >= 1) THEN 
			SELECT name from balabizo;
        ELSE
			INSERT INTO Activity_contains_Student (activity_id,student_ssn) VALUES (activity_id,student_ssn);
            SELECT 'Joined Successuly';
		END IF;
    END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Club$$
CREATE PROCEDURE view_Club(
  student_ssn INT
)  BEGIN  
		DECLARE sID INT;
		SELECT s.school_id INTO sID FROM Students s WHERE s.ssn = student_ssn;
		SELECT c.*
		from clubs c WHERE c.high_school_id = sID;
    END$$
DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS view_MAssignment$$
CREATE PROCEDURE view_MAssignment(
student_ssn INT,
course_code INT
)
	BEGIN
		SELECT a.grade, a.assignment_id, assi.content,assi.due_date,a.solution FROM Assignment_Course_Student a INNER JOIN Assignments assi
        ON assi.assignment_id = a.assignment_id AND a.course_code = assi.course_code
		WHERE a.course_code = course_code AND a.student_ssn = student_ssn order by a.grade,a.solution,assi.due_date;
	END$$
DELIMITER ;


-- “As a teacher, I should be able to ...”
-- 1 Sign up by providing my first name, 
-- middle name, last name, birthdate, address, email, and gender.

DELIMITER $$

DROP PROCEDURE IF EXISTS signUp_Teacher$$
CREATE PROCEDURE signUp_Teacher(
	first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    birth_date DATE,		
    address VARCHAR(50),
    email VARCHAR(50),
    gender CHAR,
    school_id INT
)
	BEGIN
		INSERT INTO Employees(first_name,middle_name,last_name,birth_date,address,email,gender,school_id)
		VALUES (first_name,middle_name,last_name,birth_date,address,email,gender,school_id);
		INSERT INTO Teachers(id) VALUES(LAST_INSERT_ID());
	END$$

DELIMITER ;


-- 2 View a list of courses’ names I teach 
-- categorized by level and grade.

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Courses_per_Teacher$$
CREATE PROCEDURE view_Courses_per_Teacher(
	id INT
)
	BEGIN
	SELECT c.* FROM Courses c 
	INNER JOIN Course_Student_Teacher cst 
	ON c.course_code = cst.course_code AND cst.teacher_id = id
	ORDER BY c.level_name, c.grade;
	END$$

DELIMITER ;

-- 3 Post assignments for the course(s) I teach. 
-- Every assignment has a posting date, due date and
-- content.

DELIMITER $$
DROP PROCEDURE IF EXISTS post_Assignment$$
CREATE PROCEDURE post_Assignment(
	coursecode INT,
	posting_date DATE, 
	due_date DATE, 
	content VARCHAR(50), 
	id INT
)
	BEGIN
	  DECLARE ssn INT;
	  DECLARE course INT;
	  DECLARE done INT DEFAULT FALSE;
	  DECLARE cursor_i CURSOR FOR SELECT student_ssn,course_code FROM Course_Student_Teacher;
      
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	  INSERT INTO Assignments(course_code,posting_date,due_date,content,teacher_id) VALUES
	(coursecode,posting_date,due_date,content,id);
	  OPEN cursor_i;
	  READ_LOOP: LOOP
		FETCH cursor_i INTO ssn,course;
		IF done THEN
		  LEAVE READ_LOOP;
		END IF;
		IF(course = coursecode)THEN
		INSERT INTO Assignment_Course_Student(assignment_id,
		course_code,
		student_ssn,
		teacher_id) VALUES(LAST_INSERT_ID(),coursecode,ssn, id);
		END IF;
	  END LOOP;
	  CLOSE cursor_i;
	END$$

DELIMITER ;


-- 4 View the students’ solutions for the assignments
--  I posted ordered by students’ ids.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Students_Solutions$$
CREATE PROCEDURE view_Students_Solutions(id INT, aid INT)
	BEGIN
		DROP TABLE IF EXISTS tmp; 
		CREATE TABLE tmp
		SELECT  student_ssn, course_code FROM Course_Student_Teacher WHERE teacher_id = id;
		SELECT t.student_ssn, ais.course_code,ais.assignment_id, ais.solution, ais.grade FROM Assignment_Course_Student ais 
        INNER JOIN tmp t ON t.course_code = ais.course_code AND t.student_ssn = ais.student_ssn WHERE ais.assignment_id = aid
		ORDER BY t.student_ssn;
	END$$

DELIMITER ;

-- 5 Grade the students’ solutions 
-- for the assignments I posted.

DELIMITER $$
DROP PROCEDURE IF EXISTS grade_Students_Solutions$$
CREATE PROCEDURE grade_Students_Solutions(
	Aassignment_id INT,
    Acourse_code INT,
    Astudent_ssn INT,
    Agrade DECIMAL(5,2)
    )
	BEGIN
		UPDATE Assignment_Course_Student SET grade = Agrade WHERE assignment_id = Aassignment_id AND
		course_code = Acourse_code AND student_ssn = Astudent_ssn;
	END$$

DELIMITER ;


-- 6 Delete assignments.

DELIMITER $$
DROP PROCEDURE IF EXISTS delete_Assignments$$
CREATE PROCEDURE delete_Assignments(
	assign_id INT,
    code INT)
	BEGIN
		DELETE FROM Assignments WHERE assignment_id = assign_id AND course_code = code;
	END$$

DELIMITER ;

-- Write monthly reports about every student I teach.
--  A report is issued on a specific date to a specific
-- student and contains my comment.

DELIMITER $$
DROP PROCEDURE IF EXISTS add_Report$$
CREATE PROCEDURE add_Report(
    student_ssn INT,
    report_date DATE,
    report_content VARCHAR(50),
    teacher_comment VARCHAR(50),
    teacher_id INT
)
	BEGIN
		INSERT INTO Reports(student_ssn,report_date,report_content,teacher_comment,teacher_id) VALUES
		(student_ssn,report_date,report_content,teacher_comment,teacher_id);
	END$$
    
DELIMITER ;

-- 8 View the questions asked by the students for each course I teach.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Questions$$
CREATE PROCEDURE view_Questions(
id INT,
course_code INT)
	BEGIN
		SELECT q.question, q.question_id,q.answer,t.name FROM Questions q INNER JOIN Question_isPosted_By_Student s
        ON q.question_id = s.question_id AND q.course_code = s.course_code INNER JOIN Students t ON
        s.student_ssn = t.ssn
		WHERE q.teacher_id = id AND q.course_code = course_code;
	END$$
DELIMITER ;

-- 9 Answer the questions asked by the students for each course I teach.

DELIMITER $$
DROP PROCEDURE IF EXISTS answer_Questions$$
CREATE PROCEDURE answer_Questions(
question_id INT,
answer VARCHAR(50))
	BEGIN
		UPDATE Questions q SET q.answer = answer 
		WHERE q.question_id = question_id AND q.course_code = course_code;
	END$$
DELIMITER ;

-- 10 View a list of students that i teach categorized by the grade
-- and ordered by their name (first name
-- and last name).

DELIMITER $$
DROP PROCEDURE IF EXISTS view_My_Students$$
CREATE PROCEDURE view_My_Students(teacher_id INT)
	BEGIN
		SELECT DISTINCT s.* FROM Students s INNER JOIN Course_Student_Teacher cst ON s.ssn = cst.student_ssn WHERE cst.teacher_id = teacher_id
        ORDER BY s.grade, s.name;
	END$$
DELIMITER ;


-- 11 View a list of students that did not join any activity.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_Inactive_Students$$
CREATE PROCEDURE view_Inactive_Students()
	BEGIN
		SELECT st.* FROM Students st
		WHERE st.ssn NOT IN (SELECT s.ssn
		FROM  Activity_contains_Student acs INNER JOIN Students s 
		ON acs.student_ssn = s.ssn);
	END$$
DELIMITER ;

-- 12 Display the name of the high school student who is currently a member of the greatest number of
-- clubs

DELIMITER $$
DROP PROCEDURE IF EXISTS most_Active_Student$$
CREATE PROCEDURE most_Active_Student()
	BEGIN
		DECLARE maxAct INT;
		DROP TABLE IF EXISTS tmp;
		CREATE TABLE tmp
		SELECT ces.student_ssn, COUNT(*) AS 'Number_of_Clubs' FROM Club_enrolls_Student ces 
		GROUP BY ces.student_ssn;
		SELECT MAX(Number_of_Clubs) INTO maxAct FROM tmp; 
		SELECT s.name FROM tmp t INNER JOIN Students s ON s.ssn = t.student_ssn WHERE t.Number_of_Clubs = maxAct ;
	END$$
DELIMITER ;



-- 2 View a list of courses’ names assigned to me based on my grade ordered by name.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_my_Courses$$
CREATE PROCEDURE view_my_Courses(
	ssn INT
)
	BEGIN
		SELECT c.course_code, c.course_name FROM Course_Student_Teacher s INNER JOIN Courses c ON s.course_code = c.course_code 
        WHERE s.student_ssn = ssn
		ORDER BY(c.course_name);
	END$$
DELIMITER ;

-- 3 Post questions I have about a certain course.

DELIMITER $$
DROP PROCEDURE IF EXISTS post_Question$$
CREATE PROCEDURE post_Question(
    course_code INT,
    question VARCHAR(50),
    teacher_id INT,
    ssn INT
)
	BEGIN
		INSERT INTO Questions(
		course_code ,
		question,
		teacher_id) VALUES(course_code,question,teacher_id);
		INSERT INTO  Question_isPosted_By_Student(question_id,course_code,student_ssn,teacher_id)
		VALUES(last_insert_id(),course_code,ssn,teacher_id);
	END$$
DELIMITER ;

-- 4 View all questions asked by other students on a certain course along with their answers.
     
DELIMITER $$
DROP PROCEDURE IF EXISTS view_Questions_And_Answers$$
CREATE PROCEDURE view_Questions_And_Answers(
    course_code INT
)
	BEGIN
		SELECT q.question, q.answer FROM Questions q WHERE q.course_code = course_code;
	END$$ 
DELIMITER ;

-- 5 View the assignments posted for the courses I take.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_due_Assignments$$
CREATE PROCEDURE view_due_Assignments(
    ssn INT,coursecode INT)
	BEGIN 
		SELECT a.* FROM Assignment_Course_Student acs INNER JOIN Assignments a ON acs.assignment_id= a.assignment_id and acs.course_code=a.course_code
        WHERE a.course_code=coursecode and acs.student_ssn=ssn;
        END$$
DELIMITER ;

-- 6 Solve assignments posted for courses I take.
	
DELIMITER $$
DROP PROCEDURE IF EXISTS solve_Assignment$$
CREATE PROCEDURE solve_Assignment(
    assignment_id INT,
    course_code INT,
    student_ssn INT,
	solution VARCHAR(200))
	BEGIN 
		UPDATE Assignment_Course_Student a SET a.solution = solution  
		WHERE a.course_code = course_code AND a.student_ssn = student_ssn AND a.assignment_id = assignment_id;
	END$$
DELIMITER ;

-- 7 View the grade of the assignments I solved per course.

DELIMITER $$
DROP PROCEDURE IF EXISTS view_my_Assignment_Grades$$
CREATE PROCEDURE view_my_Assignment_Grades(
student_ssn INT,
course_code INT
)
	BEGIN
		SELECT a.grade, a.assignment_id, assi.content FROM Assignment_Course_Student a INNER JOIN Assignments assi
        ON assi.assignment_id = a.assignment_id AND a.course_code = assi.course_code
		WHERE a.course_code = course_code AND a.student_ssn = student_ssn;
	END$$
DELIMITER ;

-- 8 View the announcements posted within the past 10 days about the school I am enrolled in.

DELIMITER $$

DROP PROCEDURE IF EXISTS Student_view_Announcement$$
CREATE PROCEDURE Student_view_Announcement(ssn INT, curr_date DATE)
	BEGIN 
        DECLARE stdId INT;
        SELECT s.school_id INTO stdId FROM Students s WHERE s.ssn = ssn;
		SELECT a.* FROM Announcements a INNER JOIN Employees e ON a.administrator_id = e.id WHERE e.school_id = stdId
		AND curr_date - a.announcement_date <= 10 AND a.announcement_date < curr_date;
    END$$
DELIMITER ;

-- 9 View all the information about activities offered by my school, as well as the teacher responsible
-- for it.

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Activity$$
CREATE PROCEDURE view_Activity(
  student_ssn INT
)  BEGIN  
		DECLARE schID INT;
		SELECT s.school_id INTO schID FROM Students s WHERE s.ssn = student_ssn;
		SELECT a.*, e.first_name as 'Teacher''s first name', e.middle_name as 'Teacher''s middle name', e.last_name as 'Teacher''s last name'FROM Activities a INNER JOIN Administrators_Activity_Teachers aat ON a.activity_id = aat.activity_id
		INNER JOIN Employees e ON e.id=aat.teacher_id WHERE a.school_id = schID;
    END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS view_Activity2$$
CREATE PROCEDURE view_Activity2(school_id INT)
	BEGIN 
		SELECT distinct a.activity_id, a.activity_name, a.activity_date,a.location FROM Activities a INNER JOIN Employees e ON a.administrator_id = e.id and e.school_id=school_id Inner join Administrators_Activity_Teachers
        WHERE a.activity_id NOT IN (
			SELECT activity_id FROM Administrators_Activity_Teachers
        )
        ORDER BY a.activity_date DESC;
    END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS find_Courses_Admin$$
CREATE PROCEDURE find_Courses_Admin(admin VARCHAR(20))
	BEGIN 
		declare id_tmp int;
        select school_id into id_tmp From Employees where username =admin;
        
        Select c.course_code, c.course_name, c.level_name, c.grade FROM Schools s INNER JOIN Elementary_Schools e on e.school_id=s.school_id INNER JOIN
        Courses c where c.level_name='Elementary' and s.school_id=id_tmp
        UNION
        SELECT c.course_code, c.course_name, c.level_name, c.grade FROM Schools s INNER JOIN Middle_Schools m on m.school_id =s.school_id INNER JOIN
		Courses c where c.level_name='Middle' and s.school_id=id_tmp
        UNION
        SELECT c.course_code, c.course_name, c.level_name, c.grade FROM Schools s INNER JOIN High_Schools m on m.school_id =s.school_id INNER JOIN
		Courses c where c.level_name='High' and s.school_id=id_tmp AND
         c.course_code NOT IN (
			SELECT cst.course_code FROM Course_Student_Teacher cst inner join employees e on e.id=cst.teacher_id
            and e.school_id =id_tmp
        );
    END$$
DELIMITER ;



-- 10 Apply for activities in my school on the condition that I can not join two activities of the same
-- type on the same date.



DELIMITER $$
DROP PROCEDURE IF EXISTS update_Account_Info$$
CREATE PROCEDURE update_Account_Info(
	ssn INT, 
    name VARCHAR(20),
	gender VARCHAR(10), 
    birth_date DATE, 
    password VARCHAR(20)
)
	BEGIN
		UPDATE  Students s SET s.name = name,s.gender = gender,
        s.birth_date = birth_date,s.password = password 
        WHERE s.ssn = ssn;
	END$$
DELIMITER ;



DELIMITER $$

DROP PROCEDURE IF EXISTS join_Club$$
CREATE PROCEDURE join_Club(
    high_school_id INT,
	club_name VARCHAR(40), 
    student_ssn INT
)
	BEGIN 
		INSERT INTO Club_enrolls_Student (student_ssn,high_school_id,club_name) VALUES (student_ssn,high_school_id,club_name);
    END$$
DELIMITER ;

-- 12 Search in a list of courses that i take by its name or code.


DELIMITER $$

DROP PROCEDURE IF EXISTS apply_Activity$$
CREATE PROCEDURE apply_Activity(
    activity_id INT,
    student_ssn INT
)
	BEGIN 
		DECLARE type VARCHAR(30);
		DECLARE counter INT;
		DECLARE activityDate DATE; 
        SELECT activity_type INTO type FROM Activities a WHERE a.activity_id = activity_id;
		SELECT activity_date INTO activityDate FROM Activities a WHERE a.activity_id = activity_id;
        SELECT COUNT(*) INTO counter FROM Activities a INNER JOIN Activity_contains_Student s ON a.activity_id = s.activity_id
        AND s.student_ssn = student_ssn AND a.activity_type = type AND a.activity_date = activityDate;
		IF (counter >= 1) THEN 
			SELECT name from balabizo;
        ELSE
			INSERT INTO Activity_contains_Student (activity_id,student_ssn) VALUES (activity_id,student_ssn);
            SELECT 'Joined Successuly';
		END IF;
    END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS view_Club$$
CREATE PROCEDURE view_Club(
  student_ssn INT
)  BEGIN  
		DECLARE sID INT;
		SELECT s.school_id INTO sID FROM Students s WHERE s.ssn = student_ssn;
		SELECT c.*
		from clubs c WHERE c.high_school_id = sID;
    END$$
DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS view_MAssignment$$
CREATE PROCEDURE view_MAssignment(
student_ssn INT,
course_code INT
)
	BEGIN
		SELECT a.grade, a.assignment_id, assi.content,assi.due_date,a.solution FROM Assignment_Course_Student a INNER JOIN Assignments assi
        ON assi.assignment_id = a.assignment_id AND a.course_code = assi.course_code
		WHERE a.course_code = course_code AND a.student_ssn = student_ssn order by a.grade,a.solution,assi.due_date;
	END$$
DELIMITER ;


Delimiter $$
drop trigger if exists trg_trigger_test_ins $$
create trigger trg_trigger_test_ins before insert on parent_applies_School
for each row
begin
    declare msg varchar(128);
    declare level varchar(50);
    declare studentSSN int;
    declare count int default 0;
    SET studentSSN = new.student_ssn; 
    SELECT level_name INTO level FROM students where ssn=studentSSN;
    if(level = 'Elementary')THEN
    SELECT count(*) INTO count FROM Schools s INNER JOIN Elementary_Schools e ON e.school_id=s.school_id and e.school_id=new.school_id; 
    ELSE  if(level = 'Middle')THEN
    SELECT count(*) INTO count FROM Schools s INNER JOIN Middle_Schools e ON e.school_id=s.school_id and e.school_id=new.school_id; 
	ELSE 
    SELECT count(*) INTO count FROM Schools s INNER JOIN High_Schools e ON e.school_id=s.school_id and e.school_id=new.school_id; 
	END IF;
    END IF;
    
    if count = 0 then
        set msg = 'This School does not offer the educational level of your child ';
        signal sqlstate '45000' set message_text = msg;
    end if;
    
end$$

Delimiter ;