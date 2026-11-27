import pandas as pd
from sqlalchemy import create_engine, text

# 1. Read your cleaned CSV
df = pd.read_csv('02_Cleaned_Data/cleaned_superstore.csv')

# 2. Connection details
username = 'root'
password = 'YOUR_PASSWORD'  # <-- Keep your MySQL password here
host = 'localhost'
database = 'ecommerce_analytics'  # Added the 's' at the end

# 3. Create database automatically if it doesn't exist, then connect
root_engine = create_engine(f'mysql+pymysql://{username}:{password}@{host}')
with root_engine.connect() as conn:
    conn.execute(text(f"CREATE DATABASE IF NOT EXISTS {database}"))

engine = create_engine(f'mysql+pymysql://{username}:{password}@{host}/{database}')

# 4. Upload the entire table into MySQL
df.to_sql(name='superstore', con=engine, if_exists='replace', index=False)

print("Done! All", len(df), "rows uploaded to MySQL table 'superstore'.")