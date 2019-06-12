import struct
import socket
import sys
import os

#分割文件
kilobytes = 1024
megabytes = kilobytes*1000
chunksize = int(200*megabytes)

def split(fromfile,todir,chunksize=chunksize):
    if not os.path.exists(todir):
        os.mkdir(todir)
    else:
        for fname in os.listdir(todir):
            os.remove(os.path.join(todir,fname))
    partnum = 0
    inputfile = open(fromfile,'rb')#open the fromfile
    while True:
        chunk = inputfile.read(chunksize)
        if not chunk:             #check the chunk is empty
            break
        partnum += 1
        filename = os.path.join(todir,('part%04d'%partnum))
        fileobj = open(filename,'wb')#make partfile
        fileobj.write(chunk)         #write data into partfile
        fileobj.close()
    return partnum

#下面是传送的部分，详见猪猪的代码
def sending(ip,port,listennum,filename):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((ip, port))
    server.listen(listennum)
    print("Waiting for client's request...")
    while True:
        connection, addr = server.accept()  #connection:套接字对象
        print("Connect IP:", addr[0], "Port:", addr[1])
        request = connection.recv(struct.calcsize('8s')).decode('utf-8')
        print("Receive", request, "request")
        if request == 'GET FILE':
            connection.send(filename.encode('utf-8'))
            connection.send(struct.pack('Q', os.stat(filename).st_size))
            print("Sending", os.stat(filename).st_size, "bytes")
            file = open(filename, 'rb')
            sendsize = 0
            while True:
                data = file.read(2 ** 23)
                if not data:
                    print('file send over')
                    break
                sendsize += len(data)
                connection.send(data)
                print('Have sent', sendsize, "bytes")
        connection.close()


with open('port2.txt','w') as file_object:
    file_object.write('127.0.0.1 8230') #创建一个文件（测试分割功能用）
if __name__=='__main__':
        fromfile  = 'port2.txt'  #分割的文件名称
        add = "C:\ s2"
        todir     = add  #分割文件时存储的目录
        chunksize = 8  #每块文件的大小
        absfrom,absto = map(os.path.abspath,[fromfile,todir])
        print('Splitting',absfrom,'to',absto,'by',chunksize)
        try:
            parts = split(fromfile,todir,chunksize)
        except:
            print('Error during split:')
            print(sys.exc_info()[0],sys.exc_info()[1])
        else:
            print('split finished:',parts,'parts are in',absto)


sending('127.0.0.1',8260,1,'part0001')