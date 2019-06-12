/*     infix2postfix类的实现       */

#include "infix2postfix.h"

// 设置运算符（'+','-','*','/','%','^'）的优先级 
void infix2postfix::set_priority()
{
	oper_prio["#"] = 1;
	oper_prio["("] = 2;
	oper_prio["+"] = 3;
	oper_prio["-"] = 3;
	oper_prio["*"] = 4;
	oper_prio["/"] = 4;
	oper_prio["%"] = 4;
	oper_prio["^"] = 5;
	oper_prio[")"] = 6;
}

// 求取并返回后缀表达式
string infix2postfix::postfixExp()
{
	postfix = "";
	set_priority();
	stk.push("#");
	unsigned int i = 0;
	string input, topstk;
	for ( ; i < infix.size(); )
	{
		// 取运算符栈的栈顶 
        topstk = stk.top();            
        // 取出当前待输入的符号
		input = infix.substr(i, 1);    
		// 若待输入的符号不是运算符，直接放入postfix
		if ( ! oper_prio[input] )      
			postfix += input;
        // 待输入的符号是个运算符
        // 进一步判断它的优先级和运算符栈顶运算符的优先级		
		else 
		{
            // 若待输入运算符的优先级比运算符栈顶运算符的优先级高
            // 区分对待待输入运算符为 ")" 和其他情况 
			if ( oper_prio[input] > oper_prio[topstk] ) 
			{
                // 若待输入的运算符为")",pop出栈直至"("，否则直接入栈 
				if ( input.compare(")") == 0 )           
				{
					while ( topstk.compare("(") != 0 )
					{
						postfix += topstk;
						stk.pop();
						topstk = stk.top();
					}// end while
					stk.pop();
				}
				else
					stk.push(input);
			}
			// 待输入运算符的优先级比运算符栈顶运算符的优先级低
			// 区分对待待输入运算符为 "（" 和其他情况 
            else 
			{
                // 若待输入的运算符为"(",pop出栈直遇到栈顶运算符的优先级高的情况
                // 否则，直接入栈 
				if (input.compare("(") != 0)
				{
					postfix += topstk;
					stk.pop();
					// 出栈后，继续与下一个栈顶运算符比较优先级 
					continue; 
				}// end if 
				stk.push(input);
			}// end if 
		}// end else 
		// 取 infix 的下一个元素输入
		++i;						  
	}// end for
	// 将运算符栈中剩余的符号pop出栈,直至遇到保护标志 "#" 
	topstk = stk.top();
	while (topstk.compare("#") != 0 )  
	{
		postfix += topstk;
		stk.pop();
		topstk = stk.top();
	}// end while
	return postfix;
}
