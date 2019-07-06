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
  prod.id_it as "id Товара",
  prod.name as "Название товара",
  dpd.product_photo as "Фото товара",
  dpd.descrip as "Описание товара",
  prod.price as "Цена товара",
  prod.amount as "Количество всего",
  pp.id_wh as "Точка продаж",
  pp.amount as "Количество на точке"
from "Products" prod
  left join "Detailed_product_description" dpd on prod.id_it = dpd.id_it
  left join "Products_at_point_of_sale" pp on prod.id_it = pp.id_it;
	
/*Вывести всю информацию о точке продаж.*/
select 
  p.id_wh as "id Точки продаж",
  p.name as "Имя точки продаж",
  pd.descrip as "Описание точки продаж",
  pp.id_it as "Товар",
  pp.amount as "Количество"
from "Point_of_sale" p 
  left join "Products_at_point_of_sale" pp on p.id_wh = pp.id_wh
  left join "Point_of_sale_description" pd on p.id_wh = pd.id_wh;

