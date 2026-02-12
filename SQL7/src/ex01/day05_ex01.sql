SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT 
  m.pizza_name AS pizza_name, 
  pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id;

SET enable_seqscan = ON;

                                                            --  QUERY PLAN
---------------------------------------------------------------------------------------------------------------------------------------
--  Nested Loop  (cost=0.29..63.61 rows=19 width=64) (actual time=1.258..1.274 rows=19 loops=1)
--    ->  Index Scan using idx_menu_pizzeria_id on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.699..0.702 rows=19 loops=1)
--    ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.15..2.69 rows=1 width=40) (actual time=0.030..0.030 rows=1 loops=19)
--          Index Cond: (id = m.pizzeria_id)
--  Planning Time: 0.513 ms
--  Execution Time: 1.328 ms
-- (6 rows)