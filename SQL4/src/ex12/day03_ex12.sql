INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
  (SELECT MAX(id) FROM person_order) + gs.n,
  (SELECT id FROM person ORDER BY id OFFSET gs.n - 1 LIMIT 1),
  (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
  '2022-02-25'::date
FROM generate_series(1, (SELECT COUNT(*) FROM person)) gs(n);