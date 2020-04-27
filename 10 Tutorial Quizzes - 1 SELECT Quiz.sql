-- Tutorial Quizzes - 1. SELECT Quiz
-- URL: https://sqlzoo.net/wiki/SELECT_Quiz

-- 1. Select the code which produces this table
-- 3)
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

-- 2. Pick the result you would obtain from this code
-- 5)
-- Table-E

-- 3. Select the code which shows the countries that end in A or L
-- 5)
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l'

-- 4. Pick the result from the query
-- 3)
-- | name  | length(name) |
-- |-------|--------------|
-- | Italy |            5 |
-- | Malta |            5 |
-- | Spain |            5 |

-- 5. Here are the first few rows of the world table
-- 3)
-- | Andorra | 936 |

-- 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
-- 3)
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

-- 7. Select the code that shows the population density of China, Australia, Nigeria and France
-- 3)
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')