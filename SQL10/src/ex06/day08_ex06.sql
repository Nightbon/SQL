BEGIN;--начало транзакции

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- изменение уровня изоляции

SELECT SUM(rating) FROM pizzeria; -- запрос на вывод суммы рейтингов пиццерий

INSERT INTO pizzeria (id, name, rating) -- вставка новой пиццерии
VALUES (11, 'Kazan Pizza 2', 4); -- новые данные

COMMIT;  -- завершение транзакции, публикация результатов в БД