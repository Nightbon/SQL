CREATE TABLE person_audit (
  created timestamp with time zone default now() not null,
  type_event CHAR(1) default 'I' not null,
  row_id BIGINT not null,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  address VARCHAR,
  constraint ch_type_event check (type_event in ('I','U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO person_audit(row_id, name, age, gender, address, type_event)
  VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address, 'I');
  
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');