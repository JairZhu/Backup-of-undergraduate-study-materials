from pygame.sprite import Sprite
from core.prefab import Prefab
import pygame
import math
import random


class Enemy(Prefab):
    """ 游戏中生成的敌人 """

    def __init__(self, game, name, x, y):
        """
        Args:
            game (Game): game实例
            name (str): 敌人类型的名称
            x (int): 起始x坐标
            y (int): 起始y坐标
        """
        super().__init__(name, x, y)

        self.game = game
        self.path = game.level.pathfinding.get_path()
        self.target = self.path.start
        self.rect.topleft = self.target
        self.x = self.target[0]
        self.y = self.target[1]
        self.speed += random.randint(-25, 25)

        # 敌人每一轮都将增强
        self.speed += random.randint(0, self.game.wave.number * 2)
        self.health = self.health ** (1 + (self.game.wave.number / 35))

    def update(self, delta):
        """ 
        每帧都被调用
        
        Args:
            delta (float): 距上次更新的时间
        """
        self.update_position(delta)

    def update_position(self, delta):
        """
        朝当前目标移动

        Args:
            delta (float): 距上次更新的时间
        """
        current = self.rect.topleft
        target = self.target

        dx = target[0] - current[0]
        dy = target[1] - current[1]
        distance = math.sqrt(dx ** 2 + dy ** 2)
        max = delta * self.speed

        # 捕捉到目标
        if distance < max:
            self.x = target[0]
            self.y = target[1]
            self.reached_target()
        else:
            proportion = max / distance
            self.x += dx * proportion
            self.y += dy * proportion

        self.rect.x = self.x
        self.rect.y = self.y

    def reached_target(self):
        """
        当敌人到达当前目标时调用，改变目标或是攻击敌人
        """
        if not self.path.done:

            # 检查路径是否失效
            if self.target[0] < self.game.window.resolution[
                0] and self.path.points is not None and self.target in self.path.points:
                self.path, self.target = self.game.level.pathfinding.get_partial_path(self.target)

            return

        self.target = self.path.next(self.target)
        if not self.target:
            self.game.level.lives -= 1
            if (self.game.level.lives == 0):
                self.game.menu.show_lose_screen()

            self.kill()

    def take_damage(self, damage):
        """ 
        受到伤害，若敌人的生命值低于0，它们将死亡
        
        Args:
            damage (int): 扣除的生命值
        """
        self.health -= damage

        if self.health <= 0:
            self.kill()

    def kill(self):
        """ 当敌人死亡或逃跑时调用 """
        super().kill()

        self.game.wave.enemy_killed()

        # 敌人在地图上死亡并没有逃跑则为真
        if self.rect.x > 1:
            self.game.level.money += self.money
