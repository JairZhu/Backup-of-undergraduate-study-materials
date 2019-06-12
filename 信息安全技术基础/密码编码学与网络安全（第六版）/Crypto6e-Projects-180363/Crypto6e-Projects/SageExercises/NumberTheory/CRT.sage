#
#   Cryptography and Network Security, 5th ed
#   by William Stallings
#
#   Programming Examples: Chinese Remainder Theorem
#
#   Author: Dan Shumow, 2009
#



def chinese_remainder_theorem(moduli, residues):
    r"""

    Function that implements the chinese remainder theorem.

    INPUT:

        moduli - list or positive integers

        residues - list of remainders such that remainder at position j results when divided by the corresponding modulus at position j in moduli

    OUTPUT:

        x - integer such that division by moduli[j] gives remainder residue[j]

    """
    if (len(moduli) != len(residues)):
        raise ValueError, "expected len(moduli) == len(residues)"

    M = prod(moduli);

    x = 0;

    for j in xrange(len(moduli)):
        Mj = moduli[j]
        Mpr = M/Mj
        
        (Mj_Mpr_gcd, Mpr_inv, Mj_inv) = xgcd(Mpr, Mj)  

        Mpr_inv = Mpr_inv
        
        if (Mj_Mpr_gcd != 1):
            raise ValueError, "Expected all moduli are coprime."

        x += residues[j]*Mpr*Mpr_inv;

    return x;