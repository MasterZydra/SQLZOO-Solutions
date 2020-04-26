-- 8+ Numeric Examples --
-- URL: https://sqlzoo.net/wiki/NSS_Tutorial

-- 1. Check out one row
-- The example shows the number who responded for:
-- o question 1
-- o at 'Edinburgh Napier University'
-- o studying '(8) Computer Science'
-- Show the the percentage who STRONGLY AGREE
SELECT a_strongly_agree
FROM   nss
WHERE  question = 'Q01'
       AND institution = 'Edinburgh Napier University'
       AND subject = '(8) Computer Science';

-- 2. Calculate how many agree or strongly agree
-- Show the institution and subject where the score is at least 100 for question 15.
SELECT institution,
       subject
FROM   nss
WHERE  question = 'Q15'
       AND score >= 100;

-- 3. Unhappy Computer Students
-- Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'
SELECT institution,
       score
FROM   nss
WHERE  question = 'Q15'
       AND score < 50
       AND subject = '(8) Computer Science';

-- 4. More Computing or Creative Students?
-- Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject,
       Sum(response)
FROM   nss
WHERE  question = 'Q22'
       AND ( subject = '(8) Computer Science'
              OR subject = '(H) Creative Arts and Design' )
GROUP  BY subject;

-- 5. Strongly Agree Numbers
-- Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject,
       Sum(response * a_strongly_agree / 100)
FROM   nss
WHERE  question = 'Q22'
       AND ( subject = '(H) Creative Arts and Design'
              OR subject = '(8) Computer Science' )
GROUP  BY subject;

-- 6. Strongly Agree, Percentage
-- Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
-- Use the ROUND function to show the percentage without decimal places.
SELECT subject,
       Round(Sum(response * a_strongly_agree) / Sum(response), 0)
FROM   nss
WHERE  question = 'Q22'
       AND ( subject = '(H) Creative Arts and Design'
              OR subject = '(8) Computer Science' )
GROUP  BY subject;

-- 7. Scores for Institutions in Manchester
-- Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.
-- The column score is a percentage - you must use the method outlined above to multiply the percentage by the response and divide by the total response. Give your answer rounded to the nearest whole number.
SELECT institution,
       Round(Sum(response * score) / Sum(response), 0) AS score
FROM   nss
WHERE  question = 'Q22'
       AND ( institution LIKE '%Manchester%' )
GROUP  BY institution;

-- 8. Number of Computing Students in Manchester
-- Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
SELECT institution,
       Sum(sample),
       Sum(CASE
             WHEN subject LIKE '(8)%' THEN sample
           end)
FROM   nss a
WHERE  question = 'Q01'
       AND ( institution LIKE '%Manchester%' )
GROUP  BY institution;