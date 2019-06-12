import pygame
import math
from pygame import Rect
from core.prefab import Prefab
from core.bullet import Bullet
from core.explosion import Explosion


class Defence(Prefab):
    """ 用户放置的炮塔的基类 """

    def __init__(self, game, name, x, y):
        """
        Args:
            game (Game): game实例
            name (str): 炮塔类型的名称
            x (int): x坐标
            y (int): y坐标
        """
        super().__init__(name, x, y)

        self.game = game
        self.fire_time = 0
        self.target = None

        if hasattr(self, "images"):
            self.image = self.images[0]
            self.rect = self.image.get_rect()
            self.rect.x = x
            self.rect.y = y

        if hasattr(self, "block"):
            self.game.level.collision.block_rect(x, y, self.rect.width, self.rect.height)

    def update(self, delta):
        """
        每帧调用一次，更新目标并启动攻击

        Args:
            delta (float): 距上次更新的时间（秒）
        """
        # 防御墙不能攻击
        if self.attack == "none":
            return

        target = self.get_target()

        self.fire_time += delta
        while self.fire_time >= self.attack_rate:
            self.fire_time -= self.attack_rate

            if target is not None and target != self.rect.center:  # 当位置相同时，防止除以0

                # 攻击
                if self.attack == "bullet":
                    self.game.bullets.add(Bullet(self.game, self.rect.center, target))
                elif self.attack == "explosion":
                    self.game.explosions.add(Explosion(self.game, target, self.explosion_radius, self.explosion_damage))

                # 产生闪光效果
                if hasattr(self, "flash_offset"):
                    self.game.explosions.add(DefenceFlash(self.rect.center, target, self.flash_offset))

                # 用于一次性防御，例如地雷
                if self.attack_rate <= 0:
                    self.kill()

            if self.attack_rate <= 0:
                break

        # 转动炮塔以跟踪目标
        if self.rotate:
            center = self.rect.center

            if self.target is None:
                self.image = self.images[0]
            else:
                dx = self.target.rect.center[0] - center[0]
                dy = self.target.rect.center[1] - center[1]
                angle = math.degrees(math.atan2(-dy, dx))
                if angle < 0:
                    angle += 360

                self.image = self.images[int(angle // 5)]

            self.rect = self.image.get_rect()
            self.rect.center = center

    def get_target(self):
        """
        找到合适的目标

        Returns:
            (int, int) 若找到则返回目标坐标，反之则返回None
        """
        if self.target is not None and self.is_target_suitable(self.target):
            return self.target.rect.center

        for t in self.game.wave.enemies:
            if self.is_target_suitable(t):
                self.target = t
                return t.rect.center

        return None

    def is_target_suitable(self, target):
        """
        判断是否可以射击目标

        Args:
            target (Enemy): 目标实例

        Returns 
            若目标可被击中则为True，反之为False
        """
        if target not in self.game.wave.enemies:
            return False

        a = target.rect.center
        b = self.rect.center
        sqrdist = (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2

        return sqrdist <= self.attack_range ** 2


class DefenceFlash(Prefab):
    """ 炮塔攻击时显示的闪光效果 """

    def __init__(self, defence_position, target, offset):
        """
        Args:
            defence_position (int, int): 炮塔的中心坐标
            target (int, int): 目标的中心坐标
            offset (float): 从炮塔中心到闪光的距离
        """
        dx = target[0] - defence_position[0]
        dy = target[1] - defence_position[1]
        magnitude = math.sqrt(dx * dx + dy * dy)
        dx *= (offset / magnitude)
        dy *= (offset / magnitude)

        super().__init__("defence_flash", defence_position[0] + dx - 16, defence_position[1] + dy - 16)

    def update(self, delta):
        """
        每一帧被调用，更新图像

        Args:
            delta (float): 距上次更新的时间
        """
        super().update_animation(delta)
