/*利用vector的构造函数创建空链表*/

#include <vector>
#include <cassert>   //为了使用assert宏
#include <iostream>

using namespace std;

int main() 
{
    cout << "演示如何创建向量:" << endl;
    vector<char> myVector;
    assert (myVector.size() == 0);
      //检验该向量是否为空
    cout << " 结果正确！" << endl;
    system("pause"); 
    return 0;
}
