#include <iostream> 
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

//迭代器输出 
void put_vector(vector<int> arr, char* name)
{
    std::vector<int>::iterator it;  
    
    cout << "The contents of " << name << " : "; 
    for(it=arr.begin(); it!=arr.end();++it )
    {
        cout << *it << " ";
    }
    cout << endl; 
}

int main()
{
    vector<int> arr;//初始化一个空向量
    vector<int> arr2(10,-1);//初始化长度的vector
    vector<int> arr2_copy(arr2);//拷贝初始化
    vector<int>::iterator it;
    //尾部插入 
    cout << "push_back(6) and push_back(8) and push_back(3) and push_back(8)" << endl;
    arr.push_back(6);
    arr.push_back(8);
    arr.push_back(3);
    arr.push_back(8);
    put_vector(arr,"arr");
    //擦除第三个 
    cout << "erase the third" << endl; 
    arr.erase(arr.begin()+2);
    put_vector(arr,"arr");
    //插入第三个
    cout << "insert 4 into the third" << endl; 
    arr.insert(arr.begin()+2,4);
    put_vector(arr,"arr");     
    //擦除尾部一个 
    cout << "pop_back" << endl; 
    arr.pop_back();
    put_vector(arr,"arr");     
    //以上只能比较已有类型，需要比较自定义类的，需在类里面写上比较函数，写法自寻
    sort(arr.begin(),arr.end()); // 从小到大
    put_vector(arr,"arr"); 
    
    system("pause"); 
    return 0; 
}
