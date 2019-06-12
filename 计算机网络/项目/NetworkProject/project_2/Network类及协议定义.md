
# 乱七八糟的文档

此文档旨在归纳一些乱七八糟代码的功能便于查阅。（顺便在写实验报告的时候省点事）

## 数据交换协议

为了便于数据交换，基于第一次Project的基础定义了一个简单的类HTTP应用层数据交换协议。协议定义如下

- 头部
  - Method/Status Code
  - Source IP
  - Source Port
  - Dest IP
  - Dest Port
  - Keep Alive
  - Body Len

- 数据体

  ​

  ## 路由数据交换协议

  基于上一协议框架，为路由器之间进行信息交换设计的协议

  ### Method

  | Method/Status Code |  Data  | 组织方式 |   功能   |
  | :----------------: | :----: | :--: | :----: |
  |         0          |  JSON  | 自组织  | 发送路由变更 |
  |         1          | binary | Both | 发送数据包  |
  |         2          |   -    | 自组织  | 请求路由表  |
  |         3          |        | 中心化  |  发送拓扑  |
  |         4          |        | 中心化  | 退出路由网络 |
  |         5          |   -    | Both |   正常   |

  ### Keep Alive

  考虑到端口限制，发送socket即开即用，开完关闭以便与其它路由连接，Keep Alive统一为0

  ### Data

  - Method 0
    - Dictionary
    - key：目的路由IP
    - value：元组
      - 距离
      - 下一跳路由IP 

## Network类

Network类是一个基于socket编程封装了若干网络访问功能以便于复用的类。
Network类能够实现以下功能

- 监听/停止监听指定端口
- 并行接受多个被监听端口的连接请求并调用指定的处理函数进行处理
- 与指定地址的指定端口建立/断开连接
- 在已建立的连接上发送请求/接受回应

### Network类图

### Network成员函数

```python
def __init__(self, network_send_port, network_recv_port)
```

- 构造函数，接受一个发送端口与一个接受端口。

```python
def get_host_ip(self)
```

- 返回值：str类型
- 返回本机的IP地址

```python
def connect(self, target_ip, target_port)
```

- 返回值：无
- 与指定地址建立连接。若该Network类已建立一个连接，抛出Exception类‘Already connected’异常

```python
def disconnect(self)
```

- 返回值：无
- 断开该Network类建立的连接。若该Network类没有建立连接，抛出Exception类‘Not connected’异常

```python
def start_listen(self, call_back_request_handler)
```

- 返回值：无
- 接受一个函数，在接收端口上初始化一个socket并开始监听，接受连接并将收到的报文解析成一个列表传递给函数参数。如果已经监听，抛出Exception类‘Already listening'异常

```python
def stop_listen(self)
```

- 返回值：无
- 关闭接收端口上的socket。若没有监听，抛出Exception类’Not listening‘异常

```python
def request(self, target_ip, target_port, method, keep_alive, data)
```

- 返回值：返回数据解析成的列表
- 向指定地址以指定method发送一个body部分为data的请求并接受返回数据，解析成列表后返回






