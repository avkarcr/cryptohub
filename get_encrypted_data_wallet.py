import sys
import os
from dotenv import load_dotenv
from pysqlcipher3 import dbapi2 as sqlite

if len(sys.argv) != 2:
    print("Usage: python get_wallet_info.py <wallet_id>")
    sys.exit(1)

id = str(sys.argv[1])

load_dotenv()
encryption_key = os.getenv('SQLCIPHER_KEY')

conn = sqlite.connect('personal_data/encrypted_db.db')
cursor = conn.cursor()
cursor.execute(f"PRAGMA key = '{encryption_key}';")

cursor.execute('SELECT wallet_address, private, seed, password, comments FROM wallet_secrets WHERE wallet_address = ?;', (id,))
wallet = cursor.fetchone()
if wallet:
    print(f"Wallet Address: {wallet[0]}")
    print(f"Private Key: {wallet[1]}")
    print(f"Seed Phrase: {wallet[2]}")
    print(f"Password: {wallet[3]}")
    print(f"Comments: {wallet[4]}")
else:
    print(f"No wallet found with address: {id}")

conn.close()
