/*    postfixEval类的声明       */
#ifndef POSTFIXEVAL_H_
#define POSTFIXEVAL_H_

#include <iostream>
#include <string>
#include <stack>

using namespace std;

class postfixEval
{
	public:
        // 默认构造函数
		postfixEval(){}; 
	    // 设置后缀表达式
		void setPostfixExp(const string& postfixExp){postfix = postfixExp;};
		// 计算后缀表达式并返回其值
        int evaluate(); 
	private:
		string postfix;                // 待求值的后缀表达式 			
		stack<int> stk;	   // 存放操作数的堆栈		
		void getOperands(int& left, int& right); // 从堆栈中取得左右操作数 
		int compute(int left, int right, char op) const;// 计算 "left op right"
		bool isOperator(char ch) const; // 判断是否为运算符 
};
#endif
