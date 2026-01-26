USE bigdata_sql;

-- Q1: Afficher chaque commande + le total dépensé par le client (sans GROUP BY)
-- Indice: SUM(amount) OVER (PARTITION BY customer_id)
-- WRITE HERE
SELECT
  order_id,
  customer_id,
  amount,
  status,
  order_date,
  SUM(amount) OVER (PARTITION BY customer_id) AS total_spent_by_customer
FROM orders;

-- Q2: Afficher chaque commande + la moyenne des montants par client
-- Indice: AVG(amount) OVER (PARTITION BY customer_id)
-- WRITE HERE
SELECT
  order_id,
  customer_id,
  amount,
  status,
  order_date,
  AVG(amount) OVER (PARTITION BY customer_id) AS avg_amount_by_customer
FROM orders;

-- Q3: Numéroter les commandes de chaque client par date (la plus ancienne -> la plus récente)
-- Indice: ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date)
-- WRITE HERE
SELECT
  order_id,
  customer_id,
  amount,
  status,
  order_date,
  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number
FROM orders;

-- Q4: Classer toutes les commandes par montant (du plus grand au plus petit) avec RANK()
-- WRITE HERE
SELECT
  order_id,
  customer_id,
  amount,
  status,
  order_date,
  RANK() OVER (ORDER BY amount DESC) AS amount_rank
FROM orders;

-- Q5: Pour chaque client, afficher la somme cumulée (running total) des montants par date
-- Indice: SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date)
-- WRITE HERE
SELECT
  order_id,
  customer_id,
  amount,
  status,
  order_date,
  SUM(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM orders;
