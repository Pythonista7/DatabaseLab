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
use CollegeDB;

# QUERY1 List all the student details studying in fourth semester ‘C’ section.
SELECT * 
FROM CLASS C,SEMSEC SS,STUDENT S
WHERE C.ssid=SS.ssid AND S.usn=C.usn
	AND SS.sec="C"
    AND SS.sem=4;

# QUERY2 
#		Compute the total number of male and female students in each semester and in
#		each section.
SELECT SS.sem,SS.sec,S.gender,COUNT(gender) 
FROM STUDENT S,SEMSEC SS,CLASS C
WHERE S.usn=C.usn AND SS.ssid=C.ssid
GROUP BY S.gender,SS.sem,SS.sec;

# QUERY3
#	Create a view of Test1 marks of student USN '3' in all subjects.
DROP VIEW IF EXISTS T1Mrks;
CREATE VIEW T1Mrks AS
SELECT I.test1,I.subcode 
FROM IAMARKS I,SUBJECT S
WHERE usn=3 AND I.subcode=S.subcode;
SELECT * FROM T1Mrks;

# QUERY4
#	Calculate the FinalIA (average of best two test marks) and update the
#	corresponding table for all students
UPDATE IAMARKS 
SET final=((test1+test2+test3) - LEAST(test1,test2,test3))/2;

# QUERY5
# Categorize students based on the following criterion:
# If FinalIA = 17 to 20 then CAT = ‘Outstanding’
# If FinalIA = 12 to 16 then CAT = ‘Average’
# If FinalIA< 12 then CAT = ‘Weak’
# From students of 4th sem C and D section

SELECT I.usn,I.subcode,I.final,"OUTSTANDING" AS CATEGORY
FROM STUDENT S,SEMSEC SS,IAMARKS I
WHERE I.usn=S.usn AND I.ssid=SS.ssid 
	AND SS.sem=4 AND SS.sec IN ("C","D")
    AND I.final between 40 and 50

UNION

SELECT I.usn,I.subcode,I.final,"AVERAGE" AS CATEGORY
FROM STUDENT S,SEMSEC SS,IAMARKS I
WHERE I.usn=S.usn AND I.ssid=SS.ssid 
	AND SS.sem=4 AND SS.sec IN ("C","D")
    AND I.final between 20 and 39

UNION 

SELECT I.usn,I.subcode,I.final,"WEAK" AS CATEGORY
FROM STUDENT S,SEMSEC SS,IAMARKS I
WHERE I.usn=S.usn AND I.ssid=SS.ssid 
	AND SS.sem=4 AND SS.sec IN ("C","D")
    AND I.final<20

;
