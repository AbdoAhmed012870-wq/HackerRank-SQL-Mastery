/*
===========================================================
CATEGORY: CORRELATED SUBQUERY & JOIN
DESCRIPTION: Find the cheapest non-evil wands for each specific 
             combination of high power and age.
===========================================================
*/

SELECT 
    W.id, 
    P.age, 
    W.coins_needed, 
    W.power
FROM Wands W
JOIN Wands_Property P ON W.code = P.code
WHERE P.is_evil = 0 
  AND W.coins_needed = (
      -- Subquery to find the minimum price for the current wand's power and age
      SELECT MIN(W1.coins_needed)
      FROM Wands W1
      JOIN Wands_Property P1 ON W1.code = P1.code
      WHERE P1.is_evil = 0 
        AND W1.power = W.power 
        AND P1.age = P.age
  )
ORDER BY W.power DESC, P.age DESC;