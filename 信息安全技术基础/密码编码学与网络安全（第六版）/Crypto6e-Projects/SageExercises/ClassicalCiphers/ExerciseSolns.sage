attach ExerciseHelper.sage

#
# The following are solutions to the first question
#

# solution to part a: Encrypt / Decrypt functions

def CaesarEncrypt(k, plaintext):

    ciphertext = ""

    for j in xrange(len(plaintext)):

        p = plaintext[j]

        if is_alphabetic_char(p):
            x = (k + char_to_num(p)) % 26
            c = num_to_char(x)
        else:
            c = p

        ciphertext += c

    return ciphertext


def CaesarDecrypt(k, ciphertext):

    plaintext = ""

    for j in xrange(len(ciphertext)):

        c =  ciphertext[j]

        if is_alphabetic_char(c):
            x = (char_to_num(c) - k) % 26
            p = num_to_char(x)
        else:
            p = c

        plaintext += p

    return plaintext


# solution to part b: brute force attack

def BruteForceAttack(ciphertext, keyword=None):

    for k in xrange(26):
        plaintext = CaesarDecrypt(k, ciphertext)

        if (None==keyword) or (keyword in plaintext):
            print "key", k, "decryption", plaintext

    return

#
# solution to problem 2
#

def AffineEncrypt(k, plaintext):

    (a, b) = k

    ciphertext = ""

    for j in xrange(len(plaintext)):
        p = plaintext[j]

        if is_alphabetic_char(p):
            x = (a*char_to_num(p) + b) % 26
            c = num_to_char(x)
        else:
            c = p

        ciphertext += c

    return ciphertext


def AffineDecrypt(k, ciphertext):

    (a, b) = k

    ainv = xgcd(a,26)[1]

    plaintext = ""

    for j in xrange(len(ciphertext)):

        c = ciphertext[j]

        if is_alphabetic_char(c):
            x = ainv*(char_to_num(c) - b) % 26
            p = num_to_char(x)
        else:
            p = c

        plaintext += p

    return plaintext


#
# Solutions for problem 3
#

# solution to part a

def incidence_pairs_key(x):
    return x[1]


def compute_incidence(ciphertext):

    incidence_counts = [0 for j in xrange(26)]
    alphabetic_char_count = 0

    for j in xrange(len(ciphertext)):

        c = ciphertext[j]
        if is_alphabetic_char(c):
            x = char_to_num(c)
            incidence_counts[x] += 1
            alphabetic_char_count += 1

    incidence_pairs = [(num_to_char(j), float(incidence_counts[j])/float(alphabetic_char_count)) \
                       for j in xrange(26)]

    incidence_pairs.sort(key=incidence_pairs_key, reverse=True)

    return incidence_pairs

# solution to part b

def monoalphabetic_substitution(text, subs):

    outtext = ""

    for j in xrange(len(text)):

        c = text[j]

        oc = c

        if is_alphabetic_char(c):

            x = char_to_num(c)
            tc = subs[x]

            if ('_' == tc):
                oc = c.upper()
            else:
                oc = tc.lower()

        outtext += oc        

    return outtext

#
# Solution to Question 4
#

# Solution to part a: 2x2 hill cipher

def validate_2x2_hill_key(M):

    if (M not in MatrixSpace(IntegerModRing(26), 2)):
        raise ValueError, "M must be a 2x2 matrix over the integers mod 26."
    if (not M.is_invertible()):
        raise ValueError, "M must be an invertible matrix."

    return True

def string_to_2x2_hill_block(in_string):

    if (2 != len(in_string)):
        raise ValueError, "in_string must be of length 2."

    pair = (char_to_num(in_string[0]), char_to_num(in_string[1]))

    FM = FreeModule(R, 2)

    return FM(pair)


