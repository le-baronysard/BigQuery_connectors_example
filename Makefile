
# Create Dataset with bq
create_dataset :
	bq mk --dataset $(DATASET_ID)

# Create Table with bq
create_table :
	bq mk --table $(DATASET_ID).$(TABLE_ID)

delete_table :
	bq rm -f $(DATASET_ID).$(TABLE_ID)

delete_dataset :
	bq rm -r -f $(DATASET_ID)

download_data_with_python:
	python load_data.py
