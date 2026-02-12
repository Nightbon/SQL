CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
  SELECT * FROM v_persons_female;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
  SELECT * FROM v_persons_male;
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
