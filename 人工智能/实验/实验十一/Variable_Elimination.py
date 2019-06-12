from copy import deepcopy


class VariableElimination:
    @staticmethod
    def inference(factor_list, query_variables, ordered_list_of_hidden_variables, evidence_list):
        # 根据给定的evidence_list限制所有已知的随机变量
        for evkey, value in evidence_list.items():
            for i in range(len(factor_list)):
                if evkey in factor_list[i].var_list:
                    factor_list[i] = factor_list[i].restrict(evkey, str(value))
        # 根据给定的消元顺序逐个消元
        for var in ordered_list_of_hidden_variables:
            currnet_list = []
            # 找到包含所要消除的变量的所有因子
            for i in range(len(factor_list)):
                if var in factor_list[i].var_list:
                    currnet_list.append(factor_list[i])
            # 将找到的所有因子从因子列表factor_list中删除
            for factor in currnet_list:
                factor_list.remove(factor)
            # 将所有找到的因子相乘再对于所要消除的变量求和得到新的因子
            new_factor = currnet_list.pop()
            while len(currnet_list) != 0:
                new_factor = new_factor.multiply(currnet_list.pop())
            # 将新得到的因子加入因子列表factor_list
            factor_list.append(new_factor.sum_out(var))
        print("RESULT: ")
        res = factor_list[0]
        for factor in factor_list[1:]:
            res = res.multiply(factor)
        total = sum(res.cpt.values())
        res.cpt = {k: v / total for k, v in res.cpt.items()}
        res.print_inf()

    @staticmethod
    def print_factors(factor_list):
        for factor in factor_list:
            factor.print_inf()


class Util:
    @staticmethod
    def to_binary(num, len):
        return format(num, '0' + str(len) + 'b')


class Node:
    def __init__(self, name, var_list):
        self.name = name
        self.var_list = var_list
        self.cpt = {}

    def set_cpt(self, cpt):
        self.cpt = cpt

    def print_inf(self):
        print("Name = " + self.name)
        print(" vars " + str(self.var_list))
        for key in self.cpt:
            print("   key: " + key + " val : " + str(self.cpt[key]))
        print()

    def multiply(self, factor):
        '''function that multiplies with another factor'''
        index1 = 0
        index2 = 0
        new_list = []
        new_cpt = {}
        # 找到两个因子中相同的变量
        for var in self.var_list:
            if var in factor.var_list:
                # 得到这个变量在两个因子中下标
                index1 = self.var_list.index(var)
                index2 = factor.var_list.index(var)
                new_list = self.var_list + factor.var_list[:index2] + factor.var_list[index2 + 1:]
                break
        for key1, prob1 in self.cpt.items():
            for key2, prob2 in factor.cpt.items():
                if key1[index1] == key2[index2]:
                    # 遍历两个条件概率表，找到相匹配的key
                    new_key = key1 + key2[:index2] + key2[index2 + 1:]
                    # 两个概率相乘以组成新的条件概率表
                    new_cpt[new_key] = prob1 * prob2
        new_node = Node('f' + str(new_list), new_list)
        new_node.set_cpt(new_cpt)
        return new_node

    def sum_out(self, variable):
        '''function that sums out a variable given a factor'''
        # 找到变量variable的下标
        index = self.var_list.index(variable)
        new_var_list = deepcopy(self.var_list)
        # 删除因子中变量variable
        new_var_list.remove(variable)
        new_cpt = {}
        # 对变量variable求和
        for key1, prob1 in self.cpt.items():
            for key2, prob2 in self.cpt.items():
                if key1[:index] == key2[:index] and key1[index + 1:] == key2[index + 1:] and key1[index] != key2[index]:
                    # 只对相互匹配的求和
                    new_key = key1[:index] + key1[index + 1:]
                    if new_key not in new_cpt.keys():
                        # 对条件概率表遍历两遍导致每个结果会出现两次，只需保存一次即可
                        new_cpt[new_key] = prob1 + prob2
        new_node = Node('f' + str(new_var_list), new_var_list)
        new_node.set_cpt(new_cpt)
        return new_node

    def restrict(self, variable, value):
        '''function that restricts a variable to some value in a given factor'''
        # 找到变量的下标
        index = self.var_list.index(variable)
        new_var_list = deepcopy(self.var_list)
        # 删除因子中已限制的变量
        new_var_list.remove(variable)
        new_cpt = {}
        for key, prob in self.cpt.items():
            if key[index] == value:
                # 新的条件概率表中只保留限制变量的值为value的概率
                kkey = key[:index] + key[index + 1:]
                new_cpt[kkey] = prob
        new_node = Node('f' + str(new_var_list), new_var_list)
        new_node.set_cpt(new_cpt)
        return new_node


# Create nodes for Bayes Net
B = Node('B', ['B'])
E = Node('E', ['E'])
A = Node('A', ['A', 'B', 'E'])
J = Node('J', ['J', 'A'])
M = Node('M', ['M', 'A'])

# Generate cpt for each node
B.set_cpt({'0': 0.999, '1': 0.001})
E.set_cpt({'0': 0.998, '1': 0.002})
A.set_cpt({'111': 0.95, '011': 0.05, '110': 0.94, '010': 0.06,
           '101': 0.29, '001': 0.71, '100': 0.001, '000': 0.999})
J.set_cpt({'11': 0.9, '01': 0.1, '10': 0.05, '00': 0.95})
M.set_cpt({'11': 0.7, '01': 0.3, '10': 0.01, '00': 0.99})


print("P(A) **********************")
VariableElimination.inference([B, E, A, J, M], ['A'], ['B', 'E', 'J', 'M'], {})

print("P(B | J, ~M) **********************")
VariableElimination.inference([B, E, A, J, M], ['B'], ['E', 'A'], {'J': 1, 'M': 0})
