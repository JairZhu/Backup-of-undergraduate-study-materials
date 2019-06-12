// Problem#: 1028. Hanoi Tower Sequence
#include <iostream>
#include<cstdio>
#include <string>
using namespace std;
int main()
{
    string s;
    int ca=0,t,num;
    cin>>t;
    for(int i=0;i<t;i++)
    {
        cin>>s;
        int l=s.length();
        num=0;
        for(int j=0;j<l;j++) s[j]=s[j]-'0';
        while(1){
             if(s[l-1]%2==1) break;
             for(int j=0;j<l;j++)
             {
     
             if(j<l-1)s[j+1]=s[j+1]+(s[j]%2)*10; 
             s[j]=s[j]/2;
             //cout<<s[i]+'0'<<endl;
             }
             num++;
    }
    ca++;
    if(ca!=t)cout<<"Case "<<ca<<": "<<num+1<<endl<<endl;
    else cout<<"Case "<<ca<<": "<<num+1<<endl;
}

}                                 
