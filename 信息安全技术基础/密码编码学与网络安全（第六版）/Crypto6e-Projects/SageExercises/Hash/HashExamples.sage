#
# This function generates a mash modulus
# takes a bit length, and returns a Mash
# modulus l or l-1 bits long (if n is odd)
# returns p, q, and the product N
#
def generate_mash_modulus(l):

    m = l.quo_rem(2)[0]

    p = 1
    while (p < 2^(m-1)):
        p = random_prime(2^m)
        
    q = 1
    while (q < 2^(m-1)):
        q = random_prime(2^m)
    
    N = p*q
    
    return (N, p, q)

#
# Mash Hash
# the value n is the data to be hashed.
# the value N is the modulus
# Returns the hash value.
#
def MASH(n, N):
    
	H = previous_prime(N)
	
	q = n
	
	while (0 != q):
		(q, a) = q.quo_rem(N)
		H = ((H+a)^2 + H) % N
		
	return H

