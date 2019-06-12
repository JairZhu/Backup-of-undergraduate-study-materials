/* 泛型算法find示例*/

#include <vector>
#include <cassert>
#include <iostream>
#include <algorithm>  

using namespace std;

int main()
{
    char str[]="I am a good girl";
   
    vector <char> myVector(str,str+strlen(str));

    //查找第一次出现的元素g
    vector<char>::iterator
      where = find(myVector.begin(), myVector.end(), 'g');

    assert (*where == 'g' && *(where + 1) == 'o');
    cout << "查找结果正确！." << endl;

	system("pause");
    return 0;
}
