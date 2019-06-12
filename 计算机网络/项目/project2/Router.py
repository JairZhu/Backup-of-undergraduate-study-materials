# -*- coding:utf-8 -*-
import Network
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
    def __init__(self, send_port, recv_port, link_table, router_routing_table=None):
        self.routingTable = {}
        self.link_table = link_table
        self.send_port = send_port
        self.recv_port = recv_port
        self.network_obj = Network.Network(send_port, recv_port)

    # TODO:转发数据包，需添加至RouterDV初始化中，执行这个函数后，将创建一个新的线程监听数据包并转发
    def routing(self, pkg):
        self.network_obj.LS_start_listen_pkg()


class RouterDV(Router):
    def __init__(self, send_port, recv_port, link_table, router_routing_table=None):
        Router.__init__(self, send_port, recv_port, link_table, router_routing_table)
        self.network_obj.start_listen(self.__msg_handler)
        for rt in self.link_table.keys():
            if link_table[rt][0]:
                try:
                    tmp_list = self.network_obj.request(rt, self.recv_port, 2, 0)
                    self.routingTable[rt] = [link_table[rt][1], rt]
                    self.recv_routing_msg(tmp_list)
                except socket.error:
                    link_table[rt][0] = 0
                    continue

    # 发送本路由的路由信息
    def send_routing_msg(self, type, request_ip=''):
        print("Sending routing messages...")
        if type:
            # 逆转毒性处理
            de_possion = copy.deepcopy(self.routingTable)
            for key, itm in de_possion.items():
                if itm[1] == request_ip and key != itm[1]:
                    itm[0] = 9999
            self.network_obj.response(request_ip, self.send_port, 0, 0, json.dumps(de_possion))
            # 发送本机路由表
            print('Sending to ' + request_ip + '...')
            return
        for rt in self.link_table.keys():
            if self.link_table[rt][0]:
                # 逆转毒性处理
                de_possion = copy.deepcopy(self.routingTable)
                for key, itm in de_possion.items():
                    if itm[1] == rt and key != itm[1]:
                        itm[0] = 9999
                # 发送本机路由表
                print('Sending to ' + rt + '...')
                self.network_obj.request(rt, self.recv_port, 0, 0, json.dumps(de_possion))

    def __msg_handler(self, msg):
        if msg[0] == Method_Route_Msg:
            self.network_obj.response(msg[1], self.send_port, 5, 0)
            self.recv_routing_msg(msg)
        elif msg[0] == Method_Request_Route:
            flag = 0
            if msg[1] in self.routingTable.keys() and self.link_table[msg[1]][1] <= self.routingTable[msg[1]][0]:
                flag = 1
                self.routingTable[msg[1]] = [self.link_table[msg[1]][1], msg[1]]
            elif msg[1] not in self.routingTable.keys():
                flag = 1
                self.routingTable[msg[1]] = [self.link_table[msg[1]][1], msg[1]]
            if flag:
                self.send_routing_msg(0)
            self.link_table[msg[1]][0] = 1
            self.send_routing_msg(1, msg[1])
        return

    # 接受其它路由的路由信息
    def recv_routing_msg(self, msg):
        dist = self.link_table[msg[1]][1]
        neibor_dict = json.loads(msg[7])
        print('Recieving routing messages from ' + msg[1] + ' ...')
        flag = 0
        for key in neibor_dict.keys():
            if key == self.network_obj.source_ip:
                continue
            elif key not in self.routingTable.keys():
                flag = 1
                self.routingTable[key] = [dist + neibor_dict[key][0], msg[1]]
            elif dist + neibor_dict[key][0] < self.routingTable[key][0]:
                flag = 1
                self.routingTable[key][0] = dist + neibor_dict[key][0]
        # 向其他路由发送更新后的路由表
        if flag:
            self.send_routing_msg(0)
        return

    # TODO: 路由器退出，可能需要编写，在client方法中可能需要修改
    def router_exit(self):
        pass

    #TODO: 客户端作为一个线程在RouterDV中执行，需要加入RouterDV的初始化中
    def start_client(self):
        t = threading.Thread(target=self.client())
        t.start()

    #TODO: wait方法用于等待路由表是否稳定，通过路由器"接受路由表"的线程数来判断，所以在"接受路由表"和"广播路由表"的线程中需要加入"修改Thread_number"这一指令
    def wait(self):
        time.sleep(15)
        while self.network_obj.thread_number != 0:
            time.sleep(5)

    # 实现客户端（封装在RouterDV中的函数）
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
