# -*- coding:utf-8 -*-
import LS_Network
import socket
import json
import copy
import time
import threading

Method_Route_Msg = '0'
Method_Data_Pack = '1'
Method_Request_Route = '2'
Method_Topo_Msg = '3'
Method_Exit_Msg = '4'


class Router:
    def __init__(self, send_port, recv_port, link_table):
        self.routingTable = {}
        self.link_table = link_table
        self.send_port = send_port
        self.recv_port = recv_port
        self.network_obj = LS_Network.Network(send_port, recv_port)

    # 转发数据包
    def routing(self):
        self.network_obj.LS_start_listen_pkg()


class CenterServer():
    def __init__(self, send_port, recv_port):
        '''
        global_topo: 字典结构，全局拓扑图，key=路由器IP，value=列表结构，元素为列表结构[链路距离, 邻接路由IP]

        global_routing_table: 字典结构，全局路由表（每个路由器的路由表）
        其中：key=路由器IP，value=列表结构, 元素为路由表项，列表结构[key=目的IP，value=下一跳路由IP]
        '''
        self.send_port = send_port
        self.recv_port = recv_port
        self.network_obj = LS_Network.Network(send_port, recv_port)
        self.global_topo = {}
        self.global_routing_table = {}
        self.listen_router_link_table()
        time.sleep(10)
        while self.network_obj.thread_number != 0:
            time.sleep(5)
        self.test_router()
        self.LS()
        self.send_routing_table()
        for key, value in self.global_routing_table.items():
            print(key, '路由：', value)

    def Dijkstra(self, source_ip, dest_ip):
        length = {}
        set = []
        pathto = {source_ip: None}
        for key in self.global_topo.keys():
            length[key] = 9999
        length[0] = 9999
        length[source_ip] = 0
        while dest_ip not in set:
            min = 0
            for key in self.global_topo.keys():
                if key not in set and length[key] < length[min]:
                    min = key
            set.append(min)
            for edge in self.global_topo[min]:
                v = edge[1]
                if v not in set:
                    lenn = edge[0]
                    newlen = lenn + length[min]
                    if newlen < length[v]:
                        length[v] = newlen
                        pathto[v] = min
        e = pathto[dest_ip]
        stack = []
        while e != None:
            stack.append(e)
            e = pathto[e]
        for i in range(0, len(stack)):
            if i == 0:
                if [dest_ip, dest_ip] not in self.global_routing_table[stack[i]]:
                    self.global_routing_table[stack[i]].append([dest_ip, dest_ip])
            else:
                if [dest_ip, stack[i - 1]] not in self.global_routing_table[stack[i]]:
                    self.global_routing_table[stack[i]].append([dest_ip, stack[i - 1]])

    # 根据全局拓扑图global_topo生成全局路由表
    def LS(self):
        for ip in self.global_topo.keys():
            self.global_routing_table[ip] = []
        for source_ip in self.global_topo.keys():
            for dest_ip in self.global_topo.keys():
                if source_ip != dest_ip:
                    self.Dijkstra(source_ip, dest_ip)

    def __msg_handler(self, msg):
        if msg[0] == Method_Topo_Msg:
            self.create_global_topo(msg)
        elif msg[0] == Method_Exit_Msg:
            del self.global_topo[msg[1]]
            del self.global_routing_table[msg[1]]
            print(msg[1], 'offline')
            self.test_router()
            self.LS()
            self.send_routing_table()
            for key, value in self.global_routing_table.items():
                print(key, '路由：', value)

    # 生成全局拓扑图global_topo
    def create_global_topo(self, msg):
        print(msg[1], 'online')
        self.global_topo[msg[1]] = msg[7]

    # 接收各个路由器的link_table
    def listen_router_link_table(self):
        self.network_obj.LS_start_listen(self.__msg_handler)

    # 将生成的全局路由表发往各个路由器
    def send_routing_table(self):
        for router_ip in self.global_routing_table.keys():
            data = json.dumps(self.global_routing_table[router_ip])
            self.network_obj.seng_data(router_ip, self.recv_port, 0, 0, data)

    # 检测路由器是否在线
    def test_router(self):
        routers = []
        for key in self.global_topo.keys():
            routers.append(key)
        for key in self.global_topo.keys():
            for value in self.global_topo[key]:
                if value[1] not in routers:
                    self.global_topo[key].remove([value[0], value[1]])


class RouterLS(Router):
    '''
    routingTable: 路由表为字典结构，key=目的路由IP，value=下一条路由IP
    '''

    def __init__(self, send_port, recv_port, center_server_ip, link_table):
        Router.__init__(self, send_port, recv_port, link_table)
        self.center_server_ip = center_server_ip
        self.send_link_table()
        print('Router online')
        self.recv_routing_table()
        self.routing()
        self.start_client()

    def start_client(self):
        t = threading.Thread(target=self.client())
        t.start()

    def wait(self):
        time.sleep(15)
        while self.network_obj.thread_number != 0:
            time.sleep(5)

    # 实现客户端（封装在RouterLS中的函数）
    def client(self):
        while True:
            self.wait()
            print('可到达的IP有', end=' ')
            for ip in self.routingTable.keys():
                print(ip, end='  ')
            print('\nsend指令格式为: send-(内容)-(目的IP)')
            while True:
                if len(self.network_obj.pkg_body) != 0:
                    pkg = self.network_obj.pkg_body
                    print('收到来自' + pkg[0] + '的信息:', pkg[1])
                    del self.network_obj.pkg_body[0]
                    del self.network_obj.pkg_body[0]
                if self.network_obj.thread_number != 0:
                    break
                user_input = input('请输入指令: ')
                if not user_input:
                    print(' ')
                    continue
                if user_input.lower() == 'exit':
                    self.router_exit()
                    return
                else:
                    Input = user_input.split('-')
                    if Input[0].lower() == 'send':
                        if len(Input) != 3:
                            print('错误指令:', user_input)
                        else:
                            data = Input[1]
                            dest_ip = Input[2]
                            if dest_ip in self.routingTable.keys():
                                self.network_obj.send_pkg(self.network_obj.source_ip, self.routingTable[dest_ip],
                                                          self.network_obj.pkg_recv_port, 1, 0, dest_ip, data)
                            else:
                                print('错误的目的IP地址:', dest_ip)
                    else:
                        print('错误指令:', user_input)

    def __msg_handler(self, msg):
        if msg[0] == Method_Route_Msg:
            tmp = []
            for key in self.routingTable.keys():
                tmp.append(key)
            for item in tmp:
                del self.routingTable[item]
            if msg[6] != '0':
                self.create_routing_table(msg)
            self.network_obj.router_table = self.routingTable
            print('\n路由表发生改变')
            if len(msg[6]) != 0:
                for key, value in self.routingTable.items():
                    print('目的IP:', key, '下一跳IP:', value)
            else:
                print('全局只有这一台路由器')

    # 生成路由表
    def create_routing_table(self, msg):
        for item in msg[7]:
            self.routingTable[item[0]] = item[1]

    # 接收来自CenterServer的路由表
    def recv_routing_table(self):
        self.network_obj.LS_start_listen(self.__msg_handler)

    # 向CenterServer发送link_table
    def send_link_table(self):
        data = []
        for key in self.link_table.keys():
            data.append([self.link_table[key][1], key])
        data = json.dumps(data)
        self.network_obj.seng_data(self.center_server_ip, self.recv_port, 3, 0, data)

    # 路由器离线
    def router_exit(self):
        self.network_obj.seng_data(self.center_server_ip, self.recv_port, 4, 0, '')
        print('Router offline')
