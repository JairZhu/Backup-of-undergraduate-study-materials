import pygame
from core.level import Level
from core.defence import Defence
from core.wave import Wave
from core.menu import Menu
from core.music import play_music
import threading


class Game:
    """ 
    包含主控制代码和游戏循环
    """

    def __init__(self, window):
        """
        Args:
            window (Window): 要显示的window实例
        """
        self.window = window
        self.clock = pygame.time.Clock()
        self.defences = pygame.sprite.Group()
        self.bullets = pygame.sprite.Group()
        self.explosions = pygame.sprite.Group()
        self.load_level("path")
        self.defence_type = 0
        self.defence_prototypes = [Defence(self, "defence_" + name, -100, -100) for name in
                                   ["pillbox", "wall", "mines", "artillery"]]

    def load_level(self, name):
        """
        加载一个新的关卡

        Args:
            name (str): 关卡的名称
        """
        self.defences.empty()
        self.bullets.empty()
        self.explosions.empty()
        self.level = Level(self, name)
        self.wave = Wave(self, 1)
        self.menu = Menu(self)

    def run(self):
        """ 运行游戏主循环 """
        self.running = True

        # 播放音乐
        t = threading.Thread(target=play_music)
        t.start()

        while self.running:
            delta = self.clock.tick(60) / 1000.0

            # 等待退出事件
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.quit()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    if not self.menu.visible:
                        self.place_defence(pygame.mouse.get_pos())
                    self.menu.clicked()
                elif event.type == pygame.KEYDOWN:
                    pass

            # 调用更新函数
            self.menu.update()
            self.level.pathfinding.update()

            if not self.menu.visible:
                self.level.time += delta
                self.defences.update(delta)
                self.bullets.update(delta)
                self.explosions.update(delta)

                self.wave.update(delta)
                if self.wave.done:
                    self.wave = Wave(self, self.wave.number + 1)

            # 重新绘制图像
            self.window.clear()
            self.level.prefabs.draw(self.window.screen)
            self.defences.draw(self.window.screen)
            self.bullets.draw(self.window.screen)
            self.wave.enemies.draw(self.window.screen)
            self.explosions.draw(self.window.screen)
            self.menu.draw(self.window.screen)

    def quit(self):
        """ 退出并关闭游戏 """
        self.running = False

    def select_defence(self, type):
        """
        选择放置的防御类型

        Args:
            type (int): 所选防御类型
        """
        self.defence_type = type

    def place_defence(self, position):
        """
        在给定位置放置炮塔

        Args:
            position (int, int): 炮塔的预期坐标
        """
        if self.defence_type < 0 or self.defence_type > 3:
            return

        defence = self.defence_prototypes[self.defence_type]

        if self.level.money < defence.cost:
            return

        x = position[0] - position[0] % 32
        y = position[1] - position[1] % 32

        # 若防御塔与关卡相交则停止
        if self.level.collision.rect_blocked(x, y, defence.rect.width - 2, defence.rect.height - 2):
            return

        # 若防御塔让敌人没有路线逃离则停止
        if hasattr(defence, "block") and self.level.pathfinding.is_critical((x, y)):
            return

        self.defences.add(Defence(self, defence.name, x, y))
        self.level.money -= defence.cost
