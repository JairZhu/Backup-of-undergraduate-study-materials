#include<iostream>
#include<fstream>
#include<string>
using namespace std;

#include"codeTable.h"
#include"encry.h"
#include"decry.h"

#define WZ_COMMEND_NUM 4 
#define WZUSEHELPNUM 7
void wz_printhelp();

char *WZ_Commend_Help[] =
{
  "基于不等长码子表加密解密工具     ", 
  "====追求卓越,勇于创新====        ", 
  "--------著者:吴丹--------        ",
  "                                 " 
};


char *WZ_USE_HELP[]=
{
  "输入5个参数:",
  "\t1.要加密的明文：plaintext.txt",
  "\t2.码子表：keyTable.txt",
  "\t3.加密后的密文：ciphertext.txt",
  "\t4.解密后的明文：decryedText.txt", 
  "\t",
  "--------------------------------------------"
};

void main()
{
    wz_printhelp();  //提示

	ifstream plaintext("plaintext.txt");  //明文文件 
    ofstream keyTable("keyTable.txt");    //码字表
    //生成码字表
	CodeTable c(&plaintext,&keyTable);
	c.buildCodeTable();
	keyTable.close(); 
	plaintext.close();
	

	ifstream plaintext2("plaintext.txt");  //明文要从头读起
	ifstream keyTable2("keyTable.txt");    //码字表
	ofstream ciphertext("ciphertext.txt"); //密文
    //用码字表加密
    Encry e(&plaintext2,&keyTable2,&ciphertext);
	e.encry();

	plaintext2.close();
	keyTable2.close(); 
	ciphertext.close();

    ofstream decryedText("decryedText.txt");//明文要从头读起
	ifstream keyTable3("keyTable.txt");    //码字表
	ifstream ciphertext2("ciphertext.txt");//密文
    //用码字表解密
	Decry d(&decryedText,&keyTable3,&ciphertext2);
	d.decry();

	decryedText.close();
	keyTable3.close();
	ciphertext2.close();

}

void wz_printhelp()
{
   int i ;
   printf("\t");
   for( i = 0 ; i < 22 ; i++)
   {
      printf("%c ",5);
   }

   printf("\n");

   for( i = 0 ; i < WZ_COMMEND_NUM ; i++)
   {
      printf("\t%c\t%s %c\n",5,WZ_Commend_Help[i],5); 
   }

   printf("\t");
   for ( i = 0 ; i < 22 ; i++)
   {
	   printf("%c ",5);
   } 

   printf("\n");

   for( i = 0 ; i < WZUSEHELPNUM ; i++)
   {
      printf("\t%s\n",WZ_USE_HELP[i]);
   }

   return ;
}