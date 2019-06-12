#include <openssl/crypto.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>

int main()
{
	RSA *key;
	unsigned char rbuff[] = "RSA Clear Text";
	unsigned char wbuff[256];
	unsigned char exbuff[256];
	int num,i;
	static const char rnd_seed[] = "string to make the random number generator think it has entropy";

	printf("Clear Text: %s\n",rbuff);

	memset(wbuff,0,sizeof(wbuff));
	memset(exbuff,0,sizeof(exbuff));
	RAND_seed(rnd_seed, sizeof rnd_seed);
	if( (key = RSA_generate_key(2048,3,NULL,NULL)) == NULL)
		printf("\nerror generating key\n");

    	num = RSA_public_encrypt(sizeof(rbuff),rbuff,wbuff,key,RSA_PKCS1_PADDING);

	printf("RSA Encryption:");
	for(i=0;i<num;i++)
		printf("%x",wbuff[i]);	
	printf("\n");

    	num = RSA_private_decrypt(sizeof(wbuff),wbuff,exbuff,key,RSA_PKCS1_PADDING);

    	RSA_free(key);
}
