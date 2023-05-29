import os

for count, file in enumerate(os.listdir()):
    name, file_ext = os.path.splitext(file)
    if name != "change":
        file_ext = ".jpg"
        new = f'{name}{file_ext}'
        os.rename(file, new)