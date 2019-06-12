#include <queue>
#include <vector>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
using namespace std;
const int MAXN = 1010;
vector<int> graph[MAXN];
int vis[MAXN];   // 0表示未访问，1表示访问过 
int n, m, u, v;
int color[MAXN]; // 0表示未染色，1表示染为红色，-1表示染为黑色 
    

bool bfs(int i)
{
  queue<int> cq;
  vis[i] = 1;
  color[i] = 1;
  cq.push(i); //从顶点i开始遍历
  while(!cq.empty())
  {
    u = cq.front(); cq.pop();
    for(int i=0;i<graph[u].size();i++)
    {
      v = graph[u][i];
      if (vis[v]==1) 
      {
        if (color[v] == -color[u]) continue;
        else return false;
      }
      vis[v] = 1;
      color[v] = -color[u];
      cq.push(v); 
    }
  }
  return true; 
}

int main()
{
  memset(vis,0,sizeof(vis));
  memset(color,0,sizeof(color));
  
  cin >> n >> m;
  for (int i=1; i<=m; i++)
  {
    cin >> u >> v;
    graph[u].push_back(v);
    graph[v].push_back(u);     
  }
  cout << (bfs(1) ? "yes" : "no") << endl;  
  return 0;  
}
