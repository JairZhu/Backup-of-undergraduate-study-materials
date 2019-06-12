/*
toposort by dfs
*/
#include <vector>
#include <stack>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
const int V = 1010;
int edge[V][V];
int parent[V], pre[V], post[V], tag;
vector<int> graph[V];
stack<int> cs; //keepting toposort list

int n, m, k, u, v;

/*
DAG的深度有限搜索标记
INIT: edge[][]邻接矩阵；pre[], post[], tag全置0;
CALL: dfstag(i,n); pre/post: 开始/结束时间 
*/
void dfstag(int u, int n)
{
  // vertex 1 ~ n
  pre[u] = ++tag;
  for (int i=0; i<graph[u].size(); ++i) {
    int v = graph[u][i];
    if (0 == pre[v]) {
      parent[v] = u;
      //edge[u][v]=-1;//printf("edge (%d,%d) is Tree Edge\n",cur,i);
      dfstag(v,n);
    } 
    //else if (0 == post[v]) edge[u][v]=-2;//printf("edge (%d,%d) is Back Edge\n",cur,i);
    //else if (pre[v] > pre[u]) edge[u][v]=-3;//printf("edge (%d,%d) is Down Edge\n",cur,i);
    //else edge[u][v]=-4;//printf("edge (%d,%d) is Cross Edge\n",cur,i);
  }
  post[u] = ++tag;
  cs.push(u);  
}

int dfs(int n)
{
  memset(parent,-1,sizeof(pre));
  memset(pre,0,sizeof(pre));
  memset(post,0,sizeof(post));
  tag = 0;
  for(int i=1; i<=n; i++)
    if (pre[i]==0) dfstag(i,n);
}
//char* edgetype[] = {"Tree Edge","Back Edge","Down Edge","Cross Edge"};


void print(int a[])
{
  for(int i=1; i<=n; i++)
    printf("%d ",a[i]);
  printf("\n");
}

int main()
{
  memset(edge,0,sizeof(edge));
  fill(graph,graph+V,vector<int>());

  scanf("%d%d",&n,&m);
  for(int i=0;i<m;i++)
  {
    scanf("%d%d",&u,&v);
    //printf("%d %d\n",u,v);
    graph[u].push_back(v);
    //printf("%d\n",graph[u].size());
  }
  printf("\n");
  
  dfs(n);
  
  printf("toposort: ");
  while(!cs.empty()) {
    printf("%d ",cs.top());
    cs.pop();
  }
  printf("\n");  
   
  return 0;
}
/*
in.txt
7 6
1 2
2 3
2 4
2 5
3 5
4 6
7 1
*/
