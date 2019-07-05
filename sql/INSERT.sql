insert into "Roles" ("name")
	values ('Продавец');

insert into "Roles" ("name")
	values ('Покупатель');

insert into "Users" ("name", "id_role")
	values ('Катя', 1);
	
insert into "Users" ("name", "id_role")
	values ('Антон', 2);

insert into "Products" ("name", "price", "amount")
	values ('Хлеб', 35, 128);	

insert into "Products" ("name", "price", "amount")
	values ('Snickers', 37, 56);	
	
insert into "Sales" ("id_seller", "id_customer", "price", "amount", "id_wh")
	values (1, 2, 70, 2, 1);	
	
insert into "Detailed_product_description" ("id_it", "product_photo", "descrip")
	values (1, 'http://catcut.net/ZJAB', 'Это хлеб');
	
insert into "Detailed_product_description" ("id_it", "product_photo", "descrip")
	values (2, 'http://catcut.net/fKAB', 'Это сникерс');
	
insert into "Point_of_sale" ("name")
	values ('Магазин');	

insert into "Products_at_point_of_sale" ("id_wh", "id_it", "amount")
	values (1, 1, 10);
	
insert into "Point_of_sale_description" ("id_wh", "descrip")
	values (1, 'Это магазин');