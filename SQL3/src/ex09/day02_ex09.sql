WITH order_pepperoni AS (
  SELECT
    p.name
  FROM
    person p, person_order po, menu m
  WHERE
    po.person_id = p.id AND po.menu_id = m.id AND p.gender = 'female' AND m.pizza_name = 'pepperoni pizza'
),
order_cheese AS (
  SELECT
    p.name
  FROM
    person p, person_order po, menu m
  WHERE
    po.person_id = p.id AND po.menu_id = m.id AND p.gender = 'female' AND m.pizza_name = 'cheese pizza'
)
SELECT
  op.name AS name
FROM
  order_pepperoni op
NATURAL JOIN order_cheese oc 
ORDER BY
  name;