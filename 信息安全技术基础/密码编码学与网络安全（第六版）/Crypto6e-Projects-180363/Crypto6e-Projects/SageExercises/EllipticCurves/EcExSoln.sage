#
# Solution to Question 1
#

# solution to part a

def DualECDL_prng_x_coord(point):

    return point.xy()[0].lift()

def DualECDL_prng_truncate(x, m):

    return x & (2^m - 1)


def DualECDL_prng(rng_state):

    E = rng_state[0]
    P = rng_state[1]
    Q = rng_state[2]
    si = rng_state[3]

    n = E.base_ring().characteristic().nbits()

    ti = si

    next_si = DualECDL_prng_x_coord(ti*P)

    ri = DualECDL_prng_x_coord(ti*Q)
    oi = DualECDL_prng_truncate(ri, n-8)

    rng_state[3] = next_si

    return oi


# solution to part b

def DualECDL_reinflate_points(E, oi):

    p = E.base_ring().characteristic()

    n = p.nbits()

    m = n-8

    potential_points = []

    Epoly = E.defining_polynomial()

    for j in xrange(2^8):

        x_coord = j*2^m + oi

        if (x_coord > p):
            break

        Ept = Epoly.subs(x=x_coord, z=1).univariate_polynomial()

        if (not Ept.is_irreducible()):
            y_coord = Ept.roots()[0][0]
            P1 = E((x_coord, y_coord))
            P2 = E((x_coord, -y_coord))
            potential_points.append(P1)
            potential_points.append(P2)

    return potential_points


# solution to part c

def DualECDL_predict_next_state(E, trapdoor, oi):

    points = DualECDL_reinflate_points(E, oi)

    states = []

    for j in xrange(len(points)):
        next_si = DualECDL_prng_x_coord(trapdoor*points[j])
        if not next_si in states:
            states.append(next_si)
    
    return states


# solution to part d

def DualECDL_narrow_state_guess(E, P, Q, trapdoor, o1, o2):

    states1 = DualECDL_predict_next_state(E, trapdoor, o1)

    states2 = []

    rng_state = [E, P, Q, 0]

    for j in xrange(len(states1)):

        rng_state[3] = states1[j]

        possible_o2 = DualECDL_prng(rng_state)

        if (possible_o2 == o2):
            states2.append(rng_state[3])

    return states2

