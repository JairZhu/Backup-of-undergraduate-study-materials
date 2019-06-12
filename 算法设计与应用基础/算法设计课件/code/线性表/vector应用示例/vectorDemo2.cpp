/*向量成员函数push_back()和insert()示例*/

#include <vector>
#include <string>
#include <cassert>
#include <iostream>
#include <algorithm>  

using namespace std;

int main() 
{
    char a[]="Bjarne Stroustrup";
    char b[]="purtsuortS enrajB"; 
      //数组b中的元素为a中元素的倒序
    vector<char> myVector1(a,a+strlen(a)),myVector2;
    vector<char> myVector3(b,b+strlen(a)),myVector4;
    vector<char>::iterator iter;

    cout << "向量成员函数push_back()示例：" 
         << endl;
    for (iter = myVector1.begin(); iter != myVector1.end(); ++iter)
        myVector2.push_back(*iter);
      //在myVector2末尾处依次插入myVector1的元素
    assert (myVector1 == myVector2);
   
    cout << "在向量起点插入元素示例：" 
         << endl;
    for (iter = myVector1.begin(); iter != myVector1.end(); ++iter)
        myVector4.insert(myVector4.begin(), *iter);
      //在myVector4起点处依次插入myVector1的元素
    assert (myVector4 == myVector3);

    //通过泛型算法reverse()翻转myVector1
    //来验证myVector4是myVector1的翻转
    reverse(myVector1.begin(), myVector1.end());
    assert (myVector1 == myVector4);
    cout << "结果正确！" 
         << endl;
    system("pause"); 
    return 0;
}
