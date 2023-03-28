import psycopg2

def convert_To_Binary(filename):
    with open(filename, 'rb') as file:
        data = file.read()
    return data

def insert_BLOB(itemid, itemname, itemdescription, itemprice, FileName):
    """ insert a BLOB into a table """
    conn = None
    try:
        # connect to the PostgreSQL server & creating a cursor object
        conn = psycopg2.connect(database ="Kebab", user = "alexr",
                        password = "123456", host = "localhost", port = "5432")

        # Creating a cursor with name cur.
        cur = conn.cursor()

        # Binary Data
        file_data = convert_To_Binary(FileName)

        # BLOB DataType
        BLOB = psycopg2.Binary(file_data)

        # SQL query to insert data into the database.
        cur.execute(
            "INSERT INTO menuitems(itemid, itemname, itemdescription, itemprice, image) VALUES(%s,%s,%s,%s,%s)",
            (itemid, itemname, itemdescription, itemprice, BLOB))

        # Close the connection
        cur.close()

    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            # Commit the changes to the database
            conn.commit()

insert_BLOB(1, 'Kebab', 'An image of a kebab', 9.99, 'kebab.jpeg')
