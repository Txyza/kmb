/*Вывести все товары на заданной точке продаж.*/
select pp.id_it as "id Товара", p.name as "Точка продаж"
	from "Products_at_point_of_sale" pp 
	inner join "Point_of_sale" p on p.id_wh=pp.id_wh where pp.id_wh = 1;
	
/*Вывести все продажи пользователя.*/
select s.id_sales as "id Продажи", u.name as "Имя продавца"
	from "Sales" s 
	inner join "Users" u on u.id_user=s.id_seller where s.id_seller = 1;
	
/*Вывести все покупки пользователя.*/
select s.id_sales as "id Продажи", u.name as "Имя Покупателя"
	from "Sales" s 
	inner join "Users" u on u.id_user=s.id_customer where s.id_customer = 2;
	
/*Вывести количество, которое пользователь продал и купил.*/
select s.id_sales as "id Продажи", s.amount as "Количество", u.name as "Имя Покупателя/Продавца"
	from "Sales" s 
	inner join "Users" u on u.id_user=s.id_customer where u.id_user = 2;
	
/*Вывести всю информацию о товаре.*/
select id_it as "id Товара", product_photo as "Фото товара", descrip as "Описание товара"
	from "Detailed_product_description" where id_it = 1;
	
/*Вывести всю информацию о точке продаж.*/
select p.id_wh as "id Точки продаж", p.name as "Имя точки продаж", pp.id_it as "Товар", pp.amount as "Количество"
	from "Point_of_sale" p 
	inner join "Products_at_point_of_sale" pp on p.id_wh = pp.id_wh where p.id_wh = 1;
	