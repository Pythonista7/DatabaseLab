#
#			Repository Link : 
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

#Uncomment below line if you wish to re-create the database or encountered errors during creation
#DROP DATABASE IF EXISTS OrdersDB; # NOTE THIS WILL DELETE THE DATABASE and CREATE A EMPTY NEW DB.

#CREATE DATABASE OrdersDB;
USE OrdersDB;

#DELETE OLD TABLES IF THEY EXIST
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS SALESMAN;

# TABLE CREATION
CREATE TABLE SALESMAN( 
						salesman_id INTEGER PRIMARY KEY,
                        saleman_name VARCHAR(30),
                        city 		 VARCHAR(30),
                        commission   VARCHAR(30)
                        );

CREATE TABLE CUSTOMER(
						cust_id INTEGER PRIMARY KEY,
						cust_name VARCHAR(30),
                        city 	  VARCHAR(30),
                        grade 	  INTEGER,
                        salesman_id INTEGER,
                        FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id) ON DELETE SET NULL
					);

CREATE TABLE ORDERS(
						order_no INTEGER PRIMARY KEY,
                        purchase_amt INTEGER,
                        order_date DATE,
                        cust_id INTEGER,
                        salesman_id INTEGER,
                        FOREIGN KEY (cust_id) REFERENCES CUSTOMER(cust_id) ON DELETE SET NULL
					);


# INSERT VALUES INTO THE TUPLES

INSERT INTO SALESMAN VALUES
							(1000,"Navaneeth","Bangalore","25%"),
                            (2000,"Sumukh","Bangalore","20%"),
                            (3000,"Aditya","Mumbai","15%"),
                            (4000,"Mithun","Delhi","20%"),
                            (5000,"Ray","Chennai","15%")
							;
                            
INSERT INTO CUSTOMER VALUES
							(10,"Navya","Bangalore",100,1000),
                            (11,"Lisa","Mangalore",300,1000),
                            (12,"Shaw","Mysuru",400,2000),
                            (13,"Raksha","Bangalore",200,2000),
                            (14,"Ishan","Bangalore",400,3000)
							;
                            
INSERT INTO ORDERS VALUES
						(50,5000,'2019-3-18',10,1000),
                        (51,4500,'2019-1-20',10,2000),
                        (52,1000,'2019-6-24',13,2000),
                        (53,3500,'2019-8-04',14,3000),
                        (54,550,'2019-1-20',12,2000)
					;