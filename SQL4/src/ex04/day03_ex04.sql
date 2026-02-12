(SELECT DISTINCT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, menu m, person_order po
 WHERE po.person_id = p.id AND m.pizzeria_id = pz.id AND po.menu_id = m.id AND p.gender = 'female'
 EXCEPT
 SELECT DISTINCT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, menu m, person_order po
 WHERE po.person_id = p.id AND m.pizzeria_id = pz.id AND po.menu_id = m.id AND p.gender = 'male')

UNION

(SELECT DISTINCT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, menu m, person_order po
 WHERE po.person_id = p.id AND m.pizzeria_id = pz.id AND po.menu_id = m.id AND p.gender = 'male'
 EXCEPT
 SELECT DISTINCT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, menu m, person_order po
 WHERE po.person_id = p.id AND m.pizzeria_id = pz.id AND po.menu_id = m.id AND p.gender = 'female')

ORDER BY 1;
