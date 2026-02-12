CREATE UNIQUE INDEX idx_person_order_order_date 
ON person_order(person_id, menu_id) 
WHERE order_date = '2022-01-01';

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id FROM person_order 
WHERE person_id = 2 
  AND menu_id = 8 
  AND order_date = '2022-01-01';

SET enable_seqscan = ON;

--                                                                    QUERY PLAN
-- ------------------------------------------------------------------------------------------------------------------------------------------------
--  Index Only Scan using idx_person_order_order_date on person_order  (cost=0.13..8.15 rows=1 width=16) (actual time=0.075..0.075 rows=1 loops=1)
--    Index Cond: ((person_id = 2) AND (menu_id = 8))
--    Heap Fetches: 1
--  Planning Time: 0.867 ms
--  Execution Time: 0.142 ms
-- (5 rows)