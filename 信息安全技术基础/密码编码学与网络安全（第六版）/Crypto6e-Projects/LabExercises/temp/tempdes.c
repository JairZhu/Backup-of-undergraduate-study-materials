#include <openssl/des.h>

#define ENC 1
#define DEC 0

int main()
{
	int k;
	long	in[2];
	static unsigned char cbc_key[8] = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef};
	des_key_schedule key;

	if ((k = des_set_key_checked(&cbc_key,key)) != 0)
		printf("\nkey error\n");

	in[0] = 3212314;
	in[1] = 1231233;

	printf("DES Clear Text: %ld%ld\n",in[0],in[1]);
	des_encrypt1(in,key,ENC);

	printf("DES Encryption: %u%u\n",in[0],in[1]);

    	des_encrypt1(in,key,DEC);
}
