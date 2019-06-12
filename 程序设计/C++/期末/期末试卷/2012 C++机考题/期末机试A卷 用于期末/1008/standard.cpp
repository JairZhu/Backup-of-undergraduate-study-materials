#include <iostream>
#include <string>
#include <stack>
#include <cctype>
using namespace std;

string exp;
stack<double> number;
stack<char> op;
void set(string s)
{
	exp = s;
	while(!number.empty())	number.pop();
	while(!op.empty()) op.pop();
}
bool can_do(char c)
{
	if(op.empty()) return false;
	if(op.top() == '(')	return false;
	if(c == '+' || c == '-')	return true;
	if(c == '*' && (op.top() == '*' || op.top() == '/'))	return true;
	if(c == '/' && (op.top() == '*' || op.top() == '/'))	return true;
	return false;
}

void exe_cacu()
{
	double b = number.top();
	number.pop();
	double a = number.top();number.pop();
	double result;
	switch(op.top())
	{
	case '+':
		result = a+b;
		break;
	case '-':
		result = a-b;
		break;
	case '*':
		result = a*b;
		break;
	case '/':
		result = a/b;
		break;
	}
	number.push(result);
	op.pop();
}


int getResult(string s)
{   int flag = 1; 
	set(s);
	double temp = 0;
	for(unsigned int i=0; i<exp.length(); i++)
	{
		if(isdigit(exp[i]))
		{
			temp = temp*10 + exp[i]-'0';
			if(i+1 == exp.length() || !isdigit(exp[i+1]))
			{   
			    if(flag == 2)
			    temp = -temp;
				number.push(temp);
				temp = 0;
				flag = 0;
			}
		}
		else if(exp[i] == '+' || exp[i] == '-' || exp[i] == '*' || exp[i] == '/')
		{   if(flag != 1) {
			if(can_do(exp[i]))
				exe_cacu();
			op.push(exp[i]);
			flag = 1;
		}  else {
			flag = 2;
		}
		}
		else if(exp[i] == '(')
			op.push(exp[i]);
		else
		{
			while(op.top() != '(')
				exe_cacu();
			op.pop();
		}
	}
	while(!op.empty())
		exe_cacu();

	return number.top();
}
int main() {
	string s;
	cin >> s;
	getResult(s);
	cout << number.top() << endl;
	return 0;
}
