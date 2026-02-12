SELECT
  p.name AS name
FROM
  person p
WHERE
  p.gender = 'female' AND age > 25
ORDER BY
  name