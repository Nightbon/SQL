SELECT
  name,
  COUNT(*) AS count,
  'order' AS action_type
FROM person_order po 
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pizzeria_id, name

UNION ALL

SELECT
  name,
  COUNT(*) AS count,
  'visit' AS action_type
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
GROUP BY pizzeria_id, name
ORDER BY
  action_type, count DESC
LIMIT 6;