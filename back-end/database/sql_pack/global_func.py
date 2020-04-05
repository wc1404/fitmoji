#Written by Wilfredo Cueto for Fitmoji

#Imports
from config import create_conn, close_conn
from mysql.connector import Error

def update(primary_key, new_data, table):
	conn = create_conn()
	cursor = conn.cursor()

	query = 'UPDATE ' + table + ' SET '
	l = []
	for item in new_data:
		s = "%s = %s" % (item[0], item[1])
		l.append(s)

	query += ",".join(l) + ' WHERE (' + 'and'.join((key[0] + ' =' + str(key[1]) + ' ') for key in primary_key) + ')'

	cursor.execute(query)

	#commit all changes
	conn.commit()

	#get rowcount and return # of rows affected
	rows = cursor.rowcount
	cursor.close()
	close_conn(conn)
	return rows

#Updates data for muliple tables in database
#attributes, new_data, and num_ids must be in a list or tuple
def update_multiple(query, attributes, new_data, ids, extra_id = 0):
	conn = create_conn()
	cursor = conn.cursor()
	#Get lenghts of all passed lists
	num_attributes = len(attributes)
	length_new_data = len(new_data)
	num_ids = len(ids)

	#Check for attribute to data match
	if num_attributes == length_new_data:
		#loop to update table attributes with new data
		for data_index in range(num_ids):
			#loop through attributes for changes
			for attribute_index in range(num_attributes):
				#check for address to data match
				if num_ids == len(new_data[data_index]):
					query = query[0] + attributes[attribute_index] + query[1]
					#make changes
					if extra_id:
						insert = (new_data[attribute_index][data_index], ids[data_index], extra_id)
						cursor.execute(query, insert)
					else:
						insert = (new_data[attribute_index][data_index], ids[data_index])
						cursor.execute(query, insert)
				else:
					return Error("Data Mismatch")
	else:
		return Error("Data Mismatch")

	#commit all changes
	conn.commit()

	#get rowcount and return # of rows affected
	rows = cursor.rowcount
	cursor.close()
	close_conn(conn)
	return rows

def delete_all(table, pk):
	conn = create_conn()
	cursor = conn.cursor()

	#Prepare query with parameters necessary
	query = 'DELETE FROM ' + table + ' WHERE (' + ' and '.join((key[0] + ' =' + str(key[1]) + ' ') for key in pk) + ')'
	cursor.execute(query)

	#get rowcount and return # of rows affected
	rows = cursor.rowcount
	cursor.close()
	close_conn(conn)
	return rows

def specific_insert(ids, added_attribute):
	insert = ''
	if len(ids) > 0:
		#insert scpecified attributes wanted
		insert += ' AND (%s = %s' %(added_attribute, ids[0])
		#for loop for more than one specified specific attribute
		for id_index in range(1, len(ids)):
			insert += ' OR %s = %s' %(added_attribute, ids[id_index])
		insert += ')'#close parenthesis on query insert
	return insert

def prepare_get_query(data_table, search_column, attributes, specifics = [], added_attribute_name = ''):

	raw_query = ['SELECT ', ' FROM ',' WHERE (',' = %s']
	raw_query[1] += data_table

	for attribute_ind in range(len(attributes)):
		if attribute_ind > 0:
			raw_query[0] += ("," + attributes[attribute_ind])
		else:
			raw_query[0] += attributes[attribute_ind]

	raw_query[-2] += search_column

	query = ''
	for query_part in raw_query:
		query += str(query_part)

	#insert for specific addresses
	if specifics and added_attribute_name:
		query += specific_insert(specifics, added_attribute_name)

	query += ')'

	return query