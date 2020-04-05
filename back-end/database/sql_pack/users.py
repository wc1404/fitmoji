#Imports
import global_func

def get(username, attributes = ['*']):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	#Prepare and execute statement
	query = global_func.prepare_get_query('user', 'username', attributes)
	print(query)
	cursor.execute(query, (username,))

	#get and return data
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data

def insert(values, data):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'INSERT INTO user %s VALUES %s' % (values, data)
	print(query)

	cursor.execute(query)
	global_func.conn.commit()

	query = 'SELECT LAST_INSERT_ID();'
	cursor.execute(query)
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data[0]

def update(user_id, new_data):
	primary_key = [('user_id', '"' + user_id + '"')]
	return global_func.update(primary_key, new_data, 'user')

def delete(user_id):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'DELETE FROM user WHERE (user_id = %s)'
	cursor.execute(query, (user_id,))

	conn.commit()
	rows = cursor.rowcount
	cursor.close()
	global_func.close_conn(conn)
	return rows
