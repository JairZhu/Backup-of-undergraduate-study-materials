#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples: Modular Exponentiation
#   Square and Multiply algorithm
#
#   Author: Dan Shumow, 2009
#

def ModExp(x,e,N):
    r"""
    Calculates x^e mod N using square and multiply.

    INPUT:

        x - an integer
        e - a nonnegative integer
        N - a positive integer modulus

    OUTPUT:

        y - x^e mod N

    """

    e_bits = e.bits()
    e_bitlen = len(e_bits)

    y = 1

    for j in xrange(e_bitlen):

        y = y^2 % N

        if (1 == e_bits[e_bitlen-1-j]):
            y = x*y % N

    return y