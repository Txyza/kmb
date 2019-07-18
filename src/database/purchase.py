from database.db import *


def check_money(customer, count_of_product, product):
    query_cust = '''select 
                      id_user as "id Покупателя", 
                      amount_of_money  
                    from "Users" 
                    where id_user = {}'''.format(customer)
    result = sql_exec(query_cust)
    money = result[0][1]
    query_prod = '''select 
                      pp.id_it, 
                      pp.amount, 
                      p.price 
                    from "Products_at_point_of_sale" pp 
                      join "Products" p on pp.id_it = p.id_it 
                    where pp.id_it = {}'''.format(product)
    result = sql_exec(query_prod)
    price = result[0][2]
    sum = price * count_of_product
    if (sum > money):
        raise Exception('Покупка невозможна. Не хвататет денег')
    else:
        return customer, sum, count_of_product, product



def check_count_it(product, count_of_product):
    query_prod = '''select 
                      pp.id_it, 
                      pp.amount, 
                      p.price 
                    from "Products_at_point_of_sale" pp 
                      join "Products" p on pp.id_it = p.id_it 
                    where pp.id_it = {}'''.format(product)
    result = sql_exec(query_prod)
    amount_on_point = result[0][1]
    if (amount_on_point < count_of_product):
        raise Exception('Покупка невозможна. Не хвататет товара на складе')


def get_wh(seller):
    query_sel = '''select 
                     id_seller as "id Продавца", 
                     id_wh as "Точка продаж" 
                    from "Point_of_sale" 
                    where id_seller = {}'''.format(seller)
    result = sql_exec(query_sel)
    wh = result[0][1]
    return wh


def purchase(customer, seller, count_of_product, product):
    try:
        cust_result = check_money(customer, count_of_product, product)
        check_count_it(cust_result[3], cust_result[2])
        wh = get_wh(seller)
        query_sale = '''insert into "Sales" ("id_seller", "id_customer", "price", "amount", "id_wh", "id_it") 
                          values (
                            {id_seller}, 
                            {id_customer}, 
                            {price}, 
                            {amount}, 
                            {id_wh}, 
                            {id_it})'''.format(id_seller = seller, id_customer = cust_result[0], price = cust_result[1], amount = cust_result[2], id_wh = wh, id_it = cust_result[3])
        sql_exec(query_sale)
    except Exception as err:
        print('Ошибка!')
        print(err)

purchase(2, 1, 20, 1)
