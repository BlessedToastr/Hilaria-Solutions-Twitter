import os

for count, file in enumerate(os.listdir()):
    file_name, file_ext = os.path.splitext(file)
    print(file_name)
    if 'post ' in file_name:
        file_name = "NULL"+str(count)
        file_ext = ".jpg"
        new_name = f'{file_name}{file_ext}'
        os.rename(file, new_name)