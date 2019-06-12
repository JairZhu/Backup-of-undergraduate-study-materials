import numpy as np
import queue
from copy import deepcopy
import time


def read_data(filename):
    with open(filename, 'r') as file:
        data = []
        for i in range(18):
            line = []
            for item in file.readline():
                if item != '\n':
                    line.append(item)
            data.append(line)
    return data


def find_start_end(maze):
    start = None
    end = None
    for i in range(len(maze)):
        for j in range(len(maze[i])):
            if maze[i][j] == 'S':
                start = (i, j)
            elif maze[i][j] == 'E':
                end = (i, j)
    return (start, end)


class DFS:
    def __init__(self, maze):
        self.maze = deepcopy(maze)
        self.visited = np.zeros([18, 36])
        self.path = [[0 for i in range(36)] for j in range(18)]

    def search(self, pos, end, pre):
        if self.maze[pos[0]][pos[1]] == '%':
            # 遇到迷宫中的墙壁
            return
        if pos[0] == end[0] and pos[1] == end[1]:
            # 到达目的地
            self.path[pos[0]][pos[1]] = (pre[0], pre[1], pre[2] + 1)
            return
        if self.visited[pos[0]][pos[1]] == 1:
            # 已经访问过该顶点
            return
        # 记录父顶点
        self.path[pos[0]][pos[1]] = (pre[0], pre[1], pre[2] + 1)
        # 将顶点标记为已访问
        self.visited[pos[0]][pos[1]] = 1
        # 递归访问邻接顶点
        if pos[1] - 1 >= 0:
            self.search((pos[0], pos[1] - 1, pos[2] + 1), end, pos)
        if pos[0] + 1 < 18:
            self.search((pos[0] + 1, pos[1], pos[2] + 1), end, pos)
        if pos[0] - 1 >= 0:
            self.search((pos[0] - 1, pos[1], pos[2] + 1), end, pos)
        if pos[1] + 1 < 36:
            self.search((pos[0], pos[1] + 1, pos[2] + 1), end, pos)

    def find_path(self, start, end):
        start = (start[0], start[1], 0)
        self.search(start, end, start)
        self.path[start[0]][start[1]] = start
        path = []
        pos = end
        while pos != start:
            path.append((pos[0], pos[1], self.path[pos[0]][pos[1]][2]))
            pos = self.path[pos[0]][pos[1]]
        for item in path:
            self.maze[item[0]][item[1]] = str(item[2])
        for line in self.maze:
            for i in line:
                if i != '%':
                    print("{:^4s}".format(i), end='')
                else:
                    print("{:%^4s}".format(i), end='')
            print()
        print()


class BFS:
    def __init__(self, maze):
        self.maze = deepcopy(maze)
        self.visited = np.zeros([18, 36])
        self.path = [[0 for i in range(36)] for j in range(18)]

    def is_available(self, pos):
        if self.maze[pos[0]][pos[1]] == '%':
            # 遇到迷宫中的墙壁
            return False
        if self.visited[pos[0]][pos[1]] == 1:
            # 已经访问过该顶点
            return False
        return True

    def search(self, start, end):
        start = (start[0], start[1], 0)
        self.path[start[0]][start[1]] = start
        # 声明边界队列
        q = queue.Queue()
        q.put(start)
        while not q.empty():
            pos = q.get()
            if pos[0] == end[0] and pos[1] == end[1]:
                # 到达目的地
                break
            # 将顶点标记为已访问
            self.visited[pos[0]][pos[1]] = 1
            # 依次访问邻接顶点
            if pos[0] - 1 >= 0:
                if self.is_available((pos[0] - 1, pos[1])):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0] - 1][pos[1]] = (pos[0], pos[1], pos[2] + 1)
                    q.put((pos[0] - 1, pos[1], pos[2] + 1))
            if pos[0] + 1 < 18:
                if self.is_available((pos[0] + 1, pos[1])):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0] + 1][pos[1]] = (pos[0], pos[1], pos[2] + 1)
                    q.put((pos[0] + 1, pos[1], pos[2] + 1))
            if pos[1] - 1 >= 0:
                if self.is_available((pos[0], pos[1] - 1)):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0]][pos[1] - 1] = (pos[0], pos[1], pos[2] + 1)
                    q.put((pos[0], pos[1] - 1, pos[2] + 1))
            if pos[1] + 1 < 36:
                if self.is_available((pos[0], pos[1] + 1)):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0]][pos[1] + 1] = (pos[0], pos[1], pos[2] + 1)
                    q.put((pos[0], pos[1] + 1, pos[2] + 1))
        path = []
        pos = end
        while pos != start:
            # 得到从起始顶点到目的地的路径
            path.append((pos[0], pos[1], self.path[pos[0]][pos[1]][2]))
            pos = self.path[pos[0]][pos[1]]
        for item in path:
            self.maze[item[0]][item[1]] = str(item[2])
        # 绘制从起始顶点到目的地的路径
        for line in self.maze:
            for i in line:
                if i != '%':
                    print("{:^3s}".format(i), end='')
                else:
                    print("{:%^3s}".format(i), end='')
            print()
        print()


