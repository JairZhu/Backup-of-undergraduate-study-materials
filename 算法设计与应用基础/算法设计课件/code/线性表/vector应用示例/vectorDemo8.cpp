/* 利用成员函数empty()来判断向量是否为空*/

#include <vector>
#include <iostream>

using namespace std;

int main() 
{
	vector<char> myVector;
    cout << "演示如何创建向量:" << endl;
	
	//检验该向量是否为空
    if(myVector.empty()==1)
		cout << "向量为空！" << endl;   //注意此处可以执行任何复杂操作
    else
		cout << "向量不为空！" <<endl;

	system("pause");
    return 0;
}
