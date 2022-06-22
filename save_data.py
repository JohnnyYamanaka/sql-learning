# %%
import pandas as pd
import sqlite3

conn = sqlite3.connect('./data/db/sap_bike.db')
cursor = conn.cursor()

# %%
addresses = pd.read_csv('./data/csv/Addresses.csv')
addresses.to_sql('addresses', conn, if_exists='append', index=False)

business_partners = pd.read_csv('./data/csv/BusinessPartners.csv')
business_partners.to_sql('business_partners', conn, if_exists='append', index=False)

# %%

employees = pd.read_csv('./data/csv/Employees.csv', encoding='windows-1252')
employees.dropna(axis=1, inplace=True)
employees.to_sql('employees', conn, if_exists='append', index=False)

# %%

prod_categories = pd.read_csv('./data/csv/ProductCategories.csv')
prod_categories.to_sql('product_categories', conn, if_exists='append', index=False)

prod_category_text = pd.read_csv('./data/csv/ProductCategoryText.csv')
prod_category_text.to_sql('product_category_text', conn, if_exists='append', index=False)

product = pd.read_csv('./data/csv/Products.csv')
product.to_sql('products', conn, if_exists='append', index=False)

product_text = pd.read_csv('./data/csv/ProductTexts.csv')
product_text.to_sql('product_text', conn, if_exists='append', index=False)

sales_order_items = pd.read_csv('./data/csv/SalesOrderItems.csv')
sales_order_items.to_sql('sales_order_items', conn, if_exists='append', index=False)

sales_orders = pd.read_csv('./data/csv/SalesOrders.csv')
sales_orders.to_sql('sales_orders', conn, if_exists='append', index=False)
    
conn.close()
# %%
