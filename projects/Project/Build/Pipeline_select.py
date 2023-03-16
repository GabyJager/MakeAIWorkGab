#Pipeline niet kunnen testen ivm weer niet herkennen van de table

import logging
import pandas as pd
import sqlite3

# Hardening
from pathlib import Path

# Global configuration
logging.basicConfig(level=logging.DEBUG)
db_mcr = "projects/project/Data/db.sqlite3"
table_lifespan = "rest_api_netlify"

# Collecting the data
logging.info("Load transformed data from database into dataframe")

logging.info(f"Connect to {Path(db_mcr).name}")
dbConnection = sqlite3.connect(db_mcr)
dfFromDB= pd.read_sql_query(f"SELECT * FROM rest_api_netlify", dbConnection)
logging.debug(dfFromDB.head())



# Cleaning
logging.info("Preprocessing : remove rows with missing values")
dfCleanFromDB = dfFromDB.dropna()
logging.debug(dfCleanFromDB.head())

for x in dfCleanFromDB.index:
  if dfCleanFromDB.loc[x, "lifespan"] < 0:
    dfCleanFromDB.drop(x, inplace = True)

dfCleanFromDB["lifespan"]>1
dfCleanFromDB.describe()

duplicate_rows_df = dfCleanFromDB[dfCleanFromDB.duplicated()]
print("number of duplicate rows: ", duplicate_rows_df.shape)
dfCleanFromDB = dfCleanFromDB.drop_duplicates()

print(dfCleanFromDB.isnull().sum())
dfCleanFromDB = dfCleanFromDB.dropna()
dfCleanFromDB.head()

logging.info("Preprocessing : remove rows with missing values")
dfCleanFromDB = dfFromDB.dropna()
logging.debug(dfCleanFromDB.head())


# Transform
dfSelection = dfCleanFromDB[['length', 'mass']]
length = dfSelection['length']
mass = dfSelection['mass']
logging.debug(dfSelection.head())

# BMI = (Weight in Kilograms / (Height in Meters x Height in Meters))
noemer = pow(length/100, 2)
bmi = (mass / noemer) if (noemer > 0) else 0
logging.debug(f"BMI : {bmi}")

dfSelection["bmi"] = round(df["mass"]/(df["length"]/100)**2, 2)

dfSelection= dfCleanFromDB.drop(['length', 'mass'], axis=1)
dfSelection.head()

Q1 = dfCleanFromDB.quantile(0.25)
Q3 = dfCleanFromDB.quantile(0.75)
IQR = Q3 - Q1
print(Q1)
print()
print(Q3)
print()
print(IQR)
dfSelection = dfCleanFromDB[~((df < (Q1 - 1.5 * IQR)) |(dfCleanFromDB> (Q3 + 1.5 * IQR))).any(axis=1)]

# Save df as new table
dfSelection.to_sql('bmi', con=dbConnection, if_exists='replace', index=False)

# close Connection
dbConnection.close()