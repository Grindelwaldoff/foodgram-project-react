import psycopg2
import json


with open('ingredients.json', 'r') as data_file:
    data = json.load(data_file)

collection_array = []
for item in data:
    collection_array.append(json.dumps(item))



try:
    conn = psycopg2.connect(database="postgres", user="postgres", password="postgres",host="172.20.0.3",port="5432")
    print("opened  database successfully")
    cur = conn.cursor()

    for element in collection_array:
        cur.execute("INSERT INTO recipes_ingredients (name, measurement_unit) VALUES (%s)", (element,))
    print("successfully inserted records")


except psycopg2.Error as e:
    raise

finally:
    conn.commit()
    conn.close()
    print("connection is closed")