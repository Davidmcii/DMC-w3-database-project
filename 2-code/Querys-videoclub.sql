-- 1 cantidad de peliculas clasificadas por rating

select count(rating) as quantity, rating
from filmactor as fa
left join actor as a
on a.actor_id=fa.actor_id
left join film as f
on f.film_id=fa.film_id
group by rating
order by rating asc;

-- 2 Actores por película

select count(a.actor_id) as cuenta, a.complete_name 
from filmactor as fa
left join actor as a
on a.actor_id=fa.actor_id
left join film as f
on f.film_id=fa.film_id
group by a.actor_id

order by cuenta desc;

-- 3 peliculas con más actores

select count(f.film_id) as cuenta, f.title 
from filmactor as fa
left join actor as a
on a.actor_id=fa.actor_id
left join film as f
on f.film_id=fa.film_id
group by f.film_id

order by cuenta desc;

-- 4 Cuantas películas hay de cada lengua

select count(f.title) as cuenta, lan.name
from filmactor as fa
left join actor as a
on a.actor_id=fa.actor_id
left join film as f
on f.film_id=fa.film_id
left join language as lan
on f.language_id= lan.language_id 
group by f.language_id
;

-- 5 Cliente más alquilador

select r.customer_id, count(title) as mas_alquilador

from rental as r
left join inventory as i
on i.inventory_id=r.inventory_id
left join film as f
on f.film_id=i.film_id

group by r.customer_id

order by mas_alquilador desc;


-- 6 pelicula más alquilada

select count(f.title) as mas_alquiladas, f.title

from rental as r
left join inventory as i
on i.inventory_id=r.inventory_id
left join film as f
on f.film_id=i.film_id

group by f.film_id
order by mas_alquiladas desc
;

-- 7 dinero generado por cada pelicula

select sum(rental_rate)  as ganancias_per_film, f.title

from rental as r
left join inventory as i
on i.inventory_id=r.inventory_id
left join film as f
on f.film_id=i.film_id

group by f.film_id
order by ganancias_per_film desc
;

-- 8 dinero generado por cada actor

select sum(f.rental_rate) as ganancias_per_actor, a.complete_name
from filmactor as fa
left join actor as a
on a.actor_id=fa.actor_id
left join film as f
on f.film_id=fa.film_id
left join inventory as i
on f.film_id=i.film_id
left join rental as r
on i.inventory_id=r.inventory_id
group by a.actor_id
order by ganancias_per_actor desc
;


--  9 5 actores más alquilados por veces

select a.complete_name, count(a.complete_name) as actor_mas_alquilado

from rental as r 
left join inventory as i
on i.inventory_id=r.inventory_id
left join film as f
on f.film_id=i.film_id
left join filmactor as fa
on fa.film_id=i.film_id
left join actor as a
on a.actor_id=fa.actor_id

group by  complete_name 

order by actor_mas_alquilado desc limit 5;

-- varias peliculas sin actores, comprobación
select *
from film as f
left join filmactor as fa
on fa.film_id=f.film_id

 where title="balloon homeward" or title= "beauty grease" or title = "crazy home";

-- 10 categorias de mas titulos hay

select count(f.title) as pelis_per_cat, cat.category_id, cat.name
from category as cat
left join film as f
on f.category_id=cat.category_id


group by category_id

order by pelis_per_cat desc
;

-- 11 mas alquilados por categoria

select count(cat.name) as cuenta, name
from rental as r
left join inventory as i
on i.inventory_id=r.inventory_id
left join film as f
on f.film_id=i.film_id
left join category as cat
on cat.category_id=f.category_id

group by cat.category_id

order by cuenta desc

;
