import pygame
import random
from core.enemy import Enemy


class Wave:
    """ 控制每波敌人的生成数量 """

    def __init__(self, game, number):
        """
        Args:
            game (Game): game实例
            number (int): 波数
        """
        self.game = game
        self.number = number
        self.started = False
        self.done = False
        self.enemies = pygame.sprite.Group()
        self.spawn_time = 0
        self.spawn_gap = 3 - (number ** 0.6)
        self.spawn_count_small = int(number ** 2.5)
        self.spawn_count_medium = int(number ** 2 - number)
        self.spawn_count_large = int(number ** 1.7 - 4)

    def update(self, delta):
        """
        每帧调用一次，更新敌人的生成

        Args:
            delta (float): 距上次更新的时间
        """
        self.enemies.update(delta)

        self.spawn_time -= delta
        if self.spawn_time > 0:
            return

        if self.started and self.spawn_count_small > 0:
            self.spawn("enemy_small")
            self.spawn_count_small -= 1

        if self.started and self.spawn_count_medium > 0 and self.spawn_count_small <= self.spawn_count_medium:
            self.spawn("enemy_medium")
            self.spawn_count_medium -= 1

        if self.started and self.spawn_count_large > 0 and self.spawn_count_medium <= self.spawn_count_large:
            self.spawn("enemy_large")
            self.spawn_count_large -= 1

        if not self.started:
            self.started = True

        self.spawn_time = self.spawn_gap

    def spawn(self, enemy_type):
        """
        产生敌人

        Args:
            enemy_type (str): 敌人的profab名称
        """
        enemy = Enemy(self.game, enemy_type, 0, 0)
        self.enemies.add(enemy)

    def enemy_killed(self):
        """ 当敌人死亡时调用 """
        if len(self.enemies) == 0 and self.spawn_count_small <= 0 and self.spawn_count_medium <= 0:
            self.done = True
