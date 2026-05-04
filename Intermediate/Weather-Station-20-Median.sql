/*
===========================================================
CATEGORY: AGGREGATION & WINDOW FUNCTIONS
DESCRIPTION: Calculate the Median of Northern Latitudes (LAT_N) 
             from the STATION table and round to 4 decimal places.
===========================================================
*/

-- Step 1: Assign a row number to each record ordered by LAT_N
-- Step 2: Calculate the total count to find the middle position
-- Step 3: Filter for the row where the row_number is exactly in the middle

SET @rowindex := -1;

SELECT ROUND(AVG(lat_n), 4)
FROM (
    SELECT @rowindex := @rowindex + 1 AS row_index, lat_n
    FROM STATION
    ORDER BY lat_n
) AS subquery
WHERE row_index IN (
    FLOOR(@rowindex / 2), 
    CEIL(@rowindex / 2)
);