#!/usr/bin/env python

# Imports
import logging
import pandas as pd
import pickle
import sqlite3

# Hardening
from pathlib import Path
from sklearn.neighbors import KNeighborsRegressor

# Global configuration
logging.basicConfig(level=logging.INFO)
exportFile = "/project/model/knn.pkl"

dbRegression = "project/Build/Data/db.sqlite3"
table_lifespan = "data_for_regression"


logging.info(f"Connect to {Path(dbSelection).name}")
dbConnection = sqlite3.connect(dbSeletion.Name)

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
bmi = (mass / noemer) 
logging.debug(f"BMI : {bmi}")

dfSelection["bmi"] = round(dfCleanFromDB["mass"]/(dfCleanFromDB["length"]/100)**2, 2)

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
dfSelection = dfCleanFromDB[~((dfCleanFromDB < (Q1 - 1.5 * IQR)) |(dfCleanFromDB> (Q3 + 1.5 * IQR))).any(axis=1)]

# Save df as new table
dfSelection.to_sql("data_for_regression", con=dbConnection, if_exists='replace', index=False)

# close Connection
dbConnection.close()


logging.info("Load transformed data from database into dataframe")
dfWithBMI = pd.read_sql_query(
    f"SELECT length, lifespan FROM {tableName}", dbConnection)

logging.info("Close DB Connection")

logging.info("Preprocessing : remove rows with missing values")
f = dfWithBMI.dropna()
logging.debug(dfWithBMI.head())

logging.info("Feature Selection")

y = dfWithBMI['lifespan'].values
logging.debug(f"Y : {type(y)}")

X = dfWithBMI['length'].values
logging.debug(f"X : {type(X)}")

logging.info("Build Regression Model")

regressor = KNeighborsRegressor(n_neighbors=4, metric='euclidean')
regressor.fit(X.reshape(-1, 1), y)

logging.debug(f"Check with single value {regressor.predict([[185]])}")

pickle.dump(regressor, open(exportFile, 'wb'))
dbConnection.close()