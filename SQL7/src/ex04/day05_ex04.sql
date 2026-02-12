CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM menu 
WHERE pizzeria_id = 4 AND pizza_name = 'pepperoni pizza';

SET enable_seqscan = ON;


--                                                       QUERY PLAN
-- -----------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_menu_unique on menu  (cost=0.14..8.16 rows=1 width=80) (actual time=0.025..0.025 rows=1 loops=1)
--    Index Cond: ((pizzeria_id = 4) AND ((pizza_name)::text = 'pepperoni pizza'::text))
--  Planning Time: 0.267 ms
--  Execution Time: 0.048 ms
-- (4 rows)