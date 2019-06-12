#include <iostream.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

void Encrypt(FILE*,FILE*,char*);  //加密
void Decrypt(FILE*,FILE*,char*);  //解密

void main()
{
    
	cout << "————————++ Vigenere Tool ++————————" << endl
         << "|Function: 采用Vigenere算法对文本文件加密与解密   |" << endl
	     << "|Author: 吴丹                                     |" << endl
         << "|Run: MicroSoft Visual C++ 6.0                    |" << endl
	     << "|Data: 2003.5.5,Version 1.0 Realeased             |" << endl
	     << "|_________________________________________________|" << endl;
  
   char FILENAME1[25],FILENAME2[25]; /*文件名称*/
   FILE *fp, *fp2;                   /*文件指针*/
   char key[25];                        /*密钥容器*/ 
   
   char ch;        /*用户确认*/
   int user;       /*用户确认*/
      
   cout << "您确定需要使用 ==Vigenere Tool== [y,n]?" << flush; 
   cin >> ch;
   if(ch != 'y' && ch != 'Y'){
       cout << "您已退出==Vigenere Tool==,欢迎再次使用!" << endl;
       return;
   }
   
   cout << endl
	    << "==============Vigenere Tool==============" << endl;
   cout << "可用操作:1------>文件加密" << endl   
	    << "         2------>文件解密" << endl
		<< "         3------>Quit Me!" << endl
		<< "请选择[1,2,3]?" << flush;
   cin >> user;
   switch( user )
   {
      case 1:/*加密操作*/             
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:1------>文件加密 " << endl;
		    cout << "请输入需加密的文件名(*.txt): " << flush;
		    gets(FILENAME1);
			
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:1------>文件加密 "<< endl;
		    cout << "请输入加密后的文件名(*.txt): " << flush;
		    gets(FILENAME2);
            
			if((fp = fopen(FILENAME1,"r")) == NULL || (fp2 = fopen(FILENAME2,"w"))==NULL)
			{ 
                printf("Can't open file\n"); 
                return ;
			} 
			
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:1------>文件加密 "<< endl 
				 << "请输入加密密匙: " << flush;
			gets(key);

			
            Encrypt(fp,fp2,key); 
            
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:1------>文件加密 "<< endl;
			printf("Vigenere Tool 加密完毕,密文存于%s文件\n",FILENAME2);
			break;
	  case 2:/*解密操作*/            
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:2------>文件解密 " << endl;
		    cout << "请输入需解密的文件名(*.txt): " << flush;
		    gets(FILENAME1);
			
			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:2------>文件解密 "<< endl;
		    cout << "请输入解密后的文件名(*.txt): " << flush;
		    gets(FILENAME2);

			if((fp= fopen(FILENAME1,"r")) == NULL || (fp2 = fopen(FILENAME2,"w"))==NULL)
			{ 
               printf("Can't open file\n"); 
               return ;
			} 

			cout << endl 
				 <<"==============Vigenere Tool==============" << endl;
            cout << "目前操作:2------>文件解密 "<< endl 
				 << "请输入解密密匙: " << flush;
			gets(key);
            
            Decrypt(fp,fp2,key); 
            
			cout << endl 
				 <<"==============Coolest IDEA==============" << endl;
            cout << "目前操作:2--——>文件解密 "<< endl;
			printf("Vigenere Tool解密完毕,明文存于%s文件\n",FILENAME2);
			break;
	  case 3:
            cout << "您已退出==Vigenere Tool==,欢迎再次使用!" << endl;
	    	return;
   
     }

   	fclose(fp);
    fclose(fp2);

   return;

}

void Encrypt(FILE* inFile,FILE* outFile,char* key)
{
   int len;      //密钥长度
   int i = 0;    //第i个密钥字符
   char ch;      //待加密字符   
   
   len = strlen(key);
   
   ch = getc(inFile);
   while(ch!=EOF){
	   if( (ch >='A' && ch <='Z') || (ch >='a' && ch <='z') ){ //只对字母加密
	      ch = toupper(ch); //小写字母变大写字母
	      ch = ch - 65;     //变成数字 
		  ch = (ch + (toupper(key[(i++)%len]) - 65)) % 26; //加密 
		  ch = ch + 65; //变成字母
	      fputc(ch,outFile);
	   }else
		  putc(ch,outFile);
	   ch = fgetc(inFile);
   }
}

void Decrypt(FILE* inFile,FILE* outFile,char* key)
{
   int len;      //密钥长度
   int i = 0;    //第i个密钥字符
   char ch;      //待解密字符   
   
   len = strlen(key);
   
   ch = getc(inFile);
   while(ch!=EOF){
	   if( (ch >='A' && ch <='Z')){ //待解密均为大写字母
	      ch = ch - 65; //变成数字 
		  ch = (ch - ((toupper(key[(i++)%len]) - 65)) + 26) % 26; // 解密
	      ch = ch + 65; //变成字母
		  putc(ch,outFile);
	   }else
		  fputc(ch,outFile);
	   ch = fgetc(inFile);
   }
}
