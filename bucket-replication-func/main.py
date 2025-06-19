from google.cloud import storage
import os

storage_client = storage.Client()

PRIMARY_BUCKET = os.environ.get('PRIMARY_BUCKET')
SECONDARY_BUCKET = os.environ.get('SECONDARY_BUCKET')

def replicate_file(event, context):
    """Triggered by a change to a Cloud Storage bucket.
    Copies the uploaded file from primary to secondary bucket."""
    
    file_name = event['name']
    print(f"Processing file: {file_name}")

    source_bucket = storage_client.bucket(PRIMARY_BUCKET)
    destination_bucket = storage_client.bucket(SECONDARY_BUCKET)
    source_blob = source_bucket.blob(file_name)
    destination_blob = destination_bucket.blob(file_name)

    # Copy file from primary to secondary bucket
    destination_blob.rewrite(source_blob)
    print(f"Copied {file_name} from {PRIMARY_BUCKET} to {SECONDARY_BUCKET}")
