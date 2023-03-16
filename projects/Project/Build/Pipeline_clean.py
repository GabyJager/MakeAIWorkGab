import logging
import pandas as pd
import sqlite3

# Hardening
from pathlib import Path

# Global configuration
logging.basicConfig(level=logging.DEBUG)
db_mcr = "db.sqlite3"
table_lifespan = "rest_api_netlify"

# Collecting the data
logging.info("Load transformed data from database into dataframe")

logging.info(f"Connect to {Path(db_mcr).name}")
dbConnection = sqlite3.connect(db_mcr)
df = pd.read_sql_query(f"SELECT * FROM rest_api_netlify", dbConnection)
logging.debug(dfFromDB.head())



# Cleaning
logging.info("Preprocessing : remove rows with missing values")
dfCleanFromDB = dfFromDB.dropna()
logging.debug(dfCleanFromDB.head())

# Transform

for x in df.index:
  if df.loc[x, "lifespan"] < 0:
    df.drop(x, inplace = True)

df["lifespan"]>1
df.describe()

duplicate_rows_df = df[df.duplicated()]
print("number of duplicate rows: ", duplicate_rows_df.shape)
df = df.drop_duplicates()

print(df.isnull().sum())
df = df.dropna()
df.head()

logging.info("Preprocessing : remove rows with missing values")
dfCleanFromDB = dfFromDB.dropna()
logging.debug(dfCleanFromDB.head())

# Transform
dfSelection = dfCleanFromDB[['length', 'mass', 'lifespan']]
length = dfSelection['length']
mass = dfSelection['mass']
logging.debug(dfSelection.head())

# BMI = (Weight in Kilograms / (Height in Meters x Height in Meters))
noemer = pow(length/100, 2)
bmi = (mass / noemer) if (noemer > 0) else 0
logging.debug(f"BMI : {bmi}")

df["bmi"] = round(df["mass"]/(df["length"]/100)**2, 2)

df = df.drop(['length', 'mass'], axis=1)
df.head()

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
dfSelection.to_sql('bmi', con=dbConnection, if_exists='replace', index=False)
dfSelection. to_csv

# close Connection
dbConnection.close()
