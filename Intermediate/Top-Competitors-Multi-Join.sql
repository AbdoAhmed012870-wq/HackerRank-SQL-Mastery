/*
===========================================================
CATEGORY: MULTI-TABLE JOIN & AGGREGATION
DESCRIPTION: List hackers who achieved full scores in more than one challenge.
             Requires joining Submissions, Hackers, Challenges, and Difficulty tables.
===========================================================
*/

SELECT 
    H.hacker_id, 
    H.name
FROM Submissions S
JOIN Hackers H ON S.hacker_id = H.hacker_id
JOIN Challenges C ON S.challenge_id = C.challenge_id
JOIN Difficulty D ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score -- Match submission score with the maximum score for that difficulty
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.challenge_id) > 1 -- Only those with more than one full score
ORDER BY 
    COUNT(S.challenge_id) DESC, 
    H.hacker_id ASC;