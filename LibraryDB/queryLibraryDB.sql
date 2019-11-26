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

USE LibraryDB;

#QUERY 1. Retrieve details of all books in the library – id, title, name of publisher,
#		  authors, number of copies in each branch, etc.
SELECT B.book_id,B.title,B.publ_name,A.author_name,C.branch_id,C.copies
FROM BOOK B,AUTHORS A,BOOK_COPIES C
WHERE B.book_id=C.book_id AND A.book_id=B.book_id
GROUP BY C.branch_id,book_id;

#QUERY2
#	Get the particulars of borrowers who have borrowed more than 3 books, but
#	from Jan 2017 to Jun 2017.
SELECT card_no
FROM LENDING 
WHERE date_out BETWEEN '2017-01-01' AND '2017-06-30'
GROUP BY card_no
HAVING count(*)>3;

#QUERY 3
#	Delete a book in BOOK table. Update the contents of other tables to reflect
#	this data manipulation operation.
#DELETE FROM BOOK WHERE book_id=2;#NOTE IF THIS ISNT WORKING CHECK FOREIGN KEY CASCADES IN TABLE CREATION PART


#QUERY4
#	Partition the BOOK table based on year of publication. Demonstrate its
#	working with a simple query.
DROP VIEW Publ_Partition;

CREATE VIEW Publ_Partition AS 
SELECT publ_year
FROM BOOK;

SELECT * FROM Publ_Partition;

#QUERY 5
#	Create a view of all books and its number of copies that are currently available
#	in the Library.
DROP VIEW tot_stock;

CREATE VIEW tot_stock AS
SELECT B.book_id,SUM(copies) AS S
FROM BOOK_COPIES B
GROUP BY book_id;
SELECT * FROM tot_stock;

DROP VIEW books_borrowed;
CREATE VIEW books_borrowed AS
SELECT book_id,count(*) AS S
FROM LENDING 
GROUP BY book_id;
SELECT *  FROM books_borrowed;

DROP VIEW books_borrowed;
CREATE VIEW books_available AS
SELECT T.book_id,T.S-B.S AS NO_OF_COPIES_AVAILABLE
FROM tot_stock T LEFT OUTER JOIN books_borrowed B ON T.book_id=B.book_id;

SELECT * FROM books_available;

