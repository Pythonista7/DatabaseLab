#
#			Repository Link : https://github.com/Pythonista7/DatabaseLab
#
#-------------------------------------------------------------------------------------------
#
#					LIBRARY DATABASE
#
#-------------------------------------------------------------------------------------------
#	Consider the following schema for a Library Database:
#	BOOK(Book_id, Title, Publisher_Name, Pub_Year)
#	BOOK_AUTHORS(Book_id, Author_Name)
#	PUBLISHER(Name, Address, Phone)
#	BOOK_COPIES(Book_id, Branch_id, No-of_Copies)
#	BOOK_LENDING(Book_id, Branch_id, Card_No, Date_Out, Due_Date)
#	LIBRARY_BRANCH(Branch_id, Branch_Name, Address)
#-------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE BRANCH(
						branch_id INTEGER PRIMARY KEY,
                        address VARCHAR(30),
						branch_name VARCHAR(30)
					);

CREATE TABLE PUBLISHER(
							publ_name VARCHAR(30) PRIMARY KEY,
                            Address VARCHAR(30),
                            Phone VARCHAR(10)
						);

CREATE TABLE BOOK(  book_id INTEGER PRIMARY KEY,
					title VARCHAR(30),
					publ_name VARCHAR(30),
                    publ_year INTEGER,
                    FOREIGN KEY(publ_name) REFERENCES PUBLISHER(publ_name) ON DELETE CASCADE ON UPDATE CASCADE
                    );

CREATE TABLE AUTHORS(	book_id INTEGER PRIMARY KEY,
						author_name VARCHAR(30),
						FOREIGN KEY(book_id) REFERENCES BOOK(book_id) ON DELETE CASCADE ON UPDATE CASCADE                       
                        );



CREATE TABLE BOOK_COPIES(
							book_id INTEGER ,
                            branch_id INTEGER ,
                            copies INTEGER,
                            PRIMARY KEY(book_id,branch_id),
                            FOREIGN KEY(book_id) REFERENCES BOOK(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
							FOREIGN KEY(branch_id) REFERENCES BRANCH(branch_id) ON DELETE CASCADE ON UPDATE CASCADE
                        );

CREATE TABLE LENDING(
						book_id INTEGER ,
                        branch_id INTEGER ,
                        card_no INTEGER,
                        date_out DATE,
						due_date DATE,
						PRIMARY KEY(book_id,branch_id,card_no),
                        FOREIGN KEY(book_id) REFERENCES BOOK(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY(branch_id) REFERENCES BRANCH(branch_id) ON DELETE CASCADE ON UPDATE CASCADE
                    );

#INSERT VALUES INTO THE TABLES
INSERT INTO BRANCH VALUES
						(11,"Aplha","HSR Layout"),
                        (22,"Beta","Indiranagar"),
                        (33,"Charlie","Koramangala"),
                        (44,"Delta","MG Road"),
                        (55,"Echo","Brigade Road")
						;	
INSERT INTO PUBLISHER VALUES
						("Hachette","Bangalore","12312"),
                        ("Harper","Chennai","65484"),
                        ("McMillian","Delhi","89982"),
                        ("Penguine","Hyd","846512"),
                        ("Scholastic","Mumbai","465416")
						;	
INSERT INTO BOOK VALUES
						(1,"Shining","Hachette",1977),
                        (2,"IT","Hachette",1986),
                        (3,"Split Second","Scholastic",2003),
                        (4,"Inferno","Harper",2016),
                        (5,"Nauralist","Penguine",2013),
                        (6,"WW2","MCMillian",2016)
                        ;

INSERT INTO AUTHORS VALUES
						(1,"Stephen King"),
                        (2,"Stephen King"),
                        (3,"Doughlas Richards"),
                        (4,"Dan Brown"),
                        (5,"Andrew Mayne"),
                        (6,"Max Brooks")
                        ;
                                            
                        
INSERT INTO BOOK_COPIES VALUES
						(1,11,12),
                        (2,55,6),
                        (3,22,3),
                        (4,33,15),
                        (5,44,4),
                        (6,11,8)
                        ;
                        
INSERT INTO LENDING VALUES
						(1,11,111,'2017-01-20','2017-01-27'),
						(2,55,111,'2017-02-13','2017-02-22'),
                        (3,22,111,'2017-03-01','2017-03-20'),
                        (4,33,111,'2017-04-08','2017-04-25'),
                        (4,33,444,'2016-10-15','2016-10-22'),
                        (5,44,222,'2018-04-22','2018-10-02'),
                        (6,11,333,'2019-01-03','2019-01-10')
                        ;