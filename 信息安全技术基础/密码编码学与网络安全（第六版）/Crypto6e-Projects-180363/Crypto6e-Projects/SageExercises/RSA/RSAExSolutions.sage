#
# This is a function that performs RSA key generation
# n is a bitlength this function generates an RSA
# key pair where the modulus is bitlength n.
# Returns a tuple (N, e, d)
# N is an n bit RSA modulus
# e is an encrypt key
# d us a decrypt key
#
def RSA_key_generation(n):
    m = n.quo_rem(2)[0] # floor(n/2)
    
    p = 1
    while (p < 2^(m-1)):
        p = random_prime(2^m)
    	
    q = 1
    while (q < 2^(m-1)):
        q = random_prime(2^m)
    	
    N = p*q
    phi_N = (p-1)*(q-1)
    
    e = phi_N
    g = phi_N
    while (1 != g):
        e = randint(3,phi_N-1)
        (g, d, t) = xgcd(e, phi_N)

    return (N, e, d)


#
# This is a function that performs RSA Encryption
# N is an RSA modulus, and e is a public exponent.
# P is a plaintext, taken to be a number less than
# and relatively prime to N
#
def RSA_encrypt(N, e, P):
    R = IntegerModRing(N)
    C = R(P)^e
    C = C.lift()
    return C


#
# This is a function that performs RSA Decryption
# N is an RSA modulus, and e is a private exponent.
# C is a ciphertext, taken to be a number less than
# and relatively prime to N
#

def RSA_decrypt(N, d, C):
    R = IntegerModRing(N)
    P = R(C)^d
    P = P.lift()
    return P

#
# This is a function that performs RSA Signature
# N is an RSA modulus, and d is a private exponent.
# H is a Hash value to be signed, assumed to be a number less than
# and relatively prime to N
#
def RSA_sign(N, d, H):
    return RSA_decrypt(N, d, H)
    
#
# This is a function that performs RSA signature verification
# N is an RSA modulus, and e is a public exponent.
# H is a Hash value to be signed, assumed to be a number less than
# and relatively prime to N
# S is a signature of H
# Returns True if the signature S matches the Hash value H
#
def RSA_verify(N, e, H, S):
    return (H == RSA_encrypt(N, e, S))
