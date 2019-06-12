import pygame
import random


class Collision:
    """ 处理与网格的碰撞，用于炮塔的放置、炮弹和导航 """

    def __init__(self, level, resolution, tile_size):
        """
        Args:
            game (Game): game实例
            resolution (int, int): 屏幕分辨率
            tile_size (int): 每个缓存切片的大小（像素）
        """
        self.level = level
        self.tile_size = tile_size
        self.width = resolution[0] // tile_size
        self.height = resolution[1] // tile_size
        self.blocked_tiles = []
        self.overlay = None

    def point_to_index(self, x, y):
        """
        将屏幕上的点转换为图块索引

        Args:
            x (int): x坐标
            y (int): y坐标

        Returns:
            (int): （x，y）处的图块索引
        """
        xIndex = x // self.tile_size
        yIndex = y // self.tile_size

        return (yIndex * 1000) + xIndex

    def point_blocked(self, x, y):
        """
        检查给定点是否被阻塞

        Args:
            x (int): x坐标
            y (int): y坐标

        Returns:
            若阻塞则为True，反之为False
        """
        return self.point_to_index(x, y) in self.blocked_tiles

    def block_point(self, x, y):
        """
        阻塞给定点

        Args:
            x (int): x坐标
            y (int): y坐标
        """
        index = self.point_to_index(x, y)

        if index not in self.blocked_tiles:
            self.blocked_tiles.append(index)
            self.overlay = None
            self.level.pathfinding.repair((x - (x % self.tile_size), y - (y % self.tile_size)))

    def unblock_point(self, x, y):
        """
        释放给定点

        Args:
            x (int): x坐标
            y (int): y坐标
        """
        index = self.point_to_index(x, y)

        if index in self.blocked_tiles:
            self.blocked_tiles.remove(index)
            self.overlay = None

    def rect_blocked(self, x, y, width, height):
        """
        检查给定的矩形是否被阻塞

        Args:
            x (int): 左上角x坐标
            y (int): 左上角y坐标
            width (int): 矩形的宽
            height (int): 矩形的高

        Returns:
            若矩形任何部分被阻塞则为True，反之为False
        """
        xOffset = x % self.tile_size
        yOffset = y % self.tile_size

        for xPos in range(x - xOffset, x + width, self.tile_size):
            for yPos in range(y - yOffset, y + height, self.tile_size):

                if self.point_blocked(xPos, yPos):
                    return True

        return False

    def block_rect(self, x, y, width, height):
        """
        阻塞给定的矩形区域

        Args:
            x (int): 左上角x坐标
            y (int): 左上角y坐标
            width (int): 矩形的宽
            height (int): 矩形的高
        """
        xOffset = x % self.tile_size
        yOffset = y % self.tile_size

        for xPos in range(x - xOffset, x + width - 2, self.tile_size):
            for yPos in range(y - yOffset, y + height - 2, self.tile_size):
                self.block_point(xPos, yPos)

    def unblock_rect(self, x, y, width, height):
        """
        释放给定的矩形区域

        Args:
            x (int): 左上角x坐标
            y (int): 左上角y坐标
            width (int): 矩形的宽
            height (int): 矩形的高
        """
        xOffset = x % self.tile_size
        yOffset = y % self.tile_size

        for xPos in range(x - xOffset, x + width, self.tile_size):
            for yPos in range(y - yOffset, y + height, self.tile_size):
                self.unblock_point(xPos, yPos)
