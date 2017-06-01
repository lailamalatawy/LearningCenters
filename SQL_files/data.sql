USE Database_Project;
INSERT INTO Levels VALUES('Elementary');
INSERT INTO Levels VALUES('Middle');
INSERT INTO Levels VALUES('High');

INSERT INTO Schools (name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) 
VALUES('ACST','1A ElMesaha','+201-011-645-321','americanschool@acst.net','This is an American Cooperative School of Tunis. It is the BEST SCHOOL EVER!!!!','Longsighted','Opening doors hearts and minds','English','International',160000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary'); 

INSERT INTO Schools (name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) 
VALUES('Talaa Islamic School','Elmohandessen near Mosque Mostafa Mahmood','+201-022-625-339','tis@yahoo.com','Mariem Kandil attended here 6 years.These years were some of the most influential years of her life','Longsighted','Opening Minds Doors and hearts :D','English','National',6000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary'); 

INSERT INTO Schools (name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) 
VALUES('RCG','Ghamra ','+201-237-487-925','natsykoko@gmail.com','This is Ramses College for Girls. BUT it has currently gone down the hill! NOT RECOMMENDED',
'Nearsighted','Prepare to be not amazed!','English','National',30000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary'); 

INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Shakespeare Artists School','1A Downtown Cairo,Egypt','+201-022-625-339','hamlet@yahoo.com','This Shakesperean school is one of a kind and is open for all artists out there!','limited Vision','To be or not to be','English','National',12000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Hogwarts','CLASSIFIED INFORMATION','+201-192-168-122','magicway@magicway.com','Hogwarts aims to be a nourishing environment for young witches and wizards','Extreme Vision','Teach us something Please','English','International',10);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary'); 
INSERT INTO Supplies_ElementaryS(supplies, school_id)VALUES('Stationary, lunch box, 5 notebooks',last_insert_id());
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Beauxbatons Academy of Magic','1A Mourad st., Giza, Egypt,','+201-126-253-139','info@beauxbatonsAcademy.com.fr','Our breath-taking beauty of a chateau surrounded by formal magical gardens and lawns.','Une vision tres forte','','French','National',1200);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Durmstrang Institute','Abou Air,Alexandria, Egypt','022625339','durmstrang@owl.com','Our school has a dubious reputation, and is known to put a lot of emphasis on teaching the Dark Arts','UnderWater Vision','Drum Drum','Bulgarian','International',4000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Nefertari School','Ismalia st,Cairo,Egypt','0122167198','askus@nef.com.eg','Many people talk about Nefertari school. Whether or not it is actually a good school, remains a myth','Extended Vision','We are the BEST','English','International',40000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Masria Schools','The fifth Settlement, Cairo,Egypt','01016044549','askus@masria.com.eg','Mariem Kandil mentionned in her Autobiography "Magical ME" that this school has got PLENTY OF BUSES','V stands for Vision','Excellence is our MOTTO','English','International',40000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Malvern College Egypt','B2-B3 South Ring Road, Investment Zone Kattameya, Cairo, Egypt','+202 2618616','info@malverncollege.edu.eg','We strive to be the leading independent co-educational school of its scale and type in Egypt','Sight for Sore eyes','We seek to develop future pioneers','English','International',80000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('New Ramses College','Ghamra,Cairo,Egypt','01011334942','nrc@gmail.com','We strive for Excellence','V for very good Vision','We accept only the students willing to pay','English','International',40000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('Orman School','Mourad st.,Giza,Egypt','+201018044547','ormanInfo@gmail.com','Orman School is quite an old well-known school','V for ok Vision','We pledge to fufill our honorable mission','Arabic','National',5000);
INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');
INSERT INTO Schools(name,address,phone_number,email,general_info,vision,mission,main_language,type,fees) VALUES('The International School of Elite','New Cairo – 5th Settlement, off Road 90, behind Masraweya Compound','+20111 114 3225','eliteInfo@gmail.com','nternational School of Elite Education is a private, co-educational, international school','V for very costy Vision','An Education that inspires the Leader in You','English','International',50000);

INSERT INTO High_Schools(school_id,level_name) values(last_insert_id(),'High'); 
INSERT INTO Middle_Schools(school_id,level_name) values(last_insert_id(),'Middle'); 
INSERT INTO Elementary_Schools(school_id,level_name) values(last_insert_id(),'Elementary');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
    'hod.hisham',
    'hodhod',
	'Hoda' ,
    'Laila',
    'Hisham' ,
    'F',
    'Rehab,Cairo,Egypt' ,
    '1992-2-2' ,		
    'hodahisham@gmail.com',
    13000,
    1
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'2011-1-1');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'mariem.kandil',
    'marhkandil',
	'Mariem' ,
    null,
    'Kandil' ,
    'F',
    '1A Dokki,Giza,Egypt' ,
    '1991-3-2' ,		
    'marhkandil@gmail.com',
    30000,
    9
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'2010-12-12');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
    'noha.elbaz',
    'IamBat!',
	'Noha' ,                         
    null,
    'Khaled' ,
    'F',
    'Nasr City, Cairo,Egypt' ,
    '1990-3-1' ,		
    'no.loves.na@gmail.com',
    12000,
    8
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'2010-12-1');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
    'nour.khaled',
    'pharmacist',
	'Nour' ,
    null,
    'Khaled' ,
    'F',
    'First Settlement,Cairo,Egypt' ,
    '1989-3-1' ,		
    'nourSchinchi@gmail.com',
    10000,
    2
);

INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'2008-9-1');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'minerva.mcgongall',
    'cats',
	'Minerva' ,
    null,
    'McGongall' ,
    'F' ,		
    'Shrouk City, Cairo,Egypt' ,
    '1949-3-1' ,
    'transfigure@wizwardway.com',
    18000,
    10
);

INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'1971-12-1');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
 	'sev.snape',
    'potions',
    'Severus' ,
    null,
    'Snape' ,
    'M',		
    'Spinnet st.,New Cairo,Egypt' ,
    '1960-3-1' ,
    'potionsMas@wizwardway.com',
    16500,
    7
    
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'1981-12-1');
Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'filius.flitwick',
    'charminge',
	'Filius' ,
    null,
    'Flitwick' ,
    'M',
	'10A Moez,Alharam,Giza,Egypt' ,
    '1945-3-1' ,		
    'charms@wizwardway.com',
    16000,
    5
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'1979-10-1');
Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
    'albus.dumbledore',
    'blubber',
	'Albus' ,
    null,
    'Dumbledore' ,
    'M',
    '10 Elhegaz, Cairo,Egypt' ,
    '1939-3-10' ,		
    'nitwit@wizwardway.com',
    14000,
    10 
);

INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'1970-10-1');



Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'rubius.hagrid',
    'fluffy',
	'Rubious' ,
    null,
    'Hagrid' ,
    'M',
    '10A, Adn st, Giza,Egypt' ,
     '1939-3-11' ,		
    'keeper@wizwardway.com',
    7500,
    4
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'1995-10-1');
Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'ahmad.malatawy',
    'noogler',
	'Ahmad' ,
    null,
    'Maltawy' ,
    'M',
    '1 Ramo, Nasr Rd, Nasr City',
    '1989-4-1' ,		
    'maltawy.ahmad@gmail.com',
    10000,
    2
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id(),'2010-10-1');

Insert INTO Employees(username ,
	password ,
    first_name,
    middle_name,
    last_name,
    gender ,		
    address,
    birth_date,		
    email ,
    salary,
    school_id )
    VALUES (
	'lila.malatawy',
    'loolz123',
    'Lila' ,
     null,
    'Malatawy' ,
    'F',
    '1 Ramo, Nasr Rd, Nasr City',
    '1989-4-1' ,		
    'maltawy.lolz@gmail.com',
    10000,
    1
);
INSERT INTO Teachers(id,hire_date) Values(last_insert_id() ,'2013-5-29');





INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('mariem.marian','iloveMe','Mariem','Marie','Marian','F','1A ELMESAHA,Dokki, Giza, Egypt','1995-1-1','marhkandil@yahoo.com',12,34000);
INSERT INTO Teachers(id,hire_date) values(last_insert_id(),'2010-11-10');

INSERT INTO teacher_supervise_teacher(
    superviser_id ,
	teacher_id)VALUES(1,4);


INSERT INTO teacher_supervise_teacher(
    superviser_id ,
	teacher_id)VALUES(2,5);


INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('sarah.sullivan','sarahsucks','Sarah','Sally','Sullivan','F','1B ELMESAHA,Dokki, Giza, Egypt','1994-1-21','svoldemort@yahoo.com',3,40000);
INSERT INTO Teachers(id,hire_date) values(last_insert_id(),'2011-4-1');


INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('aisha.ali','boohoo','Aisha','Ally','Ali','F','1C ELMESAHA,Dokki, Giza, Egypt','1993-1-21','aisha.al.al@yahoo.com',11,34000);
INSERT INTO Teachers(id,hire_date) values(last_insert_id(),'2013-4-1');


INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('zeina.ali','boohoo','Zeina',null,'Kandil','F','1N ELMESAHA,Dokki, Giza, Egypt','1989-1-21','zeina.kandil@yahoo.com',1,4000);
INSERT INTO Administrators(id) values(last_insert_id());

INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('mayar.aly','boohy','Mayar',null,'Aly','F','1Q ELMESAHA,Dokki, Giza, Egypt','1980-1-21','mayarAli@yahoo.com',2,5000);
INSERT INTO Administrators(id) values(last_insert_id());


INSERT INTO Employees(
	username,
    password,
    first_name,
    middle_name,
    last_name,
    gender,		
    address,
    birth_date,		
    email,
    school_id,salary)
    values('maher.aly','boohy','Maher',null,'Aly','M','1Q ELMESAHA,Dokki, Giza, Egypt','1980-1-21','maherAly@yahoo.com',3,5000);
INSERT INTO Administrators(id) values(last_insert_id());

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('Maths 11','High',11,'11th level Maths');

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('English 11','High',11,'11th level English');

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('Sciences 11','High',11,'11th level Sciences');

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('Maths 12','High',12,'12th level Maths');

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('English 12','High',12,'12th level English');

INSERT INTO Courses(
	course_name ,
    level_name,
    grade,
	description) VALUES('Sciences 12','High',12,'12th level Sciences');


INSERT INTO Course_prerequisite_Of_Course
( prerequisite_code , 
	course_code)
    VALUES
(1,4);
INSERT INTO Course_prerequisite_Of_Course
( prerequisite_code , 
	course_code)
    VALUES
(2,5);



INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456778,'Hoda Hisham Hamdy','F','2000-5-17','ho.hi.ha','dodobird',12,12,'High');

INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456789,'Harry James Potter','M','2001-5-17','harry.potter','firebolt',11,12,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456777,'Ronald Weasley','M','2000-12-12','ronald.weasley','galleons',11,4,'High');

INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456788,'Hermione Granger','F','2000-12-11','hermione.granger','books',11,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456779,'Ginny Weasley','F','2002-1-1','ginny.weasley','quiddtich',10,4,'High');



INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456800,'Drace Malfoy','M','2000-10-11','drace.malfoy','pureblood',11,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456801,'Hannah Abbott','F','2000-11-10','hannah.abbott','hufflepuff',11,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456802,'Susan Bones','F','2000-10-10','susan.bones','patronous',11,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456803,'Collin Creavey','M','2002-10-11','collin.creavey','magic',10,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456804,'George Weasley','M','1998-12-12','george.weasley','gred',12,4,'High');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456805,'Fred Weasley','M','1998-12-12','fred.weasley','forge',12,4,'High');




INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456806,'Malak Hassan','F','2009-7-29','malak.hassan','malooka',1,2,'Elementary');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456807,'Aisha Hanafy','F','2010-1-7','aisha.hanafy','fish',1,2,'Elementary');


INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456808,'Habiiba Elghamry','F','2008-1-7','habiiba.elghamry','biiba',2,3,'Elementary');



INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456809,'Nourhan Khaled','F','2007-1-7','nourhan.khaled','hogwarts',3,3,'Elementary');



INSERT INTO Students( ssn, name, gender, birth_date, 
	username , 
	password ,
    grade , 
    school_id , 
    level_name)
VALUES(123456811,'Yasmine Amr','F','2001-1-7','yasmine.amr','fish',10,2,'High');




INSERT INTO Students( ssn, name, gender, birth_date, 
    grade , 
    school_id , 
    level_name) VALUES(102983746,'Salma Ammar','F','2010-5-10',1,3,'Elementary');



INSERT INTO Students( ssn, name, gender, birth_date, 
    grade , 
    school_id , 
    level_name) VALUES(657389754,'Ahmed Seleem','M','2012-1-5',3,3,'Elementary');
    

INSERT INTO Students( ssn, name, gender, birth_date, 
    grade , 
    school_id , 
    level_name) VALUES(102935446,'Amira Gamal','F','2000-11-09',11,3,'High');





