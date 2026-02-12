SELECT
  address,
  TRIM_SCALE(ROUND(MAX(age) - (MIN(age) / MAX(age)::numeric), 2)) AS formula,
  TRIM_SCALE(ROUND(AVG(age), 2)) AS average,
  (MAX(age) - (MIN(age) / MAX(age)::numeric) > AVG(age)) AS comparison
FROM
  person
GROUP BY address
ORDER BY address;