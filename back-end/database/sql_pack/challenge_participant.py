#Imports
import global_func

def get(participant_id, attributes = ['*']):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	#Prepare and execute statement
	query = global_func.prepare_get_query('challenge_participants', 'participant_id', attributes)
	print(query)
	cursor.execute(query, (participant_id,))

	#get and return data
	data = cursor.fetchall()
	cursor.close()
	global_func.close_conn(conn)
	return data

def insert(values, data):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'INSERT INTO challenge_participants %s VALUES %s' % (values, data)
	print(query)

	cursor.execute(query)
	global_func.conn.commit()

	query = 'SELECT LAST_INSERT_ID();'
	cursor.execute(query)
	data = cursor.fetchone()
	cursor.close()
	global_func.close_conn(conn)
	return data[0]

def update(participant_id, new_data): # New Data should be a list of tuples where (ATTRIBUTE, NEW_DATA)
	primary_key = [('participant_id', '"' + participant_id + '"')]
	return global_func.update(primary_key, new_data, 'challenge_participants')

def delete(participant_id):
	conn = global_func.create_conn()
	cursor = conn.cursor()

	query = 'DELETE FROM challenge_participants WHERE (participant_id = %s)'
	cursor.execute(query, (participant_id,))

	conn.commit()
	rows = cursor.rowcount
	cursor.close()
	global_func.close_conn(conn)
	return rows
