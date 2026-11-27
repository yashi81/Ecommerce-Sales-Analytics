import pandas as pd

# 1. Load all 3 sheets from your 01_Raw_Data folder
raw_path = '01_Raw_Data/sample_-_superstore.xls'
orders = pd.read_excel(raw_path, sheet_name='Orders')
people = pd.read_excel(raw_path, sheet_name='People')
returns = pd.read_excel(raw_path, sheet_name='Returns')

# 2. Merge Returns and People into Orders
df = orders.merge(returns, on='Order ID', how='left')
df['Returned'] = df['Returned'].fillna('No')
df = df.merge(people, on='Region', how='left')

# 3. Clean column names for MySQL (remove spaces, slashes, dashes)
df.columns = [c.replace(' ', '_').replace('/', '_').replace('-', '_') for c in df.columns]

# 4. Create new business metrics
df['Shipping_Days'] = (df['Ship_Date'] - df['Order_Date']).dt.days
df['Profit_Margin_Pct'] = round((df['Profit'] / df['Sales']) * 100, 2)
df['Order_Year'] = df['Order_Date'].dt.year
df['Order_Month'] = df['Order_Date'].dt.strftime('%Y-%m')

# 5. Save cleaned CSV into your 02_Cleaned_Data folder
output_path = '02_Cleaned_Data/cleaned_superstore.csv'
df.to_csv(output_path, index=False)

print("Success! Cleaned file saved to:", output_path)
print("Total rows:", len(df))
