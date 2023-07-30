-- TASK 3
CREATE TYPE sex_t AS ENUM ('male', 'female', 'undefined');

CREATE TABLE karyawan
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    age        INT,
    sex        sex_t,
    income     BIGINT
);

SELECT *
FROM karyawan;

-- TASK 4
CREATE TABLE inventory
(
    item_code  SERIAL PRIMARY KEY,
    item_name  VARCHAR(100)   NOT NULL,
    item_price NUMERIC(10, 2) NOT NULL,
    item_total INTEGER CHECK (Item_total >= 0)
);

INSERT INTO inventory (item_code, item_name, item_price, item_total)
VALUES (2341, 'Promag Tablet', 3000, 100),
       (2342, 'Hydro Coco 250ML', 7000, 20),
       (2343, 'Nutrieve Benecol 100ML', 20000, 30),
       (2344, 'Blackmores Vit C 500Mg', 95000, 45),
       (2345, 'Entrasol Gold 370G', 90000, 120);

SELECT *
FROM inventory;

-- Show Item_name that has the highest number in Item_total
SELECT item_name
FROM inventory
ORDER BY item_total DESC
LIMIT 1;

-- Update the Item_price of the output of question bullet
UPDATE inventory
SET Item_price = 97000
WHERE item_name = (SELECT item_name
                   FROM inventory
                   ORDER BY item_total DESC
                   LIMIT 1);

SELECT *
FROM inventory;

-- What will happen if we insert another Item_name with Item_code of 2343 into the table?
INSERT INTO inventory (item_code, item_name, item_price, item_total)
VALUES (2343, 'Tester Product', 8000, 90);


-- Delete the Item_name that has the lowest number of Item_total

SELECT *
FROM inventory;

DELETE
FROM inventory
WHERE item_total = (SELECT MIN(item_total)
                    FROM inventory);


SELECT *
FROM inventory;


-- TASK 5
CREATE TABLE customers
(
    order_no        SERIAL PRIMARY KEY,
    purchase_amount INT     NOT NULL,
    order_date      DATE    NOT NULL,
    customer_id     VARCHAR NOT NULL,
    salesman_id     VARCHAR NOT NULL
);

INSERT INTO customers (order_no, purchase_amount, order_date, customer_id, salesman_id)
VALUES (10001, 150, '2022-10-05', '2005', '3002'),
       (10009, 270, '2022-09-10', '2003', '3005'),
       (10002, 65, '2022-10-05', '2002', '3001'),
       (10004, 110, '2022-08-17', '2009', '3003'),
       (10007, 948, '2022-09-10', '2005', '3002'),
       (10005, 2400, '2022-07-27', '2007', '3001');

SELECT *
FROM customers;

-- Create a Query to display all customer orders where
-- purchase amount is less than 100 or exclude those
-- orders which order date is on or greater than 25 Aug
-- 2022 and customer id is above 2001. Sample table:
-- customer_orders

SELECT * FROM customers
    WHERE (purchase_amount < 100)
        AND (order_date) >= '2022-08-25'
        AND customer_id::integer > 2001;

-- TASK 6


-- TASK 7

CREATE TABLE Time (
                      time_id SERIAL PRIMARY KEY,
                      sale_date DATE,
                      sale_month INTEGER,
                      sale_year INTEGER
);

CREATE TABLE Product (
                         product_id SERIAL PRIMARY KEY,
                         product_name VARCHAR(100),
                         category VARCHAR(50)
);

CREATE TABLE Store (
                       store_id SERIAL PRIMARY KEY,
                       store_name VARCHAR(100),
                       location VARCHAR(100)
);

CREATE TABLE Customer (
                          customer_id SERIAL PRIMARY KEY,
                          customer_name VARCHAR(100),
                          age INTEGER,
                          gender VARCHAR(10)
);

CREATE TABLE Employee (
                          employee_id SERIAL PRIMARY KEY,
                          employee_name VARCHAR(100),
                          role VARCHAR(50)
);

CREATE TABLE Sales (
                       sale_id SERIAL PRIMARY KEY,
                       time_id INTEGER REFERENCES Time(time_id),
                       product_id INTEGER REFERENCES Product(product_id),
                       store_id INTEGER REFERENCES Store(store_id),
                       customer_id INTEGER REFERENCES Customer(customer_id),
                       employee_id INTEGER REFERENCES Employee(employee_id),
                       sales_amount NUMERIC(10, 2),
                       quantity_sold INTEGER
);

