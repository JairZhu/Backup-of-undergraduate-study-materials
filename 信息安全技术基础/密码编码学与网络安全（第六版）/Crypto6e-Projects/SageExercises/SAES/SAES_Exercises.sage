#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Exercise Solutions: Simplified AES
#
#   Author: Dan Shumow, 2009
#
#   For this file to run correctly, SimplifiedAES.sage
#   must be loaded first.
#

F = GF(2);
L.<a> = GF(2^4);
V = L.vector_space();

def SAES_NibToGF16(x):
    x_bit_list = x.bits();
    x_bit_list.extend([0,0,0,0]);
    bit_list = [x_bit_list[j] for j in xrange(4)];
    output = L(V(bit_list));
    return output;

def SAES_InitSBoxMatrix():
    row_list = [];
    
    for j in xrange(4):
        row = [SAES_NibToGF16(4*j+k) for k in xrange(4)];
        row_list.append(row);
    
    return row_list;

def SAES_MapToInverse(M):
    next_M = [];
    for j in xrange(4):
        row = []
        for k in xrange(4):
            Mjk = M[j][k]
            if(Mjk != 0):
                row.append(Mjk^-1);
            else:
                row.append(0);
        next_M.append(row);

    return next_M;

A = Matrix(F, [
        [ 1, 0, 1, 1],
        [ 1, 1, 0, 1],
        [ 1, 1, 1, 0],
        [ 0, 1, 1, 1] ]);

b = V([1, 0, 0, 1]);

def SAES_LinearTransformElements(M):
    next_M = [];

    for j in xrange(4):
        row = [L(A.transpose()*V(M[j][k]) + b) for k in xrange(4)];
        next_M.append(row);

    return next_M;

def SAES_ComputeSBoxMatrix():
    
    M0 = SAES_InitSBoxMatrix();
    M1 = SAES_MapToInverse(M0);
    M2 = SAES_LinearTransformElements(M1);
    
    SBox_matrix_output = Matrix(L, M2);

    return SBox_matrix_output;


def SAES_InverseLinearTransformElements(M):
    next_M = [];

    for j in xrange(4):
        row = [L(A.transpose().inverse()*(V(M[j][k]) + b)) for k in xrange(4)];
        next_M.append(row);

    return next_M;

def SAES_ComputeInverseSBoxMatrix():

    M0 = SAES_InitSBoxMatrix();
    M1 = SAES_InverseLinearTransformElements(M0);
    M2 = SAES_MapToInverse(M1);

    InverseSBox_matrix_output = Matrix(L, M2);

    return InverseSBox_matrix_output;

def SAES_DirectlyComputeSBox(nibble):
    
    state0 = nibble;
    if (0 != state0):
        state1 = state0^-1;
    else:
        state1 = 0;

    state2 = L(A.transpose()*V(state1) + b);

    return state2;

def SAES_DirectlyComputeInverseSBox(nibble):

    state0 = nibble;

    state1 = L(A.transpose().inverse()*(V(state0) + b));

    if (0 != state1):
        state2 = state1^-1;
    else:
        state2 = 0;
    
    return state2;

def SAES_ApplyMixColumnsMatrix(state_matrix, MixColumns_matrix):
    
    next_state_matrix = MixColumns_matrix*state_matrix;

    return next_state_matrix;

def SAES_ApplySBoxMatrix(nibble, SBox_matrix):
    v = nibble._vector_();
    c = Integer(v[0]) + 2*Integer(v[1]);
    r = Integer(v[2]) + 2*Integer(v[3]);
    return SBox_matrix[r,c];

def SAES_NibSubSBox(state_matrix, SBox_matrix):
    M = state_matrix;

    M00 = SAES_ApplySBoxMatrix(M[0,0], SBox_matrix);
    M01 = SAES_ApplySBoxMatrix(M[0,1], SBox_matrix);
    M10 = SAES_ApplySBoxMatrix(M[1,0], SBox_matrix);
    M11 = SAES_ApplySBoxMatrix(M[1,1], SBox_matrix);

    next_state_matrix = Matrix(L, 
                          [ [ M00, M01],
                            [ M10, M11] ]);
    return next_state_matrix;

def SAES_EncryptDecrypt(block, MixColumns_matrix, SBox_matrix, K0, K1, K2):

    state_matrix0 = SAES_ToStateMatrix(block);

    state_matrix1 = SAES_AddRoundKey(state_matrix0, K0);
    
    state_matrix2 = SAES_NibSubSBox(state_matrix1, SBox_matrix);

    state_matrix3 = SAES_ShiftRow(state_matrix2);

    state_matrix4 = SAES_ApplyMixColumnsMatrix(state_matrix3, MixColumns_matrix);
    
    state_matrix5 = SAES_AddRoundKey(state_matrix4, K1);

    state_matrix6 = SAES_NibSubSBox(state_matrix5, SBox_matrix);

    state_matrix7 = SAES_ShiftRow(state_matrix6);

    state_matrix8 = SAES_AddRoundKey(state_matrix7, K2);

    output_block = SAES_FromStateMatrix(state_matrix8);

    return output_block;

#
# Encrypts one plaintext block with key K
#
def SAES_Encrypt2(plaintext, K):

    # get the key schedule
    (K0, K1, K2) = SAES_KeyExpansion(K);

    output = SAES_EncryptDecrypt( plaintext, MixColumns_matrix,
                                  SBox_matrix, K0, K1, K2);

    return output;

    
#
# Decrypts one ciphertext block with key K
#
def SAES_Decrypt2(ciphertext, K):

    # get the key schedule
    (K2, K1, K0) = SAES_KeyExpansion(K);

    # apply inverse mix columns matrix to the middle key
    K1_matrix0 = SAES_ToStateMatrix(K1);
    K1_matrix1 = SAES_ApplyMixColumnsMatrix(K1_matrix0, InverseMixColumns_matrix);
    K1 = SAES_FromStateMatrix(K1_matrix1);

    output = SAES_EncryptDecrypt( ciphertext, InverseMixColumns_matrix,
                                        InverseSBox_matrix, K0, K1, K2);

    return output;
    