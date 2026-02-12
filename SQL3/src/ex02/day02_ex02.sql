SELECT
  COALESCE(p.name, '-') AS person_name,
  pv.visit_date,
  COALESCE(pi.name, '-') AS pizzeria_name
FROM
  person p
FULL OUTER JOIN (
    SELECT * FROM person_visits 
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
  ) pv ON p.id = pv.person_id
FULL OUTER JOIN pizzeria pi ON pv.pizzeria_id = pi.id
ORDER BY
  person_name, pv.visit_date, pizzeria_name;