-- Using NULL --
-- URL: https://sqlzoo.net/wiki/Using_Null

-- NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN

-- 1.
-- List the teachers who have NULL for their department.
SELECT name
FROM   teacher
WHERE  dept IS NULL;

-- 2.
-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name,
       dept.name
FROM   teacher
       INNER JOIN dept
               ON ( teacher.dept = dept.id );

-- 3.
-- Use a different JOIN so that all teachers are listed.
SELECT teacher.name,
       dept.name
FROM   teacher
       LEFT JOIN dept
              ON ( teacher.dept = dept.id );

-- 4.
-- Use a different JOIN so that all departments are listed.
SELECT teacher.name,
       dept.name
FROM   teacher
       RIGHT JOIN dept
               ON ( teacher.dept = dept.id );

-- Using the COALESCE function

-- 5.
-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name,
       Coalesce(mobile, '07986 444 2266') AS mobile
FROM   teacher;

-- 6.
-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name,
       Coalesce(dept.name, 'None') AS name
FROM   teacher
       LEFT JOIN dept
              ON ( teacher.dept = dept.id );

-- 7.
-- Use COUNT to show the number of teachers and the number of mobile phones.
SELECT Count(name),
       Count(mobile)
FROM   teacher;

-- 8.
-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name,
       Count(teacher.dept)
FROM   dept
       LEFT JOIN teacher
              ON dept = dept.id
GROUP  BY dept.name;

-- Using CASE

-- 9.
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name,
       CASE
         WHEN dept = '1'
               OR dept = '2' THEN 'Sci'
         ELSE 'Art'
       end AS dept
FROM   teacher;

-- 10.
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT name,
       CASE
         WHEN dept = '1'
               OR dept = '2' THEN 'Sci'
         WHEN dept = '2' THEN 'Art'
         WHEN dept IS NULL THEN 'None'
         ELSE dept
       end AS dept
FROM   teacher;