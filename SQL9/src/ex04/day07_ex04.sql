SELECT
  p.name,
  COUNT(*) AS count_of_visits
FROM
  person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY
  person_id, p.name
HAVING
  COUNT(*) > 3
ORDER BY
  count_of_visits DESC, p.name;