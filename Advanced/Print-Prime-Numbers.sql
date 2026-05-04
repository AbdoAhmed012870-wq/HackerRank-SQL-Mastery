/*
===========================================================
CATEGORY: ALTERNATIVE QUERIES (RECURSIVE CTE)
DESCRIPTION: Print all prime numbers less than or equal to 1000 
             in a single line separated by '&'.
===========================================================
*/

WITH RECURSIVE numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 1000
)
SELECT GROUP_CONCAT(n1.n SEPARATOR '&')
FROM numbers n1
WHERE NOT EXISTS (
    SELECT 1 
    FROM numbers n2 
    WHERE n2.n < n1.n 
      AND n1.n % n2.n = 0
);