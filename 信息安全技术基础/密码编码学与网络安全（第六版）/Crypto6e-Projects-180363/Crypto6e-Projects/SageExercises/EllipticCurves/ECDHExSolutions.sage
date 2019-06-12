
def generate_public_private_pair(E, G):

    x = randint(1,E.order()-1)
    
    X = x*G
    
    return (x, X)

# solution to Question 2 part (c)
def generate_secret(Y, x):

    return x*Y
