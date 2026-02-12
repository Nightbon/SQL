WITH orders AS (
  SELECT pizzeria_id, COUNT(*) AS count_orders
  FROM person_order po 
  JOIN menu m ON po.menu_id = m.id
  GROUP BY m.pizzeria_id
), visits AS (
  SELECT pizzeria_id, COUNT(*) AS count_visits
  FROM person_visits
  GROUP BY pizzeria_id
)
SELECT
  pz.name,
  COALESCE(o.count_orders, 0) + COALESCE(v.count_visits, 0) AS total_count
FROM
  pizzeria pz
LEFT JOIN orders o ON pz.id = o.pizzeria_id
LEFT JOIN visits v ON pz.id = v.pizzeria_id
ORDER BY
  total_count DESC, pz.name;