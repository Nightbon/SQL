SELECT DISTINCT
  p.name AS name 
FROM
  person p, person_order po, menu m
WHERE
  po.person_id = p.id AND po.menu_id = m.id AND p.gender = 'male' 
  AND (m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza') 
  AND (p.address = 'Moscow' OR p.address = 'Samara')
ORDER BY
  name DESC;