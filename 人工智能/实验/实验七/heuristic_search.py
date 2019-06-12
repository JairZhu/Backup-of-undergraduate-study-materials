from copy import deepcopy
import math
import time


def show_result(path):
    print('移动步数：', len(path))
    print('路径：')
    for i in range(len(path)):
        print('{:3d}'.format(path[i].change_number), end='')
        if i % 10 == 9:
            print()
    print('\n')


def show_matrix(matrix):
    for row in matrix:
        for item in row:
            print('{:3d}'.format(item), end='')
        print()

def read_data(filename):
    data = []
    with open(filename, 'r') as file:
        for row in file.readlines():
            row = row.strip().split(' ')
            data.append([int(i) for i in row])
    return data


def move_zero(matrix, oldx, oldy, newx, newy):
    # 移动0的位置
    tmp = matrix[oldx][oldy]
    matrix[oldx][oldy] = matrix[newx][newy]
    matrix[newx][newy] = tmp
    return matrix


def find_zero(matrix, size):
    # 在矩阵中找到0的位置
    for x in range(size):
        for y in range(size):
            if matrix[x][y] == 0:
                return (x, y)


class Node:
    def __init__(self, matrix, size):
        self.matrix = matrix
        self.size = size
        self.father = None
        self.g = 0
        self.h = 0
        self.change_number = None

    def set_new_h(self, final_matrix):
        # 矩阵中每个点距目标位置的曼哈顿距离的和作为H值
        for x in range(self.size):
            for y in range(self.size):
                for i in range(self.size):
                    for j in range(self.size):
                        if self.matrix[x][y] == final_matrix[i][j]:
                            self.h += abs(x - i) + abs(y - j)
                            #self.h += math.sqrt((x - i) * (x - i) + (y - j) * (y - j))

class Astar:
    def __init__(self, start_matrix, final_matrix, size):
        self.final_matrix = final_matrix
        self.start_node = Node(start_matrix, size)
        self.openlist = []
        self.closelist = []
        self.current_node = None
        self.step = 0
        self.size = size

    def find_min_f_node(self):
        # 找出“开放列表”中F值最小的节点
        min_node = self.openlist[0]
        for item in self.openlist:
            if item.g + item.h < min_node.g + min_node.h:
                min_node = item
        return min_node

    def node_in_list(self, node, list):
        # 判断节点是否在list中
        for item in list:
            if item.matrix == node.matrix:
                return True
        return False

    def get_index_in_openlist(self, node):
        # 获得节点node在“开放列表”中的下标
        for i in range(len(self.openlist)):
            if node.matrix == self.openlist[i].matrix:
                return i
        return None

    def search_node(self, node):
        # 检测相邻节点node
        if self.node_in_list(node, self.closelist):
            # 节点node在“关闭列表”中，直接返回
            return
        if not self.node_in_list(node, self.openlist):
            # 节点node不在“开启列表”中，计算其G和H，设置其父节点为当前节点
            node.g = self.step
            node.set_new_h(self.final_matrix)
            node.father = self.current_node
            self.openlist.append(node)
        else:
            # 节点node在“开启列表”中，更新其g(x)
            index = self.get_index_in_openlist(node)
            if self.current_node.g + self.step < self.openlist[index].g:
                self.openlist[index].g = self.current_node.g + self.step
                self.openlist[index].father = self.current_node

    def search(self):
        self.start_node.set_new_h(self.final_matrix)
        self.start_node.g = self.step
        self.openlist.append(self.start_node)
        while True:
            # 从“开启列表”中选取估价函数值最小的节点，将其加入“关闭列表”并从“开启列表”中删除
            self.current_node = self.find_min_f_node()
            self.closelist.append(self.current_node)
            self.openlist.remove(self.current_node)
            self.step = self.current_node.g
            current_matrix = self.current_node.matrix
            x, y = find_zero(current_matrix, self.size)
            self.step += 1
            # 检查节点C的所有相邻节点
            if x + 1 < self.size:
                next_node = Node(move_zero(deepcopy(current_matrix), x, y, x + 1, y), self.size)
                # 检测相邻节点
                self.search_node(next_node)
                next_node.change_number = current_matrix[x + 1][y]
            if x - 1 >= 0:
                next_node = Node(move_zero(deepcopy(current_matrix), x, y, x - 1, y), self.size)
                # 检测相邻节点
                self.search_node(next_node)
                next_node.change_number = current_matrix[x - 1][y]
            if y + 1 < self.size:
                next_node = Node(move_zero(deepcopy(current_matrix), x, y, x, y + 1), self.size)
                # 检测相邻节点
                self.search_node(next_node)
                next_node.change_number = current_matrix[x][y + 1]
            if y - 1 >= 0:
                next_node = Node(move_zero(deepcopy(current_matrix), x, y, x, y - 1), self.size)
                # 检测相邻节点
                self.search_node(next_node)
                next_node.change_number = current_matrix[x][y - 1]
            # 判断“开启列表”中是否存在目标节点
            if self.node_in_list(Node(self.final_matrix, self.size), self.openlist):
                # 若存在，结束搜索，返回路径
                index = self.get_index_in_openlist(Node(self.final_matrix, self.size))
                tmp = self.openlist[index]
                path = [tmp]
                while tmp.father != None:
                    tmp = tmp.father
                    path.append(tmp)
                path.reverse()
                del path[0]
                return path
            elif len(self.openlist) == 0:
                # 若“开启列表”为空，结束搜索
                return


