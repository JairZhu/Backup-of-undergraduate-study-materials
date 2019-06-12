# solution to Question (2) (a)

#
# Verifies a user's DSA signature
# given p, q, g, H, r, and s
#
def DSA_verify(p, q, g, y, H, r, s):

    F = GF(p)

    w = xgcd(s, q)[1] % q

    u1 = H*w % q

    u2 = r*w % q

    v = F(g)^u1 * F(y)^u2
    v = v.lift() % q

    return (v == r)

