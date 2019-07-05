drop table if exists "Users" cascade;
drop table if exists "Roles" cascade;
drop table if exists "Products" cascade;
drop table if exists "Sales" cascade;
drop table if exists "Detailed_product_description" cascade;
drop table if exists "Point_of_sale" cascade;
drop table if exists "Products_at_point_of_sale" cascade;
drop table if exists "Point_of_sale_description" cascade;

create table if not exists "Users" ( 
	"id_user" serial not null,
	"name" text not null,
	"id_role" int not null,
	primary key ("id_user")
);

create table if not exists "Roles" ( 
	"id_role" serial not null,
	"name" text not null,
	primary key ("id_role")
);

create table if not exists "Products" ( 
	"id_it" serial not null,
	"name" text not null,
	"price" money not null,
	"amount" int not null,
	primary key ("id_it")
);

create table if not exists "Sales" ( 
	"id_sales" serial not null,
	"id_seller" int not null,
	"id_customer" int not null,
	"price" money not null,
	"amount" int not null,
	"id_wh" int not null,
	primary key ("id_sales")
);

create table if not exists "Detailed_product_description" ( 
	"id_it" int not null,
	"product_photo" text not null,
	"descrip" text not null
);

create table if not exists "Point_of_sale" ( 
	"id_wh" serial not null,
	"name" text not null,
	primary key ("id_wh")
);

create table if not exists "Products_at_point_of_sale" ( 
	"id_wh" int not null,
	"id_it" int not null,
	"amount" int not null
);

create table if not exists "Point_of_sale_description" ( 
	"id_wh" int not null,
	"descrip" text not null
);

alter table "Users" 
	add constraint "User_role_fk" foreign key ("id_role") references "Roles" ("id_role");