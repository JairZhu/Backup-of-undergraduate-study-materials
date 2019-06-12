
// some routine in OpenSSL.  by Linden 9:19 2003-4-11

//MD5:

int MD5_Init(MD5_CTX *c);
int MD5_Update(MD5_CTX *c, const void *data, unsigned long len);
int MD5_Final(unsigned char *md, MD5_CTX *c);
unsigned char *MD5(const unsigned char *d, unsigned long n, unsigned char *md);

//SHA1:
int SHA1_Init(SHA_CTX *c);
int SHA1_Update(SHA_CTX *c, const void *data, unsigned long len);
int SHA1_Final(unsigned char *md, SHA_CTX *c);
unsigned char *SHA1(const unsigned char *d, unsigned long n,unsigned char *md);

//...

//EVP_MD, 参见例子程序demo_hmac

const EVP_MD *EVP_md_null(void);
const EVP_MD *EVP_md2(void);
const EVP_MD *EVP_md4(void);
const EVP_MD *EVP_md5(void);
const EVP_MD *EVP_sha(void);
const EVP_MD *EVP_sha1(void);
const EVP_MD *EVP_dss(void);
const EVP_MD *EVP_dss1(void);
const EVP_MD *EVP_mdc2(void);
const EVP_MD *EVP_ripemd160(void);

// ..
const EVP_MD *evp_md_md5 = EVP_md5();
const EVP_MD *evp_md_sha1 = EVP_sha1();

unsigned char *p = HMAC(evp_md_md5, key, sizeof(key),
		    message,
			(int)strlen(message),
			md, &md_len);

