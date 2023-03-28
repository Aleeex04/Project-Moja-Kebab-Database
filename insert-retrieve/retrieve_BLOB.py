import psycopg2

def binary_to_file(blob_data, new_file_name, old_file_name):
    """Creates file from binary data"""
    with open(new_file_name, 'wb') as file:
        file.write(blob_data)
    print(f"{old_file_name} file saved with name {new_file_name}")

def retrieve_image(item_id, new_file_name):
    """Retrieve an image from the menuitems table"""
    conn = None
    try:
        # connect to the PostgreSQL server & creating a cursor object
        conn = psycopg2.connect(
            database="Kebab",
            user="alexr",
            password="123456",
            host="localhost",
            port="5432"
        )

        # Creating a cursor with name cur.
        cur = conn.cursor()

        # Retrieve image data from the database.
        cur.execute('SELECT * FROM menuitems')
        db = cur.fetchall()

        blob_data = db[item_id-1][4]
        binary_to_file(blob_data, new_file_name, db[item_id-1][1])

        # Close the connection
        cur.close()

    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            # Commit the changes to the database
            conn.commit()
            # Close the connection
            conn.close()


retrieve_image(1, 'kebab_from_db.jpeg')
