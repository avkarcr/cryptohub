import os
from dotenv import load_dotenv
from pysqlcipher3 import dbapi2 as sqlite

load_dotenv()
encryption_key = os.getenv('SQLCIPHER_KEY')

conn = sqlite.connect('encrypted_db.db')
cursor = conn.cursor()
cursor.execute(f"PRAGMA key = '{encryption_key}';")

cursor.execute('''
    CREATE TABLE IF NOT EXISTS wallet_secrets (
        wallet_address TEXT PRIMARY KEY,
        private TEXT NOT NULL,
        seed TEXT NOT NULL
    );
''')

cursor.execute('''
    CREATE TABLE IF NOT EXISTS social_secrets (
        id INTEGER PRIMARY KEY,
        social TEXT NOT NULL,
        username TEXT NOT NULL,
        password TEXT NOT NULL
    );
''')

with open('wallets_data.sql', 'r') as sql_file:
    sql_script = sql_file.read()
    cursor.executescript(sql_script)

with open('socials_data.sql', 'r') as sql_file:
    sql_script = sql_file.read()
    cursor.executescript(sql_script)

conn.commit()
conn.close()

print("Wallets and social data inserted successfully.")
