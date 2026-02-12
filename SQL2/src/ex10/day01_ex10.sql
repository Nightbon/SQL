SELECT
  p.name AS person_name,
  m.pizza_name AS pizza_name,
  pi.name AS pizzeria_name
FROM 
  person p, menu m, pizzeria pi, person_order po
WHERE
  (po.person_id = p.id) AND (po.menu_id = m.id) AND (m.pizzeria_id = pi.id)
ORDER BY
  person_name, pizza_name, pizzeria_name;