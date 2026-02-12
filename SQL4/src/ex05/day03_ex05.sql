SELECT DISTINCT
  pz.name AS pizzeria_name
FROM
  person p, pizzeria pz, person_visits pv
WHERE
  pv.person_id = p.id AND pv.pizzeria_id = pz.id AND p.name = 'Andrey'

EXCEPT

SELECT 
  pz.name AS pizzeria_name 
FROM 
  person p, pizzeria pz, person_order po, menu m 
WHERE 
  po.person_id = p.id AND po.menu_id = m.id AND m.pizzeria_id = pz.id AND p.name = 'Andrey'
ORDER BY 1;