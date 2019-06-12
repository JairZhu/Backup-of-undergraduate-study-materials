#ifndef decrytion_h
#define decrytion_h

#include "utility.h"
//===========位段结构体，用于BitStream的操作===========
struct packed_data 
{
	unsigned No_1:1;
	unsigned No_2:1;
	unsigned No_3:1;
	unsigned No_4:1;
	unsigned No_5:1;
	unsigned No_6:1;
	unsigned No_7:1;
	unsigned No_8:1;
};


//===========以下几个是方便对BitStream操作的几个工具函数===========
//----将Char转换成BitStream----
void ToBitStream(char& ini_char,packed_data& ini_char_bitstream);
//----将BitStream转换成Char----
void ToChar(packed_data& ini_char_bitstream,char& ini_char);
//----实现BitStream互相拷贝----
void CopyBitStream(packed_data& to,packed_data& from);
//----打印显示BitStream----
void PrintBitStream(packed_data& toprintbitstream);

//===========由用户输入原始密码，得到K1&K2===========
void GenerateKey(packed_data& K1,packed_data& K2);


//============以下是DES解密过程各类函数===========
//----IP----
void IP(packed_data& plaintext_bitstream);
//----Reverse IP----
void ReverseIP(packed_data& plaintext_bitstream);
//----E/P----
void EP(packed_data& right_plaintext_bitstream,packed_data& EP_bitstream);
//----E/P XOR K1----
void XOR1(packed_data& EP_bitstream,packed_data& K1_bitstream,packed_data& EP_XOR_K1_bitstream);
//----密码盒S0----
void S0(packed_data& left_EP_XOR_K1_bitstream,packed_data& S0_twobit_output);
//----密码盒S1----
void S1(packed_data& right_EP_XOR_K1_bitstream,packed_data& S1_twobit_output);
//----P4----
void P4(packed_data& S0S1_output);
//----p4 XOR 明文左半部分----
void XOR2(packed_data& S0S1_output,packed_data& left_plaintext_bitstream,packed_data& left_XOR_S0S1_bitstream);
//----SW----
void SW(packed_data& left_XOR_S0S1_bitstream,packed_data& right_plaintext_bitstream,packed_data& second_plaintext_bitstream);


//============以下是DES解密过程===========
//----DES解密----
void Decryption(packed_data& ciphertext,packed_data& plaintext,packed_data& K1,packed_data& K2);


#endif