import random


# 超大整数超大次幂然后对超大的整数取模 (base ^ exponent) mod m
def exp_mode(base, exponent, m):
    result = 1
    while exponent != 0:
        if (exponent & 1) == 1:
            # ei = 1, then mul
            result = (result * base) % m
        exponent >>= 1
        base = (base * base) % m
    return result


def primeTest(n):
    q = n - 1
    k = 0
    # Find k, q, satisfied 2^k * q = n - 1
    while q % 2 == 0:
        k += 1
        q //= 2
    a = random.randint(2, n - 2)
    # If a^q mod n= 1, n maybe is a prime number
    if exp_mode(a, q, n) == 1:
        return "inconclusive"
    # If there exists j satisfy a ^ ((2 ^ j) * q) mod n == n-1, n maybe is a prime number
    for j in range(0, k):
        if exp_mode(a, (2 ** j) * q, n) == n - 1:
            return "inconclusive"
    # a is not a prime number
    return "composite"


def findPrime(halfkeyLength):
    while True:
        # Select a random number n
        n = random.randint(0, 1 << halfkeyLength)
        if n % 2 != 0:
            found = True
            # If n satisfy primeTest 10 times, then n should be a prime number
            for i in range(0, 10):
                if primeTest(n) == "composite":
                    found = False
                    break
            if found:
                return n


# 求两个数字的最大公约数（欧几里得算法）
def gcd(a, b):
    while a != 0:
        a, b = b % a, a
    return b


def findModReverse(a, m):  # 这个扩展欧几里得算法求模逆
    if gcd(a, m) != 1:
        return None
    u1, u2, u3 = 1, 0, a
    v1, v2, v3 = 0, 1, m
    while v3 != 0:
        q = u3 // v3
        v1, v2, v3, u1, u2, u3 = (u1 - q * v1), (u2 - q * v2), (u3 - q * v3), v1, v2, v3
    return u1 % m


# 生成公钥私钥，p、q为两个超大质数
def gen_key(p, q):
    n = p * q
    fy = (p - 1) * (q - 1)  # 计算与n互质的整数个数 欧拉函数
    d = 16337341  # 选取私钥d 注意选取与fy互质的数
    while gcd(d, fy) != 1:
        d += 1
    # generate d
    b = fy
    e = findModReverse(d, fy)
    # 返回： 公钥    私钥
    return (n, e), (n, d)


# 加密 m是待加密的信息 加密成为c
def encrypt(m, pubkey):
    n = pubkey[0]
    e = pubkey[1]
    c = exp_mode(m, e, n)
    return c


# 解密 c是密文，解密为明文m
def decrypt(c, selfkey):
    n = selfkey[0]
    d = selfkey[1]
    m = exp_mode(c, d, n)
    return m

if __name__ == "__main__":
    m = input('请输入明文：')

    p = findPrime(512)
    q = findPrime(512)
    print('选取的p为')
    print(p)
    print('选取得q为')
    print(q)
    pubkey, selfkey = gen_key(p, q)
    print('e为')
    print(pubkey[1])
    print('d为')
    print(selfkey[1])
    a = ''
    for i in m:
        a = a + str(ord(i))

    m_int = int(a)
    print('%s数字表示：' % (m), m_int)
    c = encrypt(m_int, pubkey)
    print('加密后的结果为：')
    print(c)
    d = decrypt(c, selfkey)
    print('解密后的结果为：') 
    print(d)
