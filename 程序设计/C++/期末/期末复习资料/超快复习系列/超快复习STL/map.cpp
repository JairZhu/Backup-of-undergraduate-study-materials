#include <map>
#include <algorithm>
#include <string>
#include <iostream>
using namespace std;
//输出 
void put_map(map<int, string> Map, char *name) 
{ 
    map<int, string>::iterator it;
    
    cout << "The contents of " << name << " : " << endl; 
    for(it = Map.begin(); it != Map.end(); it++) 
        cout << it->first << " " << it->second << " " <<endl; 
    cout<<endl; 
} 

int main()
{
    map<int, string> mapStudent;
    mapStudent.insert(pair<int, string>(1,"student_one"));//只可插入不可覆盖 
    mapStudent.insert(map<int, string>::value_type (2,"student_two"));//只可插入不可覆盖 
    mapStudent[3] = "student_three";//可覆盖可插入 
    map<int, string>::iterator it;
    
    //查找 
    cout << "查找1，并返回其迭代器" <<endl;
    it= mapStudent.find(1);
    if(it!= mapStudent.end())
    {
        cout<<" the value is "<<it->second<<endl;
    }
    else
    {
        cout<<"Do not Find"<<endl;
    }
    
    //用迭代器删除
    cout << "用迭代器删除1" <<endl;
    it = mapStudent.find(1);
    cout << "删除前" << endl; 
    put_map(mapStudent,"mapStudent"); 
    mapStudent.erase(it);
    cout << "删除后" << endl; 
    put_map(mapStudent,"mapStudent"); 
    
    //用关键字删除
    cout << "用关键字删除2" <<endl;
    cout << "删除前" << endl; 
    put_map(mapStudent,"mapStudent"); 
    int n = mapStudent.erase(2);//如果删除了会返回1，否则返回0
    cout << "删除后" << endl; 
    put_map(mapStudent,"mapStudent");
    
    //用迭代器，成片的删除把整个map清空
    cout << "用迭代器，成片的删除把整个map清空" <<endl;
    cout << "删除前" << endl; 
    put_map(mapStudent,"mapStudent"); 
    mapStudent.erase(mapStudent.begin(), mapStudent.end());
    cout << "删除后" << endl; 
    put_map(mapStudent,"mapStudent"); 
    //成片删除要注意的是，也是STL的特性，删除区间是一个前闭后开的集合
    
    system("pause");
    return 0;
}
