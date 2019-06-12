#include <iostream>
#include <vector>
using namespace std;

int n,m;
vector<int> vout[200];
bool visited[200];

bool flood(int u)
{
    visited[u]=1;
    if (u==n-1) return 1;
    for (int x=0; x<vout[u].size(); x++)
    {
        int &v=vout[u][x];
        if (!visited[v] && flood(v)) return 1;
    }
    return 0;
}
    
int main()
{
    while (cin>>n, n)
    {
        fill(vout,vout+n,vector<int>());
        fill(visited,visited+n,0);
        
        cin>>m;
        while (m--)
        {
            int u,v;
            cin>>u>>v;
            vout[u].push_back(v);
        }
        
        cout<<(flood(0)?"I can post the letter\n":"I can't post the letter\n");
    }
    
    return 0;
}
