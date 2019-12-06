#
#			Repository Link : https://github.com/Pythonista7/DatabaseLab
#
#-------------------------------------------------------------------------------------------
#
#					COLLEGE DATABASE
#
#-------------------------------------------------------------------------------------------
#
# Consider the schema for College Database:
# STUDENT(USN, SName, Address, Phone, Gender)
# SEMSEC(SSID, Sem, Sec)
# CLASS(USN, SSID)
# SUBJECT(Subcode, Title, Sem, Credits)
# IAMARKS(USN, Subcode, SSID, Test1, Test2, Test3, FinalIA)
#-------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS CollegeDB;
CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE STUDENT(
				usn INTEGER PRIMARY KEY,
                sname VARCHAR(25),
                addr VARCHAR(25),
                phno VARCHAR(25),
                gender varchar(25)
                );

CREATE TABLE SEMSEC(
				ssid INTEGER PRIMARY KEY,
                sem INTEGER,
                sec VARCHAR(25)
			);

CREATE TABLE CLASS(
				usn INTEGER PRIMARY KEY,
                ssid INTEGER,
                FOREIGN KEY(usn) REFERENCES STUDENT(usn) ON UPDATE CASCADE ON DELETE CASCADE,
                FOREIGN KEY(ssid) REFERENCES SEMSEC(ssid) ON UPDATE CASCADE ON DELETE CASCADE
			);

CREATE TABLE SUBJECT(
				subcode VARCHAR(25) PRIMARY KEY,
                title VARCHAR(25) ,
                sem INTEGER,
                credits INTEGER
			);

CREATE TABLE IAMARKS(
				usn INTEGER ,
                subcode VARCHAR(25),
                ssid INTEGER,
                test1 INTEGER,
                test2 INTEGER,
                test3 INTEGER,
                final INTEGER,
                PRIMARY KEY(usn,ssid,subcode),
                FOREIGN KEY(usn) REFERENCES STUDENT(usn),
                FOREIGN KEY(subcode) REFERENCES SUBJECT(subcode),
                FOREIGN KEY(ssid) REFERENCES SEMSEC(ssid)
			);

INSERT INTO STUDENT VALUES(1,"Jack","Indiranagr","3453434","M"),
				(2,"Sansa","Indiranagr","8756454","F"),
				(3,"Jon","Banaswadi","8598768","M"),
                (4,"Lisa","KR Pura","9789219","F"),
                (5,"Ned","Whitefield","7645486","M")
			;

INSERT INTO SEMSEC VALUES(1,4,"C"),
				(2,4,"C"),
				(3,4,"C"),
                (4,5,"A"),
                (5,3,"D"),
                (6,4,"C")
			;
INSERT INTO CLASS VALUES(1,4),
				(2,2),
                (3,3),
                (4,5),
                (5,6)
			;

INSERT INTO SUBJECT VALUES("17cs42","SE",4,4),
				("17cs51","DBMS",5,4),
                ("17cs53",".NET",5,2),
                ("17mat31","M3",3,4),
                ("17mat21","M2",2,4)
			;

INSERT INTO IAMARKS VALUES(1,"17cs51",3,45,48,34,NULL),
				(2,"17cs51",2,37,49,23,NULL),
                (3,"17cs53",2,36,28,15,NULL),
				(3,"17cs42",4,22,37,34,NULL),
                (5,"17mat31",5,25,32,25,NULL)
            ;