update "Products"
set price = 40
where name = 'Хлеб';

update "Users"
set id_role = 2
where name = 'Катя';

alter table "Users"
  add column amount_of_money money;

alter table "Point_of_sale"
  add column id_customer int;

update "Point_of_sale"
  set id_seller = 1
  where name = 'Магазин'
  
alter table "Sales"
  add column id_it int;

update "Sales"
  set id_it = 1
  where id_sales = 1;
  
update "Sales"
  set id_it = 1
  where id_sales = 2;
  
update "Sales"
  set id_it = 2
  where id_sales = 3;
  
update "Sales"
  set id_it = 3
  where id_sales = 4;