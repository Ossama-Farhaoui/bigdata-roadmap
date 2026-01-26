USE bigdata_sql;

-- Q1: Voir le plan d'exécution (avant index) pour une recherche par customer_id
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 3;

-- Q2: Créer un index sur orders(customer_id)
-- WRITE HERE
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
-- Q3: Revoir le plan d'exécution (après index)
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 3;

-- Q4: Créer un index sur orders(order_date)
-- WRITE HERE
CREATE INDEX idx_orders_order_date ON orders(order_date);
-- Q5: EXPLAIN sur une requête avec filtre date + tri
EXPLAIN
SELECT *
FROM orders
WHERE order_date >= '2025-02-01'
ORDER BY order_date;

-- Q6: (BONNE PRATIQUE) Sélectionner seulement les colonnes utiles (éviter SELECT *)
-- Exemple: afficher order_id, amount, order_date pour customer_id=1
-- WRITE HERE
SELECT order_id, amount, order_date
FROM orders
WHERE customer_id = 1;

