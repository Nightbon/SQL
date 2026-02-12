CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT id, person_id, pizzeria_id FROM person_discounts WHERE person_id = 3;

SET enable_seqscan = ON;


--                                                                   QUERY PLAN
-- -----------------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_person_discounts_unique on person_discounts  (cost=0.14..8.15 rows=1 width=24) (actual time=0.344..0.345 rows=1 loops=1)
--    Index Cond: (person_id = 3)
--  Planning Time: 0.329 ms
--  Execution Time: 0.381 ms
-- (4 rows)