import os

path = "contract"
files= os.listdir(path)
files.sort()
m = 0
for file in files:
    print(file)
    os.system("python oyente.py -s contract/{i}.sol 2>&1 | tee result/{i}.log".format(i=m))
    m += 1
