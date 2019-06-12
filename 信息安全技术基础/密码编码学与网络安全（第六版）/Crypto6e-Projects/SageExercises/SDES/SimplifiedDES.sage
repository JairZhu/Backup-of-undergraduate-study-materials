#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   SAGE Examples: Simplified DES
#
#   Author: Dan Shumow, 2009
#

#
# The Expansions/Permutations are stored as lists of bit positions
#

P10_data = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6];

P8_data = [6, 3, 7, 4, 8, 5, 10, 9];

LS1_data = [2, 3, 4, 5, 1];

LS2_data = [3, 4, 5, 1, 2];

IP_data = [2, 6, 3, 1, 4, 8, 5, 7];

IPinv_data = [4, 1, 3, 5, 7, 2, 8, 6];

EP_data = [4, 1, 2, 3, 2, 3, 4, 1];

P4_data = [2, 4, 3, 1];

SW_data = [5, 6, 7, 8, 1, 2, 3, 4];

#
# SDES lookup tables
#

S0_data = [[1, 0, 3, 2],
           [3, 2, 1, 0],
           [0, 2, 1, 3],
           [3, 1, 3, 2]];

S1_data = [[0, 1, 2, 3],
           [2, 0, 1, 3],
           [3, 0, 1, 0],
           [2, 1, 0, 3]];

def ApplyPermutation(X, permutation):
    r"""
    This function takes a permutation list (list of bit positions.)
    And outputs a bit list with the bits taken from X.
    """
    # permute the list X
    l = len(permutation);
    return [X[permutation[j]-1] for j in xrange(l)];

def ApplySBox(X, SBox):
    r"""
    This function Applies the SDES Sbox (by table look up
    """
    r = 2*X[0] + X[3];
    c = 2*X[1] + X[2];
    o = SBox[r][c];
    return [o & 2, o & 1];

#
# Each of these functions uses ApplyPermutation
# and a permutation list to perform an SDES
# Expansion/Permutation
#

def P10(X):
    return ApplyPermutation(X, P10_data);

def P8(X):
    return ApplyPermutation(X, P8_data);

def IP(X):
    return ApplyPermutation(X, IP_data);

def IPinv(X):
    return ApplyPermutation(X, IPinv_data);

def EP(X):
    return ApplyPermutation(X, EP_data);

def P4(X):
    return ApplyPermutation(X, P4_data);

def SW(X):
    return ApplyPermutation(X, SW_data);

def LS1(X):
    return ApplyPermutation(X, LS1_data);

def LS2(X):
    return ApplyPermutation(X, LS2_data);

#
# These two functions peform the SBox substitutions
#
def S0(X):
    return ApplySBox(X, S0_data);

def S1(X):
    return ApplySBox(X, S1_data);

def concatenate(left, right):
    r"""
    Joins to bit lists together.
    """
    ret = [left[j] for j in xrange(len(left))];
    ret.extend(right);
    return ret;

def LeftHalfBits(block):
    r"""
    Returns the left half bits from block.
    """
    l = len(block);
    return [block[j] for j in xrange(l/2)];

def RightHalfBits(block):
    r"""
    Returns the right half bits from block.
    """
    l = len(block);
    return [block[j] for j in xrange(l/2, l)];

def XorBlock(block1, block2):
    r"""
    Xors two blocks together.
    """
    l = len(block1);
    if (l != len(block2)):
        raise ValueError, "XorBlock arguments must be same length"
    return [(block1[j]+block2[j]) % 2 for j in xrange(l)];

def SDESKeySchedule(K): 
    r"""
    Expands an SDES Key (bit list) into the two round keys.
    """
    temp_K = P10(K);

    left_temp_K = LeftHalfBits(temp_K);
    right_temp_K = RightHalfBits(temp_K);

    K1left = LS1(left_temp_K);
    K1right = LS1(right_temp_K);    

    K1temp = concatenate(K1left, K1right);
    K1 = P8(K1temp);

    K2left = LS2(K1left);
    K2right = LS2(K1right);

    K2temp = concatenate(K2left, K2right);

    K2 = P8(K2temp);

    return (K1, K2);

def f_K(block, K):
    r"""
    Performs the f_K function supplied block and K.
    """
    left_block = LeftHalfBits(block);
    right_block = RightHalfBits(block);

    temp_block1 = EP(right_block);    

    temp_block2 = XorBlock(temp_block1, K);
    
    left_temp_block2 = LeftHalfBits(temp_block2);
    right_temp_block2 = RightHalfBits(temp_block2);

    S0_out = S0(left_temp_block2);
    S1_out = S1(right_temp_block2);

    temp_block3 = concatenate(S0_out, S1_out);

    temp_block4 = P4(temp_block3)

    temp_block5 = XorBlock(temp_block4, left_block);

    output_block =  concatenate(temp_block5, right_block)

    return output_block;

def SDESEncrypt(plaintext_block, K):
    r"""
    Peforms a single SDES plaintext block encryption.
    (Given plaintext and key as bit lists.)
    """

    (K1, K2) = SDESKeySchedule(K);

    temp_block1 = IP(plaintext_block);
    
    temp_block2 = f_K(temp_block1, K1);

    temp_block3 = SW(temp_block2);

    temp_block4 = f_K(temp_block3, K2);

    output_block = IPinv(temp_block4);

    return output_block;

def SDESDecrypt(ciphertext_block, K):
    r"""
    Performs a single SDES ciphertext block decryption.
    (Given ciphertext and key as bit lists.)
    """

    (K1, K2) = SDESKeySchedule(K);

    temp_block1 = IP(ciphertext_block);
    
    temp_block2 = f_K(temp_block1, K2);

    temp_block3 = SW(temp_block2);

    temp_block4 = f_K(temp_block3, K1);

    output_block = IPinv(temp_block4);

    return output_block;
