#Imports
import global_func

def get(challenge_id, attributes = ['*']):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	#Prepare and execute statement
	query = global_func.prepare_get_query('challenge', 'challenge_id', attributes)
	print(query)
	cursor.execute(query, (challenge_id,))

	#get and return data
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data

def insert(values, data):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'INSERT INTO challenge %s VALUES %s' % (values, data)
	print(query)

	cursor.execute(query)
	global_func.conn.commit()

	query = 'SELECT LAST_INSERT_ID();'
	cursor.execute(query)
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data[0]

def update(challenge_id, new_data): # New Data should be a list of tuples where (ATTRIBUTE, NEW_DATA)
	primary_key = [('challenge_id', '"' + challenge_id + '"')]
	return global_func.update(primary_key, new_data, 'challenge')

def delete(challenge_id):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'DELETE FROM challenge WHERE (challenge_id = %s)'
	cursor.execute(query, (challenge_id,))

	conn.commit()
	rows = cursor.rowcount
	cursor.close()
	global_func.close_conn(conn)
	return rows
