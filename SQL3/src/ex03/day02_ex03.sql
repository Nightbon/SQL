WITH date_series AS (
    SELECT generate_series(
        '2022-01-01'::date,
        '2022-01-10'::date,
        '1 day'::interval
    )::date AS date
),
visits_1_2 AS (
    SELECT visit_date 
    FROM person_visits 
    WHERE person_id = 1 OR person_id = 2
)
SELECT ds.date AS missing_date
FROM date_series ds
LEFT JOIN visits_1_2 v ON ds.date = v.visit_date
WHERE v.visit_date IS NULL
ORDER BY ds.date;