BEGIN;--начало транзакции

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- изменение уровня изоляции

SELECT SUM(rating) FROM pizzeria; -- запрос на вывод суммы рейтингов пиццерий

INSERT INTO pizzeria (id, name, rating) -- вставка новой пиццерии
VALUES (10, 'Kazan Pizza', 5); -- новые данные

COMMIT;  -- завершение транзакции, публикация результатов в БД