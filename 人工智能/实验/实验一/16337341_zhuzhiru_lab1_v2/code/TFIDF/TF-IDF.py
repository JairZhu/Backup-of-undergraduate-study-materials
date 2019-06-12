import math
import time

start = time.time()

#读取文件并截取有效内容
article = []
with open('semeval.txt', 'r') as file:
    for line in file.readlines():
        data = line.split('\t')[2].strip('\n')
        article.append(data)

TF = []
IDF = {}
for line in article:
    #生成TF矩阵，只保留出现单词归一化后的频率
    words = line.split(' ')
    tmp = {}
    for word in words:
        if word not in tmp.keys():
            tmp[word] = 1 / len(words)
        else:
            tmp[word] += 1 / len(words)
    TF.append(tmp)

    #去除每句文本中的重复单词
    tmp = []
    for element in words:
        if element not in tmp:
            tmp.append(element)

    #记录单词在每句文本中出现的次数
    for word in tmp:
        if word not in IDF.keys():
            IDF[word] = 1
        else:
            IDF[word] += 1

#生成IDF矩阵
for key in IDF.keys():
    IDF[key] = math.log(len(article) / (IDF[key] + 1))

#根据公式生成TF-IDF矩阵
TF_IDF = []
for i in range(len(TF)):
    tmp = {}
    for key in TF[i].keys():
        tmp[key] = TF[i][key] * IDF[key]
    TF_IDF.append(tmp)

#生成不重复词向量
totalwords = []
for line in article:
    line = line.split(' ')
    for word in line:
        if word not in totalwords:
            totalwords.append(word)

#保存矩阵至文件
with open('16337341_zhuzhiru_TFIDF.txt', 'w') as file:
    for i in range(len(TF_IDF)):
        for element in totalwords:
            if element in TF_IDF[i].keys():
                file.write(str(round(TF_IDF[i][element], 9)) + ' ')
        file.write('\n')

end = time.time()
print('用时共计：' + str(end - start) + 's')
