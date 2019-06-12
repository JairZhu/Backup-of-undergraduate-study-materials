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


def sub_TF_IDF(test_word_vector, test_set):
    test_TF = []
    test_IDF = [0 for i in range(len(test_word_vector))]
    idf = {}
    for line in test_set:
        words = line[0].split(' ')

        # 生成TF矩阵
        test_vector = np.zeros(len(test_word_vector))
        for word in words:
            test_vector[test_word_vector.index(word)] += 1 / len(words)
        test_TF.append(test_vector)

        # 记录单词在每句文本中出现的次数
        unique = list(set(words))
        for word in unique:
            if word not in idf.keys():
                idf[word] = 1
            else:
                idf[word] += 1

    # 生成IDF矩阵
    for key in idf.keys():
        test_IDF[test_word_vector.index(key)] = math.log(len(test_set) / (idf[key] + 1))

    # 根据公式生成TF-IDF矩阵
    test_TFIDF = test_TF * np.tile(test_IDF, (len(test_set), 1))
    return test_TFIDF


def regression_KNN(test_set, k):
    labels = []

    # 生成不重复词向量
    test_word_vector = []
    for row in test_set:
        test_word_vector += row[0].split(' ')
    for row in train_set:
        test_word_vector += row[0].split(' ')
    test_word_vector = list(set(test_word_vector))

    # 生成训练集文本数据的TF-IDF矩阵
    train_TFIDF = sub_TF_IDF(test_word_vector, train_set)

    # 生成测试集文本数据的TF-IDF矩阵
    test_TFIDF = sub_TF_IDF(test_word_vector, test_set)

    for num in range(len(test_set)):
        test_vector = test_TFIDF[num]

        # 将测试集中一行文本数据的TF-IDF向量扩展成矩阵，并与训练集的TF-IDF矩阵相减，再取绝对值
        test_matrix = np.abs(np.tile(test_vector, (len(train_set), 1)) - train_TFIDF)

        # 将矩阵中每行元素相加得到测试集数据与训练集的每个数据之间的曼哈顿距离
        distance = np.sum(test_matrix, axis=1).T.tolist()

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
                moods += maps[dd]
                break
            else:
                moods += maps[dd]
                count += len(maps[dd])

        # 计算测试对象的情感概率
        sentiments = []
        for i in range(1, 7):
            sentiment = 0
            for index in moods:
                sentiment += float(train_set[index][i]) / distance[index]
            sentiments.append(sentiment)

        # 归一化测试对象的情感概率，使得各个概率的总和为1
        summ = sum(sentiments)
        for i in range(len(sentiments)):
            sentiments[i] = sentiments[i] / summ

        labels.append(sentiments)
    return labels


def validation(k):
    validation_set = read_csv('regression_simple_test.csv')
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

    output = [[test_set[0][0]]]
    output[0] = output[0] + test_set[0][2:]
    for i in range(1, len(test_set)):
        output.append([test_set[i][0]] + out[i - 1])
    # 将结果保存到文件
    with open('lab1_data\\regression_dataset\\16337341_zhuzhiru_KNN_regression.csv', 'w', newline='') as file:
        csv.writer(file).writerows(output)


if __name__ == '__main__':
    start = time.time()

    # 读取训练集数据
    train_set = read_csv('regression_train_set.csv')

    # 取不同k值计算验证集准确率，以便找到最好的k值
    for i in range(1, int(math.sqrt(len(train_set)))):
        print('k = ' + str(i), end=' ')
        validation(i)


    # 对测试集进行预测
    #test(2)

    end = time.time()
    print('总计用时:', end - start)
