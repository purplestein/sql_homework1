DROP DATABASE IF EXISTS homework3;
CREATE DATABASE homework3;
USE homework3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 19),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

/* Отсортируйте данные по полю 
заработная плата (salary) в порядке: убывания*/
SELECT firstname, lastname, post, seniority, salary, age 
FROM staff ORDER BY salary DESC;

/* Отсортируйте данные по полю 
заработная плата (salary) в порядке: возрастания*/
SELECT firstname, lastname, post, seniority, salary, age 
FROM staff ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (salary)
SELECT salary FROM staff LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT SUM(salary), post FROM staff
GROUP BY post;

/* Найдите кол-во сотрудников с специальностью (post) «Рабочий» 
в возрасте от 24 до 49 лет включительно.*/
SELECT COUNT(*) FROM staff WHERE post = 'Рабочий' 
AND age > 23  AND age < 50;

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age) AS age30 
FROM staff
GROUP BY post
HAVING age30 < 30;