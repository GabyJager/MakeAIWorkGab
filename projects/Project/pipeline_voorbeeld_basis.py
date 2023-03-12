# Installing libraries
import logging
import sqlite3
import pandas as pd
import os

dbPath = "Data"

# Collecting the data
# Specify the con
con = sqlite3.connect(f'{dbPath}/db.sqlite3')
# Convert to DataFrame
df = pd.read_sql('SELECT * FROM rest_api_netlify', con=con)
display(df)
con.close()

# transform
df.info()
df.describe()

for x in df.index:
  if df.loc[x, "genetic"] < 18: #> 120
# "length","mass"] < 150, 40 or > 220, 164
    df.drop(x, inplace = True)

df["lifespan"]>0

if df.loc[x, "lifespan"] <0: #> 120
#"exercise", "smoking","alcohol", "sugar"] < 0: > 6, 30, 30, 20
    df.drop(x, inplace = True)

df["lifespan"]>0

df["bmi"] = round(df["mass"]/(df["length"]/100)**2, 2)
df.describe()

duplicate_rows_df = df[df.duplicated()]
print("number of duplicate rows: ", duplicate_rows_df.shape)
#df = df.drop_duplicates()
#df.head()

print(df.isnull().sum())
#df = df.dropna()
#df.head()


Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)
IQR = Q3 - Q1
print(Q1)
print()
print(Q3)
print()
print(IQR)
df = df[~((df < (Q1 - 1.5 * IQR)) |(df > (Q3 + 1.5 * IQR))).any(axis=1)]

# Save df as new table
#df.to_sql('new_table', con=con, index=False)

# close Connection
#con.close()