-- FOR SCHOOL NUMBER 1
INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('ALL DAY','2016-11-11','Big Gym',
'We will be having a friendly dodgeball tournament',
'Dodgeball Tournament',1,
16);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),1,16)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Around 100 dodgeballs')
;
INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER HOURS','2016-11-30','Big Gym',
'You are cordially invited to attend our "Come to Our Garden" Concert',
'Come to Our Garden',1,
16);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),1,16)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need microphones, speakers, around 20 chairs, overhead lights, projectors')
;
INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('ALL DAY','2016-12-1','Staff''s garage',
'We will be having an all day car-washing event, all proceeds will be go to Charity  ',
'Car Wash',1,
16);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),1,16)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need sponges, rinsers, towels, soap')
;
INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER HOURS','2017-1-11','Big Gym',
'Come show us what you''ve got!',
'Midwinter Dance',1,
16);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),1,16)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Disco ball, dance floor, dj equipment')
;

INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER-HOURS','2016-11-30','Big Gym',
'The drama club will proudly present to us "Romeo and Juliet"',
'Play',1,
16);

INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),12,16)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need costumes, play set, light projectors, sound system')
;

INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER HOURS','2016-11-30','Big Gym',
'WE WILL BE WATCHING "FANTASTIC BEASTS AND WHERE TO FIND THEM"',
'Movie Night',1,
16);

INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need projecter, dvd player, computer')
;

INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),12,16)
;
---------------------------------------
-- SCHOOL NUMBER 2
INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER HOURS','2016-11-30','Big Gym',
'WE WILL BE WATCHING "FANTASTIC BEASTS AND WHERE TO FIND THEM"',
'Movie Night',2,
17);

INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need projecter, dvd player, computer')
;

INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),11,17)
;


INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('ALL DAY','2016-11-11','Big Gym',
'We will be having a friendly dodgeball tournament',
'Dodgeball Tournament',2,
17);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),3,17)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Around 100 dodgeballs')
;

INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER-HOURS','2016-11-30','Big Gym',
'The drama club will proudly present to us "Romeo and Juliet"',
'Play',2,
17);

INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),11,17)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need costumes, play set, light projectors, sound system')
;

INSERT INTO Activities
(
	activity_type ,
	activity_date ,
	location ,
	description ,
	activity_name, 
	school_id,
    administrator_id)
VALUES('AFTER HOURS','2016-11-30','Small Gym',
'You are cordially invited to attend our "Come to Our Garden" Concert',
'Come to Our Garden',2,
17);
INSERT INTO Administrators_Activity_Teachers
(
	activity_id, 
	teacher_id, 
	administrator_id
)VALUES(last_insert_id(),3,17)
;
INSERT INTO Activity_Equipments(
	activity_id,
	equipment
)VALUES(
last_insert_id(),
'Need microphones, speakers, around 20 chairs, overhead lights, projectors')
;
 
INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('Start of the Winter Exams','Educational',
 '2016-11-1',
 'We have some bad news...Exams are starting!',
 17);


INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('Start of the Spring Exams','Educational',
 '2016-5-1',
 'We have some bad news and some good news...The bad news is exams are starting BUT the good news is you will be having your summer vacation afterwards!',
 17);



INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('Book Fair','Event',
 '2016-11-1',
 'Bring your old books and trade them with your fellow students! Or buy from our brand new collection',
 16);
 INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('Movie Night','Event',
 '2016-12-21',
 'We will be Featuring "Fantastic Beasts and Where to find them"!',
 16);
  
 INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('Our Annual run for Cancer','Health',
 '2017-1-21',
 'Put on your running gear and join us on our annual charitable run for Cancer',
 15);  
  
  
 INSERT INTO Announcements
