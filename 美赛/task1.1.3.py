import numpy as np
import matplotlib.pyplot as plt
import xlrd
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
from scipy.optimize import curve_fit


def custom_equation(x, a, b, c):
    return a * np.exp(-b * x) + c


def exponential(x, a, b):
    return a * np.exp(b * x)


def fourier(x, a0, a1, b1, a2, b2, w):
    return a0 + a1 * np.cos(x * w) + b1 * np.sin(w * x) + a2 * np.cos(2 * x * w) + b2 * np.sin(2 * x * w)


def linear_fitting(x, a, b, c):
    return a * np.sin(x) + b * ((x - 10) ** 2) + c


def power(x, a, b):
    return a * x ** b


# 打开excel文件
data = xlrd.open_workbook('MCM_NFLIS_Data.xlsx')
# 获取第一张工作表（通过索引的方式）
table = data.sheets()[1]
# data_list用来存放数据
data_list = []
# 将table中第一行的数据读取并添加到data_list中
for i in range(1, 24063):
    data_list.append(table.row_values(i))

x = np.arange(1, 13.1, 0.1)
xx = [i for i in range(1, 9)]
dictionary = {}
substances = []
sub_county = {}
combine = {}
fitting = ['Benzylfentanyl', 'Methoxyacetyl fentanyl', 'Cyclopropyl fentanyl', 'Fluoroisobutyryl fentanyl',
           'Butyryl fentanyl', 'Acryl fentanyl', '3-Methylfentanyl', '4-Fluoroisobutyryl fentanyl', 'Acetyl fentanyl',
           'ANPP', 'Carfentanil', 'Codeine', 'Fentanyl', 'Fluoroisobutyryl fentanyl', 'Furanyl fentanyl', 'Mitragynine',
           'Tramadol', 'U-47700']
change = ['Mitragynine OH MONTGOMERY', 'Codeine OH CUYAHOGA', 'Codeine VA FAIRFAX']

for line in data_list:
    if line[6] not in substances:
        substances.append(line[6])
    combine[line[5]] = (line[1], line[2])

for sub in substances:
    dictionary[sub] = {}
    for line in data_list:
        if line[6] == sub and line[5] not in dictionary[sub].keys():
            dictionary[sub][line[5]] = []

for line in data_list:
    while int(line[0]) - 2010 > len(dictionary[line[6]][line[5]]):
        if len(dictionary[line[6]][line[5]]) == 0:
            dictionary[line[6]][line[5]].append(0)
        else:
            fill = int(np.mean(dictionary[line[6]][line[5]]))
            dictionary[line[6]][line[5]].append(fill)
    dictionary[line[6]][line[5]].append(int(line[7]))

delkey = []
for key in dictionary.keys():
    nums = []
    for kk in dictionary[key].keys():
        nums += dictionary[key][kk]
    if max(nums) < 30:
        delkey.append(key)
for key in delkey:
    del dictionary[key]

for key in dictionary.keys():
    for kkey in dictionary[key].keys():
        while len(dictionary[key][kkey]) != 8:
            fill = int(np.mean(dictionary[key][kkey]))
            dictionary[key][kkey].append(fill)
'''
for key in dictionary.keys():
    means = []
    for kk in dictionary[key].keys():
        means.append(np.mean(dictionary[key][kk]))
    per = np.percentile(means, 98.5)
    for kkey in dictionary[key].keys():
        if np.mean(dictionary[key][kkey]) > per:
            plt.scatter(xx, dictionary[key][kkey], s=5)
            p = np.poly1d(np.polyfit(xx, dictionary[key][kkey], 4))
            label = combine[kkey][0] + ' ' + combine[kkey][1]
            plt.plot(x, p(x), lw=1, label=label)
    plt.legend(loc='best')
    plt.title(key)
    # plt.savefig('figure/' + key + '.png')
    plt.show()
'''

for key in dictionary.keys():
    gradients = []
    max_index = 3
    for kk in dictionary[key].keys():
        gradients.append(np.max(np.gradient(dictionary[key][kk])))
    gradients.sort(reverse=True)
    if len(gradients) < max_index:
        gradient_threshold = gradients[-1]
    else:
        gradient_threshold = gradients[max_index]

    means = []
    for kk in dictionary[key].keys():
        means.append(np.mean(dictionary[key][kk]))
    per = np.percentile(means, 99)

    draws = []
    for kkey in dictionary[key].keys():
        if np.max(np.gradient(dictionary[key][kkey])) >= gradient_threshold or np.mean(dictionary[key][kkey]) > per:
            draws.append(kkey)
            plt.scatter(xx, dictionary[key][kkey], s=10)
            label = combine[kkey][0] + ' ' + combine[kkey][1]
            if key not in fitting:
                popt, pcov = curve_fit(exponential, xx, dictionary[key][kkey])
                plt.plot(x, exponential(x, popt[0], popt[1]), lw=1, label=label)
            elif key + ' ' + label not in change:
                p = np.poly1d(np.polyfit(xx, dictionary[key][kkey], 2))
                plt.plot(x, p(x), lw=1, label=label)
            else:
                p = np.poly1d(np.polyfit(xx, dictionary[key][kkey], 1))
                plt.plot(x, p(x), lw=1, label=label)
    maxnums = []
    for kk in draws:
        maxnums.append(np.max(dictionary[key][kk]))
    threshold = np.median(maxnums)
    plt.plot(x, np.ones([len(x)]) * threshold, linestyle='--', label='threshold')
    plt.legend(loc='best')
    plt.title(key)
    plt.savefig('figure/' + key + '.png')
    plt.show()