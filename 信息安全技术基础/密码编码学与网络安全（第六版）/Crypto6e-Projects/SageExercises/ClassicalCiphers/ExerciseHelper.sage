
en_alphabet = "abcdefghijklmnopqrstuvwxyz"

#
# This function converts a single character into its numeric value 
#
def is_alphabetic_char(c):
    return (c.lower() in en_alphabet)

#
# This function returns true if and only if the character c is an alphabetic character
#
def char_to_num(c):
    return en_alphabet.index(c.lower())

#
# This function returns returns the character corresponding to x mod 26
# in the english alphabet
#
def num_to_char(x):
    return en_alphabet[x % 26]
