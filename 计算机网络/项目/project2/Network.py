# -*- coding:utf-8 -*-

import socket
import threading

max_listen_num = 5
request_len = 57
pkg_head_len = 59


class Network:
    def __init__(self, network_send_port, network_recv_port):
        self.send_port = network_send_port
        self.recv_port = network_recv_port
        self.source_ip = self.get_host_ip()
        self.sock_send = socket.socket()
        self.send_status = 0
        self.target_ip = ''
        self.target_port = 0
        self.sock_recv = socket.socket()
        self.sock_connect = {}
        self.recv_status = 0
        self.thread_number = 0
        self.pkg_body = []
        self.router_table = {}
        self.pkg_recv_port = 22333
        self.sock_pkg_recv = socket.socket()
        self.sock_pkg_connect = {}

    # 获取主机IP
    def get_host_ip(self):
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(('8.8.8.8', 80))
            ip = s.getsockname()[0]
        finally:
            s.close()
        return ip

    def connect(self, target_ip, target_port):
        self.sock_send = socket.socket()
        self.sock_send.connect((target_ip, target_port))
        self.target_ip = target_ip
        self.send_status = 1

    def disconnect(self):
        if not self.send_status:
            raise Exception('Not connected')
        self.send_status = 0

    def start_listen(self, call_back_request_handler):
        if self.recv_status:
            raise Exception('Already listening')
        self.sock_recv.bind((self.source_ip, self.recv_port))
        self.sock_recv.listen(max_listen_num)
        t = threading.Thread(target=self.__thread_accept, args=[call_back_request_handler])
        t.start()
        self.recv_status = 1

    def stop_listen(self):
        if not self.recv_status:
            raise Exception('Not listening')
        self.sock_recv.close()
        self.recv_status = 0

    def request(self, target_ip, target_port, method, keep_alive, data=''):
        self.connect(target_ip, target_port)
        self.send_status = 1
        pkg = self.__pack_request(method, target_ip, target_port, len(data), keep_alive, data)
        self.__send(self.sock_send, pkg)
        respose = b''
        respose += self.recieve(self.sock_send, request_len)
        respose = self.__unpack_request(respose)
        body_len = int(respose[6])
        body_buff = self.recieve(self.sock_send, body_len)
        body_buff = body_buff.decode()
        respose[7] = body_buff
        if not keep_alive:
            self.sock_send.close()
        return respose

    def response(self, target_ip, target_port, method, keep_alive, data=''):
        pkg = self.__pack_request(method, target_ip, target_port, len(data), keep_alive, data)
        self.__send(self.sock_connect[target_ip], pkg)

    def __requestHandler(self, ip, call_back_handler):
        while True:
            data = b''
            data += self.recieve(self.sock_connect[ip], request_len)
            data = data.decode()
            data = data.split('\r\n')
            ret = data
            keep_alive = int(data[5])
            body_len = int(data[6])
            data = b''
            data += self.recieve(self.sock_connect[ip], body_len)
            body = data.decode()
            ret[7] = body
            call_back_handler(ret)
            if not keep_alive:
                self.sock_connect[ip].close()
                del self.sock_connect[ip]
                break

    def __thread_accept(self, call_back_request_handler):
        while True:
            tmp_obj, ipadrs = self.sock_recv.accept()
            self.sock_connect[ipadrs[0]] = tmp_obj
            t = threading.Thread(target=self.__requestHandler, args=[ipadrs[0], call_back_request_handler])
            t.start()

    # 生成数据包
    def __pack_request(self, method, target_ip, target_port, body_len, keep_alive, body):
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
        respose += str(body_len)
        respose += '\r\n'
        print(len(respose))
        respose += body
        respose = respose.encode()
        return respose

    # 解析数据包
    def __unpack_request(self, buffer):
        butter = buffer.decode()
        butter = butter.split('\r\n')
        return butter

    # 生成数据包
    def __pack_respond(self, status_code, target_ip, target_port, body_len, body):
        respose = ''
        respose += str(status_code)
        respose += '\r\n'
        respose += self.source_ip
        respose += '\r\n'
        respose += str(self.send_port)
        respose += '\r\n'
        respose += target_ip
        respose += '\r\n'
        respose += str(target_port)
        respose += '\r\n'
        respose += str(body_len)
        respose += '\r\n'
        respose += body
        respose += '\r\n'
        respose = respose.encode()
        return respose

    # 发送数据
    def __send(self, sock, data):
        sock.send(data)

    # 接收数据包
    def recieve(self, sock, data_size):
        buffer = b''
        while len(buffer) < data_size:
            buffer += sock.recv(data_size + 1)
        return buffer

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

    # 转发数据包
    def LS__pkgHandler(self, ip):
        data = b''
        data += self.LS_recieve(self.sock_pkg_connect[ip], pkg_head_len)
        data = data.decode()
        data = data.split('\r\n')
        source_ip = data[1]
        final_dest_ip = data[3]
        keep_alive = int(data[5])
        body_len = int(data[6])
        data = b''
        data += self.LS_recieve(self.sock_pkg_connect[ip], body_len)
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
            self.sock_pkg_connect[ip].close()
            del self.sock_pkg_connect[ip]

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
            self.sock_pkg_connect[ipadrs[0]] = tmp_obj
            t = threading.Thread(target=self.LS__pkgHandler, args=[ipadrs[0]])
            t.start()
