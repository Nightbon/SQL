CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 14;

SET enable_seqscan = ON;


--                                                                 QUERY PLAN
-- -------------------------------------------------------------------------------------------------------------------------------------------
--  Index Only Scan using idx_person_order_multi on person_order  (cost=0.14..8.16 rows=1 width=20) (actual time=0.081..0.082 rows=1 loops=1)
--    Index Cond: ((person_id = 8) AND (menu_id = 14))
--    Heap Fetches: 1
--  Planning Time: 0.232 ms
--  Execution Time: 0.107 ms
-- (5 rows)