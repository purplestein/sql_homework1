/*1.Создайте таблицу users_old, аналогичную таблице users.
 Создайте процедуру,  с помощью которой можно переместить любого (одного) 
 пользователя из таблицы users в таблицу users_old. 
(использование транзакции с выбором commit или rollback – обязательно).
*/
USE lesson_4;

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

DROP PROCEDURE IF EXISTS user_transfer;
DELIMITER //
CREATE PROCEDURE user_transfer(u_id int,
OUT  tran_result varchar(100))

BEGIN
	
	DECLARE `_rollback` BIT DEFAULT 0;
	DECLARE code varchar(100);
	DECLARE error_string varchar(100); 

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
 		SET `_rollback` = 1;
 		GET stacked DIAGNOSTICS CONDITION 1
			code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
	END;

	START TRANSACTION;
	
    INSERT INTO users_old (id, firstname, lastname, email)
	SELECT id, firstname, lastname, email FROM users WHERE id = u_id;

	DELETE FROM users
	WHERE id=u_id;
     
	IF `_rollback` THEN
		SET tran_result = concat('Ошибка: ', code, error_string);
		ROLLBACK;
	ELSE
		SET tran_result = 'ok';
		COMMIT;
	END IF;
END//
DELIMITER ;

CALL user_transfer(1, @tran_result);
SELECT  @tran_result;
SELECT id, firstname, lastname, email FROM users_old;

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
 с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS TEXT NO SQL
BEGIN
	DECLARE time_now INT;
	SET time_now = HOUR(now());
	CASE
		WHEN time_now BETWEEN 0 AND 5 THEN 
			RETURN 'Доброй ночи!';
		WHEN time_now BETWEEN 6 AND 11 THEN 
			RETURN 'Доброе утро!';
		WHEN time_now BETWEEN 12 AND 17 THEN 
			RETURN 'Добрый день!';
		WHEN time_now BETWEEN 18 AND 23 THEN 
			RETURN 'Добрый вечер!';
	END CASE;
END//
DELIMITER ;
SELECT hello();
