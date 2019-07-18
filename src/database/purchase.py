from database.db import *


def check_money(customer, count_of_product, product):
    query_cust = 'select id_user as "id Покупателя", amount_of_money  from "Users" where id_user = ' + customer.__str__()
    result = sql_exec(query_cust)
    money = result[0][1]
    query_prod = 'select pp.id_it, pp.amount, p.price from "Products_at_point_of_sale" pp \n' \
                 'join "Products" p on pp.id_it = p.id_it where pp.id_it = ' + product.__str__()
    result = sql_exec(query_prod)
    price = result[0][2]
    sum = price * count_of_product
    if (sum > money):
        print('Покупка невозможна. Не хватает денег')
    else:
        return customer, sum, count_of_product, product


def check_count_it(product, count_of_product):
    query_prod = 'select pp.id_it, pp.amount, p.price from "Products_at_point_of_sale" pp \n' \
                 'join "Products" p on pp.id_it = p.id_it where pp.id_it = ' + product.__str__()
    result = sql_exec(query_prod)
    amount_on_point = result[0][1]
    if (amount_on_point < count_of_product):
        print('Покупка невозможна. Не хвататет товара на складе')


def get_wh(seller):
    query_sel = 'select id_seller as "id Продавца", id_wh as "Точка продаж" from "Point_of_sale" \n' \
                'where id_seller = ' + seller.__str__()
    result = sql_exec(query_sel)
    wh = result[0][1]
    return wh


def purchase(customer, seller, count_of_product, product):
    cust_result = check_money(customer, count_of_product, product)
    check_count_it(cust_result[3], cust_result[2])
    wh = get_wh(seller)
    query_sale = 'insert into "Sales" ("id_seller", "id_customer", "price", "amount", "id_wh", "id_it") values (%d, %d, %f, %d, %d, %d)' % (seller, cust_result[0], cust_result[1], cust_result[2], wh, cust_result[3])
    sql_exec(query_sale)
