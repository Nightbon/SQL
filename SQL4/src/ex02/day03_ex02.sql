SELECT
  m.pizza_name AS pizza_name,
  m.price AS price,
  pz.name AS pizzeria_name
FROM
  menu m, pizzeria pz
WHERE
 m.pizzeria_id = pz.id AND m.id NOT IN (SELECT po.menu_id FROM person_order po)
ORDER BY
  pizza_name, price;