
WITH RECURSIVE all_paths AS (
    SELECT 
        point2,
        cost,
        ARRAY['a', point2::VARCHAR] AS path,
        point2 != 'a' AS continue_flag
    FROM graph
    WHERE point1 = 'a'
    
    UNION ALL
    
    SELECT 
      g.point2,
      p.cost + g.cost AS cost,
      p.path || g.point2 AS path,
      CASE 
        WHEN g.point2 = 'a' THEN false
        ELSE NOT g.point2 = ANY(p.path)
      END AS continue_flag
    FROM all_paths p
    JOIN graph g ON p.point2 = g.point1
    WHERE p.continue_flag = true
      AND array_length(p.path, 1) < 5
) SELECT * FROM all_paths;
,
completed_tours AS (
    SELECT 
        cost AS total_cost,
        path AS tour
    FROM all_paths
    WHERE path[1] = 'a' 
      AND path[array_length(path, 1)] = 'a'
      AND array_length(path, 1) = 5
      AND (
        SELECT COUNT(DISTINCT node) 
        FROM unnest(path) AS node
      ) = 4
)
SELECT DISTINCT
    total_cost,
    tour
FROM completed_tours
WHERE total_cost = (
    SELECT MIN(total_cost)
    FROM completed_tours
)
ORDER BY total_cost, tour;