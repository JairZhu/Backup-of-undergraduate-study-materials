import csv
import numpy as np
from scipy.stats import pearsonr
import time
import math


def read_csv(filename):
    # 读取文件
    output = []
    with open(filename, 'r') as file:
        all_data = csv.reader(file)
        for row in all_data:
            output.append(row)
    output = output[1:]
    return output


def regression_KNN(test_set, k):
    labels = []
    for line in test_set:
        words = line[0].split(' ')
        test_vector = np.zeros(len(words_vector))

        # 对于测试集中的每个数据生成一个特征向量
        for word in words:
            if word in words_vector:
                test_vector[words_vector.index(word)] += 1

        # 将该特征向量扩展成矩阵并与训练集的ONE-HOT矩阵相减，再对得到的矩阵中每个元素取绝对值
        test_matrix = np.matrix(np.abs(np.tile(test_vector, (len(train_set), 1)) - xmatrix))

        # 将矩阵中每行元素相加得到测试集数据与训练集的每个数据之间的曼哈顿距离
        distance = np.sum(test_matrix, axis=1).T.tolist()[0]

        # 将距离等于0的替换为一个极小值
        for i in range(len(distance)):
            if distance[i] == 0:
                distance[i] = 0.0000000000001

        maps = {}
        for i in range(len(distance)):
            if distance[i] not in maps.keys():
                maps[distance[i]] = [i]
            else:
                maps[distance[i]].append(i)

        # 将得到的所有距离排序
        dist = sorted(distance)

        count = 0
        moods = []
        # 选取距离最近的K个训练对象
        for index in range(len(dist)):
            dd = dist[index]
            if len(maps[dd]) + count >= k:
                moods += maps[dd][:k - count + 1]
                break
            else:
                moods += maps[dd]
                count += len(maps[dd])

        # 归一化训练对象情感概率的权重
        summary = 0
        for index in moods:
            summary += 1 / distance[index]
        ddd = [0 for i in range(len(distance))]
        for i in moods:
            ddd[i] = 1 / distance[i] / summary

        # 计算测试对象的情感概率
        sentiments = []
        for i in range(1, 7):
            sentiment = 0
            for index in moods:
                sentiment += float(train_set[index][i]) * ddd[index]
            sentiments.append(sentiment)

        # 归一化测试对象的情感概率，使得各个概率的总和为1
        summ = sum(sentiments)
        for i in range(len(sentiments)):
            sentiments[i] = sentiments[i] / summ

        labels.append(sentiments)
    return labels


def validation(k):
    validation_set = read_csv('lab1_data\\regression_dataset\\validation_set.csv')
    out = regression_KNN(validation_set, k)
    result = []
    truth = []
    for i in range(6):
        tmp1 = []
        tmp2 = []
        for j in range(len(out)):
            tmp1.append(out[j][i])
            tmp2.append(float(validation_set[j][i + 1]))
        result.append(tmp1)
        truth.append(tmp2)
    corr = []
    for i in range(len(result)):
        corr.append(pearsonr(result[i], truth[i])[0])
    print('相关系数:', np.mean(corr))


def test(k):
    test_set = []
    # 读取测试集数据
    with open('lab1_data\\regression_dataset\\test_set.csv', 'r') as file:
        all_data = csv.reader(file)
        for row in all_data:
            test_set.append(row)
    data_set = test_set[1:]
    for i in range(len(data_set)):
        data_set[i] = data_set[i][1:]
    # 运行KNN回归算法
    out = regression_KNN(data_set, k)
    for i in range(1, len(test_set)):
        for j in range(2, 8):
            test_set[i][j] = out[i - 1][j - 2]
    # 将结果保存到文件
    with open('lab1_data\\regression_dataset\\16337341_zhuzhiru_KNN_regression.csv', 'w', newline='') as file:
        csv.writer(file).writerows(test_set)


if __name__ == '__main__':
    start = time.time()

    # 读取训练集数据
    train_set = read_csv('lab1_data\\regression_dataset\\train_set.csv')
    for i in range(len(train_set)):
        train_set[i][0] = train_set[i][0].split(' ')

    # 生成不重复词向量
    words_vector = []
    for line in train_set:
        words_vector += line[0]
    words_vector = list(set(words_vector))

    # 生成训练集数据的ONE - HOT矩阵
    xmatrix = np.zeros((len(train_set), len(words_vector)))
    for i in range(len(train_set)):
        for word in train_set[i][0]:
            xmatrix[i][words_vector.index(word)] += 1

    # 取不同k值计算验证集准确率，以便找到最好的k值
    for i in range(1, int(math.sqrt(len(train_set)))):
        print('k = ' + str(i), end=' ')
        validation(i)
    
    # 对测试集进行预测
    # test(5)

    end = time.time()
    print('总计用时:', end - start)
