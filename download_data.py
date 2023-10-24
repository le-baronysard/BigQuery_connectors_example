from google.cloud import bigquery
import pandas as pd
import os

LOAD_DATASET = os.environ.get("LOAD_DATASET")
LOAD_TABLE = os.environ.get("LOAD_TABLE")

client = bigquery.Client()

sql = f"""
    SELECT *
    FROM `{LOAD_DATASET}.{LOAD_TABLE}`
"""


df = client.query(sql).to_dataframe()
df.to_csv("data/data.csv", index=False)
