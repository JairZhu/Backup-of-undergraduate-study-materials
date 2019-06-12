from core.prefab import Prefab
from pygame.sprite import OrderedUpdates
import pygame
import math


class Menu(Prefab):
    """ 控制菜单系统 """

    def __init__(self, game):
        """
        Args:
            game (Game): game实例
        """
        super().__init__("menu", 0, 0)

        self.game = game
        self.components = OrderedUpdates()
        self.clear()
        self.show_main_screen()
        self.visible = True

    def show(self):
        """ 显示菜单 """
        self.visible = True
        self.show_main_screen()

    def hide(self):
        """ 隐藏菜单并启用游戏图标 """
        self.visible = False
        self.clear()

        self.defence_buttons = [
            MenuButton(self, "menu_defence_button", self.game.defence_prototypes[i].display_name, (i + 1) * 64, 0,
                       lambda: self.game.select_defence((pygame.mouse.get_pos()[0] - 64) // 64)) for i in
            range(len(self.game.defence_prototypes))]
        self.components.add(self.defence_buttons)

        self.wave_label = MenuLabel(self, "menu_pause_button", "Wave", 448, 0)
        self.lives_label = MenuLabel(self, "menu_pause_button", "Lives", 576, 0)
        self.money_label = MenuLabel(self, "menu_pause_button", "Money", 704, 0)
        self.score_label = MenuLabel(self, "menu_pause_button", "Score", 832, 0)
        self.components.add(self.wave_label)
        self.components.add(self.lives_label)
        self.components.add(self.money_label)
        self.components.add(self.score_label)

        self.components.add(MenuButton(self, "menu_pause_button", "Menu", 1088, 0, self.show))

        self.update()

    def clear(self):
        """ 从菜单中删除所有组件 """
        self.components.remove(self.components)
        self.component_next = self.top

    def update(self):
        """ 每帧被调用 """
        if not self.visible:
            self.wave_label.set_text("Wave: " + str(self.game.wave.number))
            self.lives_label.set_text("Lives: " + str(self.game.level.lives))
            self.lives_label.highlighted = (self.game.level.lives < 5)
            self.money_label.set_text("Money: " + str(self.game.level.money))
            self.score_label.set_text("Score: " + str(self.game.level.get_score()))

            for i in range(len(self.defence_buttons)):
                self.defence_buttons[i].disabled = (self.game.defence_prototypes[i].cost > self.game.level.money)
                self.defence_buttons[i].selected = (self.game.defence_type == i)

        self.components.update()

    def clicked(self):
        """ 当按下鼠标按钮时调用 """
        for component in self.components:
            if isinstance(component, MenuButton):
                component.clicked()

    def draw(self, screen):
        """
        绘制菜单及其组件

        Args:
            screen (Surface): 表面上的斑点
        """
        if self.visible:
            screen.blit(self.image, (0, 0))

        self.components.draw(screen)

    def add_button(self, text, callback):
        """
        在菜单屏幕上添加一个标准按钮

        Args:
            text (str): 在按钮上显示的文字
            callback (callable): 点击按钮时的回调函数

        Returns:
            (MenuButton): 按钮
        """
        button = MenuButton(self, "menu_button", text, 0, self.component_next, callback)
        button.rect.x = (self.rect.width - button.rect.width) / 2

        self.components.add(button)
        self.component_next += button.rect.height
        self.component_next += button.padding

        return button

    def add_level_button(self, level):
        """
        在菜单屏幕添加更改关卡按钮

        Args:
            level (str): 在按钮上显示的关卡名称
        """
        button = MenuButton(self, "menu_level_" + level, level, 0, self.component_next,
                            lambda: self.game.load_level(level))
        button.rect.x = (self.rect.width - button.rect.width) / 2

        self.components.add(button)
        self.component_next += button.rect.height
        self.component_next += button.padding

    def show_main_screen(self):
        """ 显示主菜单屏幕 """
        self.clear()

        if self.game.level.time > 0:
            self.add_button("Continue", self.hide)
            self.add_button("Restart Game", lambda: self.game.load_level(self.game.level.name))
        else:
            self.add_button("Start Game", self.hide)

        self.add_button("Change Level", self.show_change_level_screen)
        self.add_button("Quit Game", self.game.quit)

    def show_change_level_screen(self):
        """ 显示change level """
        self.clear()
        self.add_button("Back", self.show_main_screen)

        if self.game.level.name != "basic":
            self.add_level_button("basic")

        if self.game.level.name != "path":
            self.add_level_button("path")

        if self.game.level.name != "maze":
            self.add_level_button("maze")

    def show_lose_screen(self):
        """ 显示game over """
        self.show()
        self.clear()
        self.add_button("Game Over", None)
        self.add_button("You Reached Wave " + str(self.game.wave.number), None)
        self.add_button(str(self.game.level.get_score()) + " Points", None)
        self.add_button("Restart Game", lambda: self.game.load_level(self.game.level.name))


class MenuLabel(Prefab):
    """ 菜单系统显示的标签，包含背景 """

    def __init__(self, menu, type, text, x, y):
        """
        Args:
            menu (Menu): menu实例
            type (str): prefab名称，用于字体和背景
            text (str): 在按钮上显示的文字
            x (int): x坐标
            y (int): y坐标
        """
        super().__init__(type, x, y)

        self.text = text
        self.image_template = None
        self.highlighted = False
        self.selected = False
        self.disabled = False
        if text == "Game Over":
            self.set_image(self.image_over)
        else:
            self.set_image(self.image_s)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y

    def update(self):
        """ 每帧调用，查找鼠标点击 """
        if self.text == "Game Over":
            self.set_image(self.image_over)
        elif self.disabled:
            self.set_image(self.image_d)
        elif self.highlighted or self.selected:
            self.set_image(self.image_h)
        else:
            self.set_image(self.image_s)

    def set_text(self, text):
        """
        设置标签上的文本

        Args:
            text (str): 要显示的新文本
        """
        if self.text != text:
            self.text = text

            img = self.image_template
            self.image_template = None
            self.set_image(img)

    def set_image(self, image):
        """
        设置背景图像
        
        Args:
            image (Surface): 要使用的图像
        """
        if self.image_template == image:
            return

        self.image_template = image

        if self.text == "Game Over":
            self.image = image.copy()
            return

        if hasattr(self, "font"):
            self.image = image.copy()
            self.render_text(self.image)
        else:
            self.image = image

    def render_text(self, background):
        """
        将按钮的文本渲染到给定的背景表面

        Args:
            background (Surface): 要渲染的表面
        """
        colour = (self.col_r, self.col_g, self.col_b)
        rendered = self.font.render(self.text, True, colour)
        dest = ((background.get_rect().width - rendered.get_rect().width) // 2,
                (background.get_rect().height - rendered.get_rect().height) // 2)
        background.blit(rendered, dest)


class MenuButton(MenuLabel):
    """ 响应被点击的菜单标签 """

    def __init__(self, menu, type, text, x, y, callback):
        """
        Args:
            menu (Menu): menu实例
            type (str): prefab名称，用于字体和背景
            text (str): 在按钮上显示的文字
            x (int): x坐标
            y (int): y坐标
            callback (callable): 按下按钮时触发的回调函数
        """
        super().__init__(menu, type, text, x, y)

        self.callback = callback
        self.last_pressed = True

    def update(self):
        """ 每帧调用，查找鼠标点击 """
        hover = self.rect.collidepoint(pygame.mouse.get_pos())
        self.highlighted = hover and self.callback is not None

        super().update()

    def clicked(self):
        """ 每当鼠标点击时调用 """
        hover = self.rect.collidepoint(pygame.mouse.get_pos())

        if hover and self.callback is not None:
            self.callback()
