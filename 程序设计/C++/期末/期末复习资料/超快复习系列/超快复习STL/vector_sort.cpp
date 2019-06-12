#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct AssessTypeInfo
{
    unsigned int m_uiType;
    char m_szName[64];
    unsigned int m_uiTotal;
};

bool lessmark(const AssessTypeInfo& s1,const AssessTypeInfo& s2)
{
    return s1.m_uiType < s2.m_uiType;
}
bool greatermark(const AssessTypeInfo& s1,const AssessTypeInfo& s2)
{
    return s1.m_uiType > s2.m_uiType;
}

int main()
{
    vector<AssessTypeInfo> arr;
    AssessTypeInfo a1;
    a1.m_uiType=1;
    AssessTypeInfo a2;
    a2.m_uiType=2;
    AssessTypeInfo a3;
    a3.m_uiType=3;
    
    arr.push_back(a1);
    arr.push_back(a2);
    arr.push_back(a3);
    
    sort(arr.begin(),arr.end(),lessmark);//…˝–Ú≈≈–Ú
    
    for(int i=0;i<3;i++)
        cout << arr[i].m_uiType << " ";
    cout << endl; 
        
    sort(arr.begin(),arr.end(),greatermark);//Ωµ–Ú≈≈–Ú
    
    system("pause"); 
    return 0;
}
