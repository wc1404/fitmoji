#Imports
import global_func

def get(creator_id, attributes = ['*']):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	#Prepare and execute statement
	query = global_func.prepare_get_query('friend', 'creator_id', attributes)
	print(query)
	cursor.execute(query, (creator_id,))

	#get and return data
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data

def insert(values, data):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'INSERT INTO friend %s VALUES %s' % (values, data)
	print(query)

	cursor.execute(query)
	global_func.conn.commit()

	query = 'SELECT LAST_INSERT_ID();'
	cursor.execute(query)
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data[0]

def update(creator_id, reciever_id, new_data): # New Data should be a list of tuples where (ATTRIBUTE, NEW_DATA)
	primary_key = [('creator_id', '"' + creator_id + '"'),('reciever_id', '"' + reciever_id + '"')]
	return global_func.update(primary_key, new_data, 'friend')

def delete(creator_id):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'DELETE FROM friend WHERE (creator_id = %s)'
	cursor.execute(query, (creator_id,))

	conn.commit()
	rows = cursor.rowcount
	cursor.close()
	global_func.close_conn(conn)
	return rows
