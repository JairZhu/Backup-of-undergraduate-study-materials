import csv
import numpy as np
import math
from collections import Counter
import time


def classification_KNN(test_set, k):
    labels = []
    for line in test_set:
        words = line[0].split(' ')
        test_vector = np.zeros(len(words_vector))

        # 对于测试集中的每个数据生成一个特征向量
        for word in words:
            if word in words_vector:
                test_vector[words_vector.index(word)] += 1

        # 将该特征向量扩展成矩阵并与训练集的ONE-HOT矩阵相减，再对得到的矩阵中每个元素取绝对值
        test_matrix = np.abs((np.tile(test_vector, (len(train_set), 1)) - xmatrix))

        # 将矩阵中每行元素相加得到测试集数据与训练集的每个数据之间的曼哈顿距离
        distance = np.sum(test_matrix, axis=1).T.tolist()[0]

        maps = {}
        for i in range(len(distance)):
            if distance[i] not in maps.keys():
                maps[distance[i]] = [train_set[i][1]]
            else:
                maps[distance[i]].append(train_set[i][1])

        # 将得到的所有距离排序
        distance.sort()

        # 选取距离最近的K个训练对象
        count = 0
        mood = []
        for index in range(len(distance)):
            i = distance[index]
            if len(maps[i]) + count >= k:
                mood += maps[i]
                break
            else:
                mood += maps[i]
                count += len(maps[i])

        # 选取K个训练对象的标签中出现次数最多的标签
        top = Counter(mood).most_common(1)[0][0]

        labels.append(top)
    return labels


def read_csv(filename):
    # 读取CSV文件
    output = []
    with open(filename, 'r') as file:
        all_data = csv.reader(file)
        for row in all_data:
            output.append(row)
    output = output[1:]
    return output


def error_rate(out, test_set):
    # 计算准确率
    count = 0
    for i in range(len(test_set)):
        if out[i] == test_set[i][1]:
            count += 1
    return count / len(test_set)


def validation(k):
    validation_set = read_csv('classification_simple_test.csv')
    out = classification_KNN(validation_set, k)
    print('验证集正确率:', error_rate(out, validation_set))


def test(k):
    test_set = []
    # 读取测试集数据
    with open('lab1_data\\classification_dataset\\test_set.csv', 'r') as file:
        all_data = csv.reader(file)
        for row in all_data:
            test_set.append(row)
    data_set = test_set[1:]
    for i in range(len(data_set)):
        data_set[i] = data_set[i][1:]
    # 运行KNN分类算法
    out = classification_KNN(data_set, k)
    output = []
    for i in range(len(test_set)):
        tmp = []
        tmp.append(test_set[i][1])
        tmp.append(test_set[i][2])
        output.append(tmp)
    # 将结果保存到文件
    with open('lab1_data\\classification_dataset\\16337341_zhuzhiru_KNN_classification.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(output)


if __name__ == '__main__':
    start = time.time()

    # 读取训练集中的数据
    train_set = read_csv('classification_train_set.csv')
    for i in range(len(train_set)):
        train_set[i][0] = train_set[i][0].split(' ')

    # 生成不重复词向量
    words_vector = []
    for line in train_set:
        words_vector += line[0]
    words_vector = list(set(words_vector))

    # 生成训练集数据的ONE-HOT矩阵
    xmatrix = np.zeros((len(train_set), len(words_vector)))
    for i in range(len(train_set)):
        for word in train_set[i][0]:
            xmatrix[i][words_vector.index(word)] += 1
    xmatrix = np.matrix(xmatrix)

    # 取不同k值计算验证集准确率，以便找到最好的k值
    for i in range(1, int(math.sqrt(len(train_set)))):
        print('k = ' + str(i), end=' ')
        validation(i)

    # 对测试集进行预测
    #test(5)

    end = time.time()
    print('运行总用时:', end - start)
