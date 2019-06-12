import random


class Pathfinding:
    """
    管理敌人寻路和路径选择。
    保留一个供敌人使用的路径池，为每个生成的敌人随机选择一条路径。如果路径被阻塞，它将被修改或重新计算。
    如果重新计算当前路径，敌人可以在路径之间切换以继续移动。
    """

    def __init__(self, game, collision):
        """
        Args:
            game (Game): game实例
            collision (Collision): collision实例
        """
        self.game = game
        self.collision = collision
        self.pool = []
        self.partials = 0

    def precompute(self, count):
        """
        预先计算给定数量的路径

        Args:
            count (int): 预计算的路径数量

        """
        for i in range(count):
            self.pool.append(Path(self, self.find_start()))

    def find_start(self):
        """
        查找全长路径的起点，随机挑选，考虑到碰撞

        Returns:
            (int, int): 起始位置
        """
        cells = self.collision.height
        x = self.game.window.resolution[0]
        attempts = 100

        while attempts > 0:
            attempts -= 1

            y = random.randint(0, cells - 1) * self.collision.tile_size
            if not self.collision.point_blocked(x - 32, y):
                return (x, y)

        # 找不到开始点则提供默认值
        return (x, random.randint(0, cells - 1) * self.collision.tile_size)

    def get_point_usage(self, point):
        """
        返回使用给定点的现有路径的数量

        Args:
            point (int, int): 检查点

        Returns:
            (int): 使用给定点的路径数量
        """
        total = 0

        for path in self.pool:
            if path.done and point in path.points:
                total += 1

        return total

    def update(self):
        """ 继续生成路径 """
        for path in self.pool:
            if not path.done:
                path.search()
                return

    def get_path(self):
        """
        为敌人寻找一条路径

        Returns:
            随机路径（可能仍在生成）
        """
        attempts = 500
        while attempts > 0:
            attempts -= 1

            path = self.pool[random.randint(self.partials, len(self.pool) - 1)]

            if path.done and path.start[0] >= self.game.window.resolution[0]:
                return path

        return self.get_partial_path(self.find_start())[0]

    def repair(self, point):
        """
        当一个点被炮塔阻挡时调用，触发路径修复和再生

        Args:
            point (int, int): 现在被阻塞的点

        """
        for path in self.pool:
            # 修复包含该点的路径
            if path.done and point in path.points:
                path.repair(point)

            # 重新计算可能包含该点的路径
            if not path.done and (point in path.open_set or point in path.closed_set):
                path.start_search()

    def get_partial_path(self, point):
        """
        获取或创建一条开始或穿过给定点的路径，用于因新的炮塔被放置而卡住的敌人

        Args:
            start (int, int): 路径必须包含的一点

        Returns:
            (Path), (int, int): 请求的路径和要在等待时移动的点
        """
        # 尝试相交的路径
        for path in self.pool:
            if (path.done and point in path.points) or path.start == point:
                return path, point

        # 尝试与邻居相交的路径
        for neighbour in self.pool[0].get_neighbours(point):
            for path in self.pool:
                if path.done and neighbour in path.points:
                    return path, neighbour

        # 没有合适的路径，生成一个新的
        path = Path(self, point)
        self.pool.insert(0, path)
        self.partials += 1
        return path, point

    def is_critical(self, point):
        """
        判断如果阻塞给定点是否不可能到达终点
       
        Args:
            point (int, int): 检查点

        Returns:
            如果点一定是畅通的则为True，反之为False
        """
        for path in self.pool:
            if path.done and path.start[0] >= self.game.window.resolution[0] and point not in path.points:
                return False

        return True


