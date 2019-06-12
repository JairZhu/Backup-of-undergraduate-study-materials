#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Code from RNG Exercises
#
#   Author: Dan Shumow, 2009
#


#
# Code for the BlumBlumShub Question:
#

def previous_BBS_state(state):
    r"""
    This function returns the previous BlumBlumShub state.
    Note that this is a toy function and will only work on small N.
    """

    N = state[0];
    R = IntegerModRing(N);
    X = R(state[1]);

    if (not X.is_square()):
        print "Not a valid Blum-Blum-Shub RNG state."
        return None

    return [N, X.sqrt().lift()];


