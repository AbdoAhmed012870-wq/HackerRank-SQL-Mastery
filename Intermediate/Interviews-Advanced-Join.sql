/*
===========================================================
CATEGORY: COMPLEX JOINS & PRE-AGGREGATION
DESCRIPTION: Query contest statistics while avoiding duplicated totals caused 
             by multiple joins (View_Stats and Submission_Stats).
===========================================================
*/

SELECT 
    CON.contest_id, 
    CON.hacker_id, 
    CON.name, 
    SUM(SS.total_submissions), 
    SUM(SS.total_accepted_submissions), 
    SUM(VS.total_views), 
    SUM(VS.total_unique_views)
FROM Contests CON
JOIN Colleges COL ON CON.contest_id = COL.contest_id
JOIN Challenges CHA ON COL.college_id = CHA.college_id
-- Pre-aggregating View Stats to prevent double counting
LEFT JOIN (
    SELECT challenge_id, 
           SUM(total_views) AS total_views, 
           SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) VS ON CHA.challenge_id = VS.challenge_id
-- Pre-aggregating Submission Stats to prevent double counting
LEFT JOIN (
    SELECT challenge_id, 
           SUM(total_submissions) AS total_submissions, 
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) SS ON CHA.challenge_id = SS.challenge_id
GROUP BY CON.contest_id, CON.hacker_id, CON.name
HAVING (SUM(SS.total_submissions) + 
        SUM(SS.total_accepted_submissions) + 
        SUM(VS.total_views) + 
        SUM(VS.total_unique_views)) > 0
ORDER BY CON.contest_id;