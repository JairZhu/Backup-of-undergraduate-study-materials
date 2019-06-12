#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples:
#   Extended Euclidean Algorithm for greatest common divisor
#
#   Author: Dan Shumow, 2009
#


def EXTENDED_EUCLID(m,b):
    r"""
    The Extended Euclidean Algorithm to find gcd(m,b).
    The input is expected to be such that 0 <= b < m.

    INPUT:
        
        m - positive integer
        
        b - nonnegative integer less than m

    OUTPUT:

        (g, b_inv) - g is the gcd of m and b, b_inv is the multiplicative inverse of b mod m.

    """

    if (m < b) or (b < 0):
        raise ValueError, "Expected input (0 < b < m)"

    (A1,A2,A3) = (1,0,m);
    (B1,B2,B3) = (0,1,b);

    while (True):

        if (0 == B3):
            return (A3, None)

        if (1 == B3):
            return (B3, B2)

        Q = floor(A3/B3)

        (T1,T2,T3) = (A1-Q*B1, A2-Q*B2, A3-Q*B3)
        (A1, A2, A3) = (B1, B2, B3)
        (B1, B2, B3) = (T1, T2, T3)
