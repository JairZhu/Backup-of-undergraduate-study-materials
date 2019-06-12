#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Solution Code: RNG Exercises
#
#   Author: Dan Shumow, 2009
#


#
# This is the code for the solutions to the Sage RNG Questions
#

load RngExerciseCode.sage


#
# Solutions to reducing factoring to breaking BlumBlumShub
#
def FactorByCongruentSquares(x, y, N):
    r"""
    This function tries to factor N 
    given integers x,y such that x^2 = y^2 mod N
    """
    return (gcd(x+y,N), gcd(x-y,N))


def FactorFromBreakingBlumBlumShub(N):
    r"""
    This Function Factors a number N by reducing to breaking the BBS RNG
    """
    factored = False

    factors = []

    trivial_factors = [1,N]

    while (not factored):

        x = randint(N,N^2)
        bbs_state = [N, (x^2)%N]
        
        y = previous_BBS_state(bbs_state)[1]

        (p,q) = FactorByCongruentSquares(x,y,N)

        if (p not in trivial_factors):
            factored = True;
            factors.append(p)
            p2 = N/p
            if (p != p2): factors.append(p2)

        if (q not in trivial_factors):
            factored = True;
            if (q not in factors): factors.append(q)
            q2 = N/q
            if (q2 not in factors): factors.append(q2);

    factors.sort()

    return factors


#
# Solution to breaking a linear congruential generator
#
def AttackLinearCongruential(X,m):
    r"""
    This is a function that takes 3 output states of a Linear Congruential RNG and m
    and returns the a and c parameters, or indicates that the attack fails.

    Takes a list of 3 subsequent outputs from the PRNG and the value of the modulus m.
    """
    (X0,X1,X2) = (X[0], X[1], X[2])

    # (1) Attempt to recover a by calculating X1 - X0 = a*(X2 - X1) mod m
    # let t = X1 - X0 so a = (X3-X2)*t^-1 mod m
    # errors out if t is uninvertible

    t = X1 - X0
    (gcd_t_m, t_inv, m_inv) = xgcd(t,m)
    
    if (gcd_t_m != 1):
        print "Could not invert X2 and X1 mod m."
        return None

    a = (X2 - X1)*t_inv % m

    # (2) calculate c from X1 and X0
    c = (X1 - a*X0) % m;

    return (a, c)

