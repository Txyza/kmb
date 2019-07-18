from database.db import *


def check_seller(id_seller):
    query_sel = '''select 
                     u.id_user as "id Продавца",
                     u.amount_of_money as "Количество денег",
                     r.name
                   from "Users" u
                     join "Roles" r on u.id_role = r.id_role
                   where id_user = {}'''.format(id_seller)
    result = sql_exec(query_sel)
    money = result[0][1]
    if 'Продавец' in result[0]:
        return id_seller, money
    else:
        raise Exception("Выбран покупатель")


def check_money(id_seller, id_it, count_of_product):
    seller = check_seller(id_seller)
    query_prod = '''select 
                    id_it as "id Товара", 
                    price as "Цена товара"
                  from "Products" 
                  where id_it = {}'''.format(id_it)
    result = sql_exec(query_prod)
    price = result[0][1]
    sum = count_of_product * price
    if sum > seller[1]:
        raise Exception("Не хвататет денег на приобретение")
    else:
        rest_of_money = seller[1] - sum
        return id_it, count_of_product, rest_of_money


def check_seller_on_wh(id_seller, id_wh):
    query_wh = '''select 
                        id_wh as "id Точки продаж", 
                        id_seller as "Продавец на точке"
                      from "Point_of_sale" 
                      where id_wh = {}'''.format(id_wh)
    result = sql_exec(query_wh)
    seller = result[0][1]
    if id_seller != seller:
        raise Exception("Заданый продавец не соответствует заданой точке")
    else:
        return id_wh


def new_it(id_seller, id_it, count_of_product, id_wh):
    try:
        result = check_money(id_seller, id_it, count_of_product)
        id_it = result[0]
        count_of_product = result[1]
        id_wh = check_seller_on_wh(id_seller, id_wh)
        query_wh = '''insert into "Products_at_point_of_sale" ("id_wh", "id_it", "amount") 
                          values (
                            {id_wh}, 
                            {id_it}, 
                            {amount})'''.format(id_wh=id_wh, id_it=id_it, amount=count_of_product)
        sql_exec(query_wh)
        query_count_prod_user = '''select 
                                    amount as "id Количество товара"
                                  from "User_products"'''
        result = sql_exec(query_count_prod_user)
        count_of_product += result[0][0]
        query_update = '''update "User_products"
                              set
                                amount = {amount}
                              where id_user = {id_user}'''.format(id_user=id_seller, amount=count_of_product)
        sql_exec(query_update)
    except Exception as err:
        print("Ошибка!")
        print(err)
