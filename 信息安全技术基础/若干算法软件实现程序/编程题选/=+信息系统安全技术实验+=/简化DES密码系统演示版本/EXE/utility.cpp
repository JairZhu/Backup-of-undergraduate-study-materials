/**********************************************************************
*Function: 常用工具包
*Author:   吴丹 00234015 3号
*Date:     2003/3/13
*Version:  V1.0
***********************************************************************/
#include "utility.h"
bool users_says_yes()  //实现询问用户功能
{
  int c;
  bool initial_response = true;
  do{
     if(initial_response)
     	cout << "(y,n)?" << flush;
     else
	    cout << " Response with either y or n:" << flush;
     do{   //省略换行、空格、TAB键
	    c = cin.get();
     }while(c == '\n' || c == ' ' || c == '\t');
     initial_response = false;
  }while(c != 'y' && c != 'Y' && c != 'n' && c != 'N' );

  return (c == 'y' || c == 'Y');

}

int openInFile(ifstream& inFile)
{
   char fileName[20];
   cout << "准备打开输入文件，请输入文件名: " << flush;
   gets(fileName);
   inFile.open(fileName);
   if(!inFile){
      cout << "Can't open file:" << fileName << endl;
      return(1);	
   }
   return 0;
}

int openOutFile(ofstream& outFile)
{
   char fileName[20];
   cout << "准备打开输出文件，请输入文件名: " << flush;
   gets(fileName);
   outFile.open(fileName);
   if(!outFile){
      cout << "Can't open file:" << fileName << endl;
      return(1);	
   }
   return 0;
}

