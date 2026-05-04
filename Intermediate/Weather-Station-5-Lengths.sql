/*
===========================================================
CATEGORY: STRING FUNCTIONS & SORTING
DESCRIPTION: Query the cities with the shortest and longest names.
             If there's a tie, the alphabetically first city is chosen.
===========================================================
*/

-- 1. Get the shortest city name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

-- 2. Get the longest city name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;