#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Exercise Solutions: Simplified DES
#
#   Author: Dan Shumow, 2009
#
#   For this file to run, SimplifiedDES.sage
#   must be loaded first
#


#
# Simplified DES Decrypt Function
#

def SDESDecrypt(plaintext_block, K):

    (K1, K2) = SDESKeySchedule(K);

    temp_block1 = IP(plaintext_block);
    
    temp_block2 = f_K(temp_block1, K2);

    temp_block3 = SW(temp_block2);

    temp_block4 = f_K(temp_block3, K1);

    output_block = IPinv(temp_block4);

    return output_block;

#
# Taking out the SBoxes from DES
#

#
# An inverse function for EP permutation:
# Note that their can be many inverse
# Permutations for EP
#
EPinv_data = [8, 5, 4, 1];

def EPinv(block):
    return ApplyPermutation(block, EPinv_data);

#
# Simplified DES with no SBoxes f
#

def f_K_NoSBox(block, K):
    left_block = LeftHalfBits(block);
    right_block = RightHalfBits(block);

    temp_block1 = EP(right_block);    

    temp_block2 = XorBlock(temp_block1, K);
    
    temp_block3 = EPinv(temp_block2)

    temp_block4 = P4(temp_block3)

    temp_block5 = XorBlock(temp_block4, left_block);

    output_block =  concatenate(temp_block5, right_block)

    return output_block;


#
# Simplified DES with no SBoxes Decrypt function
#

def SDESDecrypt_NoSBox(plaintext_block, K):

    (K1, K2) = SDESKeySchedule(K);

    temp_block1 = IP(plaintext_block);
    
    temp_block2 = f_K_NoSBox(temp_block1, K2);

    temp_block3 = SW(temp_block2);

    temp_block4 = f_K_NoSBox(temp_block3, K1);

    output_block = IPinv(temp_block4);

    return output_block;

#
# Simplified DES with no SBox Encrypt Function
#

def SDESEncrypt_NoSBox(plaintext_block, K):

    (K1, K2) = SDESKeySchedule(K);

    temp_block1 = IP(plaintext_block);
    
    temp_block2 = f_K_NoSBox(temp_block1, K1);

    temp_block3 = SW(temp_block2);

    temp_block4 = f_K_NoSBox(temp_block3, K2);

    output_block = IPinv(temp_block4);

    return output_block;
