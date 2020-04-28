-- Tutorial Quizzes - 8. Using Null Quiz
-- URL: https://sqlzoo.net/wiki/Using_Null_Quiz

-- 1. Select the code which uses an outer join correctly.
-- 5)
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- 2. Select the correct statement that shows the name of department which employs Cutflower
-- 3)
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

-- 3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
-- 5)
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- 4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will
-- 2)
-- display 0 in result column for all teachers without department

-- 5. Query ... shows following digit
-- 1)
-- 'four' for Throd

-- 6. Select the result that would be obtained from the following code
-- 1) Table-A
-- | Shrivell   | Computing |
-- | Throd      | Computing |
-- | Splint     | Computing |
-- | Spiregrain | Other     |
-- | Cutflower  | Other     |
-- | Deadyawn   | Other     |