/*****
Breadth Firest Search
Applications:
shoretest path in unweighted graph; 
finding connected components in undirected graph; 
bicoloring graph, see uva1004bicoloring.cpp;
*/
#include <queue>
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
bool direted = 0; //graph is directed or undirected?
int n;      //num of vertex
int m;      //num of edges
int u, v;   // vertex of edge (u,v)

/*****
Graph Defition
End
*/

/*****
BFS
Begin
*/ 
int color[MAXN];  //0 for undiscovered, 1 for discovered, 2 for processed
int parent[MAXN]; //vertex's parent in BFS tree
int dist[MAXN];   //distance from start point

void bfs(int s)
{
  queue<int> c;
  
  //从顶点s开始遍历
  color[s] = 1;  
  dist[s] = 0;
  parent[s] = -1;
  c.push(s); 
  while(!c.empty())
  {
    u = c.front(); c.pop();
    /* do sth when vertex discovered */
    printf("%d ",u);
    
    for(int i=0;i<graph[u].size();i++)
    {
      v = graph[u][i];
      if (color[v]==0) 
      {
        color[v]=1;
        dist[v] = dist[u] + 1;
        parent[v] = u;
        c.push(v); 
        //do sth to the edge (u,v)               
      }
    }
    color[u] = 2;
  }
}

void bfs()
{
  memset(color,0,sizeof(color)); 
  memset(dist,-1,sizeof(dist));
  memset(parent,-1,sizeof(parent));
  for(int i=1; i<=n; i++)
  {
    if (color[i]==0) //vertex i is undiscovered
      bfs(i);
  }
}

void connected_components()
{
  int cc = 0; //cc: num of connected components
  memset(color,0,sizeof(color)); 
  memset(dist,-1,sizeof(dist));
  memset(parent,-1,sizeof(parent));
  
  for(int i=1; i<=n; i++)
  {
    if (color[i]==0) //vertex i is undiscovered
    {  
      ++cc;
      printf("Component %d:", cc);
      bfs(i); 
      printf("\n");
    }
  }
}
/* 判断s所在的连通块是否能够只用两种颜色来染色顶点，
使得每条边的两个端点为不同颜色*/ 
bool bicoloring(int s)
{
  queue<int> c;
  int paint[MAXN]; /*0未染色，1红色，-1黑色*/ 
  memset(color,0,sizeof(color));
  memset(paint,0,sizeof(paint));
  color[s] = 1;
  c.push(s); 
  while(!c.empty())
  {
    u = c.front(); c.pop();
    for(int i=0;i<graph[u].size();i++)
    {
      v = graph[u][i];
      if (color[v]==1) 
      {
        if (paint[v] == -paint[u]) continue;
        else return false;
      }
      color[v] = 1;
      paint[v] = -paint[u];
      c.push(v); 
    }
  }
  return true; 
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
  read(false);
  printf("vertex discoverd: "); bfs();  printf("\n");
  printf("parent[]: "); print(parent);
  printf("path from 1 to 4: "); find_path(1,4,parent); printf("\n");
  connected_components(); printf("\n"); 
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
vertex discoverd: 1 3 6 7 2 5 4 8 9 
parent[]: -1 3 1 2 3 1 1 -1 8 
path from 1 to 4: 1 3 2 4 
Component 1:1 3 6 7 2 5 4 
Component 2:8 9 
*/ 
