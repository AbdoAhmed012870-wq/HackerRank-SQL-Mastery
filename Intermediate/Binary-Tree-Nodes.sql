/*
===========================================================
CATEGORY: CONDITIONAL LOGIC (CASE WHEN) & SUBQUERIES
DESCRIPTION: Identify the type of each node in a Binary Tree (Root, Leaf, or Inner).
===========================================================
*/

SELECT N,
    CASE 
        -- 1. If the Parent (P) is NULL, it's the Root.
        WHEN P IS NULL THEN 'Root'
        
        -- 2. If the Node (N) exists in the P column of any other row, 
        --    it means it has children, so it's 'Inner'.
        WHEN N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'
        
        -- 3. Otherwise, it has a parent but no children, so it's a 'Leaf'.
        ELSE 'Leaf'
    END
FROM BST
ORDER BY N ASC;