/* 大整数加法的测试程序*/

#include<iostream>
#include"BigIntAdd.h"

using namespace std;

int main()
{
    BigIntAdd add1,add2;
    cout<<"**********本程序应用链表实现大整数加法**********";
	    cout<<"\n请输入一个整数作为被加数：";
   	cin>>add1;
    cout<< add1;
    cout<<"\n请输入另一个整数作为加数：";
    cin>>add2;
    cout<< add2;
    cout<<"\n运算结为:("<<add1<<")+("<<add2<<")="<<add1+add2<<endl;

    system("pause");
    return 0;
}
