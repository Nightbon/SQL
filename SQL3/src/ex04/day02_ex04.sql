SELECT
  m.pizza_name AS pizza_name,
  pi.name AS pizzeria_name,
  m.price AS price
FROM menu m, pizzeria pi
WHERE (m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza') AND m.pizzeria_id = pi.id
ORDER BY
  pizza_name, pizzeria_name;