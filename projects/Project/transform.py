df = pd.read_csv("Data/data.csv", na_values=['?', "undefined"])
display(df)

df.info()
df["bmi"] = round(df["mass"]/(df["length"]/100)**2, 2)

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