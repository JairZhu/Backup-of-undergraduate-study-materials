/*****
depth Firest Search
Applications:

*/
#include <queue>
#include <stack>
#include <vector>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
using namespace std;

/*****
Graph Defition
Begin
*/
const int MAXN = 1010;
vector<int> graph[MAXN]; //store the graph
bool direted = 1; //graph is directed or undirected?
int n;      //num of vertex
int m;      //num of edges
int u, v;   // vertex of edge (u,v)

/*****
Graph Defition
End
*/

/*****
DFS
Begin
*/ 
//int color[MAXN];  //0 for undiscovered, 1 for discovered, 2 for processed
                    //pre[u]==0 equal color[u]==0
                    //pre[u]>0 && post[u]==0 equal color[u]==1
                    //post[u]>0 equal color[u]==2
int parent[MAXN]; //vertex's parent in BFS tree
int timetag; 
int pre[MAXN];      //vertex discovered time, 初始化为0 
int post[MAXN];     //vertex processed time, 初始化为0
void dfs(int u)
{
  //do sth when u discovered
  //color[u] = 1;
  pre[u] = ++timetag;
  cout << u << " ";
     
  for(int i=0;i<graph[u].size();i++)
  {
    v = graph[u][i];
    if (pre[v]==0)//if (color[v]==0)
    {
       parent[v] = u;
       dfs(v);
    }
  }
  //color[u]=2;
  post[u] = ++timetag;
}
void dfs()
{
  //memset(color,0,sizeof(color)); 
  memset(parent,-1,sizeof(parent));
  memset(pre,0,sizeof(pre));
  memset(post,0,sizeof(post));
  timetag = 0;
  for(int i=1; i<=n; i++)
  {
    //if (color[i]==0) //vertex i is undiscovered
    if (pre[i]==0)
      dfs(i);
  }
}

void connected_components()
{
  int cc = 0; //cc: num of connected components
  //memset(color,0,sizeof(color)); 
  memset(parent,-1,sizeof(parent));
  
  for(int i=1; i<=n; i++)
  {
    if (pre[i]==0)//if (color[i]==0) //vertex i is undiscovered
    {  
      ++cc;
      printf("Component %d:", cc);
      dfs(i); 
      printf("\n");
    }
  }
}

void find_path(int start, int end, int parent[])
{
  if ( (start == end) || (end == -1) )
    printf("%d ",start);
  else {
    find_path(start, parent[end], parent);
    printf("%d ",end);
  }
}
/*****
BFS
End
*/
void read(bool directed)
{
  cin >> n >> m; 
  memset(graph,0,sizeof(graph));
  for(int j=1; j<=m; j++)
  {
    cin >> u >> v;
    graph[u].push_back(v); 
    if (directed==false) graph[v].push_back(u);
  }
}

void print(int a[])
{
  for(int i=1; i<=n; i++)
    printf("%d ",a[i]);
  printf("\n");
}

int main()
{
  read(true);
  printf("vertex discoverd: "); dfs();  printf("\n");
  printf("parent[]: "); print(parent);
  printf("pre[]: "); print(pre);
  printf("post[]: "); print(post);
  printf("path from 1 to 5: "); find_path(1,5,parent); printf("\n");
}

/***** 
Test Data 1
输入的第一行包含两个整数n和m，n是图的顶点数，m是边数。
以下m行，每行是一个数对u v，表示存在边(u,v)。顶点编号从1开始。 
input:
9 12
1 3
1 6
1 7
2 3
2 4
2 5
2 7
3 5
3 6
4 5
5 6
8 9

output:
vertex discoverd: 1 7 2 5 4 6 3 8 9 
parent[]: -1 7 1 2 2 1 1 -1 8 
path from 1 to 4: 1 7 2 4 
Component 1:1 7 2 5 4 6 3 
Component 2:8 9 
*/ 
