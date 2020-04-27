-- Tutorial Quizzes - 2. BBC QUIZ
-- URL: https://sqlzoo.net/wiki/BBC_QUIZ

-- 1. Select the code which gives the name of countries beginning with U
-- 5)
SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom?
-- 4)
SELECT population
FROM world
WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France
-- 2)
-- 'name' should be name

-- 4. Select the result that would be obtained from the following code
-- 4)
-- | Nauru | 990 |

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia
-- 2)
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows
-- 4)
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code
-- 3)
-- | Brazil  |
-- |---------|
-- |Colombia |