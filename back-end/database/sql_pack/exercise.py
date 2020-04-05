#Imports
import global_func

def get(exercise_id, attributes = ['*']):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	#Prepare and execute statement
	query = global_func.prepare_get_query('exercise', 'exercise_id', attributes)
	print(query)
	cursor.execute(query, (exercise_id,))

	#get and return data
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data

def get_all():
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = "SELECT * FROM exercise"
	print(query)
	cursor.execute(query)

	#get and return data
	data = cursor.fetchall()
	cursor.close()
	global_func.close_conn(conn)
	return data

def insert(values, data):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'INSERT INTO exercise %s VALUES %s' % (values, data)
	print(query)

	cursor.execute(query)
	global_func.conn.commit()

	query = 'SELECT LAST_INSERT_ID();'
	cursor.execute(query)
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data[0]

def update(exercise_id, new_data): # New Data should be a list of tuples where (ATTRIBUTE, NEW_DATA) 
	primary_key = [('exercise_id', '"' + exercise_id + '"')]
	return global_func.update(primary_key, new_data, 'exercise')

def delete(exercise_id):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'DELETE FROM exercise WHERE (exercise_id = %s)'
	cursor.execute(query, (exercise_id,))

	conn.commit()
	rows = cursor.rowcount
	cursor.close()
	global_func.close_conn(conn)
	return rows
