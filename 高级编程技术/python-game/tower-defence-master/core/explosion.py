import math
import random
import pygame
from core.prefab import Prefab


class Explosion(Prefab):
    """ 爆炸类，包含动画 """

    def  __init__(self, game, position, radius, damage):
       """
       Args:
            game (Game): game实例
            position (int, int): 爆炸位置的坐标
            radius (float): 爆炸的伤害半径
            damage (float): 爆炸中心的伤害
       """
       super().__init__("attack_explosion", position[0], position[1])
       self.rect.center = position

       max_magnitude = radius ** 2

       for enemy in game.wave.enemies:
            dx = enemy.rect.centerx - self.rect.centerx
            dy = enemy.rect.centery - self.rect.centery
            magnitude = (dx ** 2) + (dy ** 2)

            if magnitude < max_magnitude:
                enemy.take_damage(damage * (1 - (magnitude / max_magnitude)))

    def update(self, delta):
        """
        调用每帧时，爆炸处于活动状态，更新图像

        Args:
            delta (float): 距上次更新的时间
        """
        super().update_animation(delta)
