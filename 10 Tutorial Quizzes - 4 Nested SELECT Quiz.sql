-- Tutorial Quizzes - 4. Nested SELECT Quiz
-- URL: https://sqlzoo.net/wiki/Nested_SELECT_Quiz

-- 1. Select the code that shows the name, region and population of the smallest country in each region
-- 3)
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- 2. Select the code that shows the countries belonging to regions with all populations over 50000
-- 2)
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3. Select the code that shows the countries with a less than a third of the population of the countries around it
-- 1)
SELECT name, region FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4. Select the result that would be obtained from the following code
-- 4) Table-D
-- | France  |
-- | Germany |
-- | Russia  |
-- | Turkey  |

-- 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
-- 2)
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
-- 2)
SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
  AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. Select the result that would be obtained from the following code
-- 2) Table-B
-- | Bangladesh |
-- | India      |
-- | Pakistan   |