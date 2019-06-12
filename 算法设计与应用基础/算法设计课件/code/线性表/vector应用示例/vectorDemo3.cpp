/*从向量中删除元素示例*/

#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int main (void) 
{
    vector <int> vector1;
    vector <int>::iterator iter;

    //将从0到9的元素依次放入vector1中
    for (int i = 0; i < 10; ++i)  
        vector1.push_back(i);
    cout<<"当前向量中的元素：";
    for(iter=vector1.begin();iter!=vector1.end()-1;++iter)
        cout<<*iter;
	cout<<endl;

    //删除最后一个元素9
    vector1.pop_back();   
    cout<<"删除9后的向量长度:"<<vector1.size()<<endl;

    // 删除第一个元素0
    vector1.erase(vector1.begin());  
    cout<<"再删除0后的向量长度:"<<vector1.size()<<endl;

    //删除数值为5的元素
    remove(vector1.begin(),vector1.end(),5);
    cout<<"再删除5后，当前向量中的元素：";
    for(iter=vector1.begin();iter!=vector1.end()-1;++iter)
        cout<<*iter;
    cout<<endl;
      
    // 删除所有剩下元素
    vector1.erase(vector1.begin(), vector1.end());  
    cout<<"删除所有剩下元素后的向量长度:"<<vector1.size()<<endl;
    
	system("pause"); 
    return 0;
}
