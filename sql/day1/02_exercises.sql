USE bigdata_sql;

-- Q1: Afficher tous les clients
-- WRITE HERE
select* 
from customers;


-- Q2: Afficher seulement full_name et city
-- WRITE HERE
select full_name,city
from customers ;
-- Q3: Afficher les commandes avec status = 'paid'
-- WRITE HERE
select *
from orders
where status = 'paid';
-- Q4: Afficher les commandes triées par amount décroissant
-- WRITE HERE
select*
from orders
order by amount desc;

-- Q5: Afficher le total des commandes (COUNT)
-- WRITE HERE
select count(*) as total_orders
from orders; 
-- Q6: Afficher le total du montant (SUM(amount))
-- WRITE HERE
select sum(amount) as total_amount
from orders ;

-- Q7: Afficher les commandes entre '2025-02-01' et '2025-02-28'
-- WRITE HERE
select *
from orders 
where order_date between '2025-02-02' and '2025-02-28';
-- Q8: Afficher les commandes avec amount >= 300
-- WRITE HERE
select*
from orders 
where amount >= 300;
-- Q9: Afficher les villes distinctes des clients
-- WRITE HERE
select distinct city
from customers;
-- Q10: Afficher les 3 plus grosses commandes
-- WRITE HERE
select*
from orders 
order by amount desc
limit 3 ;