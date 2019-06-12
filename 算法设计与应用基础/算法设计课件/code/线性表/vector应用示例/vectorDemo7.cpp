/* 向量的遍历输出示例 */

#include <vector>
#include <string>
#include <iostream>
#include <algorithm>

using namespace std;

//定义一个函数对象
void PrintF(string& StringPrint)
{
    cout << StringPrint << endl;
}

int main (void) 
{
    //构造一个向量，其元素为一周的天数
    vector <string> week;
    week.push_back (" Monday ");
    week.push_back (" Tuesday ");
    week.push_back (" Wednesday ");
    week.push_back (" Thursday ");
    week.push_back (" Friday ");
    week.push_back (" Saturday ");
    week.insert(week.begin()," Sunday ");

    //遍历输出
    for_each (week.begin(), week.end(), PrintF);

	system("pause");
    return 0;
}
