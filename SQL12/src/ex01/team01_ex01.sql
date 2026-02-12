

WITH currency_for_transaction AS (
  SELECT 
    b.user_id,
    b.money,
    b.currency_id,
    (SELECT name FROM currency WHERE id = b.currency_id LIMIT 1) as currency_name,
    COALESCE(
      (SELECT rate_to_usd 
        FROM currency 
        WHERE id = b.currency_id 
          AND updated <= b.updated
        ORDER BY updated DESC 
        LIMIT 1),
      (SELECT rate_to_usd 
        FROM currency 
        WHERE id = b.currency_id 
          AND updated > b.updated
        ORDER BY updated ASC 
        LIMIT 1)
    ) as effective_rate
  FROM balance b
  WHERE EXISTS (SELECT 1 FROM currency WHERE id = b.currency_id)
)
SELECT 
  COALESCE(u.name, 'not defined') AS name,
  COALESCE(u.lastname, 'not defined') AS lastname,
  cft.currency_name,
  TRIM_SCALE(cft.money * cft.effective_rate) AS currency_in_usd
FROM currency_for_transaction cft
LEFT JOIN "user" u ON cft.user_id = u.id
ORDER BY 
  name DESC, 
  lastname, 
  currency_name;