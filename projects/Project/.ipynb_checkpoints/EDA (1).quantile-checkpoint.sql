{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {
    "id": "Bl3yLOUmbP5T",
    "tags": []
   },
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import numpy as np\n",
    "import seaborn as sns\n",
    "import matplotlib.pyplot as plt\n",
    "%matplotlib inline     \n",
    "sns.set(color_codes=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>73.9</td>\n",
       "      <td>185.0</td>\n",
       "      <td>99.7</td>\n",
       "      <td>0.9</td>\n",
       "      <td>0.0</td>\n",
       "      <td>2.4</td>\n",
       "      <td>73.1</td>\n",
       "      <td>6.9</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>86.0</td>\n",
       "      <td>172.0</td>\n",
       "      <td>105.4</td>\n",
       "      <td>1.8</td>\n",
       "      <td>8.1</td>\n",
       "      <td>0.4</td>\n",
       "      <td>85.0</td>\n",
       "      <td>4.2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>83.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>1.1</td>\n",
       "      <td>0.8</td>\n",
       "      <td>4.6</td>\n",
       "      <td>81.6</td>\n",
       "      <td>7.5</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>82.8</td>\n",
       "      <td>164.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>4.7</td>\n",
       "      <td>11.8</td>\n",
       "      <td>1.0</td>\n",
       "      <td>81.0</td>\n",
       "      <td>2.9</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>78.7</td>\n",
       "      <td>178.0</td>\n",
       "      <td>71.6</td>\n",
       "      <td>1.5</td>\n",
       "      <td>8.3</td>\n",
       "      <td>4.9</td>\n",
       "      <td>75.0</td>\n",
       "      <td>5.5</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>...</th>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4091</th>\n",
       "      <td>4092</td>\n",
       "      <td>80.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>115.9</td>\n",
       "      <td>3.7</td>\n",
       "      <td>0.1</td>\n",
       "      <td>5.6</td>\n",
       "      <td>80.7</td>\n",
       "      <td>5.8</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4092</th>\n",
       "      <td>4093</td>\n",
       "      <td>75.3</td>\n",
       "      <td>162.0</td>\n",
       "      <td>129.6</td>\n",
       "      <td>3.6</td>\n",
       "      <td>6.2</td>\n",
       "      <td>5.6</td>\n",
       "      <td>71.1</td>\n",
       "      <td>7.6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4093</th>\n",
       "      <td>4094</td>\n",
       "      <td>93.1</td>\n",
       "      <td>189.0</td>\n",
       "      <td>115.3</td>\n",
       "      <td>2.7</td>\n",
       "      <td>9.4</td>\n",
       "      <td>4.9</td>\n",
       "      <td>90.0</td>\n",
       "      <td>6.6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4094</th>\n",
       "      <td>4095</td>\n",
       "      <td>77.9</td>\n",
       "      <td>170.0</td>\n",
       "      <td>90.8</td>\n",
       "      <td>2.3</td>\n",
       "      <td>13.2</td>\n",
       "      <td>0.8</td>\n",
       "      <td>75.9</td>\n",
       "      <td>6.2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4095</th>\n",
       "      <td>4096</td>\n",
       "      <td>101.3</td>\n",
       "      <td>188.0</td>\n",
       "      <td>129.2</td>\n",
       "      <td>1.2</td>\n",
       "      <td>8.2</td>\n",
       "      <td>6.0</td>\n",
       "      <td>96.9</td>\n",
       "      <td>6.2</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>4096 rows × 9 columns</p>\n",
       "</div>"
      ],
      "text/plain": [
       "        id  genetic  length   mass  exercise  smoking  alcohol  lifespan  \\\n",
       "0        1     73.9   185.0   99.7       0.9      0.0      2.4      73.1   \n",
       "1        2     86.0   172.0  105.4       1.8      8.1      0.4      85.0   \n",
       "2        3     83.3   176.0  111.4       1.1      0.8      4.6      81.6   \n",
       "3        4     82.8   164.0  111.4       4.7     11.8      1.0      81.0   \n",
       "4        5     78.7   178.0   71.6       1.5      8.3      4.9      75.0   \n",
       "...    ...      ...     ...    ...       ...      ...      ...       ...   \n",
       "4091  4092     80.3   176.0  115.9       3.7      0.1      5.6      80.7   \n",
       "4092  4093     75.3   162.0  129.6       3.6      6.2      5.6      71.1   \n",
       "4093  4094     93.1   189.0  115.3       2.7      9.4      4.9      90.0   \n",
       "4094  4095     77.9   170.0   90.8       2.3     13.2      0.8      75.9   \n",
       "4095  4096    101.3   188.0  129.2       1.2      8.2      6.0      96.9   \n",
       "\n",
       "      sugar  \n",
       "0       6.9  \n",
       "1       4.2  \n",
       "2       7.5  \n",
       "3       2.9  \n",
       "4       5.5  \n",
       "...     ...  \n",
       "4091    5.8  \n",
       "4092    7.6  \n",
       "4093    6.6  \n",
       "4094    6.2  \n",
       "4095    6.2  \n",
       "\n",
       "[4096 rows x 9 columns]"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "import logging\n",
    "import sqlite3\n",
    "\n",
    "#Global variables\n",
    "dbPath = \"Data\"\n",
    "\n",
    "# Collecting the data\n",
    "# Specify the con\n",
    "con = sqlite3.connect(f'{dbPath}/db.sqlite3')\n",
    "# Convert to DataFrame\n",
    "df = pd.read_sql('SELECT * FROM rest_api_netlify', con=con)\n",
    "display(df)\n",
    "con.close()\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {
    "id": "X-Fbe3oLdxx8",
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Import data\n",
    "#df = pd.read_csv(\"Data/data.csv\", na_values=['?', \"undefined\"])\n",
    "#display(df)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {
    "id": "IMqPADPrcARh",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>73.9</td>\n",
       "      <td>185.0</td>\n",
       "      <td>99.7</td>\n",
       "      <td>0.9</td>\n",
       "      <td>0.0</td>\n",
       "      <td>2.4</td>\n",
       "      <td>73.1</td>\n",
       "      <td>6.9</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>86.0</td>\n",
       "      <td>172.0</td>\n",
       "      <td>105.4</td>\n",
       "      <td>1.8</td>\n",
       "      <td>8.1</td>\n",
       "      <td>0.4</td>\n",
       "      <td>85.0</td>\n",
       "      <td>4.2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>83.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>1.1</td>\n",
       "      <td>0.8</td>\n",
       "      <td>4.6</td>\n",
       "      <td>81.6</td>\n",
       "      <td>7.5</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>82.8</td>\n",
       "      <td>164.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>4.7</td>\n",
       "      <td>11.8</td>\n",
       "      <td>1.0</td>\n",
       "      <td>81.0</td>\n",
       "      <td>2.9</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>78.7</td>\n",
       "      <td>178.0</td>\n",
       "      <td>71.6</td>\n",
       "      <td>1.5</td>\n",
       "      <td>8.3</td>\n",
       "      <td>4.9</td>\n",
       "      <td>75.0</td>\n",
       "      <td>5.5</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id  genetic  length   mass  exercise  smoking  alcohol  lifespan  sugar\n",
       "0   1     73.9   185.0   99.7       0.9      0.0      2.4      73.1    6.9\n",
       "1   2     86.0   172.0  105.4       1.8      8.1      0.4      85.0    4.2\n",
       "2   3     83.3   176.0  111.4       1.1      0.8      4.6      81.6    7.5\n",
       "3   4     82.8   164.0  111.4       4.7     11.8      1.0      81.0    2.9\n",
       "4   5     78.7   178.0   71.6       1.5      8.3      4.9      75.0    5.5"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# To display the top 5 rows\n",
    "df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {
    "id": "30cV_0spdgYQ",
    "tags": []
   },
   "outputs": [],
   "source": [
    "# To display last 5 rows\n",
    "#df.tail()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {
    "id": "yjc7anKOdqoV",
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 4096 entries, 0 to 4095\n",
      "Data columns (total 9 columns):\n",
      " #   Column    Non-Null Count  Dtype  \n",
      "---  ------    --------------  -----  \n",
      " 0   id        4096 non-null   int64  \n",
      " 1   genetic   4095 non-null   float64\n",
      " 2   length    4093 non-null   float64\n",
      " 3   mass      4094 non-null   float64\n",
      " 4   exercise  4095 non-null   float64\n",
      " 5   smoking   4096 non-null   float64\n",
      " 6   alcohol   4094 non-null   float64\n",
      " 7   lifespan  4094 non-null   float64\n",
      " 8   sugar     4095 non-null   float64\n",
      "dtypes: float64(8), int64(1)\n",
      "memory usage: 288.1 KB\n"
     ]
    }
   ],
   "source": [
    "# Check data\n",
    "#df.info()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 297
    },
    "id": "CLibRdEwd8-L",
    "outputId": "d4bdb8c9-fb59-4670-a4ee-fffcf6861ac2",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>4096.00000</td>\n",
       "      <td>4095.000000</td>\n",
       "      <td>4093.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4095.000000</td>\n",
       "      <td>4096.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4095.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>2048.50000</td>\n",
       "      <td>82.268352</td>\n",
       "      <td>183.880283</td>\n",
       "      <td>92.268442</td>\n",
       "      <td>2.402125</td>\n",
       "      <td>9.807446</td>\n",
       "      <td>2.264558</td>\n",
       "      <td>80.167416</td>\n",
       "      <td>6.482955</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>1182.55768</td>\n",
       "      <td>7.442579</td>\n",
       "      <td>12.623054</td>\n",
       "      <td>25.791314</td>\n",
       "      <td>1.170062</td>\n",
       "      <td>6.921461</td>\n",
       "      <td>1.800523</td>\n",
       "      <td>7.841687</td>\n",
       "      <td>2.710213</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>1.00000</td>\n",
       "      <td>63.900000</td>\n",
       "      <td>154.000000</td>\n",
       "      <td>50.000000</td>\n",
       "      <td>0.100000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>57.000000</td>\n",
       "      <td>0.700000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>1024.75000</td>\n",
       "      <td>77.600000</td>\n",
       "      <td>175.000000</td>\n",
       "      <td>71.500000</td>\n",
       "      <td>1.500000</td>\n",
       "      <td>3.300000</td>\n",
       "      <td>0.600000</td>\n",
       "      <td>75.000000</td>\n",
       "      <td>4.400000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>2048.50000</td>\n",
       "      <td>81.800000</td>\n",
       "      <td>184.000000</td>\n",
       "      <td>89.500000</td>\n",
       "      <td>2.200000</td>\n",
       "      <td>9.500000</td>\n",
       "      <td>1.700000</td>\n",
       "      <td>79.700000</td>\n",
       "      <td>6.300000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>3072.25000</td>\n",
       "      <td>86.700000</td>\n",
       "      <td>193.000000</td>\n",
       "      <td>110.875000</td>\n",
       "      <td>3.200000</td>\n",
       "      <td>15.900000</td>\n",
       "      <td>4.000000</td>\n",
       "      <td>85.200000</td>\n",
       "      <td>8.400000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>4096.00000</td>\n",
       "      <td>102.200000</td>\n",
       "      <td>214.000000</td>\n",
       "      <td>163.600000</td>\n",
       "      <td>5.500000</td>\n",
       "      <td>22.200000</td>\n",
       "      <td>6.000000</td>\n",
       "      <td>105.100000</td>\n",
       "      <td>13.800000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "               id      genetic       length         mass     exercise  \\\n",
       "count  4096.00000  4095.000000  4093.000000  4094.000000  4095.000000   \n",
       "mean   2048.50000    82.268352   183.880283    92.268442     2.402125   \n",
       "std    1182.55768     7.442579    12.623054    25.791314     1.170062   \n",
       "min       1.00000    63.900000   154.000000    50.000000     0.100000   \n",
       "25%    1024.75000    77.600000   175.000000    71.500000     1.500000   \n",
       "50%    2048.50000    81.800000   184.000000    89.500000     2.200000   \n",
       "75%    3072.25000    86.700000   193.000000   110.875000     3.200000   \n",
       "max    4096.00000   102.200000   214.000000   163.600000     5.500000   \n",
       "\n",
       "           smoking      alcohol     lifespan        sugar  \n",
       "count  4096.000000  4094.000000  4094.000000  4095.000000  \n",
       "mean      9.807446     2.264558    80.167416     6.482955  \n",
       "std       6.921461     1.800523     7.841687     2.710213  \n",
       "min       0.000000     0.000000    57.000000     0.700000  \n",
       "25%       3.300000     0.600000    75.000000     4.400000  \n",
       "50%       9.500000     1.700000    79.700000     6.300000  \n",
       "75%      15.900000     4.000000    85.200000     8.400000  \n",
       "max      22.200000     6.000000   105.100000    13.800000  "
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Check data some more\n",
    "df.describe()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "Int64Index: 4096 entries, 0 to 4095\n",
      "Data columns (total 10 columns):\n",
      " #   Column    Non-Null Count  Dtype  \n",
      "---  ------    --------------  -----  \n",
      " 0   id        4096 non-null   int64  \n",
      " 1   genetic   4095 non-null   float64\n",
      " 2   length    4093 non-null   float64\n",
      " 3   mass      4094 non-null   float64\n",
      " 4   exercise  4095 non-null   float64\n",
      " 5   smoking   4096 non-null   float64\n",
      " 6   alcohol   4094 non-null   float64\n",
      " 7   lifespan  4094 non-null   float64\n",
      " 8   sugar     4095 non-null   float64\n",
      " 9   bmi       4091 non-null   float64\n",
      "dtypes: float64(9), int64(1)\n",
      "memory usage: 481.0 KB\n",
      "number of duplicate rows:  (0, 10)\n",
      "id          0\n",
      "genetic     1\n",
      "length      3\n",
      "mass        2\n",
      "exercise    1\n",
      "smoking     0\n",
      "alcohol     2\n",
      "lifespan    2\n",
      "sugar       1\n",
      "bmi         5\n",
      "dtype: int64\n"
     ]
    }
   ],
   "source": [
    "#df = pd.read_csv(\"Data/data.csv\", na_values=['?', \"undefined\"])\n",
    "\n",
    "df.info()\n",
    "df.describe()\n",
    "\n",
    "#for x in df.index:\n",
    "  #if df.loc[x, \"genetic\"] < 18: #> 120\n",
    "# \"length\",\"mass\"] < 150, 40 or > 220, 164\n",
    "    #df.drop(x, inplace = True)\n",
    "\n",
    "#df[\"genetic\"]>0\n",
    "\n",
    "if df.loc[x, \"lifespan\"] <0: #> 120\n",
    "#\"exercise\", \"smoking\",\"alcohol\", \"sugar\"] < 0: > 6, 30, 30, 20\n",
    "    df.drop(x, inplace = True)\n",
    "\n",
    "df[\"lifespan\"]>0\n",
    "\n",
    "df[\"bmi\"] = round(df[\"mass\"]/(df[\"length\"]/100)**2, 2)\n",
    "df.describe()\n",
    "\n",
    "duplicate_rows_df = df[df.duplicated()]\n",
    "print(\"number of duplicate rows: \", duplicate_rows_df.shape)\n",
    "#df = df.drop_duplicates()\n",
    "#df.head()\n",
    "\n",
    "print(df.isnull().sum())\n",
    "#df = df.dropna()\n",
    "#df.head()\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "      <th>bmi</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>4096.00000</td>\n",
       "      <td>4095.000000</td>\n",
       "      <td>4093.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4095.000000</td>\n",
       "      <td>4096.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4094.000000</td>\n",
       "      <td>4095.000000</td>\n",
       "      <td>4091.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>2048.50000</td>\n",
       "      <td>82.268352</td>\n",
       "      <td>183.880283</td>\n",
       "      <td>92.268442</td>\n",
       "      <td>2.402125</td>\n",
       "      <td>9.807446</td>\n",
       "      <td>2.264558</td>\n",
       "      <td>80.167416</td>\n",
       "      <td>6.482955</td>\n",
       "      <td>27.680929</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>1182.55768</td>\n",
       "      <td>7.442579</td>\n",
       "      <td>12.623054</td>\n",
       "      <td>25.791314</td>\n",
       "      <td>1.170062</td>\n",
       "      <td>6.921461</td>\n",
       "      <td>1.800523</td>\n",
       "      <td>7.841687</td>\n",
       "      <td>2.710213</td>\n",
       "      <td>8.714897</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>1.00000</td>\n",
       "      <td>63.900000</td>\n",
       "      <td>154.000000</td>\n",
       "      <td>50.000000</td>\n",
       "      <td>0.100000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>57.000000</td>\n",
       "      <td>0.700000</td>\n",
       "      <td>11.320000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>1024.75000</td>\n",
       "      <td>77.600000</td>\n",
       "      <td>175.000000</td>\n",
       "      <td>71.500000</td>\n",
       "      <td>1.500000</td>\n",
       "      <td>3.300000</td>\n",
       "      <td>0.600000</td>\n",
       "      <td>75.000000</td>\n",
       "      <td>4.400000</td>\n",
       "      <td>20.930000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>2048.50000</td>\n",
       "      <td>81.800000</td>\n",
       "      <td>184.000000</td>\n",
       "      <td>89.500000</td>\n",
       "      <td>2.200000</td>\n",
       "      <td>9.500000</td>\n",
       "      <td>1.700000</td>\n",
       "      <td>79.700000</td>\n",
       "      <td>6.300000</td>\n",
       "      <td>26.470000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>3072.25000</td>\n",
       "      <td>86.700000</td>\n",
       "      <td>193.000000</td>\n",
       "      <td>110.875000</td>\n",
       "      <td>3.200000</td>\n",
       "      <td>15.900000</td>\n",
       "      <td>4.000000</td>\n",
       "      <td>85.200000</td>\n",
       "      <td>8.400000</td>\n",
       "      <td>33.215000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>4096.00000</td>\n",
       "      <td>102.200000</td>\n",
       "      <td>214.000000</td>\n",
       "      <td>163.600000</td>\n",
       "      <td>5.500000</td>\n",
       "      <td>22.200000</td>\n",
       "      <td>6.000000</td>\n",
       "      <td>105.100000</td>\n",
       "      <td>13.800000</td>\n",
       "      <td>65.870000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "               id      genetic       length         mass     exercise  \\\n",
       "count  4096.00000  4095.000000  4093.000000  4094.000000  4095.000000   \n",
       "mean   2048.50000    82.268352   183.880283    92.268442     2.402125   \n",
       "std    1182.55768     7.442579    12.623054    25.791314     1.170062   \n",
       "min       1.00000    63.900000   154.000000    50.000000     0.100000   \n",
       "25%    1024.75000    77.600000   175.000000    71.500000     1.500000   \n",
       "50%    2048.50000    81.800000   184.000000    89.500000     2.200000   \n",
       "75%    3072.25000    86.700000   193.000000   110.875000     3.200000   \n",
       "max    4096.00000   102.200000   214.000000   163.600000     5.500000   \n",
       "\n",
       "           smoking      alcohol     lifespan        sugar          bmi  \n",
       "count  4096.000000  4094.000000  4094.000000  4095.000000  4091.000000  \n",
       "mean      9.807446     2.264558    80.167416     6.482955    27.680929  \n",
       "std       6.921461     1.800523     7.841687     2.710213     8.714897  \n",
       "min       0.000000     0.000000    57.000000     0.700000    11.320000  \n",
       "25%       3.300000     0.600000    75.000000     4.400000    20.930000  \n",
       "50%       9.500000     1.700000    79.700000     6.300000    26.470000  \n",
       "75%      15.900000     4.000000    85.200000     8.400000    33.215000  \n",
       "max      22.200000     6.000000   105.100000    13.800000    65.870000  "
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "df[\"bmi\"] = round(df[\"mass\"]/(df[\"length\"]/100)**2, 2)\n",
    "df.describe()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 204
    },
    "id": "nzLW79xQjCeu",
    "outputId": "e86f7b7a-d6a9-44c2-af1b-ca0d2633c400",
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Drop some columns\n",
    "#df.drop(['length', 'mass'], axis=1, inplace=True)\n",
    "#df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 204
    },
    "id": "bme2D7mj2p4N",
    "outputId": "b144b362-be1d-413a-99d0-932a4b52f82d",
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Rename some columns\n",
    "#df = df.rename(columns={\"Engine HP\": \"HP\", \"Engine Cylinders\": \"Cylinders\", \"Transmission Type\": \"Transmission\", \"Driven_Wheels\": \"Drive Mode\",\"highway MPG\": \"MPG-H\", \"city mpg\": \"MPG-C\", \"MSRP\": \"Price\" })\n",
    "#df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/"
    },
    "id": "Sc_iblz92zQC",
    "outputId": "30043a55-374f-471b-a990-0bc73942d71d",
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "number of duplicate rows:  (0, 10)\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "      <th>bmi</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>73.9</td>\n",
       "      <td>185.0</td>\n",
       "      <td>99.7</td>\n",
       "      <td>0.9</td>\n",
       "      <td>0.0</td>\n",
       "      <td>2.4</td>\n",
       "      <td>73.1</td>\n",
       "      <td>6.9</td>\n",
       "      <td>29.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>86.0</td>\n",
       "      <td>172.0</td>\n",
       "      <td>105.4</td>\n",
       "      <td>1.8</td>\n",
       "      <td>8.1</td>\n",
       "      <td>0.4</td>\n",
       "      <td>85.0</td>\n",
       "      <td>4.2</td>\n",
       "      <td>35.63</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>83.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>1.1</td>\n",
       "      <td>0.8</td>\n",
       "      <td>4.6</td>\n",
       "      <td>81.6</td>\n",
       "      <td>7.5</td>\n",
       "      <td>35.96</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>82.8</td>\n",
       "      <td>164.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>4.7</td>\n",
       "      <td>11.8</td>\n",
       "      <td>1.0</td>\n",
       "      <td>81.0</td>\n",
       "      <td>2.9</td>\n",
       "      <td>41.42</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>78.7</td>\n",
       "      <td>178.0</td>\n",
       "      <td>71.6</td>\n",
       "      <td>1.5</td>\n",
       "      <td>8.3</td>\n",
       "      <td>4.9</td>\n",
       "      <td>75.0</td>\n",
       "      <td>5.5</td>\n",
       "      <td>22.60</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id  genetic  length   mass  exercise  smoking  alcohol  lifespan  sugar  \\\n",
       "0   1     73.9   185.0   99.7       0.9      0.0      2.4      73.1    6.9   \n",
       "1   2     86.0   172.0  105.4       1.8      8.1      0.4      85.0    4.2   \n",
       "2   3     83.3   176.0  111.4       1.1      0.8      4.6      81.6    7.5   \n",
       "3   4     82.8   164.0  111.4       4.7     11.8      1.0      81.0    2.9   \n",
       "4   5     78.7   178.0   71.6       1.5      8.3      4.9      75.0    5.5   \n",
       "\n",
       "     bmi  \n",
       "0  29.13  \n",
       "1  35.63  \n",
       "2  35.96  \n",
       "3  41.42  \n",
       "4  22.60  "
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Any duplicates\n",
    "duplicate_rows_df = df[df.duplicated()]\n",
    "print(\"number of duplicate rows: \", duplicate_rows_df.shape)\n",
    "#df = df.drop_duplicates()\n",
    "#df.head()\n",
    "\n",
    "print(df.isnull().sum())\n",
    "#df = df.dropna()\n",
    "#df.head()\n",
    "\n",
    "#con = sqlite3.connect(f'{dbPath}/db.sqlite3')\n",
    "#df.to_sql('new_table', con=con, index=False, if_exists='replace')\n",
    "\n",
    "\n",
    "\n",
    "# df= pd.read_sql(\"SELECT * FROM new_table\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {
    "id": "XcihVwyQ3qrV"
   },
   "outputs": [],
   "source": [
    "# Now what do we do with those?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 204
    },
    "id": "bQv2_1E534qY",
    "outputId": "897be950-d052-4d5e-8922-d80604111234",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "      <th>bmi</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>73.9</td>\n",
       "      <td>185.0</td>\n",
       "      <td>99.7</td>\n",
       "      <td>0.9</td>\n",
       "      <td>0.0</td>\n",
       "      <td>2.4</td>\n",
       "      <td>73.1</td>\n",
       "      <td>6.9</td>\n",
       "      <td>29.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>86.0</td>\n",
       "      <td>172.0</td>\n",
       "      <td>105.4</td>\n",
       "      <td>1.8</td>\n",
       "      <td>8.1</td>\n",
       "      <td>0.4</td>\n",
       "      <td>85.0</td>\n",
       "      <td>4.2</td>\n",
       "      <td>35.63</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>83.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>1.1</td>\n",
       "      <td>0.8</td>\n",
       "      <td>4.6</td>\n",
       "      <td>81.6</td>\n",
       "      <td>7.5</td>\n",
       "      <td>35.96</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>82.8</td>\n",
       "      <td>164.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>4.7</td>\n",
       "      <td>11.8</td>\n",
       "      <td>1.0</td>\n",
       "      <td>81.0</td>\n",
       "      <td>2.9</td>\n",
       "      <td>41.42</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>78.7</td>\n",
       "      <td>178.0</td>\n",
       "      <td>71.6</td>\n",
       "      <td>1.5</td>\n",
       "      <td>8.3</td>\n",
       "      <td>4.9</td>\n",
       "      <td>75.0</td>\n",
       "      <td>5.5</td>\n",
       "      <td>22.60</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id  genetic  length   mass  exercise  smoking  alcohol  lifespan  sugar  \\\n",
       "0   1     73.9   185.0   99.7       0.9      0.0      2.4      73.1    6.9   \n",
       "1   2     86.0   172.0  105.4       1.8      8.1      0.4      85.0    4.2   \n",
       "2   3     83.3   176.0  111.4       1.1      0.8      4.6      81.6    7.5   \n",
       "3   4     82.8   164.0  111.4       4.7     11.8      1.0      81.0    2.9   \n",
       "4   5     78.7   178.0   71.6       1.5      8.3      4.9      75.0    5.5   \n",
       "\n",
       "     bmi  \n",
       "0  29.13  \n",
       "1  35.63  \n",
       "2  35.96  \n",
       "3  41.42  \n",
       "4  22.60  "
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#df = df.drop_duplicates()\n",
    "#df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/"
    },
    "id": "UBkT-ixm4AUV",
    "outputId": "7baf3da9-f4b2-4c07-faa9-ca94c1c24694",
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "id          0\n",
      "genetic     1\n",
      "length      3\n",
      "mass        2\n",
      "exercise    1\n",
      "smoking     0\n",
      "alcohol     2\n",
      "lifespan    2\n",
      "sugar       1\n",
      "bmi         5\n",
      "dtype: int64\n"
     ]
    }
   ],
   "source": [
    "# Any missing values?\n",
    "\n",
    "#print(df.isnull().sum())\n",
    "#df = df.dropna()\n",
    "#df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {
    "id": "p5kRO-OU4CMy"
   },
   "outputs": [],
   "source": [
    "# Why is it missing? Is it random?\n",
    "# Impute or delete?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 204
    },
    "id": "6ZISqQ_N53d3",
    "outputId": "83bc75ea-45fc-4471-eec2-5316d0796fff",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>genetic</th>\n",
       "      <th>length</th>\n",
       "      <th>mass</th>\n",
       "      <th>exercise</th>\n",
       "      <th>smoking</th>\n",
       "      <th>alcohol</th>\n",
       "      <th>lifespan</th>\n",
       "      <th>sugar</th>\n",
       "      <th>bmi</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>73.9</td>\n",
       "      <td>185.0</td>\n",
       "      <td>99.7</td>\n",
       "      <td>0.9</td>\n",
       "      <td>0.0</td>\n",
       "      <td>2.4</td>\n",
       "      <td>73.1</td>\n",
       "      <td>6.9</td>\n",
       "      <td>29.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>86.0</td>\n",
       "      <td>172.0</td>\n",
       "      <td>105.4</td>\n",
       "      <td>1.8</td>\n",
       "      <td>8.1</td>\n",
       "      <td>0.4</td>\n",
       "      <td>85.0</td>\n",
       "      <td>4.2</td>\n",
       "      <td>35.63</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>83.3</td>\n",
       "      <td>176.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>1.1</td>\n",
       "      <td>0.8</td>\n",
       "      <td>4.6</td>\n",
       "      <td>81.6</td>\n",
       "      <td>7.5</td>\n",
       "      <td>35.96</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>82.8</td>\n",
       "      <td>164.0</td>\n",
       "      <td>111.4</td>\n",
       "      <td>4.7</td>\n",
       "      <td>11.8</td>\n",
       "      <td>1.0</td>\n",
       "      <td>81.0</td>\n",
       "      <td>2.9</td>\n",
       "      <td>41.42</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>78.7</td>\n",
       "      <td>178.0</td>\n",
       "      <td>71.6</td>\n",
       "      <td>1.5</td>\n",
       "      <td>8.3</td>\n",
       "      <td>4.9</td>\n",
       "      <td>75.0</td>\n",
       "      <td>5.5</td>\n",
       "      <td>22.60</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id  genetic  length   mass  exercise  smoking  alcohol  lifespan  sugar  \\\n",
       "0   1     73.9   185.0   99.7       0.9      0.0      2.4      73.1    6.9   \n",
       "1   2     86.0   172.0  105.4       1.8      8.1      0.4      85.0    4.2   \n",
       "2   3     83.3   176.0  111.4       1.1      0.8      4.6      81.6    7.5   \n",
       "3   4     82.8   164.0  111.4       4.7     11.8      1.0      81.0    2.9   \n",
       "4   5     78.7   178.0   71.6       1.5      8.3      4.9      75.0    5.5   \n",
       "\n",
       "     bmi  \n",
       "0  29.13  \n",
       "1  35.63  \n",
       "2  35.96  \n",
       "3  41.42  \n",
       "4  22.60  "
      ]
     },
     "execution_count": 17,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#df = df.dropna()\n",
    "#df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "4084"
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#con = sqlite3.connect(f'{dbPath}/db.sqlite3')\n",
    "#df.to_sql('new_table', con=con, index=False, if_exists='replace')\n",
    "\n",
    "\n",
    "\n",
    "# df= pd.read_sql(\"SELECT * FROM new_table\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 302
    },
    "id": "vB4r0Hzv57Sn",
    "outputId": "2130a1e3-f370-4063-881d-243d8c63bb31",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<AxesSubplot: xlabel='lifespan'>"
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAgQAAAG1CAYAAACGfOzbAAAAOXRFWHRTb2Z0d2FyZQBNYXRwbG90bGliIHZlcnNpb24zLjYuMywgaHR0cHM6Ly9tYXRwbG90bGliLm9yZy/P9b71AAAACXBIWXMAAA9hAAAPYQGoP6dpAAAcJklEQVR4nO3dfXSX9X3/8VcCJNwFULzBzbp6w41AkKogKI6BHacHtBZr23Mm2IkiavFXtUXrserc2qOuCiIoaBXUWjdX5dAqtnV1rds60cLmLaKCw4oVPAoooRCEXL8/ekjJSARB8iXp43GO55DvdV3x/f3kItcz3yshZUVRFAEA/qSVl3oAAKD0BAEAIAgAAEEAAEQQAAARBABABAEAEEEAAEQQAABJ2u7qjkVRpK6udfyjhuXlZa3mubQU1rw0rHtpWPfSsO47Ki8vS1lZ2S7tu8tBUFdXZM2aDbs91L6ibdvy7Ldfp3zwwe+zZUtdqcf5k2DNS8O6l4Z1Lw3r3rj99++UNm12LQjcMgAABAEAIAgAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAABI0rbUA8C+qiiKbN5cW+oxPpaiKJIkZWVl2bq1PJs2tUlt7aZs2VJX4sn2TEVFZcrKyko9BrRqggCasHlzbS68cEKpxyDJrFlzUlnZvtRjQKvmlgEA4BUC2BWden4hZeX79l+Xom5LNrw2P0nLmHdntn8+wN7Xsj9jQDMpK2/boi6wLW1eoPTcMgAABAEAIAgAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAACIIAAAIggAgAgCACCCAADIn0gQFEWRoihKPQYAzcDn/N3TttQD7G1FUeT6669Lklx55bUlngaAven/fs4vKysr8UQtR6sPgs2ba7Ns2av1f27XrmOJJwJgb/m/n/MrK9uXeKKW40/ilgEA8NEEAQAgCAAAQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQAQQQAARBAAABEEAEAEAQCQpG2pB5g371/y2GM/yejRn88ZZ3z5Yx377LOL88Mf3puhQ4flqaf+M2ed9dUMHHhcg+133nn7Jz0yAC3M9teLxx9/LJs3b05FRUUuuODiPPXUf+Y3v3k6SdKhQ4dMnHhRBg48Ls8+uzhz596ZJBk+/JQmrzONXYd2dn1qbLaP2qc5lPQVgvXrP8iCBT9OXV1dFiz4cdav/2CXj62trc19983Je++9mwULfpz33ns3P/jBnNTW1tZvv/feu7Np08b6Y2pq1n/izwGAfdv214tHH52fzZs3J0k2b96cuXPvrI+BJNm4cWPuvffurF//Qe67b07Wr1+f9evX59FH5zd6nWnsOrTt2KauT03N1tQ+zaWkQTBz5tQURZEkKYoiM2dO2+VjFyz4cd5/f139sUmybt26PPbYT3bYvs0dd8zc86EBaFEaux5ss379jl8ovv/+usycOS3r1q3dYVtT15ntr0MzZ077yOtTU7M1tU9zKdktg5deeiGvvfZqg8dee+2VvPTSC+nXr/ojj129elUee+yR+oXepiiKPPbYT9KrV59GF3XZstfy7LOLM3To4NTWbsqWLXV7/kTYqa1by7NpU5sWt+alLHUaakkfi5Z6vrd0f1z3hudKU9eLnXnttVcafbzhdabx61Bjx2477sQTT87BB/dodLbG9mlOZcUurtLWrXVZs2bDJ/I/rauryyWXXJCampodtnXu3Dm33DI75eWNv3hRFEWm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s/LrX/8655xzTj772c/mwAMPzCWXXJKlS5fmF7/4RaZOnZoJEybscK+Jj2/JkiXp3bv3Do9b90/egAEDctxxx+WKK67IwoULs2LFitxyyy156qmncv755+eLX/xiampqctVVV2XZsmWZN29e7rnnnkyaNKnUo7donTt3TlEU+e53v5vXXnstL7zwQi688MIMGTIkQ4cOzfjx4/P888/npptuyvLlyzNnzpz87Gc/y3nnnVfq0VuVnZ3fFRUVGTduXG666aY88cQTWbp0aS699NL06NEjo0aNKvH0+56yohX/DMzcuXNz//33Z/Xq1TnyyCNz8cUX57Of/WyS5I033sh1112XRYsWpWvXrjnzzDNz8cUXq/dPwMSJE9O5c+dMmzZth23W/ZP3/vvv55ZbbsmvfvWrvP/+++nVq1cuu+yyDB48OEny/PPP57vf/W6WLFmSAw88MBMmTMi4ceNKPHXLt3r16vzDP/xDFi5cmIqKiowaNSpTpkxJp06dkiT//u//nu9973tZsWJFDj300Fx88cUZPXp0iadu2b71rW/lrbfeyg9+8IP6x3Z2fm/dujVTp07NvHnzsmnTpgwaNCjXXHNNDj300FI8hX1aqw4CAGDX+LIMABAEAIAgAAAiCACACAIAIIIAAIggAAAiCGCf1Lt378yYMSNJ8vTTT6d3794N/vnV733vexk8eHAGDhyY+fPnl2hKoDVplb/tEFqTfv365cEHH8xRRx2V5A+/p+Cuu+7Kl7/85Zx++uk54ogjSjwh0BoIAtjHde7cOQMHDqx/e926dUmSMWPG1P/KY4A95ZYB7OO2v2UwY8aMjB8/Pkny1a9+NSNHjqzf70c/+lHGjBmT/v3756/+6q8yY8aMBr8Fbs2aNfnGN76Rk046KdXV1Tn99NMb3G6YN29eevfuneeeey5jx47NgAEDctppp+VnP/tZg3lWrlyZyy+/PMOGDUu/fv0ydOjQXH755Vm7dm39PiNHjsytt96aG2+8MSeeeGIGDBiQc889NytWrNg7iwTsMUEALciXvvSlXHPNNUmSa665JjNnzkyS3HHHHbn66qszdOjQzJ49O2eddVa+//3v5+qrr64/dsqUKVm+fHmuu+66fP/730/fvn3rf0vi9iZNmpRTTjklM2fOzOGHH55LLrkkTz75ZJJk48aNOfvss7N8+fJce+21ufvuu3P22WdnwYIFO/wyq/vuuy+vv/56rr/++nznO9/Jiy++mCuuuGJvLg+wB9wygBakR48e9d9LcNRRR6Vv375Zv359br/99nzlK1/Jt7/97STJsGHD0q1bt3z729/OOeeck549e+aZZ57J1772tfrf+Dl48OB069Zth189PX78+Hzta19Lkpx88skZO3ZsbrvttgwfPjwrVqxIjx49cuONN+ZTn/pUkmTIkCF57rnn8swzzzR4P126dMntt9+eNm3aJEl++9vfZsaMGVm7dm3222+/vbdIwG4RBNDC/c///E82bdqUkSNHZsuWLfWPb7ud8Otf/zo9e/bMCSeckBkzZmTJkiU5+eSTM3z48Ea/Yh87dmz9n8vKyvLXf/3XmTFjRjZt2pSjjz46DzzwQOrq6rJixYq88cYbWbZsWV5//fUG/+8kqa6uro+B5A8xk/zhVQZBAPseQQAt3LZvMjz//PMb3f7OO+8kSaZNm5bZs2fnpz/9aX7+85+nvLw8J554Yv7+7/8+f/7nf16//0EHHdTg+O7du6coinzwwQdp37595s6dm9mzZ2fdunU54IAD0r9//3To0CHr169vcFyHDh0avF1e/oc7lHV1dXv0fIG9QxBAC9elS5ckyU033ZRPf/rTO2w/4IADkiRVVVWZMmVKpkyZktdffz1PPPFEbr/99lx33XW588476/ffdqHf5t13302bNm3SrVu3PPLII7nhhhsyZcqUnHHGGdl///2TJF//+tfzwgsv7MVnCextvqkQWrhjjjkm7dq1y+rVq1NdXV3/X9u2bTN16tSsXLkyb731VoYPH17/EwNHHHFEJk6cmBNPPDG/+93vGry/X/ziF/V/Looijz/+eI477rhUVFRk8eLF6dKlS84777z6GNiwYUMWL17sK39o4bxCAC3cfvvtl/POOy/Tp09PTU1NTjjhhKxevTrTp09PWVlZ+vTpk6qqqvTo0SPf+c53UlNTk8MOOywvvvhinnzyyUyaNKnB+/vHf/zH1NbW5vDDD8+PfvSjLF++PPfee2+SZMCAAfmnf/qn3HDDDRkxYkTeeeed3H333Xn33XfTtWvXUjx94BMiCKAVuOSSS3LggQfmgQceyF133ZWuXbtm6NChueyyy1JVVZUkmTlzZqZOnZrp06dn7dq1OeSQQzJ58uQdvvfg7/7u73LHHXfkzTffTN++fTNnzpz6fwBp7NixWblyZR5++OE88MADOfjggzN8+PD8zd/8Ta6++uosX748Rx55ZLM/f2DPlRVFUZR6CKD05s2blyuvvDJPPPFEDj300FKPAzQz30MAAAgCAMAtAwAgXiEAACIIAIAIAgAgggAAiCAAACIIAIAIAgAgggAAiCAAAJL8f6Yl0Up+QPmgAAAAAElFTkSuQmCC\n",
      "text/plain": [
       "<Figure size 640x480 with 1 Axes>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Got any outliers?\n",
    "sns.boxplot(x=df['lifespan'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 302
    },
    "id": "O7xt3EkG9Epi",
    "outputId": "408f4be7-75a7-4cac-e5b8-6789e705dd88",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<AxesSubplot: xlabel='bmi'>"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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/OG9GXZAWb16dfz+97+Pu+++O4455piIiLj22mvjd7/7XTz00EOxfv36OPzww+OKK66IiIgxY8bEsmXL4vbbb4+pU6fWcur7nJdeeine9ra3xUUXXRTjxo2LiIhLLrkkzjjjjFi5cmU8+uij7skeuuWWW+KAAw7otM2/7Z5ZsWJFvPOd74y3vOUtO+278847rWU3lVLiW9/6VsyePTtmzZoVEREXX3xxLF26NJ544ol4/vnn4x//+Efcc889MWLEiBg3blysX78+vv71r8enPvWpGDx4cI2fwb5tr94m+Otf/xr77bdfPPjggzFx4sRO+5YuXRrHHXdc1Nf//9444YQT4m9/+1usW7dub4YdUEaNGhW33XZbNDY2VrdVKpWoVCqxadOmWLp06U6f9E844YR48skno5TyRk93nzZixIj45je/WQ2BDRs2xB133BGHHHJIjB071j3ZQ0uWLImf/OQn8dWvfrXTduvYM8uXL48xY8Z0uc9adt9zzz0Xzz//fJx22mmdti9YsCAuuuiiWLp0aYwfPz5GjBhR3XfCCSfEyy+/HM8888wbPd1+Z69iYNq0aXHLLbfE29/+9p32/fOf/4xDDjmk07ZtZfzCCy/szbADyoEHHhgnn3xyp2p95JFHYvXq1fHe9753l+v46quvxosvvvhGT7ffuPbaa2Pq1KnR1NQU119/fQwdOtQ92QObNm2Kz33uc/H5z38+Dj300E77rGPPrFixIjZs2BCzZs2K97znPfGxj30sfvvb30aEteyJ5557LiIiXnnllZgzZ05MnTo1zj777PjlL38ZEdZyb/XZTxO0tLTs9LJMQ0NDRES0trb21bD93h//+Me45ppr4pRTTon3v//9Xa7jtsdbt26txRT7hfPOOy/uu+++mDlzZlx66aXx17/+1T3ZA1/84hdj0qRJO30VFuHfdk+0tbXFqlWr4qWXXorLLrssbrvttjj66KNj7ty58eijj1rLHnj55ZcjImLevHkxc+bMWLhwYZx44olxySWXWMtesFffM7A7Q4YM2emT1bb/IEOHDu2rYfu1X/ziF/HZz342Jk+eHDfeeGNE/Ptm3nEdtz3ef//93/A59hdjx46NiIjrr78+nnrqqVi0aJF7spsWL14cS5cujYceeqjL/dax++rr6+Pxxx+PQYMGxZAhQyIiYsKECbFy5cpYsGCBteyB/fbbLyIi5syZEx/60IciIuLd7353LFu2LH7wgx9Yy73UZ68MHHLIIbF27dpO27Y9Pvjgg/tq2H5r0aJFcdlll8UHPvCB+N73vlct2kMPPbTLdRw6dGgMHz68FlPdZ23YsCGampqira2tuq2uri7Gjh0ba9eudU9203333Rfr16+P97///TFp0qSYNGlSRETMnz8/LrzwQuvYQ8OGDauGwDaHHXZYrFmzxlr2wLb12PY9QduMHTs2/v73v1vLvdRnMTBlypR48sknO/2M52OPPRbvete7YvTo0X01bL909913x5e//OWYNWtW3HTTTZ1e6jr22GPjiSee6HT8Y489FpMnT466Or8zanvr1q2LK6+8Mh599NHqttdeey2WLVsWY8aMcU9204033hgPP/xwLF68uPonIuLyyy+P66+/3jr2wMqVK2Py5Mnx+OOPd9r+9NNPx9ixY61lD4wfPz6GDRsWTz31VKftK1asiHe84x0xZcqUWLZsWfXthIh/r+WwYcPiiCOOeKOn2//01s8ozps3r9PvGVi3bl2ZMmVKmTdvXlm5cmW57777SmNjY7n//vt7a8gBYdWqVWX8+PHl0ksv7fQzyGvXri2bNm0qK1asKOPHjy/f+MY3SnNzc1mwYIHfM7AbF154YTnllFPKE088UZYvX16uvPLKMmXKlPL888+7J/fC9r9nwDp2X3t7e/nwhz9cpk+fXpYsWVKam5vLf/3Xf5UJEyaU5cuXW8se+s53vlMmTZpUHnrooU6/Z+Cxxx4rLS0t5YMf/GCZM2dOeeaZZ6q/Z+CWW26p9bT7hT6LgVJKeeqpp8pHPvKRMmHChPKBD3yg/PCHP+yt4QaMW2+9tYwbN67LP/PmzSullPKb3/ymzJw5s0yYMKGceuqppampqcaz3ndt2rSpzJ8/v5x44onlqKOOKhdccEFZsWJFdb97cs9sHwOlWMee+Ne//lWuvvrqcuKJJ5bGxsZyzjnnlCVLllT3W8ueWbhwYZk2bVoZP358Of3008vPf/7z6r6//e1v5fzzzy+NjY3lpJNOKjfffHNpb2+v4Wz7j0opflgdADLzpjMAJCcGACA5MQAAyYkBAEhODABAcmIAAJITAwCQnBiAAWjatGlx9dVX9/p1r7766pg2bVqvXxeorT77vxYCA88ll1wSs2fPrvU0gF4mBoBue8c73lHrKQB9wNsEMEC99tpr8ZWvfCWmTJkSxx57bMybNy82bNgQEf9+uX/OnDnxk5/8JD74wQ/GUUcdFR/96Efjueeei1/96ldx2mmnxcSJE+Pss8+OZ555pnpNbxPAwOSVARigfvazn8XEiRPjq1/9amzYsCFuvPHGaG5ujnvuuSciIv70pz/F2rVr4+qrr47W1tb44he/GHPnzo1KpRKXX3557L///jF//vz47Gc/G01NTTV+NkBfEgMwQI0aNSoWLFgQQ4cOrT6+9NJL47e//W1ERGzZsiVuvvnmGDNmTEREPPHEE/HjH/847rjjjpg6dWpERKxevTq+9rWvxaZNm+LAAw+szRMB+py3CWCAOvnkk6shEPHvnzCor6+PJUuWRETEiBEjqiEQEfGmN70pIiImTpxY3TZy5MiIiNi0adMbMGOgVsQADFBvfvObOz2uq6uLUaNGVT+xH3DAAV2et31AADmIARigNm7c2Olxe3t7vPjiizF69OjaTAjYZ4kBGKB+//vfR1tbW/XxI488Em1tbXH88cfXcFbAvkgMwAD1r3/9Ky677LL4wx/+EHfffXd84QtfiBNPPLH6zYEA2/hpAhigPv7xj8fmzZvj0ksvjcGDB8dpp50WV111VVQqlVpPDdjHVEoppdaTAABqx9sEAJCcGACA5MQAACQnBgAgOTEAAMmJAQBITgwAQHJiAACSEwMAkJwYAIDkxAAAJCcGACC5/wfuBkYp6/hLBAAAAABJRU5ErkJggg==\n",
      "text/plain": [
       "<Figure size 640x480 with 1 Axes>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sns.boxplot(x=df['bmi'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 302
    },
    "id": "Yr3N-G819E-H",
    "outputId": "78c74029-07a0-4255-cb5f-d0f8ab9ca765",
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<AxesSubplot: xlabel='genetic'>"
      ]
     },
     "execution_count": 21,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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9FwYW7t2rUtOTnYrV650n332mfvDH/7gunXr5j744APnnHO//OUv3QMPPOC+/vrrkH8tTWVlZZ01vPHGG65r167ulVdecVVVVe766693d911l9u3b59bv369y8zMdM8884zXo5+V+tbpXORsU+ecmz9/vhs4cKB7++233YEDB9xDDz3kevfu7b766itXVlbm+vXr52bOnOlKSkrcK6+84lJTU4Pfh5bmTGt1zrmxY8e6uXPnhmzTb775xuOpz01ubq4bOnSo27hxoysuLnZ5eXlu+PDhrrKy0pWUlLjU1FQ3d+5cV1JS4p5//nmXnJzs3nvvPa/HPidnWqtzzg0YMMC99NJLIdv18OHD3g59FlauXOm6devmcnJygsc15L65YMEC169fP/fWW2+5vXv3utzcXHf99dcHvy8tUdjGQCAQcMOGDXNPPPFEyPG5ublu8eLFzjnnbrzxRrd8+XIPpju/jh496oYNG+YefPBB55xz69atcz169HDl5eXB87z88ssuIyOjRf/w/fc6nYusbTp69Gg3Z86c4OHvv//eJSUluddff90tXrzYDRo0yJ04cSJ4+tNPP+2uv/56L0ZttDOtNRAIuLS0NPfGG294OGHTKCoqcklJSW7Tpk3B444cOeL69Onj1qxZ42bNmuXGjh0bcpnp06e73Nzc5h610epb66FDh1xSUpL76KOPPJzy3JSWlropU6a4tLQ0l52dHRID9d03KysrXXp6uvvTn/4UPP3bb791PXv2dOvWrWu+RTSxsN1N8Omnn+pf//qXRo0aFXL8smXLNGXKFFVVVenAgQO66qqrPJrw/Fm8eLGOHz+u/Px8SdLOnTuVkpKiH/3oR8Hz9O/fX0eOHNHevXu9GrPR/nudkbZNO3TooLfeeksHDx5UTU2NVq1apdjYWHXr1k07d+5UZmamoqOjg+fv37+/Dhw4oEOHDnk49bk501o///xzHTt2LCK264EDByRJffr0CR6XkJCgyy+/XNu3b9fOnTs1YMCAkMv0799f77//vpxzzTlqo9W31n379snn8+nKK6/0aMJz99FHHykmJkZ//etf1atXr5DT6rtvfvzxxzp69GjIdr7ggguUnJysHTt2NNsamlpYx4AkHTt2TJMmTdKAAQN08803a8OGDZKkkpIS1dTU6PXXX9cNN9yga665Rg888IC+/vprL8dutLKyMr3wwgu6++671bZtW0lSaWmpLr744pDzdezYUZL05ZdfNveITeJU64y0bfrQQw8pJiZG1157rVJTUzVv3jzNnz9fnTp1irhteqa1FhcXS5JWrFihrKwsXXfddXrsscf0/fffezz12TvVNqqpqVFpaanKyspOu12PHz+uw4cPN+usjVXfWouLi9WmTRs99thjGjJkiLKzs1VQUKCqqiqvRm6wrKwsLViwQJdddlmd0+q7b5aWlkqSLrnkkjrnqT2tJQrbGDhy5IgkKT8/XyNHjlRhYaEGDhyovLw8bdmyJfgLplWrVnrmmWf0+OOP65NPPtEdd9yhiooKL0dvlJdeeklt2rTRuHHjgsdVVFQoNjY25HxxcXGSpMrKymadr6mcap2Rtk1LSkrUpk0bLVy4UKtWrdJNN92k+++/X3v37o24bXqmtRYXF8vv96tjx45avHixHnzwQb3zzjvKy8tTIBDwevSzkpqaqquuukqzZ8/WV199pYqKCj399NM6fPiwTpw4ccrtWnu4JTxInqy+tRYXF6uyslI9e/bU888/r6lTp+rPf/6zHn74Ya9Hb5T67pvHjx+XpFOepyXed2tF138Wb8TExEiSJk2apJ/85CeSpO7du6uoqEjLly/X0qVLNWTIELVv3z54mS5dumjIkCHasGGDhg8f7sncjbV27VqNGTNG8fHxwePi4+Pr/CKp/aFr3bp1s87XVE61zjFjxkTMNv3yyy9133336YUXXgg+zZqamqqSkhItWLAgorZpfWt99tlnddttt6ldu3aSpKSkJP34xz/WLbfcoj179tR5mjacxcbG6tlnn9WMGTM0ZMgQxcTEaNSoURo2bJj8fr/i4uLqbNfaw61atfJi5HNW31ofe+wx5efnB3dfJiUlKSYmRvfee69mzJihCy+80OMVnJv67pu1v7OqqqpCfn9VVla2uG18srCNgYsuukjSDz9gJ+vcubM2btwoSSEPGtIPT9O0bdu2xT5V8/HHH+uLL76o8zqJiy++OPi/5lq1T53Xfp9aktOtU4qcbbp7926dOHFCqampIcf36tVLmzdv1qWXXlpn90dL3ab1rdXv9wdDoFaXLl0k/fCUbEuKAUm6+uqrtXr1apWXlys6OlqJiYkaO3as+vfvr0suueSU27V169Zq06aNRxOfuzOtNTo6OuR1TFLodm2pMXDxxRef8b5ZXV0dPK5Tp04h52mpb4OWwng3QUpKihISErR79+6Q44uLi9WpUyfNmzdPN9xwQ8iLcg4ePKjDhw+rc+fOzT1uk9i5c6c6dOigbt26hRzft29fFRUVBXedSNLWrVuVkJBQ57wtwenWGUnbtHaf4759+0KOLy4u1hVXXKG+ffvq/fffD/msiK1bt+rKK69Uhw4dmnXWxqpvrTNmzNCECRNCTtuzZ48ktbjteuTIEeXk5Ojjjz9W27ZtlZiYqIMHD6qoqEgDBw5Unz59tH379pDLbN26VRkZGfL7w/bX7SnVt9bbb79dM2fODLnMnj17FBMToyuuuMKboZtAfffNbt26KTExUdu2bQue/t1336moqEh9+/b1YuSm4fG7Gc5o4cKFLj093a1bty7kcwa2bt3q9uzZ41JSUtwjjzziPvnkE7d9+3Y3ZswYd+utt7pAIOD16Odk5syZbsKECXWOr6iocNddd52bNGmS27t3b/BzBhYsWODBlI13unVG0jatqalxP/vZz1x2drbbsmWL+/TTT928efNc9+7d3a5du9yhQ4dc3759XX5+vtu/f79bvXq1S01NdWvWrPF69LNW31rffPNNl5SU5BYsWOA+++wzt3HjRpeVleWmT5/u9ejn5LbbbnM5OTmuuLjYffjhh27kyJFu4sSJzjnniouLXUpKivv973/vSkpK3LJly1r05wycaa0rVqxw3bt3dy+99JL7/PPP3auvvur69evn5s6d6/HUZyc/Pz/krYUNuW/OnTvXZWZmujfffDPkcwaqqqq8WEKTCOsYcM65wsJCl5WV5VJSUtzo0aPd+vXrg6e99957bty4cS4tLc1lZma6mTNnhrwXv6X5+c9/7qZNm3bK0w4cOOAmTpzoUlNT3aBBg1xBQYGrqalp5gmbxpnWGUnbtLy83D366KPummuucenp6W7cuHFu27ZtwdN3797tbrnlFtejRw83bNgwt2LFCg+nbZz61vraa6+5MWPGuJ49e7qBAwe6J554wlVUVHg48bkrLS1199xzj+vdu7cbMGCAmz17tjty5Ejw9E2bNrmRI0e6Hj16uOzsbPfqq696OG3j1LfWlStXuhtvvDH4M7xo0aIW93vpv2PAufrvm9XV1e7JJ590/fv3d2lpaW7y5Mnuiy++aM6xm5zPuRb25lcAANCkWtZOLAAA0OSIAQAAjCMGAAAwjhgAAMA4YgAAAOOIAQAAjCMGAJw13pEMRBZiAMBZ+fvf/678/Pzg4W3btqlr164hH88KoGUJ2z9UBCA8vfDCCyGHU1JStGrVqhb3dwYA/B9iAECjJCYmKi0tzesxADQCuwmAMHfixAk99dRTGjJkiHr27KlJkyZp7dq16tq1qw4ePCjph78EmZOTo169eikzM1P5+fkqKysLXseaNWuUnJys3bt3a9y4cUpNTdWwYcO0bNmykNuqrKzUk08+qaFDh6pHjx4aNWqUXnvtteDpt99+u7Zv367t27cHdw2cajfBrl27lJubq4yMDPXv31/Tp0/XV199dZ6/UwDOFTEAhLlHHnlEf/zjH5WTk6OFCxfqwgsv1KxZs4Kn79ixQxMmTFB8fLwKCgr0q1/9Stu3b9cdd9yhioqK4PkCgYCmTZum4cOHa+nSpcrIyNCTTz6pt99+W9IPLwq855579PLLL2vixIlatGiR0tPTde+992rt2rWSpNmzZys5OVnJyclatWqVUlJS6sxbVFSknJycYFj8+te/1j//+U9NmjQp+LfgAYQXdhMAYezzzz/XX/7yF+Xn52vixImSpMGDB+vQoUN65513JElPP/20rrzySi1ZskRRUVGSpF69emnEiBFavXq1xo8fL+mHB/u8vDzdfPPNkqTevXtr/fr12rhxowYPHqz33ntPb7/9tubNm6fhw4cHb+v48eN66qmnNHLkSHXu3FmJiYmSdNpdA4sXL1bbtm1VWFiouLg4SVLHjh113333af/+/erevfv5+WYBOGc8MwCEsW3btsk5p+zs7JDjR44cKUmqqKjQ7t27NXToUDnnVF1drerqal122WW6+uqr9e6774ZcLj09Pfh1bGys2rdvr2PHjkmStmzZIp/Pp6FDhwavp7q6WllZWfr3v/+t/fv3N2jm999/X0OGDAmGQO3tbtiwgRAAwhTPDABhrHa/f4cOHUKOrz387bffKhAI6LnnntNzzz1X5/InPyBLUnx8fMhhv98f/MyA8vJyOeeUkZFxylm+/vrrBj2Yl5eX15kXQHgjBoAwdtFFF0mSDh06pEsvvTR4fG0kJCYmyufzacKECRoxYkSdy7dq1arBt9WmTRu1bt1aL7744ilPv/zyyxt8PSe/eLHWpk2b1L17d3Xs2LHBMwFoHuwmAMJY7969FRUVpfXr14cc/8Ybb0iSEhISlJycrE8++USpqanBf126dNGCBQvO6oOAMjMzdezYMTnnQq6ruLhYCxcuDL74z+8/86+NPn366N1331VVVVXwuKKiIt1111366KOPGjwPgObDMwNAGLvsssv005/+VHPnztWJEyfUrVs3rV+/Xm+99ZakHx6Yp0+frrvuukv33XefRo8erZqaGhUWFmr37t3Ky8tr8G0NHTpUffv2VV5envLy8nT11Vfrww8/1Pz58zV48GC1b99eknTBBRfoH//4h7Zs2aLk5OQ615OXl6dx48ZpypQpwXc0FBQUqGfPnho4cGDTfGMANCmeGQDC3KxZs3TrrbeqsLBQeXl5Ki0t1dSpUyVJrVu31qBBg7Rs2TKVlpbqF7/4hWbMmKGoqCgtX778rD4MyO/3a+nSpRoxYoSWLFmiSZMmBd9mOG/evOD5xo8fr5iYGE2ePFmbN2+ucz3JyclasWKFqqurNW3aNP32t79V7969tWTJEsXGxjb6+wGg6fkcf3EECFvl5eXavHmzBg8erHbt2gWP/93vfqc1a9bw9wAANAl2EwBhrFWrVnr88cfVvXt33XnnnWrdurV27dqllStXasqUKV6PByBC8MwAEOb27t2rgoIC7dq1S8ePH1enTp106623avz48fL5fF6PByACEAMAABjHCwgBADCOGAAAwDhiAAAA44gBAACMIwYAADCOGAAAwDhiAAAA44gBAACMIwYAADDu/wNksmf+9vAeAgAAAABJRU5ErkJggg==\n",
      "text/plain": [
       "<Figure size 640x480 with 1 Axes>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sns.boxplot(x=df['genetic'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/"
    },
    "id": "ATK-V_73-AjG",
    "outputId": "85c06103-94a0-46e7-e1fe-e166c6284c72",
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "id          1023.7500\n",
      "genetic       77.6000\n",
      "length       175.0000\n",
      "mass          71.4750\n",
      "exercise       1.5000\n",
      "smoking        3.3750\n",
      "alcohol        0.6000\n",
      "lifespan      75.0000\n",
      "sugar          4.4000\n",
      "bmi           20.9375\n",
      "Name: 0.25, dtype: float64\n",
      "\n",
      "id          3073.2500\n",
      "genetic       86.7000\n",
      "length       193.0000\n",
      "mass         110.8250\n",
      "exercise       3.2000\n",
      "smoking       15.9000\n",
      "alcohol        4.0000\n",
      "lifespan      85.2000\n",
      "sugar          8.4000\n",
      "bmi           33.2075\n",
      "Name: 0.75, dtype: float64\n",
      "\n",
      "id          2049.500\n",
      "genetic        9.100\n",
      "length        18.000\n",
      "mass          39.350\n",
      "exercise       1.700\n",
      "smoking       12.525\n",
      "alcohol        3.400\n",
      "lifespan      10.200\n",
      "sugar          4.000\n",
      "bmi           12.270\n",
      "dtype: float64\n"
     ]
    }
   ],
   "source": [
    "Q1 = df.quantile(0.25)\n",
    "Q3 = df.quantile(0.75)\n",
    "IQR = Q3 - Q1\n",
    "print(Q1)\n",
    "print()\n",
    "print(Q3)\n",
    "print()\n",
    "print(IQR)\n",
    "df = df[~((df < (Q1 - 1.5 * IQR)) |(df > (Q3 + 1.5 * IQR))).any(axis=1)]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "metadata": {},
   "outputs": [
    {
     "ename": "SyntaxError",
     "evalue": "unterminated string literal (detected at line 13) (4087764212.py, line 13)",
     "output_type": "error",
     "traceback": [
      "\u001b[1;36m  Cell \u001b[1;32mIn[23], line 13\u001b[1;36m\u001b[0m\n\u001b[1;33m    dbPath= \"db.sqlite\u001b[0m\n\u001b[1;37m            ^\u001b[0m\n\u001b[1;31mSyntaxError\u001b[0m\u001b[1;31m:\u001b[0m unterminated string literal (detected at line 13)\n"
     ]
    }
   ],
   "source": [
    "df.to_sql('new_table', con=con, index=False)\n",
    "\n",
    "# close Connection\n",
    "con.close()\n",
    "\n",
    "conn = sqlite3.connect('test_database') \n",
    "c = conn.cursor()\n",
    "\n",
    "\n",
    "\n",
    "loggingPath = path.join(Path.cwd.INFO)\n",
    "\n",
    "dbPath= \"db.sqlite\n",
    "\n",
    "conn = sqlite3.connect('test_database') \n",
    "c = conn.cursor()\n",
    "\n",
    "df= pd.read_sql('Select*From_apl"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#l/usr/bin/env"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "../scripts/pipeline.py"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 429
    },
    "id": "L78AGe8p-b-S",
    "outputId": "d5bad801-c044-4a28-d414-7f2e49bfd476",
    "tags": []
   },
   "outputs": [],
   "source": [
    "df.value_counts().nlargest(40).plot(kind='bar', figsize=(10,5))\n",
    "plt.title(\"lifespan\")\n",
    "plt.ylabel('Number of people')\n",
    "plt.xlabel('bmi');"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 544
    },
    "id": "_L1GUKrONR4f",
    "outputId": "506aafec-a58b-4993-95fc-e56f12759d1a",
    "tags": []
   },
   "outputs": [],
   "source": [
    "plt.figure(figsize=(10,5))\n",
    "c= df.corr()\n",
    "sns.heatmap(c,cmap=\"BrBG\",annot=True)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "colab": {
     "base_uri": "https://localhost:8080/",
     "height": 394
    },
    "id": "VwaZ97RYNa0s",
    "outputId": "9523d633-9efb-4a91-fabe-d8d7570ecd4d",
    "tags": []
   },
   "outputs": [],
   "source": [
    "fig, ax = plt.subplots(figsize=(10,6))\n",
    "ax.scatter(df['smoking'], df['lifespan'])\n",
    "ax.set_xlabel('smoking')\n",
    "ax.set_ylabel('lifespan')\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": []
   },
   "outputs": [],
   "source": [
    "fig, ax = plt.subplots(figsize=(10,6))\n",
    "ax.scatter(df['bmi'], df['lifespan'])\n",
    "ax.set_xlabel('bmi')\n",
    "ax.set_ylabel('lifespan')\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": []
   },
   "outputs": [],
   "source": [
    "fig, ax = plt.subplots(figsize=(10,6))\n",
    "ax.scatter(df['genetic'], df['lifespan'])\n",
    "ax.set_xlabel('genetic')\n",
    "ax.set_ylabel('lifespan')\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "fig, ax = plt.subplots(figsize=(10,6))\n",
    "ax.scatter(df['smoking'], df['lifespan'])\n",
    "ax.set_xlabel('smoking')\n",
    "ax.set_ylabel('lifespan')\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": []
   },
   "outputs": [],
   "source": [
    "# close Connection\n",
    "con.close()\n"
   ]
  }
 ],
 "metadata": {
  "colab": {
   "provenance": []
  },
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.10.10"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}