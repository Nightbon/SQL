(SELECT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, person_visits pv
 WHERE pv.person_id = p.id AND pv.pizzeria_id = pz.id AND p.gender = 'female'
 EXCEPT ALL
 SELECT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, person_visits pv
 WHERE pv.person_id = p.id AND pv.pizzeria_id = pz.id AND p.gender = 'male')

UNION ALL

(SELECT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, person_visits pv
 WHERE pv.person_id = p.id AND pv.pizzeria_id = pz.id AND p.gender = 'male'
 EXCEPT ALL
 SELECT pz.name AS pizzeria_name
 FROM person p, pizzeria pz, person_visits pv
 WHERE pv.person_id = p.id AND pv.pizzeria_id = pz.id AND p.gender = 'female')

ORDER BY 1;