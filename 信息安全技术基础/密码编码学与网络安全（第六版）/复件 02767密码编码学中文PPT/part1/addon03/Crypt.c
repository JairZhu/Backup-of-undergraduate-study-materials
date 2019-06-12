// gcc a.c -lcrypt
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
main(int argc,char **argv)
{
        if (argc!=3) exit(0);
        printf("%s\n", crypt(argv[1],argv[2]));

}
