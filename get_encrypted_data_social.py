import sys
import os
from dotenv import load_dotenv
from pysqlcipher3 import dbapi2 as sqlite

if len(sys.argv) != 2:
    print("Usage: python get_encrypted_data_social.py <username>")
    sys.exit(1)

username = str(sys.argv[1])

load_dotenv()
encryption_key = os.getenv('SQLCIPHER_KEY')

conn = sqlite.connect('personal_data/encrypted_db.db')
cursor = conn.cursor()
cursor.execute(f"PRAGMA key = '{encryption_key}';")

cursor.execute('SELECT social, username, password FROM social_secrets WHERE username LIKE ?', ('%' + username + '%',))
record = cursor.fetchone()
if record:
    print(f"Social Type: {record[0]}")
    print(f"Username: {record[1]}")
    print(f"Password: {record[2]}")
else:
    print(f"No record found for username: {username}")

conn.close()
