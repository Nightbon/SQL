INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
  (SELECT MAX(id) FROM person_visits) + 1,
  (SELECT id FROM person p WHERE p.name = 'Dmitriy'),
  (SELECT MAX(pz.id) FROM pizzeria pz, menu m WHERE pz.id = m.pizzeria_id AND price < 800 AND pz.name NOT IN (SELECT * FROM mv_dmitriy_visits_and_eats)),
  '2022-01-08'::date
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;