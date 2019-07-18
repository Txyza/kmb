import psycopg2 as p
from psycopg2.extras import RealDictCursor


def get_connection():
    connect = p.connect(host='localhost', dbname='KMB', user='postgres', password='qwaszx136')
    return connect


def sql_exec(query):
    conn = get_connection()
    cur = conn.cursor()
    conn.cursor(cursor_factory=RealDictCursor)
    cur.execute(query)
    if "select" in query:
        rows = cur.fetchall()
        return rows
    if "insert into" in query:
        conn.commit()
    #print(rows)


def exec_file(file):
    f = open(file)
    q = f.read()
    sql_exec(q)


