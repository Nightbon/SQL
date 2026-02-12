SELECT
  pi.name,
  pi.rating
FROM
  pizzeria pi
LEFT JOIN 
  person_visits pv ON pv.pizzeria_id = pi.id
WHERE
  pv.id IS NULL
