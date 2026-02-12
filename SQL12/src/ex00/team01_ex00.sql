WITH balance_agg AS (
  SELECT 
    user_id,
    type,
    currency_id,
    SUM(money) as volume
  FROM balance
  GROUP BY user_id, type, currency_id
),
latest_currency AS (
  SELECT DISTINCT ON (id)
    id,
    name,
    rate_to_usd
  FROM currency
  ORDER BY id, updated DESC
)
SELECT 
  COALESCE(u.name, 'not defined') as name,
  COALESCE(u.lastname, 'not defined') as lastname,
  ba.type,
  ba.volume,
  COALESCE(c.name, 'not defined') as currency_name,
  COALESCE(c.rate_to_usd, 1) as last_rate_to_usd,
  TRIM_SCALE(ba.volume * COALESCE(c.rate_to_usd, 1)) as total_volume_in_usd
FROM balance_agg ba
LEFT JOIN latest_currency c ON ba.currency_id = c.id
LEFT JOIN "user" u ON ba.user_id = u.id
ORDER BY 
  name DESC, 
  lastname, 
  ba.type;