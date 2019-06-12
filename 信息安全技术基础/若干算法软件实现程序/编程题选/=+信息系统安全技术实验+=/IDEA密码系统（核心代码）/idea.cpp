#include "idea.h"
/************************解密*******************************/
INT32 idea_dec( ULONG16 *data, /*待解密的64位数据首地址 */ 
                ULONG16 *outkey/*解密密钥的首地址*/)
{
   ULONG32 i;
   ULONG16 tmp;
   if( NULL == data || NULL == outkey){
      return FAIL;
   }

   for( i = 0 ; i < 48 ; i += 6)/*8轮迭代*/
   {
	   handle_data( data , &outkey[i]);
       /*交换中间两个*/
       tmp = data[1];
       data[1] = data[2];
       data[2] = tmp;
   }

  data[0] = MUL(data[0],outkey[48]);
  data[1] += outkey[49];
  data[2] += outkey[50];
  data[3] = MUL(data[3],outkey[51]); 

  return SUCCESS;
}

//************************加密*******************************
INT32 idea_enc( ULONG16 *data, /*待加密的64位数据首地址*/
                ULONG16 *outkey/*解密密钥的首地址*/)
{
   ULONG32 i ;
   ULONG16 tmp;
  
   if( NULL == data || NULL == outkey){
      return FAIL;
   }
   
   for( i = 0 ; i < 48 ; i += 6)/*8轮迭代*/
   {
      handle_data( data, &outkey[i]);
      /*交换中间两个*/
      tmp = data[1];
      data[1] = data[2];
      data[2] = tmp;
   }

   /*总输出变换*/
   data[0] = MUL(data[0],outkey[48]);
   data[1] += outkey[49];
   data[2] += outkey[50];
   data[3] = MUL(data[3],outkey[51]); 
  
  return SUCCESS;
}

//************************一次迭代*******************************

ULONG16 MUL( ULONG16 a, ULONG16 b)
{
   ULONG32 p;
   if( a == 0 && b == 0 )
   {
	   p = 0 ;
   }else if ( a == 0 )
   {
	   p = 65536*(ULONG32)b;
   }else if ( b == 0)
   {
	   p = 65536*(ULONG32)a;
   }else
   {
	   p = (ULONG32)a*(ULONG32)b;
   }

   return (ULONG16 )(p%65537);

}

INT32 handle_data( ULONG16 *data, /*待加密的64位数据首地址*/
                   ULONG16 *key /* 6组本轮使用的16位长的密钥首地址*/)
{
   ULONG16 *D1,*D2,*D3,*D4;
   ULONG16 D57;/*提供给第5,7步用的暂存数据的*/
   ULONG16 D68;/*提供给第6,8,9,10步用的暂存数据的*/
   
   D1 = &data[0];
   D2 = &data[1];
   D3 = &data[2];
   D4 = &data[3];
   
   /*一次迭代过程*/
   *D1 = MUL(*D1,key[0]);/*第1步*/ 
   *D2 += key[1];/*第2步*/  
   *D3 += key[2];/*第3步*/
   *D4 = MUL(*D4,key[3]);/*第4步*/ 
   D57 = *D1 ^ *D3;/*第5步*/
   D68 = *D2 ^ *D4;/*第6步*/
   D57 = MUL(D57,key[4]);/*第7步*/
   D68 += D57;/*第8步*/
   D68 = MUL(D68,key[5]);/*第9步*/
   *D1 ^= D68;/*第11步*/
   *D3 ^= D68;/*第12步*/
   D68 += D57;/*第10步*/
   *D2 ^= D68;/*第13步*/
   *D4 ^= D68;/*第14步*/
   
   return SUCCESS;
}

//--------------------------------------------------------------------
//***********************密钥左环移25位*******************************
INT32 key_leftmove(ULONG32 *inkey)
{
   ULONG32 itmpfirst = 0,itmp = 0 ;
   ULONG32 i;
   
   inkey[0] = (inkey[0]<<25) | (inkey[0]>>7);
   /*取低25位,因为前面已经做了环移,原始的低7位已经移到了高位,保存*/
   itmpfirst = inkey[0]&0x1ffffff;
   inkey[0] &= 0xfe000000;/*低25位清0*/

   for ( i = 1 ; i < 4 ; i++)
   {
    inkey[i] = (inkey[i]<<25) | (inkey[i]>>7);
    itmp = inkey[i] & 0x1ffffff;
    inkey[i-1] |= itmp;
    inkey[i] &= 0xfe000000;/*低25位清0*/
   }
   
   inkey[i-1] |= itmpfirst;/*把最高25位移到最低25位*/
   
   return SUCCESS;
}

