CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT
  pi.name
FROM 
  pizzeria pi, person_visits pv, menu m, person p 
WHERE
  pv.person_id = p.id AND pv.pizzeria_id = pi.id AND pi.id = m.pizzeria_id 
  AND pv.visit_date = '2022-01-08' AND p.name = 'Dmitriy' AND m.price < 800;

SELECT * FROM mv_dmitriy_visits_and_eats;