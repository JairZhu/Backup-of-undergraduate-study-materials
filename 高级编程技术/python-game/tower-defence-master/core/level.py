from core.prefab import Prefab
from core.collision import Collision
from core.wave import Wave
from core.pathfinding import Pathfinding
from pygame.sprite import OrderedUpdates


class Level:
    """ 从.level文件中加载关卡，包含关卡prefab、缓存路径和碰撞数据 """

    def __init__(self, game, name):
        """
        Args:
            game (Game): game实例
            name (str): 关卡名称
        """
        self.game = game
        self.name = name
        self.load_data()
        self.start()

    def load_data(self):
        """ 
        按名称加载关卡
        关卡数据保存在.level文件中，包含prefab类型和相应的位置，这些数据被用于定位关卡组件

        Returns:
            list[list[string]]: 该关卡的数据条目列表
        """
        try:
            with open("levels\\" + self.name + ".level", "r") as file:
                self.data = [line.strip().split(" ") for line in file.readlines() if len(line.strip()) > 0 and line[0] != "#"]

        except IOError:
            print("Error loading level")

    def start(self):
        """ 设置并启动关卡 """
        self.collision = Collision(self, self.game.window.resolution, 32)
        self.prefabs = OrderedUpdates()
        self.pathfinding = Pathfinding(self.game, self.collision)

        for args in self.data:
            name = args[0]
            x = int(args[1])
            y = int(args[2])

            prefab = Prefab(name, x, y)
            self.prefabs.add(prefab)

            if hasattr(prefab, "block"):
                # 块纹理1个像素宽，以生成完整边框
                self.collision.block_rect(x, y, prefab.rect.width - 1, prefab.rect.height - 1)

        self.pathfinding.precompute(30)
        self.wave = Wave(self.game, 1)
        self.lives = 10
        self.money = 600
        self.time = 0

    def get_score(self):
        return int((self.time / 5) ** 1.4 + (self.game.wave.number - 1) ** 3)
