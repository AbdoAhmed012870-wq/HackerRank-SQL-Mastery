/*
===========================================================
LEVEL: INTERMEDIATE
===========================================================
*/

-- ---------------------------------------------------------
-- 1. OCCUPATIONS: Names with Initials
-- Description: Query names followed by the first letter of their occupation.
-- ---------------------------------------------------------
SELECT CONCAT(Name, '(', SUBSTR(Occupation, 1, 1), ')') 
FROM OCCUPATIONS 
ORDER BY Name ASC;

-- ---------------------------------------------------------
-- 2. OCCUPATIONS: Total Counts
-- Description: Query the count of each occupation formatted as a sentence.
-- ---------------------------------------------------------
SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation 
ORDER BY COUNT(Occupation) ASC, Occupation ASC;

-- ---------------------------------------------------------
-- 3. STATION: Manhattan Distance (Weather Station 18)
-- Formula: |min_lat - max_lat| + |min_long - max_long|
-- ---------------------------------------------------------
SELECT ROUND(
    ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 
    4)
FROM STATION;

-- ---------------------------------------------------------
-- 4. STATION: Euclidean Distance (Weather Station 19)
-- Formula: SQRT( (max_lat - min_lat)^2 + (max_long - min_long)^2 )
-- ---------------------------------------------------------
SELECT ROUND(
    SQRT(
        POW(MAX(LAT_N) - MIN(LAT_N), 2) + 
        POW(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 
    4)
FROM STATION;