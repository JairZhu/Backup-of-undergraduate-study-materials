import string
import numpy as np
import math
from collections import Counter
import random
import logging
from gensim.models import word2vec


def filter_data(filename):
    all_data = []
    common_words = ['have', 'had', 'has', 'are', 'was', 'were', 'the', 'this', 'that', 'and', 'etc', 'they', 'them',
                    'their', 'theirs', 'our', 'ours', 'you', 'your', 'yours', 'its', 'she', 'her', 'hers', 'him', 'his',
                    'it´s', 'thats', 'haven', 'there', 'theres', 'maybe', 'hey', 'anyway', 'doesn', 'think', 'really',
                    'been']
    ctlword = '\x97\x91\x96\x08\x83\x8e\x9e\x84'
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            line = line.strip().replace('<br />', ' ').replace("n't", " not").replace('`', ' ').replace('-lrb-',
                                                                                                        ' ').replace(
                '-rrb-', ' ')
            table = str.maketrans(string.punctuation + string.digits + ctlword,
                                  ' ' * (len(string.punctuation) + len(string.digits) + len(ctlword)))
            line = line.translate(table).split()
            row = []
            for item in line:
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

def write_result(filename, data):
    with open(filename, 'w', encoding='utf-8') as file:
        for i in range(len(data)):
            file.write(str(data[i]) + '\n')

if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

    # data = filter_data('trainData.txt')
    # write_data(data, 'out.txt')
    train_set = read_data('out.txt')

    #model = word2vec.Word2Vec(train_set, size=3000)
    #model.save('all3000.module')
    model = word2vec.Word2Vec.load('all3000.module')
    important = ['great', 'recommend', 'happy', 'like', 'fun', 'good', 'bad', 'hate', 'boring', 'sad',
                 'love', 'romantic', 'best', 'better', 'worse', 'worst']
    for i in range(20):
        for item in model.most_similar(positive=important, topn=10):
            important.append(item[0])
        important = list(set(important))
    important.append('not')
    write_result('important.txt', important)
