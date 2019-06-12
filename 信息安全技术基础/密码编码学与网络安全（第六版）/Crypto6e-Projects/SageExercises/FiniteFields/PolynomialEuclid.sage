#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples:
#   Euclidean algorithm to find GCD of to polynomials 
#   (with coefficients in a field.)
#
#   Author: Dan Shumow, 2009
#

def POLYNOMIAL_EUCLID(A, B):
    r"""
    Euclidian algorithm for polynomial GCD:
    Given two polynomials over the same base field,
    Assuming degree(A) => degree(B) => 0

    INPUT:

        A - polynomial over a field.

        B - polynomial over the same field as A, and 0 <= degree(B) <= degree(A) 
    OUTPUT:

        G - Greatest Common Divisor of A and B.

    """

    degA = A.degree();
    degB = B.degree();

    if ((degB < 0) or (degA < degB)):
        raise ValueError, "Expected 0 <= degree(B) <= degree(A)"

    while(True):
        
        if (0 == B):
            return A;
        
        R = A % B;

        A = B;
        B = R;

