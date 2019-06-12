#include<iostream>
#include<queue>
using namespace std;
void c(string a,string b)
{
    queue<string> q;
    q.push(a);
    q.push(b);
    while(!q.empty())
    {
        string x=q.front();
        q.pop();
        string y=q.front();
        q.pop();
        if(x.size()==0)
        continue;
        cout<<x[0];
        if(x.size()==1)
        continue;
        int t;
    for(int i=0;i<y.size();++i)
        if(x[0]==y[i])
        {
            t=i;
            break;
        }
    q.push(x.substr(1,t));
    q.push(y.substr(0,t));
    q.push(x.substr(t+1));
    q.push(y.substr(t+1));
    }
}
int main()
{
    string a,b;
    int n;
    cin>>n;
    while(n--)
    {
    cin>>a>>b;
    c(a,b); 
    cout<<endl;
    }
}