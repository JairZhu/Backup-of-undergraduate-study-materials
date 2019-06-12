import numpy as np
import matplotlib.pyplot as plt
import xlrd
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
import csv
from sklearn import preprocessing
#打开excel文件
data=xlrd.open_workbook('MCM_NFLIS_Data.xlsx')
#获取第一张工作表（通过索引的方式）
table=data.sheets()[1]
#data_list用来存放数据
data_list=[]
#将table中第一行的数据读取并添加到data_list中
for i in range(1,24063):
    data_list.append(table.row_values(i))

csvreader = csv.reader(open('handle.csv', 'r'))
readdata = [row for row in csvreader]
top_name = []
for i in range(2, 24):
    top_name.append(readdata[0][i])
social_data = {}
for row in readdata[1:]:
    tmp = []
    for i in range(2, 24):
        tmp.append(float(row[i]))
    if int(row[1]) not in social_data.keys():
        social_data[int(row[1])] = [tmp[:-1]]
    else:
        social_data[int(row[1])].append(tmp[:-1])

mms = preprocessing.MinMaxScaler()
mas = preprocessing.MaxAbsScaler()
'''
for key in social_data.keys():
    for i in range(len(social_data[key])):
        summ = sum(social_data[key][i])
        for j in range(len(social_data[key][i])):
            social_data[key][i][j] /= summ
'''
for key in social_data.keys():
    social_data[key] = preprocessing.scale(social_data[key])


years = [i for i in range(1, 9)]
counties = {
    'VA': ['CHESAPEAKE CITY', 'ARLINGTON'],
    'PA': ['ALLEGHENY', 'BERKS', 'BUCKS'],
    'OH': ['BUTLER', 'CUYAHOGA', 'DELAWARE', 'FRANKLIN'],
    'KY': ['BELL'],
    'WV': ['BERKELEY']
}
combine = {}
dictionary = {}
for state in counties.keys():
    dictionary[state] = {}
    combine[state] = {}

    for line in data_list:
        if line[1] == state:
            dictionary[state][line[2]] = []
    '''
    for cou in counties[state]:
        dictionary[state][cou] = []
    '''

for line in data_list:
    combine[line[1]][line[2]] = int(line[5])
    #if line[2] in dictionary[line[1]].keys():
    if int(line[0]) - 2010 == len(dictionary[line[1]][line[2]]):
        dictionary[line[1]][line[2]].append(int(line[-2]))

for state in dictionary.keys():
    for county in dictionary[state].keys():
        while len(dictionary[state][county]) != 8:
            dictionary[state][county].append(0)

ids = []
for row in readdata[1:]:
    ids.append(int(row[1]))

drugs_gradient = {}
social_gradient = {}
for state in dictionary.keys():
    for county in dictionary[state].keys():
       id = combine[state][county]
       if id in ids:
           drugs_gradient[id] = np.gradient(dictionary[state][county])
           social_gradient[id] = np.mat(np.gradient(social_data[id], axis=1)).T

top = []
for key in drugs_gradient.keys():
    for i in range(7):
        col = list(map(abs, social_gradient[key][:, i].T.tolist()[0]))
        sorted_col = [val for val in col]
        if drugs_gradient[key][i] != 0:
            sorted_col.sort(reverse=True)
        else:
            continue
        for j in range(5):
            index = col.index(sorted_col[j])
            top.append(index)
counts = {}
for val in top:
    if val not in counts.keys():
        counts[val] = 1
    else:
        counts[val] += 1
top_num = []
for i in range(5):
    values = list(counts.values())
    index = np.argmax(values)
    top_num.append(list(counts.keys())[index])
    del counts[top_num[i]]

print(top_num)

relate_name = []
for value in top_num:
    relate_name.append(top_name[value])
for vv in relate_name:
    print(vv)


