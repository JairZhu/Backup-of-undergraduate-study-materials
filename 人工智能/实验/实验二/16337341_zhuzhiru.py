import csv
import math
# from graphviz import Digraph


def read_data_set(filename):
    '''从文件中读取数据'''
    trian_set = []
    with open(filename, 'r') as file:
        all_data = csv.reader(file)
        for row in all_data:
            trian_set.append(row)
    return trian_set


def write_labels(filename, test_set, labels):
    '''将数据写入文件'''
    '''
    for i in range(len(test_set)):
        test_set[i][6] = labels[i]
    '''
    for i in range(len(labels)):
        labels[i] = str(labels[i])
    with open(filename, 'w', newline='') as file:
        csv.writer(file).writerows(labels)


def empirical_entropy(train_set, D):
    '''根据数据集train_set计算类别D的信息熵'''
    dict_of_kinds = {}
    for i in range(len(train_set)):
        label = train_set[i][D]
        if label not in dict_of_kinds.keys():
            dict_of_kinds[label] = 1
        else:
            dict_of_kinds[label] += 1
    summ = len(train_set)
    for key in dict_of_kinds.keys():
        pd = dict_of_kinds[key] / summ
        dict_of_kinds[key] = pd * math.log(pd)
    return -sum(list(dict_of_kinds.values()))


def condition_entropy(train_set, A, D):
    '''根据数据集train_set，在已知条件A的前提下，计算D的条件熵'''
    dict_of_kinds = {}
    for i in range(len(train_set)):
        label = train_set[i][A]
        if label not in dict_of_kinds.keys():
            dict_of_kinds[label] = [i]
        else:
            dict_of_kinds[label].append(i)
    for key in dict_of_kinds.keys():
        dict_of_acct = {}
        for j in dict_of_kinds[key]:
            label = train_set[j][D]
            if label not in dict_of_acct.keys():
                dict_of_acct[label] = 1
            else:
                dict_of_acct[label] += 1
        summ = len(dict_of_kinds[key])
        for keyy in dict_of_acct.keys():
            pd = dict_of_acct[keyy] / summ
            dict_of_acct[keyy] = pd * math.log(pd)
        dict_of_kinds[key] = len(dict_of_kinds[key]) / len(train_set) * (-sum(list(dict_of_acct.values())))
    return sum(list(dict_of_kinds.values()))


def informatin_gain(train_set, D, A):
    '''计算信息增益'''
    return empirical_entropy(train_set, D) - condition_entropy(train_set, A, D)


def information_gain_ratio(train_set, D, A):
    '''计算信息增益率'''
    return informatin_gain(train_set, D, A) / empirical_entropy(train_set, A)


def gini_index(train_set, D, A, set):
    '''计算特征A的条件下，标签D的GINI指数'''
    dict_of_kinds = {0: [], 1: []}
    for i in range(len(train_set)):
        if train_set[i][A] in set:
            dict_of_kinds[0].append(i)
        else:
            dict_of_kinds[1].append(i)
    for key in dict_of_kinds.keys():
        dict_of_acct = {}
        for j in dict_of_kinds[key]:
            label = train_set[j][D]
            if label not in dict_of_acct.keys():
                dict_of_acct[label] = 1
            else:
                dict_of_acct[label] += 1
        summ = len(dict_of_kinds[key])
        for kk in dict_of_acct.keys():
            pd = dict_of_acct[kk] / summ
            dict_of_acct[kk] = pd ** 2
        dict_of_kinds[key] = len(dict_of_kinds[key]) / len(train_set) * (1 - sum(list(dict_of_acct.values())))
    return sum(list(dict_of_kinds.values()))


def get_child_set(items):
    '''求items的非空真子集'''
    result = [[]]
    for x in items:
        result.extend([subset + [x] for subset in result])
    return result[1:len(result) - 1]


class decision_node:
    '''定义节点类'''

    def __init__(self, col, value=None, child_node=None):
        self.col = col
        self.value = value
        self.child_node = child_node


