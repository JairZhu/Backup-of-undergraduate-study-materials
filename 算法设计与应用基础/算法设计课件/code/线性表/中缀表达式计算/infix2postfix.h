/*    infix2postfix类的声明       */
#ifndef INFIX2POSTFIX_H_
#define INFIX2POSTFIX_H_

#include <iostream>
#include <string>
#include <stack>
#include <map>

using namespace std;

class infix2postfix
{
	public:
		// 默认构造函数
        infix2postfix(){}; 
        // 构造函数，初始化中缀表达式
		infix2postfix(const string& infixExp):infix(infixExp){}; 
		// 设置中缀表达式 infix  
		void setInfixExp(const string& infixExp){infix = infixExp;}; 
		// 求取并返回后缀表达式
		string postfixExp(); 	

	private:
		string infix;  			    // 用于转换的中缀表达式 		
		string postfix;		    	// 后缀表达式 
		stack<string> stk;		    // 用于存储运算符的堆栈 
		map<string, int> oper_prio; // 用于存储运算符的优先级 
		void set_priority();  // 设置运算符（'+','-','*','/','%','^'）的优先级 
};
#endif
