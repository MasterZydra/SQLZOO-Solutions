-- SELECT within SELECT --
-- URL: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- 1. Bigger than Russia
-- List each country name where the population is larger than that of 'Russia'.
SELECT name
FROM   world
WHERE  population > (SELECT population
                     FROM   world
                     WHERE  name = 'Russia');

-- 2. Richer than UK
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM   world
WHERE  gdp / population > (SELECT gdp / population
                           FROM   world
                           WHERE  name = 'United Kingdom')
       AND continent = 'Europe';

-- 3. Neighbours of Argentina and Australia
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name,
       continent
FROM   world
WHERE  continent IN (SELECT continent
                     FROM   world
                     WHERE  name = 'Argentina'
                             OR name = 'Australia')
ORDER  BY name;

-- 4. Between Canada and Poland
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name,
       population
FROM   world
WHERE  population > (SELECT population
                     FROM   world
                     WHERE  name = 'Canada')
       AND population < (SELECT population
                         FROM   world
                         WHERE  name = 'Poland');

-- 5. Percentages of Germany
-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name,
       Concat(Round(population / (SELECT population
                                  FROM   world
                                  WHERE  name = 'Germany') * 100, 0), '%')
FROM   world
WHERE  continent = 'Europe';

-- 6. Bigger than every country in Europe
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM   world
WHERE  gdp > ALL (SELECT gdp
                  FROM   world
                  WHERE  gdp > 0
                         AND continent = 'Europe');

-- 7. Largest in each continent
-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent,
       name,
       area
FROM   world x
WHERE  area >= ALL (SELECT area
                    FROM   world y
                    WHERE  y.continent = x.continent
                           AND area > 0);

-- 8. First country of each continent (alphabetically)
-- List each continent and the name of the country that comes first alphabetically.
SELECT continent,
       name
FROM   world w
WHERE  name <= ALL (SELECT name
                    FROM   world x
                    WHERE  x.continent = w.continent);

-- 9. Difficult Questions That Utilize Techniques Not Covered In Prior Sections
-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name,
       continent,
       population
FROM   world
WHERE  continent NOT IN (SELECT DISTINCT continent
                         FROM   world
                         WHERE  population >= 25000000);

-- 10.
-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name,
       continent
FROM   world a
WHERE  population > ALL (SELECT 3 * population
                         FROM   world b
                         WHERE  b.continent = a.continent
                                AND a.name != b.name);