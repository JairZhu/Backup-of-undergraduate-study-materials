import centralized_Router
send_port = 23333
recv_port = 10086

if __name__ == '__main__':
    center_server = centralized_Router.CenterServer(send_port, recv_port)


