import numpy as np
import matplotlib.pyplot as plt
import xlrd
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
#打开excel文件
data=xlrd.open_workbook('MCM_NFLIS_Data.xlsx')
cm1 = cm.get_cmap('gist_rainbow')
#获取第一张工作表（通过索引的方式）
table=data.sheets()[1]
#data_list用来存放数据
data_list=[]
#将table中第一行的数据读取并添加到data_list中
for i in range(1,24063):
    data_list.append(table.row_values(i))

years = [1, 2, 3, 4, 5, 6, 7, 8]
states = ['VA', 'OH', 'PA', 'KY', 'WV']
county_dict = {}
for state in states:
    county_list = []
    for line in data_list:
        if line[1] == state:
           county_list.append(line[2])
    county_dict[state] = list(set(county_list))

for state in states:
    VA_county = {}
    for county in county_dict[state]:
        VA_county[county] = {}
    for line in data_list:
        if line[1] == state:
            VA_county[line[2]][int(line[0]) - 2009] = int(line[-2])

    VA_y = []
    for county in county_dict[state]:
        tmp = []
        for i in range(len(years)):
            if years[i] in VA_county[county].keys():
                tmp.append(VA_county[county][years[i]])
            else:
                tmp.append(0)
        VA_y.append(tmp)

    for i in range(len(VA_y)):
        plt.scatter(years, VA_y[i], s=5)
        z = np.polyfit(years, VA_y[i], 5)
        p = np.poly1d(z)
        plt.plot(years, p(years), lw=1)
        print(p)
    plt.show()