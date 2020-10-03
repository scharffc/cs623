-- MYSQL

-- DROP TABLE Student;

-- DROP TABLE Transcript;


-- MySQL only: To use this file directly : source C:/Users/cscharff/Desktop/fkdeletecascademysql.sql


CREATE TABLE Student(StudId INTEGER, FirstName CHAR(20), LastName CHAR(20));

ALTER TABLE Student ADD CONSTRAINT pk_student PRIMARY KEY (StudId);

INSERT INTO Student VALUES (1, 'Juan', 'Costa'); -- NOTE THAT YOU WILL NEED TO CHANGE THE QUOTE AS POWERPOINT CHANGES THEM AUTOMATICALLY
INSERT INTO Student VALUES (2, 'Virginia', 'West');
INSERT INTO Student VALUES (3, 'Fatima', 'Khan');


CREATE TABLE Transcript (StudId INTEGER, CrsCode CHAR(10), Semester CHAR(15), Grade CHAR(2));

ALTER TABLE Transcript ADD CONSTRAINT pk_transcript PRIMARY KEY (StudId, CrsCode, Semester);

INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (1, 'U1', 'F2020', 'A+');
INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (2, 'U2', 'F2019', 'A');
INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (3, 'U3', 'S2019', 'F');

ALTER TABLE Transcript ADD CONSTRAINT fk_transcript_studid_student  FOREIGN KEY (StudId) REFERENCES Student(StudId) ON DELETE CASCADE; 


-- Question 1

-- What happens if you do INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (8, 'U8', 'F2020', 'A+');?
-- Violation of the FK 
-- INSERT INTO Transcript(StudId, CrsCode, Semester, Grade) VALUES (8, 'U8', 'F2020', 'A+');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
-- (`christelle`.`transcript`, CONSTRAINT `fk_transcript_studid_student` FOREIGN KEY (`StudId`) REFERENCES `student` 
-- (`StudId`) ON DELETE CASCADE)

-- Question 2

-- What happens if you do  DELETE FROM Student WHERE StudId = 1; ?

DELETE FROM Student WHERE StudId = 1;

-- StudId 1 is deleted in Student and Transcript

