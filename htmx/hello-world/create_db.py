import sqlite3
import random
from faker import Faker

fake = Faker()

conn = sqlite3.connect("people.db")
cursor = conn.cursor() 

cursor.execute("""
    CREATE TABLE IF NOT EXISTS people (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER,
        city TEXT
    )
""")


for _ in range(30):
    cursor.execute('''
        insert into people (name, age, city)
        values (?, ?, ?)
    ''', (fake.name(), random.randint(20, 40), fake.city()))

conn.commit()
conn.close() 
