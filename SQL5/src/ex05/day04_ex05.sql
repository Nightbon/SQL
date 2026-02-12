CREATE VIEW v_price_with_discount AS
SELECT
  p.name AS name,
  m.pizza_name AS pizza_name,
  m.price AS price,
  (m.price - m.price * 0.1)::integer AS discount_price
FROM
  person p, menu m, person_order po 
WHERE
  po.person_id = p.id AND po.menu_id = m.id
ORDER BY
  name, pizza_name;