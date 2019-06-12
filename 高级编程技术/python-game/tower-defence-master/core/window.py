import pygame


class Window:
    """ pygame窗口的封装类 """

    def __init__(self, width, height):
        """
        Args:
            width (int): 窗口的宽度（像素）
            height (int): 窗口的高度（像素）
        """
        self.resolution = (width, height)
        self.screen = pygame.display.set_mode(self.resolution)
        self.set_background(0, 0, 0)

    def set_title(self, title):
        """ 
        设置窗口标题
        
        Args:
            title (str): 新窗口名称
        """
        pygame.display.set_caption(title)

    def set_background(self, r, g, b):
        """ 
        设置背景色

        Args:
            r (float): r值
            g (float): g值
            b (float): b值
        """
        self.background = pygame.Surface(self.resolution)
        self.background.fill(pygame.Color(r, g, b))
        self.background = self.background.convert()

    def clear(self):
        """ 使用背景色清除窗口 """
        pygame.display.flip()
        self.screen.blit(self.background, (0, 0))
