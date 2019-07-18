from database.db import *


def purchase(customer, seller, count_of_product, product):
    query_cust = 'select id_user as "id Покупателя", amount_of_money  from "Users" where id_user = ' + customer.__str__()
    result = sql_exec(query_cust)
    money = result[0][1]
    query_sel = 'select id_seller as "id Продавца", id_wh as "Точка продаж" from "Point_of_sale" \n' \
                'where id_seller = ' + seller.__str__()
    result = sql_exec(query_sel)
    wh = result[0][1]
    query_prod = 'select pp.id_it, pp.amount, p.price from "Products_at_point_of_sale" pp \n' \
                 'join "Products" p on pp.id_it = p.id_it where pp.id_it = ' + product.__str__()
    result = sql_exec(query_prod)
    price = result[0][2]
    amount_on_point = result[0][1]
    sum = price * count_of_product

    if (sum > money):
        print('Покупка невозможна. Не хватает денег')
    elif (amount_on_point < count_of_product):
        print('Покупка невозможна. Не хвататет товара на складе')
    else:
        query_sale = 'insert into "Sales" ("id_seller", "id_customer", "price", "amount", "id_wh", "id_it") values (%d, %d, %f, %d, %d, %d)' % (seller, customer, sum, count_of_product, wh, product)
        sql_exec(query_sale)
