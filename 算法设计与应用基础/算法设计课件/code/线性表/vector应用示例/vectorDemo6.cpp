/* 泛型算法search()示例*/

#include <vector>
#include <string>
#include <iostream>
#include <algorithm>

using namespace std;

int main ( void )
{ 
    vector <char> targetChar;
    vector <char> vectorOfChar;
    
    //生成需要查找的字符串，即单词blue
    targetChar.push_back('b');
    targetChar.push_back('l');
    targetChar.push_back('u');
    targetChar.push_back('e');

    //生成被查找向量
    vectorOfChar.push_back('r');
    vectorOfChar.push_back('e');
    vectorOfChar.push_back('d');
    vectorOfChar.push_back('b');
    vectorOfChar.push_back('l');
    vectorOfChar.push_back('u');
    vectorOfChar.push_back('e');

    //在redblue中查找blue
    vector<char>::iterator where = 
    search(vectorOfChar.begin(), vectorOfChar.end(), 
            targetChar.begin(), targetChar.end());

    if ( where !=vectorOfChar.end())
    cout << "找到了单词blue!" << endl;

	system("pause");
    return 0;
}
