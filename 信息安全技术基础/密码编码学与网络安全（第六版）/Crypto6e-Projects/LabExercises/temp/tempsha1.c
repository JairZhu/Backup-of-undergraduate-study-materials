#include <openssl/sha.h>
#include <fcntl.h>
#include <sys/stat.h>


int main()
{
	int i;
	unsigned char rbuff[]="SHA-1 Clear Text";
	unsigned char wbuff[20];
	SHA_CTX	c;

	memset(wbuff,0,sizeof(wbuff));

	SHA1_Init(&c);
	SHA1_Update(&c,rbuff,sizeof(rbuff));
	SHA1_Final(wbuff,&c);

	printf("Clear text: %s\n",rbuff);
	printf("SHA-1 digest:");
	for (i=0;i<sizeof(wbuff);i++)
		printf("%x",wbuff[i]);
	printf("\n");
}
