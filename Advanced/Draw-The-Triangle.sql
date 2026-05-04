/*
===========================================================
CATEGORY: ALTERNATIVE QUERIES (PATTERN GENERATION)
DESCRIPTION: Draw a downward triangle of stars starting from 20 stars.
===========================================================
*/

-- Step 1: Initialize a variable with the starting count + 1
SET @number = 21;

-- Step 2: Use a system table to generate rows and REPEAT() to draw stars
SELECT REPEAT('* ', @number := @number - 1)
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;

/*
===========================================================
CATEGORY: ALTERNATIVE QUERIES (PATTERN GENERATION)
DESCRIPTION: Draw an upward triangle of stars starting from 1 star up to 20.
===========================================================
*/

-- Step 1: Initialize the variable at 0
SET @number = 0;

-- Step 2: Increment the variable in each row to increase stars
SELECT REPEAT('* ', @number := @number + 1)
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;