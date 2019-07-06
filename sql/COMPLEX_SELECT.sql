/*Вывести все товары на заданной точке продаж.*/
select 
  pp.id_it as "id Товара",
  p.name as "Точка продаж"
from "Products_at_point_of_sale" pp 
  join "Point_of_sale" p on p.id_wh=pp.id_wh
where pp.id_wh = 1;
	
/*Вывести все продажи пользователя.???*/
select 
  s.id_sales as "id Продажи",
  u.name as "Имя продавца"
from "Sales" s 
  right join "Users" u on u.id_user=s.id_seller;
	
/*Вывести все покупки пользователя.???*/
select 
  s.id_sales as "id Продажи",
  u.name as "Имя Покупателя"
from "Sales" s 
  right join "Users" u on u.id_user=s.id_customer;
	
/*Вывести количество, которое пользователь продал и купил.*/
select 
  s.id_sales as "id Продажи",
  s.amount as "Количество",
  u.name as "Имя Продавца/покупателя",
  u.id_role as "Продавец/покупатель"
from "Sales" s 
  right join "Users" u on u.id_user=s.id_customer or u.id_user=s.id_seller;
	
/*Вывести всю информацию о товаре.*/
select 
  id_it as "id Товара",
  product_photo as "Фото товара",
  descrip as "Описание товара"
from "Detailed_product_description";
	
/*Вывести всю информацию о точке продаж.*/
select 
  p.id_wh as "id Точки продаж",
  p.name as "Имя точки продаж",
  pp.id_it as "Товар",
  pp.amount as "Количество"
from "Point_of_sale" p 
  join "Products_at_point_of_sale" pp on p.id_wh = pp.id_wh
where p.id_wh = 1;

