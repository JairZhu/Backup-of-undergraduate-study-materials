# Answer to question 2 part (a)
def generate_domain_parameters(B):
   p = 1
   while not is_prime(p):
       q = random_prime(floor(B/2))
       p = 2*q + 1

   F = GF(p)

   g = randint(2,p-1)

   while 1 != F(g)^q:
       g = randint(2,p-1)

   return (p, q, g, F)


# Answer to question 2 part (b)
def generate_public_private_pair(p, q, g, F):

   x = randint(2,q-1)

   g = F(g)

   X  = g^x

   return (X, x)


# Answer to question 2 part (c)
def generate_secret(X, y):

   return X^y
