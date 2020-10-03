-- POSTGRE / MYSQL

-- Postgre only: To use this file directly : \i C:/Users/cscharff/Desktop/viewpostgre.sql 

-- MySQL only: To use this file directly : source C:/Users/cscharff/Desktop/viewpostgre.sql

-- For DROP you may have to use drop cascade 

-- DROP TABLE Student;

-- DROP TABLE Transcript;

-- DROP VIEW CoursesTaken;


CREATE TABLE Transcript (StudId INTEGER, CrsCode CHAR(10), Semester CHAR(15), Grade CHAR(2));

ALTER TABLE Transcript ADD CONSTRAINT pk_transcript PRIMARY KEY (StudId, CrsCode, Semester);

INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (1, 'U1', 'F2020', 'A+');
INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (2, 'U2', 'F2019', 'A');
INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (3, 'U3', 'S2019', 'F');

SELECT * FROM Transcript;


CREATE VIEW CoursesTaken (StudId, CrsCode, Semester) AS SELECT  T.StudId, T.CrsCode, T.Semester FROM Transcript T;

SELECT * FROM CoursesTaken;


-- QUESTION 1: What happens to Transcript and CourseTaken if we insert a row in Transcript ?

INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (3, 'U4', 'S2018', 'B');

-- Table and view are updated with a new row


-- QUESTION 2: What happens to Transcript and CourseTaken if we insert a row in CoursesTaken ?

INSERT INTO CoursesTaken (StudId, CrsCode, Semester) VALUES (5, 'U5', 'S2020');

-- Table and view updated with  new row. In Transcript the grade is null

-- CAREFUL!!! MySQL and Postgre show NULL differently

-- MySQL to see if the value is null in Transcript. NULL appears clearly
-- SELECT * FROM Transcript WHERE grade = NULL

-- Postgre to see if the value is null in Transcript. In Transcript we see empty but it is NULL
-- SELECT * FROM Transcript WHERE grade is NULL


-- QUESTION 3: What happens to Transcript and CourseTaken if we delete a row in Transcript ?

DELETE FROM Transcript WHERE StudId = 2;

-- Table and view are updated. The rows with StudI 2 are deleted from the 2 tables


-- QUESTION 4: What happens to Transcript and CourseTaken if we delete a row in CoursesTaken ?

DELETE FROM coursestaken WHERE studid = 1;

-- Table and view are updated. The rows with StudId 1 are deleted from th 2 tables


