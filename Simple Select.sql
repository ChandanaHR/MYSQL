-- INIT database
CREATE TABLE Student (
  Name Varchar(100),
  USN Varchar(20),
  Age int,
  Degree Varchar(20),
  Branch Varchar(20),
  );

INSERT INTO Student(Name,USN,Age,Degree,Branch) VALUES ('Chandana','19cs020',24,'BE','CSE');
INSERT INTO Student(Name,USN,Age,Degree,Branch) VALUES ('Asha','20cs022',23,'BE','ECE');
INSERT INTO Student(Name,USN,Age,Degree,Branch) VALUES ('Ravi','21cs018',26,'BE','ISE');
INSERT INTO Student(Name,USN,Age,Degree,Branch) VALUES ('Krishna','22cs019',30,'BCA','Computer');
INSERT INTO Student(Name,USN,Age,Degree,Branch) VALUES ('Chandana','24cs001',28,'BSC','Physics');

Select * From Student;
Select Name From Student;

Output
Name USN Age Degree Branch
---------------------------------------------------------------------------------------------------- -------------------- ----------- -------------------- --------------------
Chandana 19cs020 24 BE CSE
Asha 20cs022 23 BE ECE
Ravi 21cs018 26 BE ISE
Krishna 22cs019 30 BCA Computer
Chandana 24cs001 28 BSC Physics
Name
----------------------------------------------------------------------------------------------------
Chandana
Asha
Ravi
Krishna
Chandana
