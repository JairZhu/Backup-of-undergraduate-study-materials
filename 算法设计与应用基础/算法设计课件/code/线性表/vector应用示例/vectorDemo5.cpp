/* 泛型算法find_if()示例*/

#include <vector>
#include <cassert>
#include <iostream>
#include <algorithm>

using namespace std;

//定义一个函数对象类
class GreaterThan30 
{
public:
    bool operator()(int x) const { return x > 30; }
};

int main()
{
	vector <int> myVector;
    vector <int>::iterator iter;

    //向量元素值为0至9的平方
    for (int i = 0; i < 10; ++i)
        myVector.push_back(i * i);
	cout<<"向量中所包含元素：";
    for(iter = myVector.begin();iter!=myVector.end();++iter)
        cout<<*iter<<" ";
	cout<<endl;

    //查找第一个大于30的元素
    vector<int>::iterator where;
    where = find_if(myVector.begin(), myVector.end(),
                  GreaterThan30());

    //结果输出
    if (where == myVector.end())
        cout<<"没有找到大于30的数！"
            <<endl;
    else
        cout << "第一个大于30的数为：" 
             <<*where
             <<endl;

	system("pause");
    return 0;
}
