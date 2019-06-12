import string
import numpy as np
import math
from collections import Counter
import random
import logging
from gensim.models import word2vec


def filter_data(filename):
    all_data = []
    # 停用词表
    common_words = ['have', 'had', 'has', 'are', 'was', 'were', 'the', 'this', 'that', 'and', 'etc', 'they', 'them',
                    'their', 'theirs', 'our', 'ours', 'you', 'your', 'yours', 'its', 'she', 'her', 'hers', 'him', 'his',
                    'it´s', 'thats', 'haven', 'there', 'theres', 'maybe', 'hey', 'anyway', 'doesn', 'think', 'really',
                    'been']
    # 控制字符表
    ctlword = '\x97\x91\x96\x08\x83\x8e\x9e\x84'
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            line = line.strip().replace('<br />', ' ').replace("n't", " not")
            # 去除所有的标点符号、数字、控制字符
            table = str.maketrans(string.punctuation + string.digits + ctlword,
                                  ' ' * (len(string.punctuation) + len(string.digits) + len(ctlword)))
            line = line.translate(table).split()
            row = []
            for item in line:
                # 去除长度小于2的词和停用词
                if len(item) > 2 and item.lower() not in common_words:
                    row.append(item.lower())
            all_data.append(row)
    return all_data


def write_data(data, filename):
    with open(filename, 'w', encoding='utf-8') as file:
        for i in range(len(data)):
            for j in range(len(data[i])):
                file.write(data[i][j] + ' ')
            file.write('\n')


def read_data(filename):
    output = []
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            output.append(line.strip().split())
    return output


def read_label(filename):
    output = []
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            output.append(int(line.strip()))
    return output


def write_result(filename, data):
    with open(filename, 'w', encoding='utf-8') as file:
        for i in range(len(data)):
            file.write(str(data[i]) + '\n')


class Naive_Bayes:
    def __init__(self, train_set, train_labels):
        self.train_set = train_set
        self.trian_labels = train_labels
        self.pos_words_vector = {}
        self.neg_word_vector = {}
        # 生成不重复词向量
        self.words_vector = []
        for word in train_set:
            self.words_vector += word
        self.words_vector = list(set(self.words_vector))
        for word in self.words_vector:
            self.pos_words_vector[word] = 0
            self.neg_word_vector[word] = 0
        self.pos_num = 0
        for label in self.trian_labels:
            if label == 1:
                self.pos_num += 1
        self.neg_num = len(self.train_set) - self.pos_num
        # 计算先验概率P(y)
        self.neg_prob = (self.neg_num + 1) / (len(self.trian_labels) + 2)
        self.pos_prob = (self.pos_num + 1) / (len(self.trian_labels) + 2)

    def classification(self, test_set):
        # 使用Word2vec获取情感类词语集合
        model = word2vec.Word2Vec.load('all3000.model')
        important = ['sweet', 'great', 'recommend', 'happy', 'like', 'fun', 'good', 'bad', 'hate', 'boring', 'sad',
                     'love', 'satirical', 'romantic', 'whimsical']
        for i in range(20):
            for item in model.most_similar(positive=important, topn=10):
                important.append(item[0])
            important = list(set(important))
        important.append('not')
        print(len(important), important)
        for i in range(len(self.train_set)):
            print('计算第', i, '行')
            tmp = []
            for word in self.train_set[i]:
                if word not in tmp:
                    if self.trian_labels[i] == 1:
                        # 记录每个词在类别为1的语句中出现的次数
                        self.pos_words_vector[word] += 1
                    else:
                        # 记录每个词在类别为0的语句中出现的次数
                        self.neg_word_vector[word] += 1
                    tmp.append(tmp)
        for key in self.words_vector:
            # 计算条件概率P(x|y)
            if key not in important:
                self.pos_words_vector[key] = (self.pos_words_vector[key] + 1) / (self.pos_num + 2)
                self.neg_word_vector[key] = (self.neg_word_vector[key] + 1) / (self.neg_num + 2)
            else:
                # 加大情感类词语所占的比重
                self.pos_words_vector[key] = (self.pos_words_vector[key] + 5) / (self.pos_num + 2)
                self.neg_word_vector[key] = (self.neg_word_vector[key] + 5) / (self.neg_num + 2)
        labels = []
        for line in test_set:
            # 计算概率P(y|x)时使用取对数相加的方式
            is_pos = math.log(self.pos_prob)
            is_neg = math.log(self.neg_prob)
            for word in line:
                if word in self.words_vector:
                    is_pos += math.log(self.pos_words_vector[word])
                    is_neg += math.log(self.neg_word_vector[word])
            # 选取概率最大的项作为测试集数据的类别
            if is_pos > is_neg:
                labels.append(1)
            else:
                labels.append(0)
            print('已预测', len(labels), '行')
        return labels

    def validation(self, validation_set, validation_labels):
        results = self.classification(validation_set)
        count = 0
        for i in range(len(results)):
            if results[i] == validation_labels[i]:
                count += 1
        print('验证集准确率:', count / len(results))


