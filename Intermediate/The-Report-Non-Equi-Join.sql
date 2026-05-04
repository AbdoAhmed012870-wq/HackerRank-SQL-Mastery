/*
===========================================================
CATEGORY: NON-EQUI JOIN & CONDITIONAL LOGIC
DESCRIPTION: Generate a report containing Name, Grade, and Mark. 
             Names are hidden for students with grades lower than 8.
===========================================================
*/

SELECT 
    IF(G.Grade < 8, NULL, S.Name), 
    G.Grade, 
    S.Marks
FROM Students S
JOIN Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY 
    G.Grade DESC, 
    CASE 
        WHEN G.Grade >= 8 THEN S.Name 
    END ASC,
    CASE 
        WHEN G.Grade < 8 THEN S.Marks 
    END ASC;