//  本程序用于测试调度列车顺序的正确性  
#include <iostream>
#include <string>
#include <algorithm>
#include <stack>
 
using namespace std;
// 函数原型声明 
void trainJudge(const string &istr);

int main()
{    
	string istr;
	cout << "请输入希望调度出来的列车顺序"
         <<"(长度不超过6，且所有数均需介于1和6之间)";
    cout << "(q推出程序)" << endl;
	cin >> istr;
	
	while( istr != "q")
	{
           // 调用 trainJudge函数判断调度是否成功，并返回结果 
           cout << "下面给出调度判断的过程：" << endl; 
           trainJudge(istr);
           cout << "请输入希望调度出来的列车顺序"
         <<"(长度不超过6，且所有数均需介于1和6之间)";
    cout << "(q推出程序)" << endl;
           cin >> istr;
     }		
	return 0;
}

// 判断车辆调度顺序正确与否的检查程序 
void trainJudge(const string &istr)
{
    string numbs = "123456";
    string ostr, cstk;
    int i = 0, j;
	string strleft = numbs;
	stack<char> stk;
	stk.push('#');
	for (; i < istr.length(); ++i)
	{
        // 如果待调度车辆号不是介于 1 到 6 之间，报错 
       if (numbs.find(istr[i]) > 6)
        {   cerr << "你输入了一个错误的数字: " << istr[i] 
                 << " ，其位置在 "<< i << " 请检查修正后重新输入" << endl;
            return;
        }
        
        // 调度过程中的堆栈、已调度车辆的情况输出 
        cout << " 调度栈 = " << cstk << " 输出 = " << ostr << endl;
        // 如果待调度车辆在栈顶，则直接退栈即可 
        if (istr[i] == stk.top())
        {
             ostr += stk.top();
             stk.pop();
             cstk.erase(cstk.length()-1, cstk.length());
             continue;
        }
        // 待调度车辆不在栈顶，则从未被调度的车辆中寻找 
        j = strleft.find(istr[i]);
        // 待调度车辆不也不在 未被调度的车辆中，说明调度失败 
        if ( j < 0 )
        {
             cout << " 调度不能成功实现，请重新输入一个新的调度顺序！" 
             << endl << endl;
            return;
        }
        
        //  待调度车辆在未被调度的车辆中，可以进行调度
        // 先把前面号码的未调度车辆入栈，再将待调度车辆出栈 
        for (int k = 0; k <= j; k++)
        {
            stk.push(strleft[k]);
            cstk += strleft[k];
        }
        ostr += stk.top();
        stk.pop();
        cstk.erase(cstk.length()-1, cstk.length());
        // 剩余的未被调度车辆的号码 
        strleft = strleft.substr(j+1, 5); 
    }
       // 输出调度成功  
       cout << "\n 调度后得到输出 = " << ostr << " 这等同于 "  
            << "调度的期望输入 = " << istr << endl;
       cout << "\n Congratulations！，调度成功！" << endl << endl;
}
