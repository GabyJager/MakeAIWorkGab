# import logging
import sqlite3
import pandas as pd
import os
import logging



# Collecting the data
# Specify the con



dbPath = "Data/db.sqlite3"



# Collecting the data
# Specify the con

con = sqlite3.connect(f'{dbPath}/db.sqlite3')

# Convert to DataFrame

df = pd.read_sql('SELECT * FROM rest_api_netlify', con=con)

#logging.debug

con.close()

# transform
#dSelection = dFrom

# 