/* list的成员函数splice(）示例 */

#include <list>
#include <iostream>
#include <algorithm>

using namespace std;

void PrintF ( int& PrintInt ) 
{ 
    cout << PrintInt << endl; 
}

int main()
{
    int myArray[]={23,45,89,43,56,27,81,10,51,32,78,74};

    list <int> myList1(myArray,myArray+12);
    list <int> myList2;
    list <int>::iterator\
		iter1 = find(myList1.begin(),myList1.end(),45);
      //使迭代器指向myList1的第二个元素
    list <int>::iterator\
		iter2 = find(myList1.begin(),myList1.end(),81);
      //使迭代器指向myList1的第七个元素
    list <int> myList3(iter2,myList1.end());
      //用myList1第七个元素之后的区间构造一个新表

    myList2.splice(myList2.end(),myList1,myList1.begin());
    cout<<"将myList1的第一个元素移到myList2的结果："
        <<endl;
    for_each(myList2.begin(), myList2.end(), PrintF);

    //必须注意这里的iter2所指的元素并不参加操作
    myList2.splice(myList2.end(),myList1,iter1,iter2);
    cout<<"继续将myList1的第二个至第六个元素移到myList2的结果："
        <<endl;
    for_each(myList2.begin(), myList2.end(), PrintF);

    myList2.splice(myList2.end(),myList3);
    cout<<"继续将myList3的全部元素移到myList2中去的结果："
        <<endl;
    for_each(myList2.begin(), myList2.end(), PrintF);

    system("pause");
	return 0;
}
