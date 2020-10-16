CREATE DATABASE College_Database ;

USE College_Database ;

CREATE TABLE Students (
student_ID INT NOT NULL,
student_Name VARCHAR(100) NOT NULL,
student_Address VARCHAR(100) NOT NULL,
student_MailID VARCHAR(200) NOT NULL ,
student_PhoneNumber INT NOT NULL ,
PRIMARY KEY ( student_ID ) );

CREATE TABLE Course (
course_ID INT NOT NULL,
course_Name VARCHAR(100) NOT NULL,
student_ID INT NOT NULL,
PRIMARY KEY ( course_ID ) );

CREATE TABLE Faculty (
faculty_ID INT NOT NULL,
faculty_Name VARCHAR(100) NOT NULL,
faculty_Address VARCHAR(100) NOT NULL,
faculty_MailID VARCHAR(200) NOT NULL ,
faculty_PhoneNumber INT NOT NULL ,
student_ID INT NOT NULL,
PRIMARY KEY ( faculty_ID ) );

#INNER JOIN 

SELECT Students.student_ID , Students.student_Name , Students.student_Address ,
Course.course_Name , Faculty.faculty_Name FROM Students 
JOIN Course ON Course.student_ID = Students.student_ID 
JOIN  Faculty ON Faculty.student_ID = Students.student_ID ;
 
SELECT Students.student_Name , Course.course_Name FROM Students 
JOIN Course
WHERE Students.student_ID = Course.student_ID ORDER BY Students.student_Name;

SELECT Students.student_Name , Students.student_Address, Faculty.faculty_Name  FROM Faculty 
JOIN Students
WHERE Students.student_ID = Faculty.student_ID GROUP BY Students.student_Address HAVING Students.student_Address = 'Bangalore' ;

#LEFT OUTER JOIN 

SELECT Students.student_Name , Students.student_Address , Course.course_Name FROM Students
LEFT OUTER JOIN Course
ON Students.student_ID = Course.student_ID ;

SELECT Faculty.faculty_Name , Faculty.faculty_Address , Students.student_Name  FROM Faculty
LEFT OUTER JOIN Students
ON Faculty.student_ID = Students.student_ID WHERE Faculty.faculty_Name LIKE '%a';

SELECT Students.student_ID ,Students.student_Name , Students.student_PhoneNumber , Course.course_Name , Faculty.faculty_Name FROM Students
LEFT OUTER JOIN Course
ON Students.student_ID = Course.student_ID 
LEFT OUTER JOIN Faculty
ON Students.student_ID = Faculty.student_ID ORDER BY Faculty.faculty_Name ;

#RIGHT OUTER JOIN 

SELECT Students.student_Name , Course.course_ID , Course.course_Name FROM Course
RIGHT OUTER JOIN Students 
ON Students.student_ID = Course.student_ID WHERE Students.student_Name LIKE 'a%';

SELECT   Students.student_Name , Faculty.faculty_Name , Faculty.faculty_MailID 
FROM Students
RIGHT OUTER JOIN Faculty 
ON Students.student_ID = Faculty.student_ID GROUP BY Faculty.faculty_MailID HAVING Faculty.faculty_MailID = 'stnle@gmail.com';

SELECT Students.student_Name , Faculty.faculty_ID , Faculty.faculty_Name , Course.course_Name FROM Students
RIGHT OUTER JOIN Faculty
ON Students.student_ID = Faculty.student_ID 
RIGHT OUTER JOIN Course 
ON Students.student_ID = Course.student_ID ;
 


SELECT * FROM Students ;
SELECT * FROM Course ;
SELECT * FROM Faculty ;
