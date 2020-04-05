import mysql.connector
from mysql.connector import Error
import json
from os import getcwd, chdir

cwd = getcwd()

if 'sql_pack' not in cwd.split('/'):
	if 'utils' not in cwd.split('/'):
		chdir(cwd + '/utils/sql_pack/')
	else:
		chdir(cwd + '/sql_pack/')

with open('classified.json', 'r') as top_secret_stuff:
	database_credentials = top_secret_stuff.read()
	data = json.loads(database_credentials)[0]

chdir(cwd)

def create_conn():
	conn = mysql.connector.connect(host=data['database']['host'],
											port = data['database']['port'],
											user=data['credentials']['user'],
											password=data['credentials']['password'],
											db=data['database']['db'],
											charset=data['database']['charset'])
	try:
		if conn.is_connected():
			db_Info = conn.get_server_info()
			#print("Connected to MySQL database... MySQL Server version:",db_Info)
			cursor = conn.cursor()
			cursor.execute("select database();")
			record = cursor.fetchone()
			#print("Youre connected to -", record)
			return conn
	except Error as err:
		print ("Error while connecting to MySQL", err)
	finally:
		#closing database connection.
		if(conn.is_connected()):
			cursor.close()
			#print("MySQL Test Cursor has closed")
			#print("CONNECTION IS OPEN, PLEASE CLOSE CONNECTION WITH close_conn WHEN DONE")

def close_conn(connection):
	if(connection.is_connected()):
			connection.close()
			print("MySQL connection has closed")

#TO CREATE A CURSOR CONNECTING TO THE DATABASE USE THE FOLLOWING CODE:
# import database_config
# conn = database_config.create_conn()
# cursor = conn.cursor()