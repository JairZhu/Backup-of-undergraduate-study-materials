#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples:  Miller Rabin Test
#
#   Author: Dan Shumow, 2009
#

r"""
EXAMPLES:

    sage: MILLER_RABIN_TEST(101)
    False

    sage: MILLER_RABIN_TEST(592701729979)
    True

"""

def MILLER_RABIN_TEST(n):
    r"""

    This function implements the Miller-Rabin Test.

    It either returns "inconclusive" or "composite." 

    INPUT: 

        n - positive integer to probabilistically determine the primality of.

    OUTPUT:
 
        If the function returns False, then the test was inconclusive.
        If the function returns True, the the test was conclusive and n is composite.
  
    """

    R = IntegerModRing(n); # object for integers mod n
    
    # (1) Find integers k, q w/ k > 0 and q odd so that (n-1) == 2^k * q 
    q = n-1
    k = 0
    while (1 == (q % 2)):
        k += 1
        q = q.quo_rem(2)[0] # q/2 but with result of type Integer

    # (2) select random a in 1 < a < n-1
    a = randint(1,n-1)

    a = R(a) # makes it so modular exponentiation is done fast

    # if a^q mod n == 1 then return inconclusive
    if (1 == a^q):
        return False

    # (3) for j = 0 to k-1 do: if a^(2^j * q) mod n = n-1 return inconclusive
    e = q
    for j in xrange(k):
        if (n-1) == (a^e):
            return False
        e = 2*e

    # (4) if you've made it here return composite.
    return True
