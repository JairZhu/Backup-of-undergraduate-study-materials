import pygame
from core.game import Game
from core.window import Window


# 初始化pygame
pygame.init()

# 创建一个窗口
window = Window(1280, 768)
window.set_title("Tower Defence")
window.set_background(148, 168, 176)

# 创建一个Game实例
game = Game(window)
game.run()

# 退出pygame
pygame.quit()