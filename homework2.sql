/*Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
*/
drop database if exists homework2;
create database homework2;
use homework2;

create table sales (
  `id` int not null auto_increment primary key,
  `order_date` date not null ,
  `count_product` int not null
);

insert into sales (order_date, count_product)
values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-02', 21),
('2022-01-03', 124),
('2022-01-04', 341);

/*для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - маленький заказ
от 100 до 300 - средний заказ
больше 300 - большой заказ */

select 
	id as 'id заказа',
	case
		when count_product < 100 then 'маленький заказ'
		when count_product between 100 and 300 then 'средний заказ'
		when count_product > 300 then 'большой заказ'
	end as 'тип заказа'	
from sales;

-- создайте таблицу “orders”, заполните ее значениями
create table orders (
  `id` int not null auto_increment primary key,
  `employee_id` varchar(10) not null ,
  `amount` float(2) not null,
  `order_status` varchar(30)
);

insert into orders (employee_id, amount,order_status )
values
('e03', 15.00, 'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70, 'CLOSED'),
('e02', 22.18,'OPEN'),
('e04', 9.50, 'CANCELLED');

/*Выберите все заказы. В зависимости от поля order_status 
выведите столбец full_order_status:
OPEN – «Order is in open state» ; 
CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/
SELECT 
	CASE order_status
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'	
FROM orders;


