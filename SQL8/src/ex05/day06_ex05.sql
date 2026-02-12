-- Комментарий к таблице
COMMENT ON TABLE person_discounts IS 
'Таблица для хранения персональных скидок клиентов в пиццериях.
Скидка рассчитывается на основе истории заказов: чем больше клиент заказывает
в конкретной пиццерии, тем выше его персональная скидка там.';

-- Комментарии к столбцам
COMMENT ON COLUMN person_discounts.id IS 
'Уникальный идентификатор записи. Первичный ключ.';

COMMENT ON COLUMN person_discounts.person_id IS 
'Идентификатор клиента. Ссылается на таблицу person (id).
NOT NULL - обязательное поле.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 
'Идентификатор пиццерии. Ссылается на таблицу pizzeria (id).
NOT NULL - обязательное поле.';

COMMENT ON COLUMN person_discounts.discount IS 
'Размер скидки в процентах. Диапазон: 0-100.
Правила расчета:
- 1 заказ в пиццерии: 10.5%
- 2 заказа в пиццерии: 22%
- 3 и более заказов: 30%
NOT NULL, DEFAULT 0.';

--этот запрос покажет комментарии
-- SELECT 
--     'Table' AS object_type,
--     'person_discounts' AS object_name,
--     obj_description(oid, 'pg_class') AS comment
-- FROM pg_class
-- WHERE relname = 'person_discounts'

-- UNION ALL

-- SELECT 
--     'Column' AS object_type,
--     a.attname AS object_name,
--     col_description(c.oid, a.attnum) AS comment
-- FROM pg_class c
-- JOIN pg_attribute a ON c.oid = a.attrelid
-- WHERE (c.relname = 'person_discounts' OR relname = 'person_discounts')

--     AND col_description(c.oid, a.attnum) IS NOT NULL
-- ORDER BY object_type DESC, object_name;