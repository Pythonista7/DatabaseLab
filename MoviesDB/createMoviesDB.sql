#
#			Repository Link : https://github.com/Pythonista7/DatabaseLab
#
#-------------------------------------------------------------------------------------------
#
#					MOVIES DATABASE
#

#-------------------------------------------------------------------------------------------
#	ACTOR(Act_id, Act_Name, Act_Gender)
#	DIRECTOR(Dir_id, Dir_Name, Dir_Phone)
#	MOVIES(Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id)
#	MOVIE_CAST(Act_id, Mov_id, Role)
#	RATING(Mov_id, Rev_Stars)	
#-------------------------------------------------------------------------------------------

#Uncomment below line if you wish to re-create the database or encountered errors during creation
#DROP DATABASE IF EXISTS OrdersDB; # NOTE THIS WILL DELETE THE DATABASE and CREATE A EMPTY NEW DB.

#CREATE DATABASE MoviesDB;
USE MoviesDB;

#DELETE OLD TABLES IF THEY EXIST
DROP TABLE IF EXISTS MOVIE_CAST;
DROP TABLE IF EXISTS RATING;
DROP TABLE IF EXISTS MOVIES;
DROP TABLE IF EXISTS DIRECTOR;
DROP TABLE IF EXISTS ACTOR;


CREATE TABLE ACTOR(
						act_id INTEGER PRIMARY KEY,
						act_name VARCHAR(20),
                        act_gender VARCHAR(20)
				);

CREATE TABLE DIRECTOR(
						dir_id INTEGER PRIMARY KEY,
                        dir_name VARCHAR(20),
                        dir_ph VARCHAR(20)
					);

CREATE TABLE MOVIES(
						mov_id INTEGER PRIMARY KEY,
                        mov_title VARCHAR(30),
                        mov_year INTEGER,
                        mov_lang VARCHAR(20),
                        dir_id INTEGER,
                        FOREIGN KEY(dir_id) REFERENCES DIRECTOR(dir_id)
					);
                        
CREATE TABLE MOVIE_CAST(
						act_id INTEGER,
                        mov_id INTEGER,
                        role VARCHAR(20),
                        PRIMARY KEY(act_id,mov_id),
                        FOREIGN KEY(act_id) REFERENCES ACTOR(act_id),
                        FOREIGN KEY(mov_id) REFERENCES MOVIES(mov_id)
					);
                        
CREATE TABLE RATING(
						mov_id INTEGER PRIMARY KEY,
                        rev_stars INTEGER,
						FOREIGN KEY(mov_id) REFERENCES MOVIES(mov_id)
				);
                        
#Insert Values into the table
INSERT INTO ACTOR VALUES(301,"Neha","FEMALE"),
						(302,"Mukul","MALE"),
                        (303,"Raksha","FEMALE"),
                        (304,"Rifas","MALE"),
						(305,"Shruthi","FEMALE")
                        ;

INSERT INTO DIRECTOR VALUES(10,"Ashika","78986578"),
						(11,"Hitchcock","45684566"),
                        (12,"Sapna","87912354"),
                        (13,"Steven Spielberg","67943223"),
						(14,"Navya","897212353")
                        ;

INSERT INTO MOVIES VALUES
						(1001,"Insergent",2017,"ENG",10),
						(1002,"Divergent",2015,"ENG",10),
						(1003,"F&F7",2008,"ENG",11),
						(1004,"War Horse",2011,"ENG",13),
						(1005,"Baaghi",2009,"HINDI",12)
                        ;
                        
INSERT INTO MOVIE_CAST VALUES
						(301,1001,"LEAD"),
                        (301,1002,"LEAD"),
                        (303,1002,"GUEST"),
                        (303,1003,"LEAD"),
                        (304,1004,"LEAD")
                        ;
                        
INSERT INTO RATING VALUES
						(1001,4),
                        (1002,2),
                        (1003,5),
                        (1004,4),
                        (1005,2)
                        ;
                        