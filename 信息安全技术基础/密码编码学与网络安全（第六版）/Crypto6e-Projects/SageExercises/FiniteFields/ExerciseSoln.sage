attach Euclid.sage
attach ExtendedEuclid.sage


#
# Solutions to Question 1
#

def euclidean_gcd(a,b):

    A = abs(a)
    B = abs(b)

    if (A == B):
        return A

    if (B > A):
        temp = B
        B = A
        A = temp

    return EUCLID(A, B)


def extended_euclidean_gcd(a,b):

    sign_coef_A = 1
    sign_coef_B = 1

    if (a < 0):
        sign_coef_A = -1
    
    if (b < 0):
        sign_ceof_B = -1

    A = abs(a)
    B = abs(b)

    switched = False

    if (A == B):
        return (1, 1, 0)

    if (B > A):
        switched = True
        temp = B
        B = A
        A = temp

    (g, x) = EXTENDED_EUCLID(A, B)

    if (None == x):
        w = None
    else:
        w = (g - x*B)/A
    
    if (switched):
        temp = x
        x = w
        w = temp

    if (None != x):
        w = sign_coef_A * w
        x = sign_coef_B * x

    return (g, w, x)

#
# Solution to Question 2
#

# solution to part a

def polynomial_scalar_multiply(f, c):
    
    g = [ c*f[j] for j in xrange(len(f)) ]

    return g

# solution to part c

def polynomial_addition(f, g):

    max_len = max(len(f), len(g))
    
    temp_f = [f[j] for j in xrange(len(f))]
    temp_g = [g[j] for j in xrange(len(g))]

    if (len(f) < max_len):
        temp_f.extend([0 for j in xrange(max_len - len(f))])

    if (len(g) < max_len):
        temp_g.extend([0 for j in xrange(max_len - len(g))])

    h = [temp_f[j] + temp_g[j] for j in xrange(max_len)]
    
    return h


# solution to part c

def polynomial_subtraction(f, g):

    return polynomial_addition(f, polynomial_scalar_multiply(g, -1))

# solution to part d

def polynomial_multiplication(f, g):

    len_prod = len(f) + len(g) - 2

    h = [0 for j in xrange(len(f) + len(g) - 1)]

    for j in xrange(len(f)):
        for k in xrange(len(g)):
            h[j+k] += f[j]*g[k]

    return h


#
# Solution to Question 3
#

gf2_poly_ring.<x> = GF(2)[]
gf16_modulus = x^4 + x + 1

# solution to part a
def gf16_add(f, g):

    h = [f[j] + g[j] for j in xrange(4)]

    return h


# solution to part b
def gf16_scalar_multiply(f, c):

    h = [c*f[j] for j in xrange(4)]

    return h


# solution to part c
def gf16_multiply(f, g):

    f_poly = gf2_poly_ring(f)
    g_poly = gf2_poly_ring(g)

    (q,h) = (f*g).quo_rem(gf16_modulus)

    return h.list()


# solution to part d
def gf16_inversion(f):

    gf2_poly_ring(f)

    (g, h, foo) = f.quo_rem(gf16_modulus)

    return h.list()

