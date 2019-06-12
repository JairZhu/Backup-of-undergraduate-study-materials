README

In this folder you will find the following files:

- tempdes.c : is a sample code for encrypting / decrypting using DES
- temprsa.c : is a sample code for encrypting / decrypting using RSA
- tempsha1.c : is a sample code for digest generation using SHA1
- test.txt,test2.txt,test3.txt: are sample plain text files to test your code
- test.des,test2.des,test3.des: are DES encrypted versions of files test.txt,test2.txt,test3.txt. 
  Key and IV values used are as follows.
	- Key = 40fedf386da13d57 (Hexadecimal values)
	- IV  = fedcba9876543210 (Hexadecimal values)
- func_desc.txt: Brief description of built in functions you are allowed to
  use.

All the c codes can be compiled and executed using the following commands:

- In the linux command line, execute "gcc -o tempdes tempdes.c -lcrypto", where tempdes.c 
is the source code and tempdes is the name of the executable that sill be generated This 
command will compile your code and generate an executable.
- To execute the program you just created (tempdes in our example), in the linux command 
line write "./tempdes"
