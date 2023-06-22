DROP TABLE IF EXISTS mobiles_phones;
CREATE TABLE mobiles_phones (
id INT NOT NULL,
product_name VARCHAR(45),
manufacturer VARCHAR(100),
product_count INT,
price INT,
PRIMARY KEY(id)
);

INSERT INTO mobiles_phones (id, product_name, manufacturer, product_count, price)
VALUES
(1,'iPhone X', 'Apple', 3 , 76000),
(2,'iPhone 8', 'Apple', 2 , 51000),
(3,'Galaxy S9', 'Samsung', 2 , 56000),
(4,'Galaxy S8', 'Samsung', 1, 41000),
(5,'P20 Pro', 'Huawei', 5 , 36000);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones 
WHERE product_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones 
WHERE manufacturer = 'Samsung'; 

-- Товары, в которых есть упоминание "Iphone"
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones
WHERE product_name LIKE '%iPhone%';

-- Товары, в которых есть упоминание"Samsung"
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones
WHERE manufacturer LIKE '%Samsung%';

-- Товары, в которых есть ЦИФРЫ
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones
WHERE product_count OR price OR product_name
LIKE '%0%' or '%1%' or '%2%' or '%3%' 
or '%4%' or '%5%' or '%6%' 
or '%7%' or '%8%' or '%9%';

-- Товары, в которых есть ЦИФРА "8"
SELECT id, product_name, manufacturer, product_count, price 
FROM homework1.mobiles_phones
WHERE product_name
LIKE '%8%';