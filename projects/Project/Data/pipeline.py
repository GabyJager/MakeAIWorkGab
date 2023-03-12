import logging
import sqlite3
import pandas as pd
import os



# Collecting the data
# Specify the con
con = sqlite3.connect(./db.sqlite3)


# Convert to DataFrame
df = pd.read_sql('SELECT * FROM rest_api_netlify', con=con)

display(df)
con.close()

# transform