def hill_2x2_process_text(intext, M):

    # strip out all nonalphabtic characters
    intxt_alpha_only = ""
    for j in xrange(len(intext)):
        if is_alphabetic_char(intext[j]):
            intxt_alpha_only += intext[j]

    # pad if necessary
    if (1 == len(intxt_alpha_only) % 2):
        intxt_alpha_only += 'a'

    num_blocks = len(intxt_alpha_only)/2

    outtext = ""

    for j in xrange(num_blocks):

        str_block = intxt_alpha_only[2*j] + intxt_alpha_only[2*j+1]
        vec = string_to_2x2_hill_block(str_block)

        out_vec = M*vec

        outtext += num_to_char(out_vec[0]) + num_to_char(out_vec[1])

    return outtext

def hill_2x2_encrypt(plaintext, K):

    validate_2x2_hill_key(K)

    return hill_2x2_process_text(plaintext, K)


def hill_2x2_decrypt(ciphertext, K):

    validate_2x2_hill_key(K)

    Kinv = K.inverse()

    return hill_2x2_process_text(ciphertext, Kinv)

#
# Solutions to problem 5: Hill cipher (general)
#

def validate_hill_key(K):

    m = K.nrows()

    if (K not in MatrixSpace(IntegerModRing(26), m)):
        raise ValueError, "Key must be square matrix over the integers mod 26."

    if (not K.is_invertible()):
        raise ValueError, "Key must be an invertible matrix."

    return m

def string_to_hill_block(in_string, m):

    instr_list = [char_to_num(in_string[j]) for j in xrange(m)]

    FM = FreeModule(R, m)

    return FM(instr_list)

def hill_block_to_string(in_block, m):

    outtxt = ""

    for j in xrange(m):
        outtxt += num_to_char(in_block[j])

    return outtxt

def hill_process_text(intext, M, m):

    # strip out all nonalphabetic characters
    intxt_alpha_only = ""

    for j in xrange(len(intext)):

        c = intext[j]

        if is_alphabetic_char(c):
            intxt_alpha_only += c

    # pad to make length a multiple of m
    len_rem_m = len(intxt_alpha_only) % m
    
    if (0 != len_rem_m):
        for j in xrange(m - len_rem_m):
            intxt_alpha_only += 'a'

    outtext = ""

    num_blocks = len(intxt_alpha_only) / m

    for j in xrange(num_blocks):

        this_block_str = intxt_alpha_only[j*m:(j+1)*m]
        vec = string_to_hill_block(this_block_str, m)

        out_vec = M*vec

        outtext += hill_block_to_string(out_vec, m)

    return outtext


def hill_encrypt(plaintext, K):

    m = validate_hill_key(K)

    return hill_process_text(plaintext, K, m)


def hill_decrypt(ciphertext, K):

    m = validate_hill_key(K)

    Kinv = K.inverse()

    return hill_process_text(ciphertext, Kinv, m)


#
# Solution 6: Known plaintext attack on Hill cipher
#

# solution to part a: known cipher text functions

def hill_known_plaintext_attack(plaintext, ciphertext, m):

    numblocks = len(plaintext)/m

    # initialize the plaintext blocks
    plaintext_blocks = [string_to_hill_block(plaintext[j*m:(j+1)*m], m) for j in xrange(numblocks)] 

    # initialize the ciphertext blocks
    ciphertext_blocks = [string_to_hill_block(ciphertext[j*m:(j+1)*m], m) for j in xrange(numblocks)] 

    MS = MatrixSpace(IntegerModRing(26), m)

    Mpt = MS(0)
    Mct = MS(0)

    found_invertible_matrices = False

    # iterate over the the combinations of the plaintext/ciphertext blocks
    for combin in combinations_iterator(range(numblocks), m):

        Mpt_list = [plaintext_blocks[x] for x in combin]

        Mct_list = [ciphertext_blocks[x] for x in combin]

        Mpt = MS(Mpt_list).transpose()

        Mct = MS(Mct_list).transpose()

        if (Mpt.is_invertible() and Mct.is_invertible()):
           found_invertible_matrices = True
           break 
        
    if not found_invertible_matrices:
        return MS(0)

    K = Mct*Mpt.inverse()

    return K

