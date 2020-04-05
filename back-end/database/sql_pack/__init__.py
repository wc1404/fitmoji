from sys import path
from os import getcwd

cwd = getcwd()
lstcwd = cwd.split('/')

insert = cwd
if 'sql_pack' not in lstcwd:
	insert = cwd + '/sql_pack/'

if insert not in path:
	path.insert(0, insert)