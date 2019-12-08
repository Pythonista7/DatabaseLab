#
#			Repository Link : https://github.com/Pythonista7/DatabaseLab
#
#-------------------------------------------------------------------------------------------
#
#					COMPANY DATABASE
#
#-------------------------------------------------------------------------------------------
# Consider the schema for Company Database:
# EMPLOYEE(SSN, Name, Address, Sex, Salary, SuperSSN, DNo)
# DEPARTMENT(DNo, DName, MgrSSN, MgrStartDate)
# DLOCATION(DNo,DLoc)
# PROJECT(PNo, PName, PLocation, DNo)
# WORKS_ON(SSN, PNo, Hours)
#-------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE DEPARTMENT(
dno INTEGER PRIMARY KEY,
dname VARCHAR(25),
mgrstartdate DATE
);

CREATE TABLE EMPLOYEE(ssn INTEGER PRIMARY KEY,
ename VARCHAR(25),
addr VARCHAR(25),
sex VARCHAR(25),
salary INTEGER,
superssn INTEGER,
dno INTEGER,
FOREIGN KEY(superssn) REFERENCES EMPLOYEE(ssn),
FOREIGN KEY(dno) REFERENCES DEPARTMENT(dno)
);

ALTER TABLE DEPARTMENT ADD COLUMN mgrssn INTEGER ;
ALTER TABLE DEPARTMENT ADD CONSTRAINT FOREIGN KEY(mgrssn) REFERENCES EMPLOYEE(ssn);


CREATE TABLE DLOCATION(dno INTEGER,
dloc VARCHAR(25),
PRIMARY KEY(dno,dloc),
FOREIGN KEY(dno) REFERENCES DEPARTMENT(dno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PROJECT(pno INTEGER PRIMARY KEY,
pname VARCHAR(25),
plocation VARCHAR(25),
dno INTEGER,
FOREIGN KEY(dno) REFERENCES DEPARTMENT(dno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE WORKS_ON(ssn INTEGER,
pno INTEGER,
hours INTEGER,
PRIMARY KEY(ssn,pno),
FOREIGN KEY(ssn) REFERENCES EMPLOYEE(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(pno) REFERENCES PROJECT(pno) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EMPLOYEE(ssn,ename,addr,sex,salary) VALUES
(1111,"Raj","Bangalore","M",70000),
(2222,"Diya","Mysuru","F",40000),
(3333,"Deeksha","Tumkur","F",80000),
(4444,"Rajesh","Tumkur","M",65000),
(5555,"Vamshi","Bangalore","M",100000),
(6666,"John","London","M",220000),
(7777,"Surya","Chennai","M",30000),
(8888,"Ramya","Chennai","F",40000),
(9999,"Geetha","Tumkur","F",80000),
(9900,"Rahul","Tumkur","M",65000)
;

INSERT INTO DEPARTMENT VALUES
(1,"Research",'2012-08-01',1111),
(2,"Accounts",'2015-04-13',2222),
(3,"AI",'2018-03-13',3333),
(4,"Networks",'2016-01-23',1111),
(5,"Bigdata",'2016-11-09',6666)
;

UPDATE EMPLOYEE
SET dno=1 , superssn=NULL
WHERE ssn=1111;

UPDATE EMPLOYEE
SET dno=2 ,superssn=1111
WHERE ssn=2222;

UPDATE EMPLOYEE
SET dno=3 ,superssn=NULL
WHERE ssn=3333;

UPDATE EMPLOYEE
SET dno=3 , superssn=3333
WHERE ssn=4444;

UPDATE EMPLOYEE
SET dno=3 ,superssn=3333
WHERE ssn=5555;

UPDATE EMPLOYEE
SET dno=5 ,superssn=4444
WHERE ssn=6666;

UPDATE EMPLOYEE
SET dno=2 ,superssn=2222
WHERE ssn=7777;

UPDATE EMPLOYEE
SET dno=3 ,superssn=3333
WHERE ssn=8888;

UPDATE EMPLOYEE
SET dno=3 ,superssn=NULL
WHERE ssn=9999;

UPDATE EMPLOYEE
SET dno=3 ,superssn=3333
WHERE ssn=9900;


INSERT INTO DLOCATION VALUES
(1,"Mysuru"),
(1,"Tumkur"),
(2,"Bangalore"),
(3,"Chennai"),
(4,"Delhi"),
(5,"Bangalore")
;

INSERT INTO PROJECT VALUES
(111,"IoT","Chennai",3),
(222,"ML","Chennai",3),
(333,"Security","Delhi",4),
(444,"DataScience","Bangalore",5),
(555,"Cloud","Delhi",1)
;

INSERT INTO WORKS_ON VALUES
(1111,222,5),
(2222,111,9),
(3333,111,6),
(4444,111,7),
(4444,444,8),
(5555,222,2),
(6666,111,2),
(6666,333,8)
;
