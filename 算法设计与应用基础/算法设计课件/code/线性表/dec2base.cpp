// 本函数用于将10进制数转换为任意进制数（介于2和16之间） 
// 程序当用户输入0时结束 
#include <iostream>
#include <stack>
#include <string>

using namespace std;
// 函数原型声明
string dec2base( int num, int base);

int main()
{
	int num, base;	// decimal number and base

	cout << "请输入待转换的进制(介于2和16之间)，输入0结束" << endl;
	cin >> base;

	// continue until the user enters a base of 0
	while (base != 0)
	{
        cout << "请输入带转换的十进制数" << endl; 
        cin >> num; 
		cout << " 十进制数 " << num << " 转换为 " << base << " 进制数为 "
			  << dec2base(num, base) << endl;

		cout << "请输入待转换的进制"
		  << "(介于2和16之间)，输入0结束" << endl;
	cin >> base;
	}// end while
	return 0;
}
// 将10进制数转换为任意进制数（基介于2和16之间）
string dec2base( int num, int base)
{
	// digitChar为字库字符串，numStr用于存储输出字符串
	string digitChar = "0123456789ABCDEF", numStr = "";
	// 用于临时存储余数的堆栈
    stack<char> stk;
    
	// 求余直至余数为零 
	do
	{		
		// 将余数压入堆栈
        stk.push(digitChar[num % base]);  
		num /= base;
	} while (num != 0);	
	
	// 将余数堆栈出栈并附到结果字符串中
    while (!stk.empty()) 
	{
		numStr += stk.top();
		stk.pop();	
	}//end while 
	return numStr;
}
