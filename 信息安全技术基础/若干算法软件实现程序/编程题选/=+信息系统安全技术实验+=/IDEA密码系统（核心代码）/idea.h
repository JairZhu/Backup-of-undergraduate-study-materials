#ifndef idea_h
#define idea_h

#include "utility.h"

typedef int INT32;
typedef char INT8;
typedef unsigned char ULONG8;
typedef unsigned short ULONG16;
typedef unsigned long ULONG32;

#define SUCCESS 0 
#define FAIL -1

#define _USEDFINDTABLE_ 1 /*是否采用查表实现*/

/*解密时密钥的换位表*/
//ULONG16 outkey[52] = { 0 };

static ULONG8 wz_spkey[52] = { 
       48,49,50,51,46,47,
	   42,44,43,45,40,41,/*解密密钥配置,2,3位要交换:44<->43*/
	   36,38,37,39,34,35,/*解密密钥配置,2,3位要交换:38<->37*/
	   30,32,31,33,28,29,/*解密密钥配置,2,3位要交换:32<->31*/
	   24,26,25,27,22,23,/*解密密钥配置,2,3位要交换:26<->25*/
	   18,20,19,21,16,17,/*解密密钥配置,2,3位要交换:20<->19*/
	   12,14,13,15,10,11,/*解密密钥配置,2,3位要交换:14<->13*/
	    6, 8, 7, 9, 4, 5,/*解密密钥配置,2,3位要交换:8<->7*/
	    0, 1, 2, 3
};

static ULONG8 wz_spmulrevr[18] = {/*变乘法逆的位*/
        0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51
};

static ULONG8 wz_spaddrever[18] ={/*变加法逆的位*/
        1,2,7,8,13,14,19,20,25,26,31,32,37,38,43,44,49,50
};
//-------------------------------------------------------------------

ULONG16 MUL( ULONG16 a, ULONG16 b);/*乘法运算(a*b)mod(0x10001)*/

INT32 handle_data( ULONG16 *data, /*待加密的64位数据首地址*/
                   ULONG16 *key /* 6组本轮使用的16位长的密钥首地址*/);

INT32 idea_dec( ULONG16 *data, /*待解密的64位数据首地址*/ 
                ULONG16 *outkey/*解密密钥的首地址*/);

INT32 idea_enc( ULONG16 *data, /*待加密的64位数据首地址*/
                ULONG16 *outkey/*解密密钥的首地址*/);

//-------------------------------------------------------------------
ULONG16 mulInv( ULONG16 x);/*取x的(%0x10001L)乘法逆*/

INT32 key_leftmove(ULONG32 *inkey);/*密钥左移位运算*/

INT32 key_decryExp(ULONG16 *outkey);/*解密密钥的变逆处理*/

INT32 idea_makekey( ULONG32 *inkey,/*用户输入的128位密钥首地址*/
                    ULONG16 *outkey/*生成的52组16位密钥的首地址*/);

INT32 idea_MakeEncKey(ULONG16 *key, ULONG16 *outkey);/*加密密钥*/

INT32 idea_MakeDecKey(ULONG16 *key, ULONG16 *outkey);/*解密密钥*/

//-------------------------------------------------------------------

#endif