from pygame.sprite import Sprite
from pygame.rect import Rect
import pygame


class Prefab(Sprite):
    """ 
    prefab对象

    每个prefab对象都有一个.prefab文件，其中包含加载到新prefab实例中的变量
    """

    # 缓存配置文件 { name: config }
    Cache = {}

    def __init__(self, name, x, y):
        """
        Args:
            name (str): 配置文件名
            x (int): 左上角x坐标
            y (int): 左上角y坐标
        """
        super().__init__()

        self.name = name
        self.config = self.load_config(name)
        self.apply_config(self.config)

        # 处理动画
        if hasattr(self, "anim_source"):
            self.anim_change_time = self.anim_rate
            self.anim_index = 0
            self.image = self.anim_source[0]

        # 处理sprite图像
        if hasattr(self, "image"):
            self.rect = self.image.get_rect()
            self.rect.x = x
            self.rect.y = y
        else:
            self.rect = Rect(x, y, 32, 32)

    def update_animation(self, delta):
        """
        更新prefab上的所有sprite图表动画

        Args:
            delta (float): 从上一帧开始的时间
        """
        if hasattr(self, "anim_source"):
            self.anim_change_time -= delta

            if self.anim_change_time < 0:
                self.anim_change_time += self.anim_rate

                self.anim_index += 1
                if self.anim_index == len(self.anim_source):
                    self.anim_index = 0

                    if not hasattr(self, "anim_loop") or not self.anim_loop:
                        self.kill()

                self.image = self.anim_source[self.anim_index]

    def load_config(self, name):
        """ 
        获取指定prefab的配置字典

        Args:
            name (str): 要加载的.prefab文件的名称

        Returns:
            entries (dict): 配置变量的字典
        """
        # 先尝试已缓存的版本
        if name in Prefab.Cache.keys():
            return Prefab.Cache[name]

        entries = {}

        try:
            with open("prefabs\\" + name + ".prefab", "r") as file:
                for line in [f.split(":") for f in file.readlines() if f[0] != "#" and len(f.strip()) != 0]:
                    key = line[0].strip()
                    type = line[1].strip()
                    value = line[2].strip()

                    if type == "str":
                        entries[key] = value
                    elif type == "int":
                        entries[key] = int(value)
                    elif type == "float":
                        entries[key] = float(value)
                    elif type == "bool":
                        entries[key] = (value == "1")
                    elif type == "img":
                        entries[key] = pygame.image.load(value).convert()
                    elif type == "aimg":
                        entries[key] = pygame.image.load(value).convert_alpha()
                    elif type == "font":
                        entries[key] = pygame.font.Font(pygame.font.match_font(value, "font_bold" in entries.keys()),
                                                        entries["font_size"])
                    elif type == "spritesheet":
                        entries[key] = [pygame.image.load(value + str(i) + ".png").convert_alpha() for i in
                                        range(entries["anim_count"])]
                    elif type == "rotimg":
                        original = pygame.image.load(value).convert_alpha()
                        entries[key] = [original] + [pygame.transform.rotate(original, angle) for angle in
                                                     range(5, 361, 5)]

        except OSError:
            print("Could not read prefab " + name)

        Prefab.Cache[name] = entries
        return entries

    def apply_config(self, config):
        """ 
        将所有的配置设置应用于prefab实例

        Args:
            config (dict): 将要应用的变量值列表
        """
        for name in config.keys():
            setattr(self, name, config[name])