class Path:
    """ 整个关卡的单一路径，在多个帧中使用寻路算法进行计算。如果其中一个点被阻塞，路径可以修复 """

    def __init__(self, pathfinding, start):
        """
        Args:
            pathfinding (Pathfinding): pathfinding实例
            start (int, int): 路径的起始位置
        """
        self.start = start
        self.pathfinding = pathfinding
        self.collision = self.pathfinding.collision
        self.res = self.collision.tile_size
        self.points = None
        self.start_search()

    def next(self, current):
        """
        获取路径中的下一个点
        
        Args:
            current (int, int): 当前点

        Returns:
            (int, int) 如果存在下个点则返回下点坐标，否则返回False
        """
        if current not in self.points:
            return False

        index = self.points.index(current)
        length = len(self.points)

        if index + 1 == length:
            return False

        return self.points[index + 1]

    def start_search(self):
        """ 开始寻路搜索 """
        self.done = False
        self.closed_set = set()
        self.open_set = {self.start}
        self.scores = {self.start: 0}
        self.came_from = {}

    def search(self):
        """ 开始或继续搜索适当的路径 """
        iterations = 25
        while len(self.open_set) > 0 and iterations > 0:
            iterations -= 1

            # 找到下一个要评估的点
            current, current_score = self.get_lowest_score(self.open_set, self.scores)

            # 检查是否为目的地
            if current[0] < 0:
                self.points = self.trace_path(current, self.came_from)
                self.done = True
                return

            # 从开放集合中移除
            self.open_set.remove(current)

            # 添加到封闭集合
            self.closed_set.add(current)

            # 考虑每个邻居
            for neighbour in self.get_neighbours(current):

                # 如果已经在封闭集合中则跳过
                if neighbour in self.closed_set:
                    continue

                score = current_score + self.get_cost(current, neighbour)
                exists = (neighbour in self.open_set)

                if not exists or self.scores[neighbour] > score:
                    self.scores[neighbour] = score
                    self.came_from[neighbour] = current

                if not exists:
                    self.open_set.add(neighbour)

    def get_lowest_score(self, open_set, scores):
        """
        查找最低得分路径
       
        Args:
            open_set (set(int, int)): 一组可能的点
            scores (list(int)): 每个点得分的列表

        Returns:
           ((int, int), int) 最低得分点和得分
        """
        lowest_score = 999999999
        lowest_point = (0, 0)

        for p in open_set:
            score = scores[p]

            if lowest_score > score:
                lowest_score = score
                lowest_point = p

        return lowest_point, lowest_score

    def get_neighbours(self, position):
        """
        查找给定位置的相邻图块列表

        Args:
            position (int, int): 起始位置

        Returns:
            （int，int）元组列表
        """
        if position[0] >= self.pathfinding.game.window.resolution[0]:
            return [(position[0] - self.res, position[1])]

        x_diff = range(position[0] - self.res, position[0] + self.res + 1, self.res)
        y_diff = range(position[1] - self.res, position[1] + self.res + 1, self.res)

        return [(x, y) for x in x_diff for y in y_diff if (x, y) != position and (
                    x == position[0] or y == position[1] or self.can_use_diagonal(position, (
            x, y))) and not self.collision.point_blocked(x, y)]

    def can_use_diagonal(self, a, b):
        """
        Args:
            a (int, int): a点坐标
            b (int, int): b点坐标

        Returns:
            (bool) 如果a和b之间的对角线畅通，则返回True，反之返回False
        """
        return not self.collision.point_blocked(b[0], a[1]) and not self.collision.point_blocked(a[0], b[1])

    def get_cost(self, a, b):
        """
        计算在给定位置之间移动的成本
        
        Args:
            a (int, int): a点坐标
            b (int, int): b点坐标
            
        Returns:
            (int) 从a移到b的成本
          
        """
        base = 3 if a[0] == b[0] or a[1] == b[1] else 4
        crowding = self.pathfinding.get_point_usage(b)

        return base + crowding

    def trace_path(self, current, came_from):
        """
        追踪从完成到开始的完成路径

        Args:
            current (int, int): 路径中的最后一个位置
            came_from (dict): 每个点的位置的来源

        Returns:
            (list(int, int)): 路径中的点列表
        """
        path = [current]
        while current in came_from:
            current = came_from[current]
            path.insert(0, current)

        return path

    def repair(self, point):
        """
        在点被阻塞后修复路径
        
        Args:
            point (int, int): 被阻塞的点
        """
        index = self.points.index(point)

        if index != 0 and index < len(self.points) - 1:
            previous = self.points[index - 1]
            next = self.points[index + 1]

            previous_neighbours = self.get_neighbours(previous)
            next_neighbours = self.get_neighbours(next)

            # 如果下一个点和上一个点相邻，则删除该点
            if next in previous_neighbours:
                self.points.remove(point)
                return

            # 如果不是，则检查一个邻居
            for neighbour in previous_neighbours:
                if neighbour in next_neighbours:
                    self.points[index] = neighbour
                    return

            # 如果不是，检查邻居的邻居
            for neighbour in previous_neighbours:
                for neighbour_neighbour in self.get_neighbours(neighbour):
                    if neighbour_neighbour in next_neighbours:
                        self.points[index] = neighbour
                        self.points.insert(index + 1, neighbour_neighbour)
                        return

        # 无解则重制路径
        self.start_search()
