use MoviesDB;

#Query 1. List the titles of all movies directed by ‘Hitchcock’.
SELECT mov_title 
FROM MOVIES M,DIRECTOR D
WHERE M.dir_id=D.dir_id AND D.dir_name="Hitchcock";


#QUERY 2.Find the movie names where one or more actors acted in two or more movies.
SELECT MM.mov_title
FROM MOVIE_CAST M,MOVIES MM
WHERE M.mov_id=MM.mov_id    #JOIN M and MM on mov_id col
	  AND
      #Select all actors who have acted in atleast 1 movie
	  act_id IN(
				SELECT act_id
				FROM MOVIE_CAST
				GROUP BY act_id
				HAVING COUNT(act_id)>0
				)
#Group all the movies in which actors(acted in 1+ movies) have acted and no of such movies is 2 or more
GROUP BY mov_title
HAVING COUNT(*)>1;

#QUERY3 List all actors who acted in a movie before 2000 and also in a movie after 2015
#		(use JOIN operation).
SELECT DISTINCT A.act_name,M.mov_title,M.mov_year
FROM ACTOR A ,MOVIES M ,MOVIE_CAST C 
WHERE C.act_id=A.act_id AND C.mov_id=M.mov_id AND M.mov_year NOT BETWEEN 2000 AND 2015;

#QUERY4 
#	Find the title of movies and number of stars for each movie that has at least one
#	rating and find the highest number of stars that movie received. Sort the result
#	by movie title.
SELECT mov_title,rev_stars,MAX(rev_stars)
FROM RATING R,MOVIES M
WHERE R.mov_id = M.mov_id
GROUP BY R.mov_id
HAVING count(*)>0
ORDER BY mov_title;
	  
#QUERY 5. Update rating of all movies directed by ‘Steven Spielberg’ to 5
UPDATE RATING R,MOVIES M,DIRECTOR D
SET rev_stars=5
WHERE R.mov_id = M.mov_id AND D.dir_id=M.dir_id
	  AND D.dir_name="Steven Spielberg";