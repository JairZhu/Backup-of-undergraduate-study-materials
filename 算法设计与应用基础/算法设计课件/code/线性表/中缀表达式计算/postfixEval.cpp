/*     postfixEval类的实现       */

#include "postfixEval.h"

// 计算后缀表达式并返回其值
int postfixEval::evaluate()
{
	int left, right, expValue;
	char ch;
	unsigned int i;
	// 扫描后缀表达式直至表达式结束 
	for (i=0; i < postfix.length(); i++)
	{		
		// 取得当前字符 	
        ch = postfix[ i ];       
        //操作数压入操作数堆栈	
		if ( isdigit(ch) )        
			stk.push(ch - '0');	
		// 若为运算符则取出其前两个操作数执行运算，并将结果压入操作数栈 
		else if (isOperator(ch))  
		{
			getOperands(left, right);
			stk.push(compute(left, right, ch));
		}// end if
	}// end for 
	// 操作数的栈顶即为最后的运算结果 
	expValue = stk.top();
	stk.pop();
	return expValue;
}

// 从堆栈中取得左右操作数 
void postfixEval::getOperands(int& left, int& right)
{
    // 取得右操作数 
	right = stk.top();
	stk.pop();
    // 取得左操作数 
	left = stk.top();
	stk.pop();
}

// 计算 "left op right"
int postfixEval::compute(int left, int right, char op) const
{
	int value;
	switch(op)
	{
		case '+':	value = left + right;
					break;
		case '-':	value = left - right;
					break;
		case '*':	value = left * right;
					break;
		case '/':	if (right == 0)
					   cout << "postfixEval出现除0错误 " << endl;
					value = left / right;
					break;
		case '%':	if (right == 0)
					   cout << "postfixEval出现除0错误" << endl;
					value = left % right;
					break;
		case '^':	if (left == 0 && right == 0)
					   cout << "postfixEval出现未定义的0^0 现象" << endl;
					value = 1;
					while (right > 0)
					{
						value *= left;
						right--;
					}
					break;
	}//end switch
	return value;
}

// 判断是否为运算符 
bool postfixEval::isOperator(char ch) const
{
	return ch == '+' || ch == '-' || ch == '*' || 
           ch == '/' || ch == '%' || ch == '^';
}