class UCS:
    def __init__(self, maze):
        self.maze = deepcopy(maze)
        self.visited = np.zeros([18, 36])
        self.path = [[0 for i in range(36)] for j in range(18)]

    def is_available(self, pos, end):
        if self.maze[pos[0]][pos[1]] == '%':
            return False
        if self.visited[pos[0]][pos[1]] == 1:
            return False
        return True

    def search(self, start, end):
        begin = (start[0], start[1], 0)
        self.path[start[0]][start[1]] = begin
        # 声明边界队列
        q = [begin]
        while len(q) != 0:
            # 将距起始顶点最近的顶点从队列中弹出
            index = 0
            minn = q[0][2]
            for i in range(len(q)):
                if minn > q[i][2]:
                    minn = q[i][2]
                    index = i
            pos = q[index]
            del q[index]
            if pos[0] == end[0] and pos[1] == end[1]:
                # 到达目的地
                break
            # 将顶点标记为已访问
            self.visited[pos[0]][pos[1]] = 1
            # 依次访问邻接顶点
            if pos[0] - 1 >= 0:
                if self.is_available((pos[0] - 1, pos[1]), end):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0] - 1][pos[1]] = (pos[0], pos[1], pos[2] + 1)
                    q.append((pos[0] - 1, pos[1], pos[2] + 1))
            if pos[0] + 1 < 18:
                if self.is_available((pos[0] + 1, pos[1]), end):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0] + 1][pos[1]] = (pos[0], pos[1], pos[2] + 1)
                    q.append((pos[0] + 1, pos[1], pos[2] + 1))
            if pos[1] - 1 >= 0:
                if self.is_available((pos[0], pos[1] - 1), end):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0]][pos[1] - 1] = (pos[0], pos[1], pos[2] + 1)
                    q.append((pos[0], pos[1] - 1, pos[2] + 1))
            if pos[1] + 1 < 36:
                if self.is_available((pos[0], pos[1] + 1), end):
                    # 如果该顶点可以访问，则记录父顶点，并将其加入边界队列
                    self.path[pos[0]][pos[1] + 1] = (pos[0], pos[1], pos[2] + 1)
                    q.append((pos[0], pos[1] + 1, pos[2] + 1))
        path = []
        pos = end
        while pos != begin:
            # 得到从起始顶点到目的地的路径
            path.append((pos[0], pos[1], self.path[pos[0]][pos[1]][2]))
            pos = self.path[pos[0]][pos[1]]
        for item in path:
            self.maze[item[0]][item[1]] = str(item[2])
        # 绘制从起始顶点到目的地的路径
        for line in self.maze:
            for i in line:
                if i != '%':
                    print("{:^3s}".format(i), end='')
                else:
                    print("{:%^3s}".format(i), end='')
            print()
        print()


class IDS:
    def __init__(self, maze):
        self.maze = deepcopy(maze)
        self.visited = np.zeros([18, 36])
        self.path = [[0 for i in range(36)] for j in range(18)]
        self.flag = False

    def search(self, pos, end, pre, limit):
        # 深度受限搜索
        if pos[2] > limit:
            # 搜索深度达到最大值，结束搜索
            return
        if self.maze[pos[0]][pos[1]] == '%':
            # 遇到迷宫中的墙壁
            return
        if pos[0] == end[0] and pos[1] == end[1]:
            # 到达目的地，记录父顶点
            self.path[pos[0]][pos[1]] = (pre[0], pre[1], pre[2] + 1)
            self.flag = True
            return
        if self.visited[pos[0]][pos[1]] == 1:
            # 已经访问过该顶点
            return
        # 记录父顶点
        self.path[pos[0]][pos[1]] = (pre[0], pre[1], pre[2] + 1)
        # 将顶点标记为已访问
        self.visited[pos[0]][pos[1]] = 1
        # 递归访问邻接顶点
        if pos[1] - 1 >= 0 and not self.flag:
            self.search((pos[0], pos[1] - 1, pos[2] + 1), end, pos, limit)
        if pos[0] + 1 < 18 and not self.flag:
            self.search((pos[0] + 1, pos[1], pos[2] + 1), end, pos, limit)
        if pos[0] - 1 >= 0 and not self.flag:
            self.search((pos[0] - 1, pos[1], pos[2] + 1), end, pos, limit)
        if pos[1] + 1 < 36 and not self.flag:
            self.search((pos[0], pos[1] + 1, pos[2] + 1), end, pos, limit)
        # 回溯时将顶点设为未被访问
        self.visited[pos[0]][pos[1]] = 0

    def find_path(self, start, end):
        start = (start[0], start[1], 0)
        cutoff = 0
        while not self.flag:
            # 未到达目的地，则增加搜索深度
            cutoff += 1
            # 清除上次搜索的记录
            self.path = [[0 for i in range(36)] for j in range(18)]
            # 进行深度受限搜索
            self.search(start, end, start, cutoff)
        self.path[start[0]][start[1]] = start
        path = []
        pos = end
        while pos != start:
            # 得到从起始顶点到目的地的路径
            path.append((pos[0], pos[1], self.path[pos[0]][pos[1]][2]))
            pos = self.path[pos[0]][pos[1]]
        for item in path:
            self.maze[item[0]][item[1]] = str(item[2])
        # 绘制从起始顶点到目的地的路径
        for line in self.maze:
            for i in line:
                if i != '%':
                    print("{:^3s}".format(i), end='')
                else:
                    print("{:%^3s}".format(i), end='')
            print()
        print()


if __name__ == "__main__":
    maze = read_data('MazeData.txt')
    start, end = find_start_end(maze)

    start_time = time.time()
    dfs = DFS(maze)
    dfs.find_path(start, end)
    dfs_time = time.time()

    bfs = BFS(maze)
    bfs.search(start, end)
    bfs_time = time.time()

    ucs = UCS(maze)
    ucs.search(start, end)
    ucs_time = time.time()

    ids = IDS(maze)
    ids.find_path(start, end)
    ids_time = time.time()

    print("DFS时间：", dfs_time - start_time)
    print("BFS时间：", bfs_time - dfs_time)
    print("UCS时间：", ucs_time - bfs_time)
    print("IDS时间：", ids_time - ucs_time)