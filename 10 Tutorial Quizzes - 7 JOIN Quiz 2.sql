-- Tutorial Quizzes - 7. JOIN Quiz 2
-- URL: https://sqlzoo.net/wiki/JOIN_Quiz_2

-- 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
-- 3)
SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

-- 2. Select the correct example of JOINing three tables
-- 5)
SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid

-- 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
-- 3)
SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC

-- 4. Select the result that would be obtained from the following code
-- 2) Table-B
-- | "Crocodile" Dundee      |
-- | Crocodile Dundee in ... |
-- | Flipper                 |
-- | Lightning Jack          |

-- 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
-- 4)
SELECT name
FROM movie JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6. There are two sensible ways to connect movie and actor.
-- 3)
-- o link the director column in movies with the primary key in actor
-- o connect the primary keys of movie and actor via the casting table

-- 7. Select the result that would be obtained from the following code
-- 2) Table-B
-- | A Bronx Tale         | 1993 |
-- | Bang the Drum Slowly | 1973 |
-- | Limitless            | 2011 |