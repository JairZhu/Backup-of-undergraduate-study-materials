#-*- coding:utf-8 -*-
from flask import Flask
import Router

#本路由id
router_id = 0
#发送请求的端口
send_port = 23333
#接受请求的端口
recv_port = 10086
#连接到的路由列表
connected_router = []


#TODO:Flask框架
app = Flask(__name__)

@app.route('/')
def mainpage():
    return

if __name__ == '__main__':
    app.run()