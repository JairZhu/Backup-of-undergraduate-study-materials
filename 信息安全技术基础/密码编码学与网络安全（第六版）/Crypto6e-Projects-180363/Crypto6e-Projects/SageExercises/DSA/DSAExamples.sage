#
# Generates a 16 bit q and 64 bit p, both prime
# such that q divides p-1
#
def DSA_generate_domain_parameters():

    g = 1

    while (1 == g):

        # first find a q    
        q = 1
        while (q < 2^15): q = random_prime(2^16)

        # next find a p    
        p = 1
        while (not is_prime(p)):
            p = (2^47 + randint(1,2^45)*2)*q + 1


        F = GF(p)    

        h = randint(2,p-1)

        g = (F(h)^((p-1)/q)).lift()
        
    return (p, q, g)


#
# Generates a users private and public key
# given domain parameters p, q, and g
#
def DSA_generate_keypair(p, q, g):

    x = randint(2,q-1)

    F = GF(p)

    y = F(g)^x
    y = y.lift()

    return (x,y)


#
# given domain parameters p, q and g
# as well as a secret key x
# and a hash value H
# this performs the DSA signing algorithm
#
def DSA_sign(p, q, g, x, H):

    k = randint(2,q-1)

    F = GF(p)

    r = F(g)^k
    r = r.lift() % q

    kinv = xgcd(k,q)[1] % q

    s = kinv*(H + x*r) % q

    return (r, s)
