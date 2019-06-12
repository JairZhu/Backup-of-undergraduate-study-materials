import struct
import socket
import os
import time
from tqdm import tqdm

list_file = 0
transmission = 1
get = 2
version = 1
head_length = struct.calcsize('bbQ')
files = [b'test.jpg', b'test.mp4']

def makehead(version, service_number, length):
    return struct.pack('bbQ', version, service_number, length)

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('172.18.35.96', 8100))
server.listen(1)

while True:
    print("Waiting for connection...")
    connection, addr = server.accept()
    print("Connect IP:", addr[0], "Port:", addr[1])

    connection.send(makehead(version, list_file, struct.calcsize('bbQ8sQ8sQ')))
    for file in files:
        connection.send(struct.pack('8sQ', file, os.stat(file).st_size))

    headinfo = connection.recv(head_length)
    Version, request_number, length = struct.unpack('bbQ', headinfo)
    if request_number == get:
        file_name = connection.recv(length - head_length).decode()
        file_length = os.stat(file_name).st_size
        print('Client request: Get', file_name)
        print('Start sending', file_length, 'bytes', file_name)
        time.sleep(1)

        connection.send(makehead(version, transmission, head_length + file_length))

        file_info = open(file_name, 'rb')
        t = tqdm(total=file_length, unit='bytes')
        sent_size = 0
        while True:
            data = b''
            if file_length - sent_size > 2 ** 20:
                data = file_info.read(2 ** 20)
                sent_size += len(data)
                t.update(len(data))
                connection.send(data)
            elif file_length - sent_size > 1024:
                data = file_info.read(2 ** 17)
                sent_size += len(data)
                t.update(len(data))
                connection.send(data)
            else:
                data = file_info.read(1024)
                sent_size += len(data)
                t.update(len(data))
                connection.send(data)

            if sent_size >= file_length:
                t.close()
                break

        file_info.close()
        connection.close()
        print(file_name, 'send over', '\nConnection close')