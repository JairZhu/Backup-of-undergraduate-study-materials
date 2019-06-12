import numpy as np
file = open("16337327_00.txt", 'r', encoding='utf-8')

resultStd = []
for line in file:
    resultStd.append(int(line.strip().split()[0]))

file = open("16337327_0.txt", 'r', encoding='utf-8')
resultStu = []
for line in file:
    resultStu.append(int(line.strip().split()[0]))

acc = 0
for i in np.arange(len(resultStu)):
    if resultStd[i] == resultStu[i]:
        acc+=1

print(1.0*acc/len(resultStu))