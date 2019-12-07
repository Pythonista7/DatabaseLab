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

use CompanyDB;

# QUERY1
# Make a list of all project numbers for projects that involve an employee whose
# last name is ‘Scott’, either as a worker or as a manager of the department that
# controls the project.

#Select all Project numbers which have employees whose name is Raj.
SELECT W.pno,E.ename
FROM EMPLOYEE E,WORKS_ON W
WHERE E.ssn=W.ssn AND E.ename LIKE "Raj"

UNION # UNION BOTH THE QUERIES 

#Select all the Project Numbers which have the project-manager name as Raj
SELECT W.pno,E.ename
FROM DEPARTMENT D,EMPLOYEE E,WORKS_ON W
WHERE D.mgrssn=W.ssn AND E.ename LIKE "Raj";

# QUERY2
# Show the resulting salaries if every employee working on the ‘IoT’ project is
# given a 10 percent raise.
SELECT E.ename,1.1*E.salary
FROM PROJECT P, WORKS_ON W,EMPLOYEE E
WHERE P.pno=W.pno AND E.ssn=W.ssn
		AND P.pname="IoT";

# QUERY3
# Find the sum of the salaries of all employees of the ‘Accounts’ department, aswell as the maximum salary, the minimum salary, and the average salary in
# this department
SELECT COUNT(*),MAX(E.salary),MIN(E.salary),SUM(E.salary)
FROM EMPLOYEE E ,DEPARTMENT D
WHERE E.dno=D.dno AND D.dname="Accounts";

# QUERY4
# Retrieve the name of each employee who works on all the projects
# controlled by department number 5 (use NOT EXISTS operator).
SELECT ename
FROM EMPLOYEE E
WHERE NOT EXISTS
(SELECT pno FROM PROJECT
WHERE dno=5 AND 
pno NOT IN (SELECT pno FROM WORKS_ON W WHERE E.ssn=W.ssn)
);

# QUERY5
# For each department that has more than two employees, retrieve the
# department number and the number of its employees who are making more
# than Rs. 6,00,000
SELECT E.dno,COUNT(*)
FROM  EMPLOYEE E
WHERE E.salary>60000
GROUP BY dno
HAVING COUNT(*)>2 
;