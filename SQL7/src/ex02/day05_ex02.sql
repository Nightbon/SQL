CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'ANNA';

SET enable_seqscan = ON;

--                                                         QUERY PLAN
-- --------------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_person_name on person  (cost=0.14..8.15 rows=1 width=108) (actual time=0.039..0.040 rows=1 loops=1)
--    Index Cond: (upper((name)::text) = 'ANNA'::text)
--  Planning Time: 0.333 ms
--  Execution Time: 0.074 ms
-- (4 rows)