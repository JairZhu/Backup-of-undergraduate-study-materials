import pandas as pd
import numpy as np
import logging
import pickle
import os
from gensim.models.word2vec import Word2Vec, LineSentence
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.layers import Dense, Input, LSTM, Embedding, Dropout
from keras.layers.merge import concatenate
from keras.models import Model
from keras.layers.normalization import BatchNormalization
from keras.callbacks import EarlyStopping, ModelCheckpoint
from sklearn.model_selection import KFold

MAX_WORDS = 200000
MAX_SEQUENCE_LENTGH = 40
EMBEDDING_DIM = 300
lstm_num = 400
dense_num = 150
drop_dense = 0.1
drop_lstm = 0.15

# def build_w2v(questions):
#     logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
#     model = Word2Vec(questions, size=300, workers=4)
#     #model.save("./model/w2v.mod")
#     return model

print(os.listdir("../input"))

train_set = pd.read_csv("../input/quora-question-pairs/train.csv")
test_set = pd.read_csv("../input/quora-question-pairs/test.csv")

train_set['question1'] = train_set['question1'].astype(str)
train_set['question2'] = train_set['question2'].astype(str)
test_set['question1'] = test_set['question1'].astype(str)
test_set['question2'] = test_set['question2'].astype(str)

questions = train_set['question1'].tolist() + train_set['question2'].tolist() \
            + test_set['question1'].tolist() + test_set['question2'].tolist()


tokenizer = Tokenizer(num_words=MAX_WORDS, lower=False)
tokenizer.fit_on_texts(questions)

question1 = tokenizer.texts_to_sequences(train_set['question1'].tolist())
question2 = tokenizer.texts_to_sequences(train_set['question2'].tolist())
test_question1 = tokenizer.texts_to_sequences(test_set['question1'].tolist())
test_question2 = tokenizer.texts_to_sequences(test_set['question2'].tolist())

data1 = pad_sequences(question1, maxlen=MAX_SEQUENCE_LENTGH)
data2 = pad_sequences(question2, maxlen=MAX_SEQUENCE_LENTGH)
labels = np.array(train_set['is_duplicate'].tolist())

test_data1 = pad_sequences(test_question1, maxlen=MAX_SEQUENCE_LENTGH)
test_data2 = pad_sequences(test_question2, maxlen=MAX_SEQUENCE_LENTGH)
test_ids = np.array(test_set['test_id'].tolist())

word_index = tokenizer.word_index
words_number = min(MAX_WORDS, len(word_index)) + 1
word2vec = Word2Vec.load("../input/mymodel/w2v.mod")
embedding_matrix = np.zeros((words_number, EMBEDDING_DIM))
for word, index in word_index.items():
    if word in word2vec.wv.vocab:
        embedding_matrix[index] = word2vec.wv.word_vec(word)
print("embedding_matrix shape:", embedding_matrix.shape)

def build_model():
    embedding_layer = Embedding(words_number, EMBEDDING_DIM, weights=[embedding_matrix], input_length=MAX_SEQUENCE_LENTGH, trainable=False)
    lstm_layer = LSTM(lstm_num, dropout=drop_lstm, recurrent_dropout=drop_lstm)

    sequence_input1 = Input(shape=(MAX_SEQUENCE_LENTGH, ), dtype="int32")
    embedding_sequences1 = embedding_layer(sequence_input1)
    x1 = lstm_layer(embedding_sequences1)

    sequence_input2 = Input(shape=(MAX_SEQUENCE_LENTGH, ), dtype="int32")
    embedding_sequences2 = embedding_layer(sequence_input2)
    y1 = lstm_layer(embedding_sequences2)

    merged = concatenate([x1, y1])
    merged = Dropout(drop_dense)(merged)
    merged = BatchNormalization()(merged)

    merged = Dense(dense_num, activation='relu')(merged)
    merged = Dropout(drop_dense)(merged)
    merged = BatchNormalization()(merged)

    preds = Dense(1, activation='sigmoid')(merged)
    model = Model(input=[sequence_input1, sequence_input2], outputs=preds)
    model.compile(loss='binary_crossentropy', optimizer='nadam', metrics=['acc'])
    return model

results = []

folds = KFold(n_splits=5, shuffle=True)
for train_index, val_index in folds.split(data1):
    x1_train, x2_train = data1[train_index], data2[train_index]
    x1_val, x2_val = data1[val_index], data2[val_index]
    y_train, y_val = labels[train_index], labels[val_index]
    model = build_model()
    early_stopping = EarlyStopping(monitor='val_loss', patience=3)
    model.fit([x1_train, x2_train], y_train, validation_data=([x1_val, x2_val], y_val), epochs=100, batch_size=100, class_weight={0: 1.309028344, 1: 0.472001959}, shuffle=True, callbacks=[early_stopping], verbose=2)
    preds = model.predict([test_data1, test_data2], batch_size=2048, verbose=1)
    results.append(preds)

prediction = np.mean(results, axis=0)
submission = pd.DataFrame({'test_id': test_ids, 'is_duplicate': prediction.ravel()})
submission.to_csv('prediction.csv', index=False)