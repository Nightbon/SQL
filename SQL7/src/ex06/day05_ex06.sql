CREATE INDEX idx_1 ON pizzeria(rating);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
SET enable_seqscan = ON;

-- БЕЗ idx_1
--                                                                        QUERY PLAN
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------       
--  Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.314..0.316 rows=19 loops=1)
--    Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--    Sort Method: quicksort  Memory: 26kB
--    ->  WindowAgg  (cost=25.17..25.55 rows=19 width=96) (actual time=0.248..0.264 rows=19 loops=1)
--          ->  Sort  (cost=25.17..25.22 rows=19 width=64) (actual time=0.227..0.229 rows=19 loops=1)
--                Sort Key: pz.rating
--                Sort Method: quicksort  Memory: 25kB
--                ->  Merge Join  (cost=0.27..24.77 rows=19 width=64) (actual time=0.119..0.127 rows=19 loops=1)
--                      Merge Cond: (m.pizzeria_id = pz.id)
--                      ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.034..0.037 rows=19 loops=1)        
--                            Heap Fetches: 19
--                      ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.038..0.039 rows=6 loops=1)
--  Planning Time: 0.743 ms
--  Execution Time: 0.823 ms
-- (14 rows)

-- С idx_1
--                                                                    QUERY PLAN
-- ------------------------------------------------------------------------------------------------------------------------------------------------
--  Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.089..0.090 rows=19 loops=1)
--    Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--    Sort Method: quicksort  Memory: 26kB
--    ->  WindowAgg  (cost=0.27..25.54 rows=19 width=96) (actual time=0.037..0.052 rows=19 loops=1)
--          ->  Nested Loop  (cost=0.27..25.21 rows=19 width=64) (actual time=0.023..0.033 rows=19 loops=1)
--                ->  Index Scan using idx_1 on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.005..0.006 rows=6 loops=1)
--                ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..2.15 rows=1 width=40) (actual time=0.003..0.004 rows=3 loops=6)
--                      Index Cond: (pizzeria_id = pz.id)
--                      Heap Fetches: 19
--  Planning Time: 0.448 ms
--  Execution Time: 0.147 ms
-- (11 rows)