/********************************************************************
Function: Caesar替代法算法实现演示版本
Author:   吴丹 3号 00234015
*********************************************************************/
#include <iostream.h>
#include <stdio.h>

#define WZ_COMMEND_NUM 4 
char *WZ_Commend_Help[] =
{
  "Caesar替代法算法实现演示版本     ", 
  " ====追求卓越,勇于创新====       ", 
  "         作者:吴丹               ",
  "                                 " 
};
void wz_printhelp(); //界面

int caesar();   //caesar替代算法函数

int main(){
   char k;
   
   caesar();
   
   cout << "要继续运行本程序吗<y,n>？" << flush;
   cin >> k;
   while(k == 'y' || k == 'Y'){
	     caesar();
		 cout << "要继续运行本程序吗<y,n>？" << flush;
         cin >> k;
   }
   
   return 0;
}
  

int caesar()
{
   char M[10];        //存储输入明文字符
   char C[10];        //存储加密密文字符
   char c;            //接收输入的变量
   int i,k1,k2;       //控制变量
   
   wz_printhelp();
   
   
   for(i=0;i<10;i++){          //对两个数组进行赋初值' '
      M[i] = C[i] = ' ';
   }
   
   cout << "请输入10个字符:  " << flush; //明文输入
   for(i=0;i<10;i++){
      c = getchar();
      M[i] = c;
   }
   
   cout << "你输入的字符为：" << flush; //明文显示
   for(i = 0;i<10;i++)
      cout << M[i];
   
   cout << endl                        //加密过程，获取密文
	    << "要加密吗(y,n)?" << flush;           
   cin >> c;
   if(c=='y'||c=='Y'){
      cout << "请输入移位密码（1-25）：" <<flush;
      cin >> k1;   
      cout << "请重复移位密码（1-25）：" <<flush;
      cin >> k2;
     while(k1!=k2){
          cout << "密码不一致!请再次输入!" << endl;
          cout << "请输入移位密码（1-25）：" << flush;
          cin >> k1;   
          cout << "请重复移位密码（1-25）：" <<flush;
          cin >> k2;
     } 
     for(i = 0;i<10;i++){   //加密算法
         if((M[i] < 'A' || M[i] > 'Z') && (M[i] <'a' || M[i] > 'z'))
		    C[i] = M[i]; 
		 else if(M[i] >= 'A' && M[i] <= 'Z') C[i] = 'A' + ((M[i] - 'A' + k1) % 26); 
	     else if(M[i] >= 'a' && M[i] <= 'z') C[i] = 'a' + ((M[i] - 'a' + k1) % 26); 
		 
     }    
	 cout << "明文已加密!" << endl;
     cout << "密文显示：" << flush;
	 for(i = 0;i<10;i++){
		 cout << C[i];
     }
	 cout << endl;
     
   }else {
	   cout << "你未加密明文，不安全！" << endl;
       return 0;
   }
   
   cout << "要查看明文吗(y,n)？" << flush;            //解密过程，获取明文
   cin >> c;
   if(c=='y'||c=='Y'){
      cout << "进行解密，请输入密码：" << flush;
      cin >> k1;
      if(k1==k2){
		  for(i = 0;i<10;i++){    //解密算法
            if((C[i] < 'A' || C[i] > 'Z') && (C[i] <'a' || C[i] > 'z'))
		        M[i] = C[i]; 
			else if (C[i] >= 'A' && C[i] <= 'Z') M[i] = 'A' + ((C[i] - 'A' - k1 + 26) % 26); 
	        else if (C[i] >= 'a' && C[i] <= 'z') M[i] = 'a' + ((C[i] - 'a' - k1 + 26) % 26); 	  
		  }			
	  
		  cout << "明文显示：" << flush;
	  for(i = 0;i<10;i++)
         cout << M[i];
      cout << endl;
	  }else cout << "密码错误！查看失败！" << endl;
   }

   return 0;
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

 

   return ;
}