(
	title, 
	announcement_type,
	announcement_date, 
	description, 
	administrator_id
 )VALUES('International Day','Event',
 '2017-3-21',
 'Everyone is welcome to put on their national outfits, bring some homemade goodies and join us on our annual International Day',
 17);  
  
  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (1,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (1,'Arcade Club','An arcade gaming group, getting together to chat, eat, drink and play arcade games and pinball. Regular gaming events and meet ups for everyone interested in retro arcade games of the 80''s and 90''s.');
    
    
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (2,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (2,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (2,'Arcade Club','An arcade gaming group, getting together to chat, eat, drink and play arcade games and pinball. Regular gaming events and meet ups for everyone interested in retro arcade games of the 80''s and 90''s.');


  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (3,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
    
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (3,'Arcade Club','An arcade gaming group, getting together to chat, eat, drink and play arcade games and pinball. Regular gaming events and meet ups for everyone interested in retro arcade games of the 80''s and 90''s.');


    
    INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (4,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (4,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );


  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (4,'Arcade Club','An arcade gaming group, getting together to chat, eat, drink and play arcade games and pinball. Regular gaming events and meet ups for everyone interested in retro arcade games of the 80''s and 90''s.');



  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (5,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
    INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (6,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
    
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (6,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );


    
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (7,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (7,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );


  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (8,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (8,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );

  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (8,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (4,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');
    

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (9,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (9,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );

  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (9,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');


  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (10,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (10,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );

  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (10,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');
    


  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (11,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (11,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );

  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (11,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');

 

  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (12,'Model United Nations','Model United Nations, also known as Model UN or MUN, is an educational simulation and/or academic competition in which students can learn about diplomacy, international relations, and the United Nations.'
    );
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (1,'Karate Club','Karate is a Japanese martial art built around a system of punches, blocks, kicks and sweeps. It is a great way to build your character, keep fit, and improve your flexibility.'
    );

  
  INSERT INTO  Clubs
(
	high_school_id ,
	club_name , 
	purpose )VALUES
    (12,'Roots and Shoots','Jane Goodall’s Roots & Shoots is the Jane Goodall Institute’s (JGI) global youth-led community action program, comprised of thousands of young people inspired by Dr. Jane Goodall to make the world a better place.');

INSERT INTO Club_enrolls_Student
(	student_ssn,
    high_school_id, 
    club_name)VALUES(123456778,12,'Roots and Shoots');
    
-- ----

INSERT INTO Assignments
(
	course_code,
	posting_date, 
	due_date, 
	content, 
	teacher_id)
VALUES (2,'2016-11-9','2016-12-14','Write about your favorite animal',2);

INSERT INTO  Assignment_Course_Student          -- ASKKKKKKK!!!!!!!!!!!
(
	assignment_id ,
    course_code,
    student_ssn,
    teacher_id)
VALUES(last_insert_id(),2,123456811,2);

    
    
----
-- new part

INSERT INTO Course_Student_Teacher
(
    student_ssn ,
    course_code ,
    teacher_id )
    Values (123456811,1,1);

INSERT INTO Course_Student_Teacher
(
    student_ssn ,
    course_code ,
    teacher_id )
    Values (123456811,2,2);
INSERT INTO Course_Student_Teacher
(
    student_ssn ,
    course_code ,
    teacher_id )
    Values (123456811,3,3);

INSERT INTO Questions
(
    course_code,
    question,
	answer,
    teacher_id) 
    VALUES(3,'How fast does Earth rotate around itself?','let me google this for you',3);
    
INSERT INTO Question_isPosted_By_Student
(
	course_code ,
    question_id ,
    student_ssn ,
    teacher_id
    )VALUES(3,last_insert_id(),123456811,3);

    
INSERT INTO Questions
(
    course_code,
    question,
	answer,
    teacher_id) 
    VALUES(2,'What book should I read?','Little Red Riding Hood',2);
    

    
INSERT INTO Question_isPosted_By_Student
(
	course_code ,
    question_id ,
    student_ssn ,
    teacher_id
    )VALUES(2,last_insert_id(),123456811,2);


INSERT INTO Assignments
(
	course_code,
	posting_date, 
	due_date, 
	content, 
	teacher_id)
VALUES (2,'2016-10-9','2016-12-12','Write about your favorite food',2);

INSERT INTO  Assignment_Course_Student          -- ASKKKKKKK!!!!!!!!!!!
(
	assignment_id ,
    course_code,
    student_ssn,
    teacher_id)
VALUES(last_insert_id(),2,123456811,2);



INSERT INTO Assignments
(
	course_code,
	posting_date, 
	due_date, 
	content, 
	teacher_id)
VALUES (2,'2016-11-9','2016-12-14','Write about your favorite animal',2);

INSERT INTO  Assignment_Course_Student          -- ASKKKKKKK!!!!!!!!!!!
(
	assignment_id ,
    course_code,
    student_ssn,
    teacher_id)
VALUES(last_insert_id(),2,123456811,2);

