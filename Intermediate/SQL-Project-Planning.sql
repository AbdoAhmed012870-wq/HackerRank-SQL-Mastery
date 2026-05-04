/*
===========================================================
CATEGORY: GAPS AND ISLANDS / WINDOW FUNCTIONS
DESCRIPTION: Group consecutive daily tasks into projects and calculate 
             their start and end dates.
===========================================================
*/

WITH ProjectGroups AS (
    SELECT 
        Start_Date, 
        End_Date,
        -- Magic Trick: Subtracting row number from Start_Date groups consecutive dates
        DATE_SUB(Start_Date, INTERVAL ROW_NUMBER() OVER (ORDER BY Start_Date) DAY) AS grp
    FROM Projects
)
SELECT 
    MIN(Start_Date) AS Project_Start, 
    MAX(End_Date) AS Project_End
FROM ProjectGroups
GROUP BY grp
ORDER BY 
    DATEDIFF(MAX(End_Date), MIN(Start_Date)) ASC, 
    Project_Start ASC;