BEGIN; --начало транзакции
UPDATE pizzeria -- запрос на обновление данных
SET rating = 5 -- новое значение
WHERE pizzeria.name = 'Pizza Hut';
COMMIT; -- завершение транзакции, публикация результатов в БД

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; --запрос для Session#2