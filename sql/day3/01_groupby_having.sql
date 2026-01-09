USE bigdata_sql;

-- Q1: Nombre de commandes par client
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Q2: Total dépensé par client
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Q3: Moyenne des montants par client
SELECT customer_id, AVG(amount) AS avg_amount
FROM orders
GROUP BY customer_id;

-- Q4: Clients avec total_spent > 300
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 300;

-- Q5: Nombre de commandes par status
SELECT status, COUNT(*) AS total
FROM orders
GROUP BY status;
