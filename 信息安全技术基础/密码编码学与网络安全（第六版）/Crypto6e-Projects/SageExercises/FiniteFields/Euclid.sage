#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples:
#   Euclidean Algorithm for Greatest Common Divisor
#
#   Author: Dan Shumow, 2009
#


def EUCLID(a,b):
    r"""
    The Euclidean Algorithm for finding the gcd of a and b.
    This algorithm assumes that a > b => 0

    INPUT:

        a - positive integer

        b - nonnegative integer less than a

    OUTPUT:

        g - greatest common divisor of a and b

    """

    if (b < 0) or ( a <= b):    
        raise ValueError, "Expected 0 < a < b"
    
    (A, B) = (a,b);
    
    while (True):
    
        if (0 == B):
            return A;

        R = A % B; 
        A = B;
        B = R;
