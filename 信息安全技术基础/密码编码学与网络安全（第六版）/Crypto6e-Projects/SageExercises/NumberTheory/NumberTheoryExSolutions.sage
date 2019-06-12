#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Solutions to Number Theory Exercises
#
#   Author: Dan Shumow, 2009
#


#
# This function is the solution to the Euler's Phi function
# implementation question
#
def EulerPhi(n):
    r"""
    Euler's Phi Function for calcluating the number of positive integers less than n
    that are relatively prime to n. 
    """
    
    n_factored = factor(n);

    output = 1

    for j in xrange(len(n_factored)):
        pj = n_factored[j][0]
        ej = n_factored[j][1]

        output = output*(p^e - p^(e-1))

    return output


#
# These functions are the solution to the Miller Rabin question
# that tests with a list of witness.
#
def MillerRabinWitnessTest(n, q, k, a):
    # if a^q mod n == 1 then return inconclusive
    if (1 == a^q):
        return True

    # (3) for j = 0 to k-1 do: if a^(2^j * q) mod n = n-1 return inconclusive
    e = q
    for j in xrange(k):
        if (n-1) == (a^e):
            return True
        e = 2*e

    # (4) if you've made it here return composite.
    return False
    

def MillerRabinWitnessListTest(n, witnesses):
    r"""
    Given a list of witnesses a this runs the Miller-Rabin witness test on each one.
    Returns True if n is prime with high probability, 
    otherwise returns false.
    """
    
    R = IntegerModRing(n);
    
    q = n-1
    k = 0
    while (1 == (q % 2)):
        k += 1
        q = q.quo_rem(2)[0] # q/2 but with result of type Integer
    
    could_be_prime = True;

    for j in xrange(len(witnesses)):

        a = R(witnesses[j])

        could_be_prime = could_be_prime and MillerRabinWitnessTest(n, q, k, a)

    return could_be_prime
 

#
# This function is the solution to the question to reduce breaking BBS to factoring
#
def BreakBBSWithFactors(X, p, q):
    r"""
    Given an output of a BlumBlumShub PRNG
    and p,q, factorization of N (where p,q are both 3 mod 4):
    Returns the previous state of the BlumBlumShub RNG.
    """

    Fp = GF(p)
    Fq = GF(q)

    Xp = Fp(X)
    Xq = Fq(X)

    Xp_sqrt = Xp^((p+1)/4) # or Xp_sqrt = Xp.sqrt()
    Xq_sqrt = Xq^((q+1)/4) # or Xq_sqrt = Xq.sqrt()

    M = [p,q];

    sqrt0 = [Xp_sqrt.lift(), Xq_sqrt.lift()]
    sqrt1 = [-Xp_sqrt.lift(), Xq_sqrt.lift()]
    sqrt2 = [Xp_sqrt.lift(), -Xq_sqrt.lift()]
    sqrt3 = [-Xp_sqrt.lift(), -Xq_sqrt.lift()]

    return [CRT_list(sqrt0, M), CRT_list(sqrt1, M), CRT_list(sqrt2, M), CRT_list(sqrt3, M)]


#
# These functions are the solutions to the question about fixed window exponentiation
#
def GeneratePowerTable(x, N, b):
    r"""
    Given an integer x, modulus N, and base b
    this creates a list of length b
    where the the element at index i (for i=0,1,2,...,b-1)
    is x^i mod N
    """

    power_table = [0 for j in xrange(b)]
    
    for j in xrange(b):
        j = Integer(j)
        power_table[j] = ModExp(x, j, N)

    return power_table


def FixedWindowExp(x, e, N, b):
    r"""
    Given an integer x, exponent e,
    modulus N, and base b
    this function performs a fixed window exponentiation with base b
    """

    power_table = GeneratePowerTable(x, N, b)

    exp_t = e
    exp_list = []

    # preprocess the exponent into a list with base b
    while (0 != exp_t):
        (exp_t, r) = exp_t.quo_rem(b)
        exp_list.append(r)

    exp_list_c = len(exp_list)

    ret = 1

    for j in xrange(exp_list_c):
        ret = ModExp(ret, b, N)
        offset = exp_list[exp_list_c - j - 1]
        ret = (ret*power_table[offset]) % N

    return ret


#
# This question is the solution to the Dual DL RNG Question
#
def DualDLGenerateParameters(n):
    r"""
    This function instantiates a Dual Discrete Log RNG state
    The state is a list and it consists of several values:
    [n, q, p, X, Y, state]

    n is the bit length of p

    p is a prime modulus such that p = 2*q + 1

    X,Y are randomly chosen points of order q mod p.
    
    state is a random value mod q.

    """

    if (n < 17):
        raise ValueError, "n is too small, must be at least 17"

    # find valid primes p and q.
    p = 1
    while (not is_prime(p)):

        q = 1

        while (q < 2^(n-2)):
            q = random_prime(2^(n-1))

        p = 2*q + 1

    X = 1
    while (1 == X):
        X = randint(2, p-1)
        X = X*X % p

    Y = 1
    while (1 == Y):
        Y = randint(2, p-1)
        Y = Y*Y % p

    state = Integer(randint(2, q-1))

    ret = [n, p, q, X, Y, state]

    return ret


def DualDLSetup(p, q, X, Y):

    state = Integer(randint(2, q-1))

    ret = [p, q, X, Y, state]

    return ret


def DualDLGenerate(rng_state):
    r"""
    Generates a single output of the Dual DL Rng.
    """

    p = rng_state[0]
    q = rng_state[1]
    X = rng_state[2]
    Y = rng_state[3]
    state = rng_state[4]

    temp = ModExp(X, state, p) % q

    next_state = temp

    output = ModExp(Y, temp, p)

    # update the next state
    rng_state[4] = next_state

    return output


def DualDLSetupWithBackdoor(p, q, X):

    state = Integer(randint(2, q-1))

    backdoor_inv = Integer(randint(2, q-1))

    backdoor = xgcd(backdoor_inv,q)[1] % q

    Y = ModExp(X, backdoor_inv, p)

    rngstate = [p, q, X, Y, state]

    return (rngstate, backdoor)


def DualDLPredictNextOutput(p, X, Y, output, backdoor):
    r"""
    Given p, X, Y, one block out output and the backdoor,
    
    """

    nexttemp = ModExp(output, backdoor, p)
    nextoutput = ModExp(Y, nexttemp, p)

    return nextoutput


def DualDLGenerateWithFix(rng_state):
    r"""
    Generates a single output of the Dual DL Rng.
    Fixes the forward security attack by truncating off the MSB from the output.
    """

    p = rng_state[0]
    q = rng_state[1]
    X = rng_state[2]
    Y = rng_state[3]
    state = rng_state[4]

    n = p.nbits()
    mask = 2^((n - (n%2))/2) - 1

    temp1 = ModExp(X, state, p) % q

    next_state = temp1

    temp2 = ModExp(Y, temp1, p)

    output = mask & temp2

    # update the next state
    rng_state[4] = next_state

    return output


#
# Solutions to exercise on the CRT
#

CRT_precompute(moduli):
    
    

    M = prod(moduli)

    Marray = [0 for j in xrange(len(moduli))]
    
    for j in xrange(len(moduli)):
        Mpr = ZZ(M/moduli[j])

        Mpr_inv = xgcd(Mpr, moduli[j])[1]

        Marray[j] = Mpr*Mpr_inv % M

    return (Marray, M)


CRT_reconstruct_from_precomp(precomp_array, residues, M):

    X = 0

    for j in xrange(len(precomp_array)):
        X += precomp_array[j]*residues[j]

    X = X % M

    return X

