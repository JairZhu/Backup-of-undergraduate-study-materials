// 求中缀表达式的运算结果主函数

#include "infix2postfix.h"
#include "postfixEval.h"

int main()
{
    infix2postfix iexp;
    string infix, postfix;
    postfixEval pexp;
    cout << "*****本程序模拟一位数的中缀表达式转化为后缀表达式及其运算*****" << endl; 
	cout << "请输入一个1位数的中缀表达式( q to quit!) : " << endl;
	cin >> infix;
	while (infix.compare("q") != 0)
	{		
		cout << "你输入的中缀表达式为: " << infix << endl;
		iexp.setInfixExp(infix);
		// 求出相应的后缀表达式并输出 
		postfix = iexp.postfixExp();			
		cout << "其相应的后缀表达式为 " << postfix << endl;			
		// 计算后缀表达式的值并输出 
		pexp.setPostfixExp(postfix);			
		cout << "表达式的运算值 = " 
			 << pexp.evaluate() << endl << endl;
		cout << "请再输入一个1位数的中缀表达式( q to quit!) : " << endl;
		cin >> infix;
	}  
	return 0;
}
