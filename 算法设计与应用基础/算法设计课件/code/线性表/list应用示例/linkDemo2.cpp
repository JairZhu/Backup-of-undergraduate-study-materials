/* list的成员函数unique()示例 */

#include <list>
#include <iostream>
#include <algorithm>

using namespace std;

void PrintF ( int& PrintInt ) 
{ 
    cout << PrintInt << endl; 
};

//定义一个作为unique()比较操作符的类
class EvenPair{
public:
    bool operator()(int div1,int div2)
    {
        return ! (div2 % div1);
    }
};
int main()
{
    int myArray[]={5,2,9,4,8,2,3,4,9};

    list <int> myList1(myArray,myArray+9);
    list <int> myList2(myList1);  

    //删除相同的相邻元素
    myList1.unique();   //没有满足条件的元素
    cout<<"删除后的结果为："
        <<endl;
    for_each(myList1.begin(),myList1.end() ,PrintF);

    //排序后删除相同的相邻元素
    myList1.sort();
    myList1.unique();   //删除2，4，9
    cout<<"排序再删除后的结果为："
        <<endl;
    for_each(myList1.begin(),myList1.end(),PrintF);

    myList2.unique( EvenPair());   //删除8
    cout<<"删除第二个元素能被第一个整除的相邻元素后的结果为："
        <<endl;
    for_each(myList2.begin(),myList2.end() ,PrintF);

	system("pause");
    return 0;
}
