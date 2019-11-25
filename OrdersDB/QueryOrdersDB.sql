#
#			Repository Link : https://github.com/Pythonista7/DatabaseLab
#
#-------------------------------------------------------------------------------------------
#
#					ORDERS DATABASE
#
#-------------------------------------------------------------------------------------------
#	Consider the following schema for Order Database:
#	SALESMAN(Salesman_id, Name, City, Commission)
#	CUSTOMER(Customer_id, Cust_Name, City, Grade, Salesman_id)
#	ORDERS(Ord_No, Purchase_Amt, Ord_Date, Customer_id, Salesman_id)
#-------------------------------------------------------------------------------------------


use OrdersDB;

#Observe contents of all tables
#SELECT * FROM CUSTOMER;
#SELECT * FROM ORDERS;
#SELECT * FROM SALESMAN;

#QUERY 1. Count the customers with grades above Bangalore’s average.
SELECT  grade,COUNT(cust_id)
FROM CUSTOMER
GROUP BY grade
HAVING grade > (SELECT AVG(grade)
				FROM CUSTOMER
                WHERE city="Bangalore"
				);


#QUERY 2. Find the name and numbers of all salesman who had more than one customer.
SELECT S.saleman_name,S.salesman_id 
FROM SALESMAN S,CUSTOMER C
WHERE S.salesman_id=C.salesman_id 
GROUP BY S.salesman_id
HAVING COUNT(C.cust_id)>1;



#QUERY 3. List all the salesman and indicate those who have and don’t have customers in
#		  their cities (Use UNION operation.)
SELECT S.saleman_name , S.salesman_id , "SAME" as city
FROM SALESMAN S,CUSTOMER C
WHERE S.city=C.city
UNION
SELECT S.saleman_name,S.salesman_id,"DIFFERENT" as city
FROM SALESMAN S
WHERE NOT city IN (SELECT city
				   FROM CUSTOMER
                   );

#QUERY 4. Create a view that finds the salesman who has the customer with the highest
#		  order of a day.

DROP VIEW IF EXISTS top_order;

CREATE VIEW top_order AS
SELECT S.salesman_id,S.saleman_name,O.order_date,O.purchase_amt
FROM SALESMAN S,ORDERS O 
WHERE S.salesman_id=O.salesman_id
	  AND
	  purchase_amt in (SELECT MAX(purchase_amt)
						FROM ORDERS
                        GROUP BY (order_date)
					);
#call the view
SELECT * FROM top_order;



#QUERY5:	Demonstrate the DELETE operation by removing salesman with id 1000. All
#			his orders must also be deleted.
DELETE FROM SALESMAN
WHERE salesman_id=1000;

#Check all tables to observer changes of the DELETE operation from Query5
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
SELECT * FROM SALESMAN;