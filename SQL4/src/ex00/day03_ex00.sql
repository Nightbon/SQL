SELECT
  m.pizza_name AS pizza_name,
  m.price AS price,
  pz.name AS pizzeria_name,
  pv.visit_date
FROM
  person p, menu m, person_visits pv, pizzeria pz
WHERE
  p.id = pv.person_id AND pz.id = pv.pizzeria_id 
  AND pz.id = m.pizzeria_id AND p.name = 'Kate' AND m.price >= 800 AND m.price < 1000
  ORDER BY
    pizza_name, price, pizzeria_name;