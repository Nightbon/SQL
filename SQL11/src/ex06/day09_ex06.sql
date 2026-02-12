CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy', pprice numeric DEFAULT 500, pdate date DEFAULT '2022-01-08')
RETURNS TABLE(pizzeria_name varchar) AS $$
BEGIN
RETURN QUERY
  SELECT pz.name AS pizzeria_name
  FROM pizzeria pz
  JOIN person_visits pv ON pv.pizzeria_id = pz.id
  JOIN menu m ON m.pizzeria_id = pz.id
  JOIN person p ON pv.person_id = p.id
  WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

select *  
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');