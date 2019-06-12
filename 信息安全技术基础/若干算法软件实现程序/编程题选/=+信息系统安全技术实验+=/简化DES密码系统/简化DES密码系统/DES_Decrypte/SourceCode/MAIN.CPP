#include "utility.h"
#include "Decryption.h"
int main()
{
   
   char inputFileName[20],outputFileName[20];
   FILE *input,*output;
   char ch;
   packed_data plaintext,ciphertext,K1,K2;
    
   cout << "————++Simple DES Presentation Program++————" << endl
    	<< "|         <===========Welcome===========>         |" << endl
	    << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
        << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	    << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	    << "|_________________________________________________|" << endl;
//******************************产生密码******************************
   GenerateKey(K1,K2);                


//******************************解密过程******************************   
   cout << endl << endl
	    << "————++Simple DES Presentation Program++————" << endl
    	<< "|         <===========Welcome===========>         |" << endl
	    << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
        << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	    << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	    << "|_________________________________________________|" << endl;
   cout << "请输入欲解密文件名:" << flush;
   gets(inputFileName);
   cout << "请指定解密后文件名:" << flush;
   gets(outputFileName);
   if((input = fopen(inputFileName,"r")) == NULL){
	   cout << "打开文件<" << inputFileName << ">时失败!" << endl;
       cout << "程序异常退出!!!" << endl;
       exit(0);
   }
   if((output = fopen(outputFileName,"w")) == NULL){
	   cout << "创建文件<" << outputFileName << ">时失败!" << endl;
       cout << "程序异常退出!!!" << endl;
       exit(0);
   }
   while(!feof(input)){
      ch = getc(input);
	  ToBitStream(ch,ciphertext);
	  Decryption(ciphertext,plaintext,K1,K2);
      ToChar(plaintext,ch);
      putc(ch,output);
   }

   cout << endl << endl
	    << "————++Simple DES Presentation Program++————" << endl
    	<< "|         <===========Welcome===========>         |" << endl
	    << "|Author: Dan,Wu  Sofeware Engineering 00 No.3     |" << endl
        << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	    << "|Data:2003.4.20,Version 1.0 Realeased             |" << endl
	    << "|_________________________________________________|" << endl;
   cout << "指定文件: " << inputFileName << "已被解密为: "
        << outputFileName << endl
		<< "程序退出!!!" << endl;
   
   fclose(input);
   fclose(output);
   
   return 0;
}