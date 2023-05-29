import os

for count, file in enumerate(os.listdir()):
    name, ext = os.path.splitext(file)
    new = name.split(' ', 1)[1]+ext
    os.rename(file, new)