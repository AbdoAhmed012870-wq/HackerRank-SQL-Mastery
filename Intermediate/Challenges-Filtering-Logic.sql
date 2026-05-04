/*
===========================================================
CATEGORY: AGGREGATION & COMPLEX HAVING CLAUSE
DESCRIPTION: List hackers and their total challenge counts. 
             Filter out hackers who share the same count unless that count 
             is the maximum number of challenges created.
===========================================================
*/

SELECT 
    h.hacker_id, 
    h.name, 
    COUNT(c.challenge_id) AS total_count
FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING 
    -- Condition 1: The count is the maximum count among all hackers
    total_count = (
        SELECT MAX(temp1.cnt)
        FROM (SELECT COUNT(*) AS cnt FROM Challenges GROUP BY hacker_id) temp1
    )
    OR 
    -- Condition 2: The count is unique (no other hacker has the same count)
    total_count IN (
        SELECT temp2.cnt
        FROM (SELECT COUNT(*) AS cnt FROM Challenges GROUP BY hacker_id) temp2
        GROUP BY temp2.cnt
        HAVING COUNT(temp2.cnt) = 1
    )
ORDER BY total_count DESC, h.hacker_id ASC;