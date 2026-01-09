USE bigdata_sql;

-- Q1: INNER JOIN clients + commandes
SELECT
  c.full_name,
  o.order_id,
  o.amount,
  o.status,
  o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Q2: Total des montants par client
SELECT
  c.full_name,
  SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name;

-- Q3: Clients avec commandes 'paid'
SELECT DISTINCT
  c.full_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.status = 'paid';

-- Q4: LEFT JOIN (clients même sans commande)
SELECT
  c.full_name,
  o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
