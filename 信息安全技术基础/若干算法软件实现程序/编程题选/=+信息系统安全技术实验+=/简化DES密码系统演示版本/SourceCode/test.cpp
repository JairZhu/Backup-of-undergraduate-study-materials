/**********************************************************************
*Function: 简单DES加密算法的实现
*Author:   吴丹 00234015 3号，软件工程2000级
*Date:     2003/4/20
*Version:  V1.0
***********************************************************************/
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


//===========由用户输入获得一字节的明文===========
void GetPlaintext(packed_data& plaintext);


//===========由用户输入原始密码，得到K1&K2===========
void GenerateKey(packed_data& K1,packed_data& K2);


//============以下是DES加密过程各类函数===========
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


//============以下是DES加密解密过程===========
//----DES加密----
void Encryption(packed_data& plaintext,packed_data& ciphertext,packed_data& K1,packed_data& K2);
//----DES解密----
void Decryption(packed_data& ciphertext,packed_data& plaintext,packed_data& K1,packed_data& K2);


//============驱动主函数============
int main()
{ 
    cout << "————++Simple DES Presentation Program++————" << endl
    	 << "|         <===========Welcome===========>         |" << endl
	     << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
         << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	     << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	     << "|_________________________________________________|" << endl;
    
	packed_data plaintext,ciphertext;  //明文&密文  
    packed_data K1,K2;                 //密钥K1&K2

//******************************产生密码******************************
	
	GenerateKey(K1,K2);                
    cout << "密钥如下:" << endl;
	cout << "K1 :";
	PrintBitStream(K1);
	cout << "K2 :";
	PrintBitStream(K2);
    cout << endl << endl;

//******************************产生明文******************************
	
	cout << "————++Simple DES Presentation Program++————" << endl
    	 << "|         <===========Welcome===========>         |" << endl
	     << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
         << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	     << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	     << "|_________________________________________________|" << endl;

	GetPlaintext(plaintext);    

//******************************加    密******************************
    cout << endl << endl
		 << "————++Simple DES Presentation Program++————" << endl
    	 << "|         <===========Welcome===========>         |" << endl
	     << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
         << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	     << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	     << "|_________________________________________________|" << endl;

	cout << "是否要进行DES加密[y,n]:  " << flush;
	char makesure;
	cin >> makesure;
	if(makesure == 'Y' || makesure == 'y'){
	
	   Encryption(plaintext,ciphertext,K1,K2);

//******************************解    密******************************
       cout << endl << endl
		    << "————++Simple DES Presentation Program++————" << endl
      	    << "|         <===========Welcome===========>         |" << endl
	        << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
            << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	        << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	        << "|_________________________________________________|" << endl;
	   cout << "是否要进行解密[y,n]:  " << flush;
	   char make_sure;
	   cin >> make_sure;
	   if(make_sure == 'Y' || make_sure == 'y'){
          Decryption(ciphertext,plaintext,K1,K2);
          cout << "Warning: DES加密&解密完成，程序退出!!!!!!" << endl;
	   }else cout << "Warning: DES加密完成，程序退出!!!!!!" << endl;
	}else cout << "Warning: DES加密未完成，程序退出!!!!!!" << endl;
    
	return 0;
}
void ToBitStream(char& ini_char,packed_data& ini_char_bitstream)
{
//**********以下将字符转换成位段bit stream**********
    ini_char_bitstream.No_1 = (ini_char&0200) >> 7;
	ini_char_bitstream.No_2 = (ini_char&0100) >> 6;
	ini_char_bitstream.No_3 = (ini_char&040) >> 5;
	ini_char_bitstream.No_4 = (ini_char&020) >> 4;
	ini_char_bitstream.No_5 = (ini_char&010) >> 3;
	ini_char_bitstream.No_6 = (ini_char&04) >> 2;
	ini_char_bitstream.No_7 = (ini_char&02) >> 1;
	ini_char_bitstream.No_8 = (ini_char&01) >> 0;
}
void ToChar(packed_data& ini_char_bitstream,char& ini_char)
{
//**********以下将位段bit stream 转换成字符**********
    ini_char = 'a';
	ini_char = ini_char&0;
	ini_char = ini_char|ini_char_bitstream.No_1 << 7;
	ini_char = ini_char|ini_char_bitstream.No_2 << 6;
	ini_char = ini_char|ini_char_bitstream.No_3 << 5;
	ini_char = ini_char|ini_char_bitstream.No_4 << 4;
	ini_char = ini_char|ini_char_bitstream.No_5 << 3;
	ini_char = ini_char|ini_char_bitstream.No_6 << 2;
	ini_char = ini_char|ini_char_bitstream.No_7 << 1;
	ini_char = ini_char|ini_char_bitstream.No_8 << 0;    
}
void CopyBitStream(packed_data& to,packed_data& from)
{
//**********以下将位段from拷贝至位段to**********
   to.No_1 = from.No_1;
   to.No_2 = from.No_2;
   to.No_3 = from.No_3;
   to.No_4 = from.No_4;
   to.No_5 = from.No_5;
   to.No_6 = from.No_6;
   to.No_7 = from.No_7;
   to.No_8 = from.No_8;
}
void PrintBitStream(packed_data& toprintbitstream)
{
//**********以下位段bit stream打印显示**********
	cout << toprintbitstream.No_1 << toprintbitstream.No_2
   	     << toprintbitstream.No_3 << toprintbitstream.No_4
	     << toprintbitstream.No_5 << toprintbitstream.No_6
	     << toprintbitstream.No_7 << toprintbitstream.No_8
		 << endl;
}
void GetPlaintext(packed_data& plaintext)
{
//**********以下由用户输入8位的明文**********  
  char ini_plaintext[9];  //8-bit的明文
  char make_sure;
  cout << "请输入8位明文(0和1的任意组合): " << flush;
  gets(ini_plaintext);
  while(strlen(ini_plaintext) != 8){
     cout << "明文长度不符!请重新输入8位明文(0和1的任意组合): " << flush;
     gets(ini_plaintext);
  }  
  cout << "您输入的8位明文是: " << ini_plaintext << endl;
  cout << "请确认[y,n]: " << flush;
  cin >> make_sure;
  while(make_sure != 'Y' && make_sure != 'y'){
     cout << "请输入8位明文(0和1的任意组合): " << flush;
     gets(ini_plaintext);
     while(strlen(ini_plaintext) != 8){
        cout << "明文长度不符!请重新输入8位明文(0和1的任意组合): " << flush;
        gets(ini_plaintext);
	 }  
     cout << "您输入的8位明文是: " << ini_plaintext << endl;
     cout << "请确认[y,n]: " << flush;
     cin >> make_sure;
  }  
  plaintext.No_1 = ini_plaintext[0]-'0';
  plaintext.No_2 = ini_plaintext[1]-'0';
  plaintext.No_3 = ini_plaintext[2]-'0';
  plaintext.No_4 = ini_plaintext[3]-'0';
  plaintext.No_5 = ini_plaintext[4]-'0';
  plaintext.No_6 = ini_plaintext[5]-'0';
  plaintext.No_7 = ini_plaintext[6]-'0';
  plaintext.No_8 = ini_plaintext[7]-'0';

  return;
}
void GenerateKey(packed_data& K1,packed_data& K2)
{
//**********以下产生密钥K1 和 K2**********
    struct key_data{
		unsigned No_1:1;
		unsigned No_2:1;
		unsigned No_3:1;
		unsigned No_4:1;
		unsigned No_5:1;
		unsigned No_6:1;
		unsigned No_7:1;
		unsigned No_8:1;
        unsigned No_9:1;
		unsigned No_10:1;
	};               //可进行位操作的位段
  char ini_key[11];  //10-bit的由用户输入的密码G(0和1的任意组合)
  key_data p10_key;  //对G作P10置换
//**********以下由用户输入密码G(0和1的任意组合)**********
  char make_sure;
  cout << "请输入原始10位密码G(0和1的任意组合): " << flush;
  gets(ini_key);
  while(strlen(ini_key) != 10){
     cout << "密码长度不符!请重新输入10位密码G(0和1的任意组合): " << flush;
     gets(ini_key);
  }  
  cout << "您输入的10位密码是: " << ini_key << endl;
  cout << "请确认[y,n]: " << flush;
  cin >> make_sure;
  while(make_sure != 'Y' && make_sure != 'y'){
     cout << "请输入原始10位密码G(0和1的任意组合): " << flush;
     gets(ini_key);
     while(strlen(ini_key) != 10){
        cout << "密码长度不符!请重新输入10位密码G(0和1的任意组合): " << flush;
        gets(ini_key);
	 }  
     cout << "您输入的10位密码是: " << ini_key << endl;
     cout << "请确认[y,n]: " << flush;
     cin >> make_sure;
  }  
//**********以下作P10=(3 5 2 7 4 10 1 9 8 6)置换**********
  p10_key.No_1 = ini_key[2]-'0';
  p10_key.No_2 = ini_key[4]-'0';
  p10_key.No_3 = ini_key[1]-'0';
  p10_key.No_4 = ini_key[6]-'0';
  p10_key.No_5 = ini_key[3]-'0';
  p10_key.No_6 = ini_key[9]-'0';
  p10_key.No_7 = ini_key[0]-'0';
  p10_key.No_8 = ini_key[8]-'0';
  p10_key.No_9 = ini_key[7]-'0';
  p10_key.No_10 = ini_key[5]-'0';
//**********以下作左半部分的循环左移一位:LS—1**********
  key_data Ls1_left_p10_key;
  Ls1_left_p10_key.No_1 = p10_key.No_2;
  Ls1_left_p10_key.No_2 = p10_key.No_3;
  Ls1_left_p10_key.No_3 = p10_key.No_4;
  Ls1_left_p10_key.No_4 = p10_key.No_5;
  Ls1_left_p10_key.No_5 = p10_key.No_1;
//**********以下作右半部分的循环左移一位:LS—1**********
  key_data Ls1_right_p10_key;
  Ls1_right_p10_key.No_1 = p10_key.No_7;
  Ls1_right_p10_key.No_2 = p10_key.No_8;
  Ls1_right_p10_key.No_3 = p10_key.No_9;
  Ls1_right_p10_key.No_4 = p10_key.No_10;
  Ls1_right_p10_key.No_5 = p10_key.No_6;
//**********以下作Q8 = (6 3 7 4 8 5 10 9)变换,得到K1*********
  K1.No_1 = Ls1_right_p10_key.No_1;
  K1.No_2 = Ls1_left_p10_key.No_3;
  K1.No_3 = Ls1_right_p10_key.No_2;
  K1.No_4 = Ls1_left_p10_key.No_4;
  K1.No_5 = Ls1_right_p10_key.No_3;
  K1.No_6 = Ls1_left_p10_key.No_5;
  K1.No_7 = Ls1_right_p10_key.No_5;
  K1.No_8 = Ls1_right_p10_key.No_4;
//**********以下作左半部分的循环左移二位:LS—2**********
  key_data Ls2_left_p10_key;
  Ls2_left_p10_key.No_1 = Ls1_left_p10_key.No_3;
  Ls2_left_p10_key.No_2 = Ls1_left_p10_key.No_4;
  Ls2_left_p10_key.No_3 = Ls1_left_p10_key.No_5;
  Ls2_left_p10_key.No_4 = Ls1_left_p10_key.No_1;
  Ls2_left_p10_key.No_5 = Ls1_left_p10_key.No_2;
//**********以下作右半部分的循环左移二位:LS—2**********
  key_data Ls2_right_p10_key;
  Ls2_right_p10_key.No_1 = Ls1_right_p10_key.No_3;
  Ls2_right_p10_key.No_2 = Ls1_right_p10_key.No_4;
  Ls2_right_p10_key.No_3 = Ls1_right_p10_key.No_5;
  Ls2_right_p10_key.No_4 = Ls1_right_p10_key.No_1;
  Ls2_right_p10_key.No_5 = Ls1_right_p10_key.No_2;
//**********以下作Q8 = (6 3 7 4 8 5 10 9)变换,得到K2*********
  K2.No_1 = Ls2_right_p10_key.No_1;
  K2.No_2 = Ls2_left_p10_key.No_3;
  K2.No_3 = Ls2_right_p10_key.No_2;
  K2.No_4 = Ls2_left_p10_key.No_4;
  K2.No_5 = Ls2_right_p10_key.No_3;
  K2.No_6 = Ls2_left_p10_key.No_5;
  K2.No_7 = Ls2_right_p10_key.No_5;
  K2.No_8 = Ls2_right_p10_key.No_4;
}
void IP(packed_data& plaintext_bitstream)
{
//**********以下对明文做IP=(2 6 3 1 4 8 5 7)的置换**********
   packed_data temp;
   CopyBitStream(temp,plaintext_bitstream);
   plaintext_bitstream.No_1 = temp.No_2;
   plaintext_bitstream.No_2 = temp.No_6;
   plaintext_bitstream.No_3 = temp.No_3;
   plaintext_bitstream.No_4 = temp.No_1;
   plaintext_bitstream.No_5 = temp.No_4;
   plaintext_bitstream.No_6 = temp.No_8;
   plaintext_bitstream.No_7 = temp.No_5;
   plaintext_bitstream.No_8 = temp.No_7;
}
void ReverseIP(packed_data& plaintext_bitstream)
{ 
//**********以下对明文做IP的逆置换=(4 1 3 5 7 2 8 6)**********
   packed_data temp;
   CopyBitStream(temp,plaintext_bitstream);
   plaintext_bitstream.No_1 = temp.No_4;
   plaintext_bitstream.No_2 = temp.No_1;
   plaintext_bitstream.No_3 = temp.No_3;
   plaintext_bitstream.No_4 = temp.No_5;
   plaintext_bitstream.No_5 = temp.No_7;
   plaintext_bitstream.No_6 = temp.No_2;
   plaintext_bitstream.No_7 = temp.No_8;
   plaintext_bitstream.No_8 = temp.No_6;
}
void EP(packed_data& right_plaintext_bitstream,packed_data& EP_bitstream)
{
//**********以下对明文右半部分做E/P(1 2 3 4)=(4 1 2 3 2 3 4 1)**********
   EP_bitstream.No_1 = right_plaintext_bitstream.No_8;
   EP_bitstream.No_2 = right_plaintext_bitstream.No_5;
   EP_bitstream.No_3 = right_plaintext_bitstream.No_6;
   EP_bitstream.No_4 = right_plaintext_bitstream.No_7;
   EP_bitstream.No_5 = right_plaintext_bitstream.No_6;
   EP_bitstream.No_6 = right_plaintext_bitstream.No_7;
   EP_bitstream.No_7 = right_plaintext_bitstream.No_8;
   EP_bitstream.No_8 = right_plaintext_bitstream.No_5;
}
void XOR1(packed_data& EP_bitstream,packed_data& K1_bitstream,packed_data& EP_XOR_K1_bitstream)
{
//**********以下对E/P_bitstream与K1作异或运算**********
   char ep,K1,ep_xor_K1;
   ToChar(EP_bitstream,ep);
   ToChar(K1_bitstream,K1);
   ep_xor_K1 = ep^K1;
   ToBitStream(ep_xor_K1,EP_XOR_K1_bitstream);
}
void S0(packed_data& left_EP_XOR_K1_bitstream,packed_data& S0_twobit_output)
{
//**********以下利用密码盒S0得到two bit输出**********
	int S0[4][4] = {{1,0,3,2}
	               ,{3,2,1,0}
				   ,{0,2,1,3}
				   ,{3,1,3,2}};
	int i = left_EP_XOR_K1_bitstream.No_1*2 +left_EP_XOR_K1_bitstream.No_4;
    int j = left_EP_XOR_K1_bitstream.No_2*2 +left_EP_XOR_K1_bitstream.No_3;
    S0_twobit_output.No_1 = S0[i][j]/2;
    S0_twobit_output.No_2 = S0[i][j]%2;
}
void S1(packed_data& right_EP_XOR_K1_bitstream,packed_data& S1_twobit_output)
{
//**********以下利用密码盒S1得到two bit输出**********
	int S1[4][4] = {{0,1,2,3}
	               ,{2,0,1,3}
				   ,{1,0,3,2}
				   ,{2,1,0,0}};
	int i = right_EP_XOR_K1_bitstream.No_5*2 +right_EP_XOR_K1_bitstream.No_8;
    int j = right_EP_XOR_K1_bitstream.No_6*2 +right_EP_XOR_K1_bitstream.No_7;
    S1_twobit_output.No_3 = S1[i][j]/2;
    S1_twobit_output.No_4 = S1[i][j]%2;
}
void P4(packed_data& S0S1_output)
{
//**********以下对S0S1-four bitstream作P4=(2 4 3 1)置换**********
   packed_data temp;
   CopyBitStream(temp,S0S1_output);
   S0S1_output.No_1 = temp.No_2;
   S0S1_output.No_2 = temp.No_4;
   S0S1_output.No_3 = temp.No_3;
   S0S1_output.No_4 = temp.No_1;
}
void XOR2(packed_data& S0S1_output,packed_data& left_plaintext_bitstream,packed_data& left_XOR_S0S1_bitstream)
{
//**********以下对P4和plaintext的左部分作异或运算**********   
   if(S0S1_output.No_1 == left_plaintext_bitstream.No_1)
	   left_XOR_S0S1_bitstream.No_1 = 0; 
   else left_XOR_S0S1_bitstream.No_1 = 1;
   if(S0S1_output.No_2 == left_plaintext_bitstream.No_2)
	   left_XOR_S0S1_bitstream.No_2 = 0; 
   else left_XOR_S0S1_bitstream.No_2 = 1;
   if(S0S1_output.No_3 == left_plaintext_bitstream.No_3)
	   left_XOR_S0S1_bitstream.No_3 = 0; 
   else left_XOR_S0S1_bitstream.No_3 = 1;
   if(S0S1_output.No_4 == left_plaintext_bitstream.No_4)
	   left_XOR_S0S1_bitstream.No_4 = 0; 
   else left_XOR_S0S1_bitstream.No_4 = 1;
}
void SW(packed_data& left_XOR_S0S1_bitstream,packed_data& right_plaintext_bitstream,packed_data& second_plaintext_bitstream)
{
	second_plaintext_bitstream.No_1 = right_plaintext_bitstream.No_5;
    second_plaintext_bitstream.No_2 = right_plaintext_bitstream.No_6;
    second_plaintext_bitstream.No_3 = right_plaintext_bitstream.No_7;
    second_plaintext_bitstream.No_4 = right_plaintext_bitstream.No_8;
    second_plaintext_bitstream.No_5 = left_XOR_S0S1_bitstream.No_1;
    second_plaintext_bitstream.No_6 = left_XOR_S0S1_bitstream.No_2;
    second_plaintext_bitstream.No_7 = left_XOR_S0S1_bitstream.No_3;
    second_plaintext_bitstream.No_8 = left_XOR_S0S1_bitstream.No_4;
}
void Encryption(packed_data& plaintext,packed_data& ciphertext,packed_data& K1,packed_data& K2)
{

//******************************IP******************************
	IP(plaintext);                     //IP置换
    cout << endl  << "IP置换后明文:" << endl;	
	PrintBitStream(plaintext);

//******************************f(k)_1******************************
	packed_data EP_bitstream;          
	EP(plaintext,EP_bitstream);        //E/P扩展置换
    cout <<"**************************************************" << endl
         <<"E/P扩展置换:" << endl;	
    PrintBitStream(EP_bitstream);
   
	packed_data EP_XOR_K1_bitstream;
	XOR1(EP_bitstream,K1,EP_XOR_K1_bitstream);//(E/P)^K1
    cout <<"**************************************************" << endl
         <<"E/P扩展置换&K1作异或运算:" << endl;
    PrintBitStream(EP_XOR_K1_bitstream);
	
	packed_data S0S1_output;
    S0(EP_XOR_K1_bitstream,S0S1_output);  //密码盒S0
    cout <<"**************************************************" << endl
         <<"密码盒S0输出:" << endl;
	cout << S0S1_output.No_1 << S0S1_output.No_2 << endl;
    
	S1(EP_XOR_K1_bitstream,S0S1_output);  //密码盒S1
    cout <<"**************************************************" << endl
         <<"密码盒S1输出:" << endl;
	cout << S0S1_output.No_3 << S0S1_output.No_4 << endl;
    
	P4(S0S1_output);                       //P4置换
    cout <<"**************************************************" << endl
         <<"P4置换:" << endl;
	cout << S0S1_output.No_1 << S0S1_output.No_2
		 << S0S1_output.No_3 << S0S1_output.No_4 << endl;
    
	packed_data left_XOR_S0S1_bitstream;   //P4^明文的左半部分
	XOR2(S0S1_output,plaintext,left_XOR_S0S1_bitstream);
    cout <<"**************************************************" << endl
         <<"明文的左半部分与P4作异或运算:" << endl;
	cout << left_XOR_S0S1_bitstream.No_1 << left_XOR_S0S1_bitstream.No_2
		 << left_XOR_S0S1_bitstream.No_3 << left_XOR_S0S1_bitstream.No_4 << endl;

//*******************************SW*********************************
	packed_data second_plaintext;          //SW运算 
  	SW(left_XOR_S0S1_bitstream,plaintext,second_plaintext);
    cout <<"**************************************************" << endl
         <<"SW运算:" << endl;
	PrintBitStream(second_plaintext);

//******************************f(k)_2******************************
    packed_data second_EP_bitstream;          
	EP(second_plaintext,second_EP_bitstream);        //E/P扩展置换
    cout <<"**************************************************" << endl
         <<"E/P扩展置换:" << endl;	
    PrintBitStream(second_EP_bitstream);
   
	packed_data second_EP_XOR_K2_bitstream;
	XOR1(second_EP_bitstream,K2,second_EP_XOR_K2_bitstream);//(E/P)^K2
    cout <<"**************************************************" << endl
         <<"E/P扩展置换&K2作异或运算:" << endl;
    PrintBitStream(second_EP_XOR_K2_bitstream);
	
	packed_data second_S0S1_output;
    S0(second_EP_XOR_K2_bitstream,second_S0S1_output);  //密码盒S0
    cout <<"**************************************************" << endl
         <<"密码盒S0输出:" << endl;
	cout << second_S0S1_output.No_1 << second_S0S1_output.No_2 << endl;
    
	S1(second_EP_XOR_K2_bitstream,second_S0S1_output);  //密码盒S1
    cout <<"**************************************************" << endl
         <<"密码盒S1输出:" << endl;
	cout << second_S0S1_output.No_3 << second_S0S1_output.No_4 << endl;
    
	P4(second_S0S1_output);                       //P4置换
    cout <<"**************************************************" << endl
         <<"P4置换:" << endl;
	cout << second_S0S1_output.No_1 << second_S0S1_output.No_2
		 << second_S0S1_output.No_3 << second_S0S1_output.No_4 << endl;
    
	packed_data second_left_XOR_S0S1_bitstream;   //P4^明文的左半部分
	XOR2(second_S0S1_output,second_plaintext,second_left_XOR_S0S1_bitstream);
    cout <<"**************************************************" << endl
         <<"明文的左半部分与P4作异或运算:" << endl;
	cout << second_left_XOR_S0S1_bitstream.No_1 
		 << second_left_XOR_S0S1_bitstream.No_2
		 << second_left_XOR_S0S1_bitstream.No_3 
		 << second_left_XOR_S0S1_bitstream.No_4 
		 << endl;

//******************************ReverseIP******************************
	packed_data input_ReverseIP; 
    input_ReverseIP.No_1 = second_left_XOR_S0S1_bitstream.No_1;
    input_ReverseIP.No_2 = second_left_XOR_S0S1_bitstream.No_2;
	input_ReverseIP.No_3 = second_left_XOR_S0S1_bitstream.No_3;
	input_ReverseIP.No_4 = second_left_XOR_S0S1_bitstream.No_4;
	input_ReverseIP.No_5 = second_plaintext.No_5;
	input_ReverseIP.No_6 = second_plaintext.No_6;
	input_ReverseIP.No_7 = second_plaintext.No_7;
	input_ReverseIP.No_8 = second_plaintext.No_8;
    ReverseIP(input_ReverseIP);

//******************************产生密文******************************
	CopyBitStream(ciphertext,input_ReverseIP);
    cout <<"**************************************************" << endl
         <<"产生的密文:" << endl;
	PrintBitStream(ciphertext);
}
void Decryption(packed_data& ciphertext,packed_data& plaintext,packed_data& K1,packed_data& K2)
{
//******************************IP******************************
	IP(ciphertext);                     //IP置换
    cout <<"**************************************************" << endl
         <<"IP置换后密文:" << endl;	
	PrintBitStream(ciphertext);

//******************************f(k)_2******************************
	packed_data EP_bitstream;          
	EP(ciphertext,EP_bitstream);        //E/P扩展置换
    cout <<"**************************************************" << endl
         <<"E/P扩展置换:" << endl;	
    PrintBitStream(EP_bitstream);
   
	packed_data EP_XOR_K2_bitstream;
	XOR1(EP_bitstream,K2,EP_XOR_K2_bitstream);//(E/P)^K2
    cout <<"**************************************************" << endl
         <<"E/P扩展置换&K2作异或运算:" << endl;
    PrintBitStream(EP_XOR_K2_bitstream);
	
	packed_data S0S1_output;
    S0(EP_XOR_K2_bitstream,S0S1_output);  //密码盒S0
    cout <<"**************************************************" << endl
         <<"密码盒S0输出:" << endl;
	cout << S0S1_output.No_1 << S0S1_output.No_2 << endl;
    
	S1(EP_XOR_K2_bitstream,S0S1_output);  //密码盒S1
    cout <<"**************************************************" << endl
         <<"密码盒S1输出:" << endl;
	cout << S0S1_output.No_3 << S0S1_output.No_4 << endl;
    
	P4(S0S1_output);                       //P4置换
    cout <<"**************************************************" << endl
         <<"P4置换:" << endl;
	cout << S0S1_output.No_1 << S0S1_output.No_2
		 << S0S1_output.No_3 << S0S1_output.No_4 << endl;
    
	packed_data left_XOR_S0S1_bitstream;   //P4^明文的左半部分
	XOR2(S0S1_output,ciphertext,left_XOR_S0S1_bitstream);
    cout <<"**************************************************" << endl
         <<"明文的左半部分与P4作异或运算:" << endl;
	cout << left_XOR_S0S1_bitstream.No_1 << left_XOR_S0S1_bitstream.No_2
		 << left_XOR_S0S1_bitstream.No_3 << left_XOR_S0S1_bitstream.No_4 << endl;

//*******************************SW*********************************
	packed_data second_ciphertext;          //SW运算 
  	SW(left_XOR_S0S1_bitstream,ciphertext,second_ciphertext);
    cout <<"**************************************************" << endl
         <<"SW运算:" << endl;
	PrintBitStream(second_ciphertext);

//******************************f(k)_1******************************
    packed_data second_EP_bitstream;          
	EP(second_ciphertext,second_EP_bitstream);        //E/P扩展置换
    cout <<"**************************************************" << endl
         <<"E/P扩展置换:" << endl;	
    PrintBitStream(second_EP_bitstream);
   
	packed_data second_EP_XOR_K1_bitstream;
	XOR1(second_EP_bitstream,K1,second_EP_XOR_K1_bitstream);//(E/P)^K1
    cout <<"**************************************************" << endl
         <<"E/P扩展置换&K1作异或运算:" << endl;
    PrintBitStream(second_EP_XOR_K1_bitstream);
	
	packed_data second_S0S1_output;
    S0(second_EP_XOR_K1_bitstream,second_S0S1_output);  //密码盒S0
    cout <<"**************************************************" << endl
         <<"密码盒S0输出:" << endl;
	cout << second_S0S1_output.No_1 << second_S0S1_output.No_2 << endl;
    
	S1(second_EP_XOR_K1_bitstream,second_S0S1_output);  //密码盒S1
    cout <<"**************************************************" << endl
         <<"密码盒S1输出:" << endl;
	cout << second_S0S1_output.No_3 << second_S0S1_output.No_4 << endl;
    
	P4(second_S0S1_output);                       //P4置换
    cout <<"**************************************************" << endl
         <<"P4置换:" << endl;
	cout << second_S0S1_output.No_1 << second_S0S1_output.No_2
		 << second_S0S1_output.No_3 << second_S0S1_output.No_4 << endl;
    
	packed_data second_left_XOR_S0S1_bitstream;   //P4^明文的左半部分
	XOR2(second_S0S1_output,second_ciphertext,second_left_XOR_S0S1_bitstream);
    cout <<"**************************************************" << endl
         <<"明文的左半部分与P4作异或运算:" << endl;
	cout << second_left_XOR_S0S1_bitstream.No_1 
		 << second_left_XOR_S0S1_bitstream.No_2
		 << second_left_XOR_S0S1_bitstream.No_3 
		 << second_left_XOR_S0S1_bitstream.No_4 
		 << endl;

//******************************ReverseIP******************************
	packed_data input_ReverseIP; 
    input_ReverseIP.No_1 = second_left_XOR_S0S1_bitstream.No_1;
    input_ReverseIP.No_2 = second_left_XOR_S0S1_bitstream.No_2;
	input_ReverseIP.No_3 = second_left_XOR_S0S1_bitstream.No_3;
	input_ReverseIP.No_4 = second_left_XOR_S0S1_bitstream.No_4;
	input_ReverseIP.No_5 = second_ciphertext.No_5;
	input_ReverseIP.No_6 = second_ciphertext.No_6;
	input_ReverseIP.No_7 = second_ciphertext.No_7;
	input_ReverseIP.No_8 = second_ciphertext.No_8;
    ReverseIP(input_ReverseIP);

//******************************恢复明文***************************
	CopyBitStream(plaintext,input_ReverseIP);
    cout <<"**************************************************" << endl
         <<"恢复的明文:" << endl;
	PrintBitStream(plaintext);
}
