INSERT INTO "Roles" 
	VALUES (1, 'Продавец');

INSERT INTO "Roles" 
	VALUES (2, 'Покупатель');

INSERT INTO "Users" 
	VALUES (1, 'Катя', 1);
	
INSERT INTO "Users" 
	VALUES (2, 'Антон', 2);

INSERT INTO "Products" 
	VALUES (1, 'Хлеб', 35, 128);	

INSERT INTO "Products" 
	VALUES (2, 'Snickers', 37, 56);	
	
INSERT INTO "Sales" 
	VALUES (1, 1, 2, 1, 70, 2, 1);	
	
INSERT INTO "Detailed_product_description"
	VALUES (1, 'http://catcut.net/ZJAB', 'Это хлеб');
	
INSERT INTO "Detailed_product_description"
	VALUES (2, 'http://catcut.net/fKAB', 'Это сникерс');
	
INSERT INTO "Point_of_sale" 
	VALUES (1, 'Магазин');	

INSERT INTO "Products_at_point_of_sale" 
	VALUES (1, 1, 10);
	
INSERT INTO "Descrip_point_of_sale" 
	VALUES (1, 'Это магазин');