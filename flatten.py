import os
import shutil
import re

# Utility function to sanitize file names by removing problematic characters


def sanitize_filename(filename):
    # Replace any character that is not alphanumeric, space, hyphen, or underscore
    filename = re.sub(r'[^a-zA-Z0-9._-]', '_', filename)
    return filename


def flatten_folder(source_folder, destination_folder):
    for root, _, files in os.walk(source_folder):
        for filename in files:
            sanitized_filename = sanitize_filename(
                filename)  # Sanitize file name
            source_path = os.path.join(root, filename)
            destination_path = os.path.join(
                destination_folder, sanitized_filename)

            # If file already exists in destination folder, add suffix to avoid overwriting
            if os.path.exists(destination_path):
                base, ext = os.path.splitext(sanitized_filename)
                index = 1
                while os.path.exists(os.path.join(destination_folder, f"{base}_{index}{ext}")):
                    index += 1
                destination_path = os.path.join(
                    destination_folder, f"{base}_{index}{ext}")

            shutil.move(source_path, destination_path)


# Example usage:
source_folder = r"C:\Users\wozni\Desktop\source"
destination_folder = r"C:\Users\wozni\Desktop\target"

flatten_folder(source_folder, destination_folder)