class IDAstar:
    def __init__(self, startmatrix, finalmatrix, size):
        self.finalnode = Node(finalmatrix, size)
        self.startnode = Node(startmatrix, size)
        self.startnode.set_new_h(finalmatrix)
        self.size = size
        self.visited = []
        self.flag = False
        self.endnode = None
        self.cutoff = []

    def search_node(self, matrix, depth):
        # 更新新节点的G和H值
        node = Node(matrix, self.size)
        node.g = depth
        node.set_new_h(self.finalnode.matrix)
        return node

    def subsearch(self, node, pre, depth, limit):
        if node.g + node.h > limit:
            # 节点的F值大于阈值，结束搜索，将该F值加入cutoff列表
            self.cutoff.append(node.g + node.h)
            return
        if node.matrix == self.finalnode.matrix:
            # 节点是目标节点，结束搜索，保存父节点
            node.father = pre
            self.flag = True
            self.endnode = node
            return
        # 记录父节点
        node.father = pre
        # 将节点加入已访问的列表
        self.visited.append(node.matrix)
        x, y = find_zero(node.matrix, self.size)
        # 递归搜索所有相邻节点
        if x + 1 < self.size and not self.flag:
            next_matrix = move_zero(deepcopy(node.matrix), x, y, x + 1, y)
            if next_matrix not in self.visited:
                # 节点不在已访问的列表中，更新新节点的G和H值
                next_node = self.search_node(next_matrix, depth)
                next_node.change_number = next_matrix[x][y]
                self.subsearch(next_node, node, depth + 1, limit)
        if x - 1 >= 0 and not self.flag:
            next_matrix = move_zero(deepcopy(node.matrix), x, y, x - 1, y)
            if next_matrix not in self.visited:
                # 节点不在已访问的列表中，更新新节点的G和H值
                next_node = self.search_node(next_matrix, depth)
                next_node.change_number = next_matrix[x][y]
                self.subsearch(next_node, node, depth + 1, limit)
        if y + 1 < self.size and not self.flag:
            next_matrix = move_zero(deepcopy(node.matrix), x, y, x, y + 1)
            if next_matrix not in self.visited:
                # 节点不在已访问的列表中，更新新节点的G和H值
                next_node = self.search_node(next_matrix, depth)
                next_node.change_number = next_matrix[x][y]
                self.subsearch(next_node, node, depth + 1, limit)
        if y - 1 >= 0 and not self.flag:
            next_matrix = move_zero(deepcopy(node.matrix), x, y, x, y - 1)
            if next_matrix not in self.visited:
                # 节点不在已访问的列表中，更新新节点的G和H值
                next_node = self.search_node(next_matrix, depth)
                next_node.change_number = next_matrix[x][y]
                self.subsearch(next_node, node, depth + 1, limit)
        # 回溯时将节点从已访问列表中删除
        self.visited.remove(node.matrix)

    def search(self):
        # 阈值设为初始节点的H值
        limit = self.startnode.h
        while not self.flag:
            # 没有找到目标节点，将阈值设为cutoff中最小值
            self.subsearch(self.startnode, None, 1, limit)
            limit = min(self.cutoff)
            self.cutoff = []
        tmp = self.endnode
        # 找到目标节点，返回路径
        path = [tmp]
        while tmp.father != None:
            tmp = tmp.father
            path.append(tmp)
        path.reverse()
        del path[0]
        return path


if __name__ == '__main__':
    data1 = read_data('data1.txt')
    data2 = read_data('data2.txt')
    data3 = read_data('data3.txt')
    data4 = read_data('data4.txt')
    ppt1 = read_data('ppt1.txt')
    ppt2 = read_data('ppt2.txt')
    ppt3 = read_data('ppt3.txt')
    ppt4 = read_data('ppt4.txt')
    target = read_data('target.txt')

    starttime = time.time()
    idastar = IDAstar(data1, target, 4)
    path = idastar.search()
    show_matrix(data1)
    ppt1_ida_time = time.time()
    print('时间：', ppt1_ida_time - starttime)
    show_result(path)

    idastar = IDAstar(data2, target, 4)
    path = idastar.search()
    show_matrix(data2)
    ppt2_ida_time = time.time()
    print('时间：', ppt2_ida_time - ppt1_ida_time)
    show_result(path)

    ppt2_ida_time = time.time()
    idastar = IDAstar(data3, target, 4)
    path = idastar.search()
    show_matrix(data3)
    ppt3_ida_time = time.time()
    print('时间：', ppt3_ida_time - ppt2_ida_time)
    show_result(path)

    idastar = IDAstar(data4, target, 4)
    path = idastar.search()
    show_matrix(data4)
    ppt4_ida_time = time.time()
    print('时间：', ppt4_ida_time - ppt3_ida_time)
    show_result(path)