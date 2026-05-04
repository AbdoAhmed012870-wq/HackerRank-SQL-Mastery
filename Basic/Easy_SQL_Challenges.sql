-- =========================================================
-- SQL PRACTICE CHALLENGES SUMMARY (Basic Select & Filtering)
-- =========================================================

-- 1. Query American cities with population > 120,000
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'USA' 
  AND POPULATION > 120000;

-- 2. Query all columns for every row in CITY
SELECT * 
FROM CITY;

-- 3. Query all columns for a specific city by ID (1661)
SELECT * 
FROM CITY 
WHERE ID = 1661;

-- 4. Query all attributes of Japanese cities (JPN)
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- 5. Query CITY and STATE from STATION table
SELECT CITY, STATE 
FROM STATION;

-- 6. Query unique CITY names with even ID numbers
SELECT DISTINCT CITY 
FROM STATION 
WHERE ID % 2 = 0;

-- 7. Difference between total and distinct CITY entries
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) 
FROM STATION;

-- 8. Query CITY names starting with vowels (a, e, i, o, u)
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou]';

-- 9. Query CITY names ending with vowels (a, e, i, o, u)
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[aeiou]$';

-- 10. Query CITY names starting AND ending with vowels
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[aeiou].* [aeiou]$';

-- 11. Query CITY names that DO NOT end with vowels
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '[aeiou]$';

-- 12. Student names with Marks > 75 (Ordered by last 3 chars and ID)
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3) ASC, ID ASC;

-- 13. Employee names with Salary > 2000 and Months < 10
SELECT NAME 
FROM EMPLOYEE 
WHERE SALARY > 2000 
  AND MONTHS < 10;