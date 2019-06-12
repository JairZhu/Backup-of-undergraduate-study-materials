# Solution to Question 1(a)

#
# Generate a simple hash modulus of bit length n
# also generate g < N and relatively prime to N.
#
def generate_simple_hash_params(n):

    m = n.quo_rem(2)[0]
    
    p = 1
    while (p < 2^(m-1)):
    	p = random_prime(2^m)
    
    q = 1	
    while (q < 2^(m-1)):
    	q = random_prime(2^m)
        
    N = p*q
    
    g = N
    while (1 != gcd(g,N)):
        g = randint(1,N-1)
    
    return (N, g)
 
  
# Solution to Question 1(c)

#
# Perform the simple hashing algorithm.
# g, N are the simple hash parameters
#
# n is the data to hash
#
 
def simple_hash(n, g, N):

    R = IntegerModRing(N)
    
    H = R(g)^n
    H = H.lift()
    
    return H

# Solution to Question 1(f)

#
# Given p and q (factors of a simple hash modulus)
# 
# This function calculates two inputs that hash to the same value
# using simple hash
#
def simple_hash_collision(p, q):

    phi_N = (p-1)*(q-1)
    
    n = randint(1,phi_N-1)
    
    m = n + phi_N
    
    return (m, n)
    
