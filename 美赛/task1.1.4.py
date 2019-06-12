import numpy as np
import matplotlib.pyplot as plt
import xlrd
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
import csv

# 打开excel文件
data = xlrd.open_workbook('MCM_NFLIS_Data.xlsx')
# 获取第一张工作表（通过索引的方式）
table = data.sheets()[1]
# data_list用来存放数据
data_list = []
# 将table中第一行的数据读取并添加到data_list中
for i in range(1, 24063):
    data_list.append(table.row_values(i))

labels = ['VA', 'OH', 'PA', 'KY', 'WV']
x = np.arange(1, 13.1, 0.1)

dictionary = {}
xx = [1, 2, 3, 4, 5, 6, 7, 8]
for x1 in labels:
    dictionary[x1] = {}
for datas in data_list:
    dictionary[datas[1]][int(datas[0]) - 2009] = int(datas[-1])

drugs = [0, 0, 0, 0, 0, 0, 0, 0]
for i in range(8):
    for lab in labels:
        drugs[i] += dictionary[lab][i + 1]

plt.scatter(xx, drugs, s=5)
alldrugs = 243300+4956*np.cos(0.794*x)-8870*np.sin(0.794*x)+9861*np.cos(2*0.794*x)+414.7*np.sin(2*0.794*x)
plt.plot(x, alldrugs, lw=1)
plt.show()