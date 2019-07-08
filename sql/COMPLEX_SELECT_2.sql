/*Вывести все продажи пользователей “Продавцов”*/
select
  u.id_user as "id Пользователя",
  u.name as "Имя",
  s.id_sales as "id Продажи",
  s.id_wh as "id Точки продаж",
  s.price as "Цена",
  s.amount as "Количество"
from "Users" u
  left join "Sales" s on u.id_user = s.id_seller
where u.id_role = 1;
/*Вывести список пользователей с их ролями*/
select
  u.id_user as "id Пользователя",
  u.name as "Имя",
  u.id_role as "id Роли",
  r.name as "Название роли"
from "Users" u
  join "Roles" r on u.id_role = r.id_role;
/*Вывести список Продавцов и тех, кто у них купил товар*/
select
  u.id_user as "id Продавца",
  u.name as "Имя продавца",
  us.id_user as "id Покупателя",
  us.name as "Имя покупателя"
from "Users" u 
  left join "Sales" s on u.id_user = s.id_seller 
  left join "Users" us on s.id_customer = us.id_user 
where u.id_role = 1
/*Вывести все покупки конкретного пользователя*/
select 
  s.id_sales as "id Покупки",
  u.name as "Имя Покупателя"
from "Sales" s 
  right join "Users" u on u.id_user=s.id_customer
where u.id_user = 2;
/*Вывести все продажи конкретного пользователя*/
select 
  s.id_sales as "id Продажи",
  u.name as "Имя продавца"
from "Sales" s 
  right join "Users" u on u.id_user=s.id_seller
where u.id_user = 1;
/*Вывести записи, в которых имеются ошибки. К примеру “Покупатель” не может продавать товары*/
(select
  u.name as "Имя покупателя-продавца",
  s.id_sales as "id_Продажи-покупки"
from "Users" u
  join "Sales" s on u.id_user = s.id_seller
where u.id_role = 2)
union
(select
  u.name as "Имя покупателя-продавца",
  s.id_sales as "id_Продажи-покупки"
from "Users" u
  join "Sales" s on u.id_user = s.id_customer
where u.id_role = 1)