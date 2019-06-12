#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples:
#   Extended Euclidean algorithm for the gcd of two polynomials
#   (with coefficients in the same field.)
#
#   Author: Dan Shumow, 2009
#

def POLYNOMIAL_EXTENDED_EUCLID(m, b):
    r"""
    Extended Euclidian algorithm for polynomial GCD:
    Given two polynomials over the same base field,
    Assuming degree(m) => degree(b) => 0

    INPUT:

        m - polynomial over a field.

        b - polynomial over the same field as A, and 0 <= degree(B) <= degree(M) 
    OUTPUT:

        (g,b_inv) - The Pair where:

        g - Greatest Common Divisor of m and b.

        m_inv - Is None if G is not of degree 0, 
                and otherwise it is the polynomial such that b(X)*b_inv(X) = 1 mod m(X)

    """

    degm = m.degree();
    degb = b.degree();

    if(degb < 0) or (degm < degb):
        raise ValueError, "expected 0 <= degree(b) <= degree(m)"

    (A1, A2, A3) = (1, 0, m);
    (B1, B2, B3) = (0, 1, b);

    while (True):

        if (0 == B3):
            return (A3, None);

        if (0 == B3.degree()):
            return (B3/B3, B2/B3);

        Q = A3.quo_rem(B3)[0];

        (T1, T2, T3) = (A1 - Q*B1, A2 - Q*B2, A3 - Q*B3);
        (A1, A2, A3) = (B1, B2, B3);
        (B1, B2, B3) = (T1, T2, T3);