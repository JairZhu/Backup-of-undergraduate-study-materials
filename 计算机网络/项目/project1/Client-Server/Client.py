import struct
import socket
from tqdm import tqdm
import time

list_file = 0
transmission = 1
get = 2
version = 1
user_choose = ''
head_length = struct.calcsize('bbQ')

def makehead(version, request_number, length):
    return struct.pack('bbQ', version, request_number, length)

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('172.18.35.96', 8100))

while True:
    headinfo = client.recv(head_length)
    Version, service_number, packet_length = struct.unpack('bbQ', headinfo)
    if service_number == list_file:
        receive_length = 0
        files_info = {}
        while receive_length != packet_length - head_length:
            receive_length += struct.calcsize('8sQ')
            file_name, file_length = struct.unpack('8sQ', client.recv(struct.calcsize('8sQ')))
            files_info[file_name.decode()] = file_length

        for key, value in files_info.items():
            print(key, '\t', value, 'bytes')

        user_choose = input('Please choose the file: ')
        while user_choose not in files_info.keys():
            user_choose = input(user_choose + 'does not exit, Please input again: ')
        else:
            client.send(makehead(version, get, struct.calcsize('bbQ%ds' % len(user_choose))))
            client.send(user_choose.encode())

    elif service_number == transmission:
        recieved_length = 0
        file_length = packet_length - head_length

        file = open(user_choose, 'wb')
        print('Start receiving', file_length, 'bytes', user_choose)
        time.sleep(1)

        t = tqdm(total=file_length, unit='bytes')
        while recieved_length != file_length:
            if file_length - recieved_length > 2 ** 20:
                data = client.recv(2 ** 20)
                file.write(data)
                t.update(len(data))
                recieved_length += len(data)
            elif file_length - recieved_length > 1024:
                data = client.recv(2 ** 17)
                file.write(data)
                t.update(len(data))
                recieved_length += len(data)
            else:
                data = client.recv(1024)
                file.write(data)
                t.update(len(data))
                recieved_length = len(data)

            if recieved_length >= file_length:
                break

        t.close()
        file.close()
        print('Recieved', recieved_length, 'bytes', user_choose)
        client.close()
        print('Connection close')
        break