from google.cloud import bigquery
import pandas as pd
client = bigquery.Client()
import os

LOAD_DATASET = os.environ.get("LOAD_DATASET")
LOAD_TABLE = os.environ.get("LOAD_TABLE")
with open("queries/scheduled.sql", "r") as f:
    sql = f.read()


df = client.query(sql).to_dataframe()
df.to_csv("data/new_data.csv", index=False)
