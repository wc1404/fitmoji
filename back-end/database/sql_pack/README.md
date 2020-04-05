# Database SQL Pack

Python SQL calls using mysql-connector to fetch and push data

Dependencies:
mysql-connector

TO CREATE A CURSOR CONNECTING TO THE DATABASE USE THE FOLLOWING:
import global_func
conn = global_func.create_conn()
cursor = conn.cursor()

TO CLOSE CONNECTION TO DATABASE USE THE FOLLOWING:
cursor.close()
global_func.close_conn(conn)