class Decision_tree:
    '''定义决策树类'''

    def __init__(self, train_set, D, dict_of_labels, function, dict_of_col):
        self.labels = [i for i in range(len(dict_of_labels.keys()))]
        self.train_set = train_set
        self.D = D
        self.dict_of_labels = dict_of_labels
        self.function = function
        self.dict_of_col = dict_of_col
        self.decision_tree = self.build_tree(train_set, [], function)

    def is_same(self, remain_set):
        '''数据集D中的样本属于同一类别C，则将当前结点标记为C类叶结点'''
        acct = remain_set[0][self.D]
        for row in remain_set:
            if acct != row[self.D]:
                return False
        return True

    def classify(self, test_set):
        '''根据已生成的决策树将test_set中的数据分类'''
        results = []
        for row in test_set:
            head = self.decision_tree
            while head.col != -1:
                if self.function != gini_index:
                    head = head.child_node[row[head.col]]
                else:
                    for key in head.child_node.keys():
                        if key.find(row[head.col]) != -1:
                            head = head.child_node[key]
                            break
            results.append(head.value)
        return results

    def find_mode(self, remain_set):
        '''找出remain_set中出现次数最多的类别'''
        result = [0, 0]
        for line in remain_set:
            result[int(line[self.D])] += 1
        if result[0] > result[1]:
            return 0
        else:
            return 1

    def build_tree(self, remain_set, used_col, function):
        '''构建决策树'''
        if self.is_same(remain_set):
            '''数据集D中的样本属于同一类别C，则将当前结点标记为C类叶结点'''
            return decision_node(-1, value=remain_set[0][self.D])
        if len(used_col) == len(self.dict_of_labels.keys()):
            '''特征集A为空集，或数据集D中所有样本在A中所有特征上取值相同，此时无法划分。将当前结点标记为叶结点，类别为D中出现最多的类'''
            return decision_node(-1, value=self.find_mode(remain_set))
        if function == gini_index:
            '''构建CART模型决策树'''
            gini = {}
            gini_num = []
            for i in self.labels:
                if i not in used_col:
                    child_set = get_child_set(self.dict_of_labels[i])
                    child_gini = []
                    for set in child_set:
                        child_gini.append(gini_index(remain_set, self.D, i, set))
                    minn = min(child_gini)
                    index = child_gini.index(minn)
                    gini[minn] = child_set[index]
                    gini_num.append(minn)
                else:
                    gini[9999] = []
                    gini_num.append(9999)
            '''选择GINI指数最小的特征作为决策点'''
            choose = gini_num.index(min(gini_num))
            left_set = gini[min(gini_num)]
            right_set = []
            for value in self.dict_of_labels[choose]:
                if value not in left_set:
                    right_set.append(value)
            set = [left_set, right_set]
            new_used_col = used_col + [choose]
            child_node = {}
            for i in range(len(set)):
                new_remain_set = []
                for row in remain_set:
                    if row[choose] in set[i]:
                        new_remain_set.append(row)
                strings = ''
                for item in set[i]:
                    strings += item + '|'
                if len(new_remain_set) == 0:
                    '''数据集D为空集，则将当前结点标记为叶结点，类别为父结点中出现最多的类'''
                    child_node[strings] = decision_node(-1, value=self.find_mode(remain_set))
                else:
                    child_node[strings] = self.build_tree(new_remain_set, new_used_col, function)
        else:
            '''构建ID3或C4.5模型决策树'''
            entropies = []
            for i in self.labels:
                if i not in used_col:
                    entropies.append(function(remain_set, self.D, i))
                else:
                    entropies.append(-1)
            '''选择信息增益或信息增益率最大的特征作为决策点'''
            choose = entropies.index(max(entropies))
            new_used_col = used_col + [choose]
            child_node = {}
            for label in self.dict_of_labels[choose]:
                new_remain_set = []
                for row in remain_set:
                    if row[choose] == label:
                        new_remain_set.append(row)
                if len(new_remain_set) == 0:
                    '''数据集D为空集，则将当前结点标记为叶结点，类别为父结点中出现最多的类'''
                    child_node[label] = decision_node(-1, value=self.find_mode(remain_set))
                else:
                    child_node[label] = self.build_tree(new_remain_set, new_used_col, function)
        return decision_node(choose, child_node=child_node)

    '''
    def visit_node(self, graph, father_col, node, strings):
        # 绘制决策树时访问节点函数
        if node.col != -1:
            new_col = father_col + self.dict_of_col[node.col] + strings
            graph.node(new_col, self.dict_of_col[node.col])
            graph.edge(father_col, new_col, strings)
            for key in node.child_node.keys():
                self.visit_node(graph, new_col, node.child_node[key], key)
        else:
            new_col = father_col + str(node.value) + strings
            graph.node(new_col, str(node.value))
            graph.edge(father_col, new_col, strings)

    def draw_tree(self):
        # 绘制决策树的图像
        tree_name = None
        if self.function == informatin_gain:
            tree_name = 'ID3_Decision_Tree.gv'
        elif self.function == information_gain_ratio:
            tree_name = 'C4.5_Decision_Tree.gv'
        else:
            tree_name = 'CART_Decision_Tree.gv'
        graph = Digraph(tree_name, format='png')
        node = self.decision_tree
        graph.node(str(node.col), self.dict_of_col[node.col])
        for key in node.child_node.keys():
            self.visit_node(graph, str(node.col), node.child_node[key], key)
        graph.render(tree_name, view=True)
    '''


def validation(test_set, result, D, function_name):
    count = 0
    for i in range(len(result)):
        if int(result[i]) == int(test_set[i][D]):
            count += 1
    print(function_name + '准确率:', count / len(result))


if __name__ == '__main__':
    dict_of_col = {0: 'buying', 1: 'maint', 2: 'doors', 3: 'persons', 4: 'lug_boot', 5: 'safety'}
    dict_of_train_labels = {0: ['vhigh', 'high', 'med', 'low'], 1: ['vhigh', 'high', 'med', 'low'],
                            2: ['2', '3', '4', '5more'], 3: ['2', '4', 'more'], 4: ['small', 'med', 'big'],
                            5: ['low', 'med', 'high']}

    train_set = read_data_set('Car_train.csv')
    validation_set = read_data_set('car_test_with_label.csv')
    dt_ig = Decision_tree(train_set, 6, dict_of_train_labels, informatin_gain, dict_of_col)
    re1 = dt_ig.classify(validation_set)
    # dt_ig.draw_tree()
    validation(validation_set, re1, 6, 'ID3')

    dt_igr = Decision_tree(train_set, 6, dict_of_train_labels, information_gain_ratio, dict_of_col)
    re2 = dt_igr.classify(validation_set)
    # dt_igr.draw_tree()
    validation(validation_set, re2, 6, 'C4.5')

    dt_gini = Decision_tree(train_set, 6, dict_of_train_labels, gini_index, dict_of_col)
    re3 = dt_gini.classify(validation_set)
    # dt_gini.draw_tree()
    validation(validation_set, re3, 6, 'CART')

    '''
    test_set = read_data_set('Car_test.csv')
    test_labels = dt_igr.classify(test_set)
    write_labels('16337341_zhuzhiru.csv', test_set, test_labels)
    '''
