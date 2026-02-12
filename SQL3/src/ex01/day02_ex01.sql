SELECT 
  gs.d::date AS missing_date
FROM 
  generate_series(
    '2022-01-01'::date,
    '2022-01-10'::date,
    '1 day'::interval
  ) AS gs(d)
LEFT JOIN person_visits pv ON gs.d = pv.visit_date 
  AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE 
  pv.id IS NULL
ORDER BY 
  gs.d;