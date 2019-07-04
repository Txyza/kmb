DROP TABLE IF EXISTS "Users" CASCADE;
DROP TABLE IF EXISTS "Roles" CASCADE;
DROP TABLE IF EXISTS "Products" CASCADE;
DROP TABLE IF EXISTS "Sales" CASCADE;
DROP TABLE IF EXISTS "Detailed_product_description" CASCADE;
DROP TABLE IF EXISTS "Point_of_sale" CASCADE;
DROP TABLE IF EXISTS "Products_at_point_of_sale" CASCADE;
DROP TABLE IF EXISTS "Descrip_point_of_sale" CASCADE;

CREATE TABLE IF NOT EXISTS "Users" ( 
	"id_user" serial not null,
	"name" text not null,
	"id_role" int not null,
	PRIMARY KEY ("id_user")
);

CREATE TABLE IF NOT EXISTS "Roles" ( 
	"id_role" serial not null,
	"name" text not null,
	PRIMARY KEY ("id_role")
);

CREATE TABLE IF NOT EXISTS "Products" ( 
	"id_it" serial not null,
	"name" text not null,
	"price" money not null,
	"amount" int not null,
	PRIMARY KEY ("id_it")
);

CREATE TABLE IF NOT EXISTS "Sales" ( 
	"id_sales" serial not null,
	"id_seller" int not null,
	"id_customer" int not null,
	"price" money not null,
	"amount" int not null,
	"id_wh" int not null,
	PRIMARY KEY ("id_sales")
);

CREATE TABLE IF NOT EXISTS "Detailed_product_description" ( 
	"id_it" int not null,
	"product_photo" text not null,
	"descrip" text not null
);

CREATE TABLE IF NOT EXISTS "Point_of_sale" ( 
	"id_wh" serial not null,
	"name" text not null,
	PRIMARY KEY ("id_wh")
);

CREATE TABLE IF NOT EXISTS "Products_at_point_of_sale" ( 
	"id_wh" int not null,
	"id_it" int not null,
	"amount" int not null
);

CREATE TABLE IF NOT EXISTS "Descrip_point_of_sale" ( 
	"id_wh" int not null,
	"decrip" text not null
);

ALTER TABLE "Users" 
	ADD CONSTRAINT "User_role_fk" FOREIGN KEY ("id_role") REFERENCES "Roles" ("id_role");

/*ALTER TABLE "Sales" 
	ADD CONSTRAINT "Sale_price_fk" FOREIGN KEY ("price") REFERENCES "Products" ("price");*/