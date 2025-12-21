-- Day 1 - Setup MySQL
CREATE DATABASE IF NOT EXISTS bigdata_sql;
USE bigdata_sql;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name   VARCHAR(100) NOT NULL,
  city        VARCHAR(60)  NOT NULL
);

CREATE TABLE orders (
  order_id    INT PRIMARY KEY,
  customer_id INT NOT NULL,
  amount      DECIMAL(10,2) NOT NULL,
  status      VARCHAR(20) NOT NULL,
  order_date  DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1,'Ahmed El Amrani','Meknes'),
(2,'Sara Bennani','Rabat'),
(3,'Youssef El Idrissi','Casablanca'),
(4,'Khadija Ait Ali','Fes'),
(5,'Omar Chraibi','Marrakech');

INSERT INTO orders (order_id, customer_id, amount, status, order_date) VALUES
(101,1,250.00,'paid','2025-01-10'),
(102,1,120.50,'paid','2025-01-12'),
(103,2,500.00,'pending','2025-01-15'),
(104,3,80.00,'canceled','2025-02-01'),
(105,3,300.00,'paid','2025-02-03'),
(106,4,150.00,'paid','2025-02-10'),
(107,5,700.00,'pending','2025-03-05');
