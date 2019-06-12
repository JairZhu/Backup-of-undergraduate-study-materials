import numpy as np
import matplotlib.pyplot as plt
import xlrd
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
import csv
#打开excel文件
data=xlrd.open_workbook('MCM_NFLIS_Data.xlsx')
#获取第一张工作表（通过索引的方式）
table=data.sheets()[1]
#data_list用来存放数据
data_list=[]
#将table中第一行的数据读取并添加到data_list中
for i in range(1,24063):
    data_list.append(table.row_values(i))

xx = np.arange(1, 9, 1)
x = np.arange(1, 13.1, 0.1)
drugs = ['Oxycodone', 'Hydrocodone', 'Heroin', 'Fentanyl', 'Buprenorphine']
substances = {}
for line in data_list:
    if line[6] not in substances.keys():
        substances[line[6]] = [0, 0, 0, 0, 0, 0, 0, 0]

for line in data_list:
    substances[line[6]][int(line[0])-2010] += int(line[7])

for i in range(8):
    summ = 0
    for key in substances.keys():
        summ += substances[key][i]
    for key in substances.keys():
        substances[key][i] /= summ

allnum = list(substances.values())
per = np.percentile(allnum, 95)


plt.scatter(xx, substances[drugs[0]], s=5)
oxycodone = 0.434*np.exp(-((x+4.53)/9.821)**2)
plt.plot(x, oxycodone, lw=1, label=drugs[0])

plt.scatter(xx, substances[drugs[1]], s=5)
hydrocodone = 0.1797*np.exp(-0.1897*x)
plt.plot(x, hydrocodone, lw=1, label=drugs[1])

plt.scatter(xx, substances[drugs[2]], s=5)
herion = 0.6041*np.exp(-((x-4.789)/5.273)**2)
plt.plot(x, herion, lw=1, label=drugs[2])

plt.scatter(xx, substances[drugs[3]], s=5)
fentanyl = 0.0001487/(0.0003688+np.exp(-x-0.4123))
plt.plot(x, fentanyl, lw=1, label=drugs[3])

plt.scatter(xx, substances[drugs[4]], s=5)
buprenorphine = 0.04084*(x**0.2274)
plt.plot(x, buprenorphine, lw=1, label=drugs[4])

plt.legend(loc='upper left')
plt.show()
