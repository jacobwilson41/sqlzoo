--1. List the films where the yr is 1962 [Show id, title]

SELECT id, title FROM movie
  WHERE yr = 1962
  
--2. Give year of 'Citizen Kane'.

SELECT yr FROM movie
  WHERE title = 'Citizen Kane'
  
--3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr FROM movie
  WHERE title LIKE 'Star Trek%'
  ORDER BY yr
  
--4. What id number does the actor 'Glenn Close' have?

SELECT id FROM actor
  WHERE name = 'Glenn Close'
  
--5. What is the id of the film 'Casablanca'

SELECT id FROM movie
  WHERE title='Casablanca'
  
--6. Obtain the cast list for 'Casablanca'.

SELECT name FROM actor JOIN casting ON id=actorid
  WHERE movieid=27
  
--7. Obtain the cast list for the film 'Alien'

SELECT name FROM actor JOIN casting ON id=actorid
  WHERE movieid=(SELECT id FROM movie WHERE title='Alien')

--8. List the films in which 'Harrison Ford' has appeared

SELECT title FROM movie JOIN casting ON id=movieid
  WHERE actorid = (SELECT id FROM actor WHERE name='Harrison Ford')
  
--9. List the films where 'Harrison Ford' has appeared - but not in the starring role.

SELECT title from movie JOIN casting ON id=movieid
  WHERE actorid=(SELECT id FROM actor WHERE name='Harrison Ford')
  AND ord > 1
  
--10. List the films together with the leading star for all 1962 films.

SELECT title, name FROM movie JOIN casting ON id=movieid
  JOIN actor on actorid=actor.id
  WHERE ord=1 AND yr=1962
  
--11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr, COUNT(title) AS Movies FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT title, name FROM casting JOIN movie ON movieid=movie.id 
	JOIN actor ON actorid=actor.id
		WHERE movie.id IN (
 			SELECT movieid FROM actor JOIN casting ON actorid=id
  				WHERE name='Julie Andrews') 
					AND ord = 1
          
--13. 
