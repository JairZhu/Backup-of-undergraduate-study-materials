/* List的迭代器与vector的迭代器的比较*/

#include <list>
#include <vector> 
#include <string>
#include <iostream>
#include <algorithm>  

using namespace std;

int main() 
{
    int m='a';
        // 隐式类型转换，'a'的ASCII码转换为整数 
    list <char> myList;
    list <char>::iterator link_iter;
    vector <char> myVec;
    vector <char>::iterator v_iter; 

    //将字符abcdef放入表中
    for (int i=0;i<6;i++)
    {
        // 隐式类型转换，整数转换为ASCII码
        myList.push_back(m+i);
        myVec.push_back(m+i);
    } 

    //判断删除字符后的迭代器是否有效
    link_iter = find(myList.begin(), myList.end(), 'c');
    cout<<"删除link中一个节点元素"<<endl; 
    myList.erase(link_iter++); 
    if (*link_iter=='d')
        cout<<"此时迭代器所指元素为："
		    <<*link_iter
            <<endl
            <<"删除元素之后，迭代器保持有效"
			<<endl
			<<endl;

    v_iter = find(myVec.begin(), myVec.end(), 'c');
    cout<<"删除vector中一个节点元素"<<endl; 
    myVec.erase(v_iter++); 
    if (*v_iter=='d')
        cout<<*v_iter
            <<endl
            <<"迭代器保持有效"<<endl;
    else
        cout<<"被删除元素之后的迭代器无效"<<endl; 

    system("pause"); 
    return 0;
}

