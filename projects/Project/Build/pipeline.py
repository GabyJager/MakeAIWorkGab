

import logging
import pandas as pd
import sqlite3

# Hardening
from pathlib import Path

# Global configuration
logging.basicConfig(level=logging.DEBUG)
db_mcr = "projects/project/data/db.sqlite3"
table_lifespan = "rest_api_netlify"

# Collecting the data
logging.info("Load transformed data from database into dataframe")

logging.info(f"Connect to {db_mcr}")
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
dfSelection = dfCleanFromDB[['length', 'mass', "genetic", "smoking", "exercise", "alcohol", "sugar", "lifespan"]]
#length = dfSelection['length']
#mass = dfSelection['mass']
#logging.debug(dfSelection.head())

# BMI = (Weight in Kilograms / (Height in Meters x Height in Meters))
dfSelection["bmi"] = round(dfSelection["mass"]/(dfSelection["length"]/100)**2, 2)

#logging.debug(f"bmi : {bmi}")


# naam nog veranderen??????????????
#dfSelection = dfSelection.copy()
#nrOfCols = dfSelection.shape[1]
#dfSelection.insert(loc=nrOfCols, column='bmi', value=bmiList)

dfSelectionBmi= dfSelection.drop(['length', 'mass'], axis=1)

Q1 = dfSelection.quantile(0.25)
Q3 = dfSelection.quantile(0.75)
IQR = Q3 - Q1
print(Q1)
print()
print(Q3)
print()
print(IQR)
dfSelectionBmi = dfSelection[~((dfSelection < (Q1 - 1.5 * IQR)) |(dfSelection> (Q3 + 1.5 * IQR))).any(axis=1)]

logging.info("Save df as new table")
dfSelectionBmi.to_sql("data_for_regression", con=dbConnection, if_exists='replace', index=False)

# close Connection
dbConnection.close()
