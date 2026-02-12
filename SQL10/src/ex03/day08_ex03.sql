BEGIN;--начало транзакции
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- изменение уровня изоляции

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria -- запрос на обновление данных
SET rating = 4 -- новое значение
WHERE pizzeria.name = 'Pizza Hut';

COMMIT; -- завершение транзакции, публикация результатов в БД

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';