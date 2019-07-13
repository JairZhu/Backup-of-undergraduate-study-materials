import pandas as pd
import xgboost as xgb
import numpy as np
from sklearn import preprocessing
from sklearn.model_selection import GridSearchCV
from sklearn.decomposition import PCA, FastICA
from sklearn.ensemble import RandomForestRegressor
import csv

x = pd.read_csv('train.csv')
y = pd.read_csv('label.csv')
y.drop(['Id'], axis=1, inplace=True)
test = pd.read_csv('test.csv')

x.dropna(axis=1, how='all', inplace=True)
for col in x.columns:
    if x[col].dtype != 'object':
        x[col].fillna(x[col].mean(), inplace=True)
    else:
        x[col].fillna(x[col].mode()[0], inplace=True)
        lbl = preprocessing.LabelEncoder()
        x[col] = lbl.fit_transform(list(x[col].values))
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

# 搜索的参数取值
cv_params = {'min_child_weight': [1, 2, 3, 4, 5], 
            'max_depth': [6, 7, 8, 9 , 10],
            'n_estimators': [600, 800, 1000, 1200, 1400],
            'gamma': [0.1, 0.2, 0.3, 0.4, 0.5], 
            'subsample': [0.5, 0.6, 0.7, 0.8, 0.9, 1],
            'colsample_bytree': [0.5, 0.6, 0.7, 0.8, 0.9, 1],
            'reg_lambda': [0.5, 1, 1.5, 2, 3], 
            'scale_pos_weight': [2, 4, 6, 8, 10],
            'max_delta_step': [0.5, 1, 1.5, 2, 3], 
            'learning_rate': [0.01, 0.02, 0.05, 0.1, 0.15, 1]}
# 其他参数
other_params = {'max_depth': 9, 'learning_rate': 0.05, 'gamma': 0.2, 'reg_lambda': 1, 'scale_pos_weight': 6, 'subsample': 0.7, 'min_child_weight': 1, 'colsample_bytree': 0.7, 'objective': 'binary:logistic', 'n_jobs': -1, 'silent': 0}
# 建立模型
model = xgb.XGBClassifier(**other_params)
# 进行网格搜索
optimized = GridSearchCV(estimator=model, param_grid=cv_params, scoring='roc_auc', cv=5, verbose=True, n_jobs=-1)
# 使用训练集数据训练模型
optimized.fit(x, y.values.ravel())
# 获得最佳参数取值，以及对应得分
print('参数的最佳取值：{0}'.format(optimized.best_params_))
print('最佳模型得分:{0}'.format(optimized.best_score_))
