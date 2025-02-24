import os

# Function to delete files containing "Zone.Identifier" in their name
def delete_zone_identifier_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if "Zone.Identifier" in file:
                file_path = os.path.join(root, file)
                try:
                    os.remove(file_path)
                    print(f"Deleted: {file_path}")
                except Exception as e:
                    print(f"Error deleting {file_path}: {e}")

# Start from the current directory
delete_zone_identifier_files(".")
