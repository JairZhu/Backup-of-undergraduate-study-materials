class Router:
    def __init__(self, router_id):
        '''
        routingTable: 字典结构，key为目的router_id，value为元组结构(链路长度, 下一跳router_id)
        '''
        self.id = router_id
        self.routingTable = {}

    def build_route_table(self, neighbor_distance_dict, route_table_dict):
        '''
        :param neighbor_distance_dict:字典结构，key为邻居router_id, value为距离
        :param route_table_dict:字典结构，key为邻居router_id, value为字典{key为目的router_id, value为链路长度}
        '''
        neighbor = []
        for key in neighbor_distance_dict:
            neighbor.append(key)

        self.routingTable[neighbor[0]] = (neighbor_distance_dict[neighbor[0]], neighbor[0])
        for key, value in route_table_dict[neighbor[0]].items():
            self.routingTable[key] = (neighbor_distance_dict[neighbor[0]] + value, neighbor[0])

        for i in range(1, len(neighbor)):
            if neighbor_distance_dict[neighbor[i]] < self.routingTable[neighbor[i]][0]:
                self.routingTable[neighbor[i]] = (neighbor_distance_dict[neighbor[i]], neighbor[i])
            for key, value in route_table_dict[neighbor[i]].items():
                if self.routingTable[key][0] > value + neighbor_distance_dict[neighbor[i]]:
                    self.routingTable[key] = (value + neighbor_distance_dict[neighbor[i]], neighbor[i])

#测试
neighbor_distance_dict = {'B': 3, 'C': 1, 'D': 5}
route_table_dict = {'B': {'C': 2, 'D': 3, 'E': 3, 'F': 5},
                    'C': {'B': 2, 'D': 2, 'E': 1, 'F': 3},
                    'D': {'B': 3, 'C': 2, 'E': 1, 'F': 3}
                    }

router = Router('A')
router.build_route_table(neighbor_distance_dict, route_table_dict)
for key, value in router.routingTable.items():
    print(key, ':', value[0], ',', value[1])