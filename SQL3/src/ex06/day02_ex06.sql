SELECT
  m.pizza_name AS pizza_name,
  pi.name AS pizzeria_name
FROM
  menu m, person p, pizzeria pi, person_order po 
WHERE
  po.person_id = p.id AND (p.name = 'Denis' OR p.name = 'Anna') AND po.menu_id = m.id AND m.pizzeria_id = pi.id
ORDER BY
  pizza_name, pizzeria_name