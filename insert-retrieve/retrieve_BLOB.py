# Complete Function to Retrieve the BLOB data into the database.
import psycopg2

def Binary_To_File(BLOB, FileName, oldFileName):
	"""Creates file from binary data"""
	with open(f"{FileName}", 'wb') as file:
		file.write(bytes(BLOB))
	print(f"{oldFileName} File saved With Name name {FileName}")


def retrieve_BLOB(itemid, newFileName):
	""" Retrieve a BLOB From a table """
	conn = None
	try:
		# connect to the PostgreSQL server & creating a cursor object
		conn = psycopg2.connect(database ="Kebab", user = "postgres",
                        password = "alex2004", host = "localhost",
                        port = "5432")

		# Creating a cursor with name cur.
		cur = conn.cursor()

		# Retrieve BLOB data from the database.
		cur.execute('SELECT * FROM menuitems')
		db = cur.fetchall()

		BLOB = db[itemid-1][2]
		Binary_To_File(BLOB, newFileName, db[itemid-1][1])

		# Close the connection
		cur.close()

	except(Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		if conn is not None:
			# Commit the changes to the database
			conn.commit()


retrieve_BLOB(1, 'KebabFromDB.jpeg')