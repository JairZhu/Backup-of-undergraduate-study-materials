import math
import random
import pygame
from core.prefab import Prefab


class Bullet(Prefab):
    """ 子弹类 """

    def __init__(self, game, origin, target):
        """
        Args:
            game (Game): game实例
            origin (int, int): 初始子弹位置
            target (int, int): 目标位置
            damage (int): 对命中目标造成的伤害
        """
        super().__init__("attack_bullet", origin[0], origin[1])
        self.game = game

        dx = target[0] - origin[0]
        dy = target[1] - origin[1]

        magnitude = math.sqrt(dx ** 2 + dy ** 2)
        self.xSpeed = (dx / magnitude) * self.speed * random.randint(200, 500)
        self.ySpeed = (dy / magnitude) * self.speed * random.randint(200, 500)
        self.life = magnitude / math.sqrt(self.xSpeed ** 2 + self.ySpeed ** 2)
        self.current_life = 0

        angle = math.degrees(math.atan2(-dy, dx))
        self.image = pygame.transform.rotate(self.image, angle)
        self.rect = self.image.get_rect()
        self.rect.center = origin

    def update(self, delta):
        """ 
        每帧移动一次子弹
        
        Args:
            delta (float): 距上次更新的时间（秒）
        """
        self.rect.x += self.xSpeed * delta
        self.rect.y += self.ySpeed * delta

        # 一颗子弹出现的时间
        self.current_life += delta
        if self.life < self.current_life:
            self.kill()

        # 与场景的碰撞
        if self.current_life > 0.03 and self.game.level.collision.point_blocked(self.rect.centerx, self.rect.centery):
            self.kill()

        # 与敌人的碰撞
        for enemy in self.game.wave.enemies:
            dx = enemy.rect.centerx - self.rect.centerx
            dy = enemy.rect.centery - self.rect.centery
            sqrMagnitude = (dx ** 2) + (dy ** 2)

            if sqrMagnitude < (enemy.rect.width / 2) ** 2:
                enemy.take_damage(self.damage)
                self.kill()
                return
