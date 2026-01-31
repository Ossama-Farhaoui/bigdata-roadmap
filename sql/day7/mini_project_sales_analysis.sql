USE bigdata_sql;

-- =========================
-- MINI PROJET SQL
-- Analyse des ventes
-- =========================

-- KPI 1: Nombre total de commandes
SELECT COUNT(*) AS total_orders
FROM orders;

-- KPI 2: Chiffre d’affaires total
SELECT SUM(amount) AS total_revenue
FROM orders;

-- KPI 3: Chiffre d’affaires par client
SELECT
  c.full_name,
  SUM(o.amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY revenue DESC;

-- KPI 4: Nombre de commandes par statut
SELECT status, COUNT(*) AS total
FROM orders
GROUP BY status;

-- KPI 5: Top 3 clients par chiffre d’affaires
SELECT
  c.full_name,
  SUM(o.amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY revenue DESC
LIMIT 3;

-- KPI 6: Chiffre d’affaires par mois
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;
