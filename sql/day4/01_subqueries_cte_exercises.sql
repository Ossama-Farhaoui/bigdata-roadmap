USE bigdata_sql;

-- Q1: Afficher les commandes dont le montant est supérieur à la moyenne
-- WRITE HERE
with avg_amount AS (
select AVG(amount) AS avg_val FROM orders)
select *
from orders
where amount > (select avg_val from avg_amount);

-- Q2: Afficher les clients qui ont au moins une commande
-- WRITE HERE
select distinct c.customer_id,c.full_name
from customers c
inner join orders o
on c.customer_id= o.customer_id ;

-- Q3: Afficher les clients dont le total dépensé est supérieur à la moyenne des totaux
-- WRITE HERE
select customer_id, sum(amount)as total_spent
from orders
group by customer_id
having sum(amount) > (
   select avg(total_per_customer)
   from(
   select sum(amount) as total_per_customer
   from orders
   group by customer_id
   )t
);

-- Q4: Refaire Q1 avec une CTE (WITH)
-- WRITE HERE
WITH avg_amount AS (
  SELECT AVG(amount) AS avg_val FROM orders
)
SELECT *
FROM orders
WHERE amount > (SELECT avg_val FROM avg_amount);


-- Q5: Refaire Q3 avec une CTE (WITH)
-- WRITE HERE
WITH totals AS (
  SELECT customer_id, SUM(amount) AS total_spent
  FROM orders
  GROUP BY customer_id
),
avg_totals AS (
  SELECT AVG(total_spent) AS avg_total
  FROM totals
)
SELECT t.customer_id, t.total_spent
FROM totals t
WHERE t.total_spent > (SELECT avg_total FROM avg_totals);
