#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples: Linear Congruential RNG
#
#   Author: Dan Shumow, 2009
#


def LinearCongruential_Initialize(a, c, m, X0):
    r"""
    This functional initializes a Linear Congruential RNG state.

    This state is a list of four integers: [a, c, m, X]

    a,c,m are the parameters of the linear congruential instantiation
    X is the current state of the PRNG.

    INPUT:

        a - The coefficient
        c - The offset
        m - The modulus
        X0 - The initial state

    OUTPUT:

        state - The initial internal state of the RNG

    """

    return [a,c,m,X0]


def LinearCongruential_Generate(state):
    r"""
    Generates a single Linear Congruential RNG output and updates the state.

    INPUT:

        state - an internal RNG state.

    OUTPUT:

        X - a single output of the linear congruential RNG

    """

    a = state[0]
    c = state[1]
    m = state[2]
    X = state[3]

    X_next = (a*X + c) % m

    state[3] = X_next

    return X_next
