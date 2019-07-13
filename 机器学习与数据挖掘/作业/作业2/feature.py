# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load in 

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
from nltk.corpus import stopwords
import matplotlib.pyplot as plot

# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list the files in the input directory
# Any results you write to the current directory are saved as output.

train_set = pd.read_csv('../input/train.csv')
test_set = pd.read_csv('../input/test.csv')
stop = set(stopwords.words('english'))

print("训练集正样本率：", train_set['is_duplicate'].mean())

train_sentences = pd.Series(train_set['question1'].tolist() + train_set['question2'].tolist()).astype(str)
test_sentences = pd.Series(test_set['question1'].tolist() + test_set['question2'].tolist()).astype(str)
train_lens = train_sentences.apply(lambda x: len([i for i in x.split(' ') if i not in stop]))
test_lens = test_sentences.apply(lambda x: len([i for i in x.split(' ') if i not in stop]))

print("训练集平均值：", np.mean(train_lens))
print("测试集平均值：", np.mean(test_lens))

plot.hist(train_lens, bins=30, normed=1, range=[0, 30], label='train', )
plot.hist(test_lens, bins=30, normed=1, range=[0, 30], alpha=0.7, label='test')
plot.xlabel("number")
plot.ylabel("frequency")
plot.legend()

def length_difference(row):
    question1 = []
    question2 = []
    for word in str(row['question1']).lower().split(' '):
        if word not in stop:
            question1.append(word)
    for word in str(row['question2']).lower().split(' '):
        if word not in stop:
            question2.append(word)
    return abs(len(question1) - len(question2))
train_length_difference = train_set.apply(length_difference, axis=1, raw=True)

print("Duplicate平均值：", np.mean(train_length_difference[train_set['is_duplicate'] == 1]))
print("Not Duplicate平均值：", np.mean(train_length_difference[train_set['is_duplicate'] == 0]))

plot.hist(train_length_difference[train_set['is_duplicate'] == 1], range=[0, 20], normed=True, label='Duplicate')
plot.hist(train_length_difference[train_set['is_duplicate'] == 0], range=[0, 20], normed=True, alpha=0.7, label='Not Duplicate')
plot.xlabel("length difference")
plot.ylabel("frequency")
plot.legend()

def find_same(row):
    question1 = []
    question2 = []
    for word in str(row['question1']).lower().split(' '):
        if word not in stop:
            question1.append(word)
    for word in str(row['question2']).lower().split(' '):
        if word not in stop:
            question2.append(word)
    same_number1 = len([i for i in question1 if i in question2])
    same_number2 = len([i for i in question2 if i in question1])
    return max(same_number1, same_number2)
train_same = train_set.apply(find_same, axis=1, raw=True)

print("Duplicate平均值：", np.mean(train_same[train_set['is_duplicate'] == 1]))
print("Not Duplicate平均值：", np.mean(train_same[train_set['is_duplicate'] == 0]))

plot.hist(train_same[train_set['is_duplicate'] == 1], range=[0, 15], normed=True, label='Duplicate')
plot.hist(train_same[train_set['is_duplicate'] == 0], range=[0, 15], normed=True, alpha=0.7, label='Not Duplicate')
plot.xlabel("number")
plot.ylabel("frequency")
plot.legend()

from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer

df_data = pd.concat([train_set[['question1', 'question2']], test_set[['question1', 'question2']]], axis=0)
tfidf = TfidfVectorizer(stop_words='english', ngram_range=(1, 1))
questions = pd.Series(df_data['question1'].tolist() + df_data['question2'].tolist()).astype(str)
tfidf.fit_transform(questions)

def tfidf_same(row):
    tfidf_q1 = tfidf.transform([str(row['question1'])]).data
    tfidf_q2 = tfidf.transform([str(row['question2'])]).data
    count1 = 0
    count2 = 0
    for w in tfidf_q1:
        if w in tfidf_q2:
            count1 += 1
    for w in tfidf_q2:
        if w in tfidf_q1:
            count2 += 1
    return max(count1, count2)

train_tfidf_same = train_set.apply(tfidf_same, axis=1, raw=True)

print("Duplicate平均值：", np.mean(train_tfidf_same[train_set['is_duplicate'] == 1]))
print("Not Duplicate平均值：", np.mean(train_tfidf_same[train_set['is_duplicate'] == 0]))

plot.hist(train_tfidf_same[train_set['is_duplicate'] == 1], range=[0, 15], normed=True, label='Duplicate')
plot.hist(train_tfidf_same[train_set['is_duplicate'] == 0], range=[0, 15], normed=True, alpha=0.7, label='Not Duplicate')
plot.xlabel("number")
plot.ylabel("frequency")
plot.legend()