//****************************产生密钥*******************************
INT32 idea_makekey( ULONG32 *inkey,/*用户输入的128位密钥首地址*/
                    ULONG16 *outkey/*生成的52组16位密钥的首地址*/)
{
   ULONG32 i,j,k;
   ULONG16 *Pkey = ( ULONG16*)inkey;
   
   for(i = 0 ; i < 6; i++){
      k = i << 3; 
      for( j = 0 ; j < 8 ; j++)/*生成8组密钥*/
	  {
		  outkey[k+j] = Pkey[j] ;
	  }
      
	  key_leftmove(inkey);/*128位密钥左环移25位*/
   }

   for( i = 0 ; i < 4; i++)
   {
      outkey[48+i] = Pkey[i] ; 
   }
   
   return SUCCESS;
}

//****************************Mod(0x10001)的逆元素求解*******************************
ULONG16 mulInv( ULONG16 x)
{
  long n1,n2,q,r,b1,b2,t;
  if(x == 0)
	  b2 = 0;
  else {
      n1 = 65537;n2 = x;b1 = 0;b2 = 1;
	  do{
		  r = (n1%n2);
		  q = (n1 - r)/n2;
          if(r == 0){ 	  
			  if(b2 < 0)b2 = b2 + 65537;
			  break;
          } else
		  {
		  n1 = n2;
		  n2 = r;
		   t = b2;
		  b2 = b1 - q*b2;
		  b1 = t;
		  }
	  }while(r != 0);
  }

  return ULONG16(b2);
}

//************************解密密钥的变逆处理*******************************
INT32 key_decryExp(ULONG16 *outkey)
{
   /*用查表的方法实现换位,当然也可以采用一些编程技巧直接实现*/
#if _USEDFINDTABLE_ /*用查表法*/
   ULONG16 tmpkey[52] = { 0 };
   ULONG32 i;
   
   for( i = 0 ; i < 52 ; i++)
   {
      tmpkey[i] = outkey[ wz_spkey[i] ] ;/*换位*/
   }

   for( i = 0 ; i < 52 ; i++)
   {
      outkey[i] = tmpkey[i];
   }

   for( i = 0 ; i < 18 ; i++)
   {
      outkey[wz_spaddrever[i]] = 65536 -outkey[wz_spaddrever[i]] ;/*替换成加法逆*/
   }

   for( i = 0 ; i < 18 ; i++)
   { 
      outkey[wz_spmulrevr[i]] = mulInv(outkey[wz_spmulrevr[i]] );/*替换成乘法逆*/ 
   }
#else 
   ULONG16 K1, K2, K3, K4, i;
   ULONG16 tmpkey[52] = { 0 };
   ULONG16 *pin = outkey ;
   
   ULONG16 *p = tmpkey + 52; /* 从后往前 */
   K1 = mulInv(*pin);
   K2 = 65536 - *++pin;
   K3 = 65536 - *++pin;
   K4 = mulInv(*++pin);
   
   pin++;
   *--p = K4;
   *--p = K3;
   *--p = K2;
   *--p = K1;
   
   for(i = 0 ; i < 7; i++)
   {
	  K1 = *pin++;/*不变的两个*/
	  K2 = *pin++;
	  *--p = K2;
	  *--p = K1;
	  
	  K1 = mulInv(*pin);
      K2 = 65536 - *++pin;
      K3 = 65536 - *++pin;
      K4 = mulInv(*++pin);
      
	  pin++;
      *--p = K4;
      *--p = K2; /* 交换 */
      *--p = K3;
      *--p = K1;
   }
   
   K1 = *pin++;/*最后一组不交换*/
   K2 = *pin++;
   *--p = K2;
   *--p = K1;

   K1 = mulInv(*pin);
   K2 = 65536 - *++pin;
   K3 = 65536 - *++pin;
   K4 = mulInv(*++pin);
   *--p = K4;
   *--p = K3;
   *--p = K2;
   *--p = K1;
   
   for(i = 0 ; i < 52 ; i++)
   {
      outkey[i] = tmpkey[i];
   }

#endif
    
   return SUCCESS;
}

//************************加密密钥的产生*******************************
INT32 idea_MakeEncKey(ULONG16 *key, ULONG16 *outkey)
{
   if(NULL == outkey || NULL == key)
   {
      return FAIL;
   }

   idea_makekey( (ULONG32*)key , outkey); 
   
   return SUCCESS;
}

//************************解密密钥的产生*******************************
INT32 idea_MakeDecKey(ULONG16 *key, ULONG16 *outkey)
{
   if ( NULL == outkey || NULL == key)
   {
     return FAIL;
   }

   idea_makekey( (ULONG32*)key , outkey);
   key_decryExp(outkey); 

   return SUCCESS;
}
