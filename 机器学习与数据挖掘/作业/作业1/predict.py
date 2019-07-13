import pandas as pd
import xgboost as xgb
import numpy as np
from sklearn import preprocessing
from sklearn.decomposition import PCA, FastICA
from sklearn.ensemble import RandomForestRegressor
import csv

x = pd.read_csv('train.csv')
y = pd.read_csv('label.csv')
y.drop(['Id'], axis=1, inplace=True)
test = pd.read_csv('test.csv')

# 将整列为NaN的列删除
x.dropna(axis=1, how='all', inplace=True)
for col in x.columns:
    if x[col].dtype != 'object':
        # 将数值类型的列中平均值填入该列中的空缺位置
        x[col].fillna(x[col].mean(), inplace=True)
    else:
        # 将非数值类型的列中出现次数最多的值填入列中的空缺位置
        x[col].fillna(x[col].mode()[0], inplace=True)
        # 将该列的数据全部转为数值类型
        lbl = preprocessing.LabelEncoder()
        x[col] = lbl.fit_transform(list(x[col].values))
# 填补所有的空缺值后，再将训练集中的所有数据min-max标准化
x = x.apply(lambda x: (x - np.min(x)) / (np.max(x) - np.min(x)))
x.dropna(axis=1, how='all', inplace=True)

test.dropna(axis=1, how='all', inplace=True)
for col in test.columns:
    if test[col].dtype != 'object':
        test[col].fillna(test[col].mean(), inplace=True)
    else:
        test[col].fillna(test[col].mode()[0], inplace=True)
        lbl = preprocessing.LabelEncoder()
        test[col] = lbl.fit_transform(list(test[col].values))
test = test.apply(lambda x: (x - np.min(x)) / (np.max(x) - np.min(x)))
test.dropna(axis=1, how='all', inplace=True)
print(x.shape, test.shape)

# xgboost模型，选择最优参数建立模型
classfilter = xgb.XGBClassifier(max_depth=9, learning_rate=0.05, objective='binary:logistic', n_jobs=-1,
                                min_child_weight=1, gamma=0.2, scale_pos_weight=6, reg_lambda=1, subsample=0.7,
                                n_estimators=1400, colsample_bytree=0.7, max_delta_step=1)
# 使用训练集数据训练模型
classfilter.fit(x, y.values.ravel(), verbose=True)
# 预测测试集数据的标签
pred = classfilter.predict_proba(test)

with open('data/xgboost.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Id', 'label'])
    for i in range(len(pred)):
        writer.writerow([i, format(pred[i][0], '.9f')])
