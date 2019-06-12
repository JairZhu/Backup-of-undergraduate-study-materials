# -*- coding:utf-8 -*-

import socket
import threading
import json

max_listen_num = 5
LS_head_len = 59


class Network:
    def __init__(self, network_send_port, network_recv_port):
        self.send_port = network_send_port
        self.recv_port = network_recv_port
        self.pkg_recv_port = 22333
        self.source_ip = self.get_host_ip()
        self.sock_send = socket.socket()
        self.target_port = 0
        self.sock_recv = socket.socket()
        self.sock_pkg_recv = socket.socket()
        self.sock_connect = {}
        self.thread_number = 0
        self.pkg_body = []
        self.router_table = {}

    # 获取主机IP
    def get_host_ip(self):
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(('8.8.8.8', 80))
            ip = s.getsockname()[0]
        finally:
            s.close()
        return ip

    # 创建连接
    def connect(self, target_ip, target_port):
        self.sock_send = socket.socket()
        self.sock_send.connect((target_ip, target_port))

    # 发送数据
    def __send(self, sock, data):
        sock.send(data)

    # 监听来自中心服务器的连接
    def LS_start_listen(self, call_back_request_handler):
        self.sock_recv.bind((self.source_ip, self.recv_port))
        self.sock_recv.listen(max_listen_num)
        t = threading.Thread(target=self.LS__thread_accept, args=[call_back_request_handler])
        t.start()

    # 发送数据包
    def seng_data(self, target_ip, target_port, method, keep_alive, data=''):
        self.connect(target_ip, target_port)
        pkg = self.LS__pack_request(method, target_ip, target_port, len(data), keep_alive, data)
        self.__send(self.sock_send, pkg)
        if not keep_alive:
            self.sock_send.close()

    # 每当有中心服务器连接过来后就建立新的线程
    def LS__thread_accept(self, call_back_request_handler):
        while True:
            tmp_obj, ipadrs = self.sock_recv.accept()
            self.sock_connect[ipadrs[0]] = tmp_obj
            t = threading.Thread(target=self.LS__requestHandler, args=[ipadrs[0], call_back_request_handler])
            t.start()
            self.thread_number += 1

    # 处理来自中心服务器的数据包
    def LS__requestHandler(self, ip, call_back_handler):
        data = b''
        data += self.LS_recieve(self.sock_connect[ip], LS_head_len)
        data = data.decode()
        data = data.split('\r\n')
        ret = data
        keep_alive = int(data[5])
        body_len = int(data[6])
        if body_len != 0:
            data = b''
            data += self.LS_recieve(self.sock_connect[ip], body_len)
            body = json.loads(data.decode())
            ret[7] = body
        call_back_handler(ret)
        if not keep_alive:
            self.sock_connect[ip].close()
            del self.sock_connect[ip]
        self.thread_number -= 1

    # 生成数据包
    def LS__pack_request(self, method, target_ip, target_port, body_len, keep_alive, body):
        respose = ''
        respose += str(method)
        respose += '\r\n'
        respose += self.source_ip
        respose += '\r\n'
        respose += str(self.send_port)
        respose += '\r\n'
        respose += target_ip
        respose += '\r\n'
        respose += str(target_port)
        respose += '\r\n'
        respose += str(keep_alive)
        respose += '\r\n'
        if 9 < body_len < 100:
            respose += str(0)
        elif body_len < 10:
            respose += str(0)
            respose += str(0)
        respose += str(body_len)
        respose += '\r\n'
        respose += body
        respose = respose.encode()
        return respose

    # 接收数据包
    def LS_recieve(self, sock, data_size):
        buffer = b''
        while len(buffer) < data_size:
            buffer += sock.recv(data_size)
        return buffer

    # 发送分组
    def send_pkg(self, source_ip, next_jmp, pkg_recv_port, method, keep_alive, finial_dest_ip, data=''):
        self.connect(next_jmp, pkg_recv_port)
        pkg = self.LS__pack_request(1, finial_dest_ip, self.pkg_recv_port, len(data), 0, data)
        self.__send(self.sock_send, pkg)
        if not keep_alive:
            self.sock_send.close()

    # 监听来自其他路由器的分组
    def LS_start_listen_pkg(self):
        self.sock_pkg_recv.bind((self.source_ip, self.pkg_recv_port))
        self.sock_pkg_recv.listen(max_listen_num)
        t = threading.Thread(target=self.LS__thread_accept_pkg)
        t.start()

    # 每当有分组传来时建立新的线程处理
    def LS__thread_accept_pkg(self):
        while True:
            tmp_obj, ipadrs = self.sock_pkg_recv.accept()
            self.sock_connect[ipadrs[0]] = tmp_obj
            t = threading.Thread(target=self.LS__pkgHandler, args=[ipadrs[0]])
            t.start()

    # 转发数据包
    def LS__pkgHandler(self, ip):
        data = b''
        data += self.LS_recieve(self.sock_connect[ip], LS_head_len)
        data = data.decode()
        data = data.split('\r\n')
        source_ip = data[1]
        final_dest_ip = data[3]
        keep_alive = int(data[5])
        body_len = int(data[6])
        data = b''
        data += self.LS_recieve(self.sock_connect[ip], body_len)
        body = data.decode()
        if final_dest_ip == self.source_ip:
            self.pkg_body.append(source_ip)
            self.pkg_body.append(body)
            print('\n来自' + source_ip + '的分组将发往客户端')
        else:
            next_jmp = self.router_table[final_dest_ip]
            self.send_pkg(source_ip, next_jmp, self.pkg_recv_port, 1, 0, final_dest_ip, body)
            print('\n转发来自' + source_ip + '的分组，将发往目的地' + final_dest_ip + '，下一跳IP为' + next_jmp)
        if not keep_alive:
            self.sock_connect[ip].close()
            del self.sock_connect[ip]
