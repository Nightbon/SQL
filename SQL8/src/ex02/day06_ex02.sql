SELECT
  p.name,
  m.pizza_name,
  m.price,
  (m.price - m.price / 100 * pd.discount)::integer AS discount_price,
  pz.name
FROM
  person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = m.pizzeria_id
ORDER BY
  p.name, m.pizza_name;