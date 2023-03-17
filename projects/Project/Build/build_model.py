#!/usr/bin/env python

# Imports
import logging
import pandas as pd
import pickle
import sqlite3
from sklearn.linear_model import LinearRegression

# Hardening
from pathlib import Path


# Global configuration
logging.basicConfig(level=logging.INFO)
exportFile = "projects/project/model/regression.pkl"
dbSelectionBmi = "projects/project/data/db.sqlite3"
table_lifespan = "data_for_regression"


logging.info(f"Connect to {Path(dbSelectionBmi).name}")
dbConnection = sqlite3.connect(dbSelectionBmi)

logging.info("Load transformed data from database into dataframe")

df = pd.read_sql_query(f"SELECT * FROM {table_lifespan}", dbConnection)


logging.info("Close DB Connection")
dbConnection.close()

logging.info("Build Regression Model")

X = df[['smoking', 'bmi', 'genetic', "exercise", "alcohol", "sugar"]]
y = df['lifespan']

regressor = LinearRegression()
regressor.fit(X, y)


pickle.dump(regressor, open(exportFile, 'wb'))
