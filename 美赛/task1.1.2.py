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

y = []
for la in labels:
    tmp = []
    for i in range(len(xx)):
        tmp.append(dictionary[la][xx[i]])
    y.append(tmp)

for i in range(8):
    summ = 0
    for j in range(5):
        summ += y[j][i]
    for j in range(5):
        y[j][i] /= summ

'''
data_dict = {}
for i in range(len(labels)):
    data_dict[labels[i]] = []
    for j in range(8):
        data_dict[labels[i]].append([xx[j], y[i][j]])

for label in labels:
    with open(label + '.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(data_dict[label])
'''

plt.scatter(xx, y[0], color='red', s=10)
plt.scatter(xx, y[1], color='blue', s=10)
plt.scatter(xx, y[2],color='green', s=10)
plt.scatter(xx, y[3],color='yellow', s=10)
plt.scatter(xx, y[4],color='orange', s=10)


ky = 0.1261*(x**-0.08074)
plt.plot(x, ky,color='yellow', lw=1, label='KY')

oh = -0.3423*np.exp(-0.1323*x)+0.5894
plt.plot(x, oh, color='blue',lw=1, label='OH')

pa = 0.1933*np.exp(-0.1573*x)+0.219
plt.plot(x, pa, color='green',lw=1, label='PA')

wv = 0.04877*np.exp(-0.1148*x)
plt.plot(x, wv,color='orange', lw=1, label='WV')

va = 0.1425-0.0164*np.cos(0.9625*x)-0.003006*np.sin(0.9625*x)-0.001925*np.cos(2*0.9625*x)+0.0288*np.sin(2*0.9625*x)
plt.plot(x, va,color='red', lw=1, label='VA')

plt.legend(loc='best')
plt.show()