class LR:
    def __init__(self, train_set, train_labels, size, step):
        self.train_set = train_set
        self.train_labels = train_labels
        self.step = step
        self.model = word2vec.Word2Vec.load('train_all_5000.module')
        self.word_vector = list(self.model.wv.vocab.keys())
        self.matrix = []
        for line in train_set:
            sentence_vector = np.zeros(size)
            for word in line:
                if word in self.word_vector:
                    sentence_vector += self.model[word]
            self.matrix.append(sentence_vector)
            print('已处理', len(self.matrix), '行')

    def sigmod(self, x):
        return 1 / (1 + np.exp(-x))

    def grandascent(self, datain, labels, numiter):
        datain = np.mat(datain)
        m, n = np.shape(datain)
        weights = np.ones((n, 1))
        step = self.step
        for j in range(numiter):
            print('迭代', j, '次', end=' ')
            for i in range(m):
                output = self.sigmod(datain[i, :] * weights)
                err = labels[i] - output
                weights = weights + step * datain[i, :].transpose() * err
            print(weights[0][0], weights[1][0], weights[2][0], weights[3][0])
        return weights

    def classification(self, test_set, size, numiter, module_file_name):
        model = word2vec.Word2Vec.load(module_file_name)
        test_word_vector = list(model.wv.vocab.keys())
        labels = []
        trainweights = self.grandascent(np.array(self.matrix), self.train_labels, numiter)
        test_x = []
        for line in test_set:
            sentence = np.zeros(size)
            for word in line:
                if word in test_word_vector:
                    sentence += model[word]
            test_x.append(sentence)
        test_x = np.mat(test_x)
        for i in range(len(test_x)):
            labels.append(self.sigmod(test_x[i, :] * trainweights)[0, 0] > 0.5)
            print('已预测', len(labels), '行')
        return labels

    def validation(self, validation_set, validation_labels, size, numiter, module_file_name):
        results = self.classification(validation_set, size, numiter, module_file_name)
        count = 0
        for i in range(len(validation_labels)):
            if results[i] == validation_labels[i]:
                count += 1
        print('验证集准确率:', count / len(results))


class KNN:
    def __init__(self, train_set, train_set_label):
        self.train_row_num = len(train_set)
        self.train_label = train_set_label
        self.words_vector = []
        # 生成不重复词向量
        for row in train_set:
            self.words_vector += row
        self.words_vector = list(set(self.words_vector))
        # 生成ONE-HOT矩阵
        self.xmatrix = np.zeros((self.train_row_num, len(self.words_vector)))
        for i in range(len(train_set)):
            for word in train_set[i]:
                self.xmatrix[i][self.words_vector.index(word)] += 1
            print('已处理', i, '行')

    def classification_KNN(self, test_set, k):
        labels = []
        for line in test_set:
            # 生成测试集的特征向量
            test_vector = np.zeros(len(self.words_vector))
            for word in line:
                if word in self.words_vector:
                    test_vector[self.words_vector.index(word)] += 1
            # 计算测试集向量与训练集向量的距离
            test_matrix = np.abs((np.tile(test_vector, (self.train_row_num, 1)) - self.xmatrix))
            distance = np.sum(test_matrix, axis=1).T.tolist()
            maps = {}
            for i in range(len(distance)):
                if distance[i] not in maps.keys():
                    maps[distance[i]] = [self.train_label[i]]
                else:
                    maps[distance[i]].append(self.train_label[i])
            distance.sort()
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
            # 根据多数表决的规则得到测试集的类别
            top = Counter(mood).most_common(1)[0][0]
            labels.append(top)
            print('已生成', len(labels), '个')
        return labels

    def validation(self, validation_set, validation_labels, k):
        out = self.classification_KNN(validation_set, k)
        count = 0
        for i in range(len(validation_set)):
            if out[i] == validation_labels[i]:
                count += 1
        print('验证集准确率:', count / self.train_row_num)


if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

    train_set = read_data('out.txt')
    train_labels = read_label('trainLabel.txt')
    test_set = read_data('in.txt')

    lr = LR(train_set[:18000], train_labels[:18000], 5000, 8)
    lr.validation(train_set[18000:], train_labels[18000:], 5000, 1000, 'train_all_5000.module')
