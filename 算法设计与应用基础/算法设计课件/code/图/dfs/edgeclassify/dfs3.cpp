/*
Finding cut vertex and biidge
*/
#include <vector>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
const int V = 1010;
int edge[V][V];
int parent[V], pre[V], post[V], low[V], tag;
bool iscut[V], isbridge[V][V];
vector<int> graph[V];

int n, m, k, u, v;

/*
DAG的深度有限搜索标记
INIT: edge[][]邻接矩阵；pre[], post[], tag全置0;
CALL: dfstag(i,n); pre/post: 开始/结束时间 
*/
void dfstag(int u, int fa, int n)
{
  // vertex 1 ~ n
  low[u] = pre[u] = ++tag;
  int child = 0;  //vertex cur has child children 
  for (int i=0; i<graph[u].size(); ++i) {
    int v = graph[u][i];
    if (0 == pre[v]) {
      child ++;
      parent[v] = u;
      edge[u][v]=-1;//printf("edge (%d,%d) is Tree Edge\n",cur,i);
      dfstag(v,u,n);
      low[u] = min(low[u],low[v]);
      if (low[v] >= pre[u]) iscut[u] = true;
      if (low[v] > pre[u]) isbridge[u][v] = true;
      
      
    } else if (0 == post[v] && v!=fa) {
        edge[u][v]=-2;//printf("edge (%d,%d) is Back Edge\n",cur,i);
        low[u] = min(low[u],pre[v]); 
      }
    //else if (pre[u] < pre[v] ) edge[u][v]=-3;//printf("edge (%d,%d) is Down Edge\n",cur,i);
    //else edge[u][v]=-4;//printf("edge (%d,%d) is Cross Edge\n",cur,i);
  }
  if (fa<0 && child == 1) iscut[u] = 0;
  post[u] = ++tag;
}

int dfs(int n)
{
  memset(parent,-1,sizeof(parent));
  memset(pre,0,sizeof(pre));
  memset(post,0,sizeof(post));
  memset(iscut,0,sizeof(iscut));
  memset(isbridge,0,sizeof(isbridge));
  memset(low,0,sizeof(low));
  
  tag = 0;
  for(int i=1; i<=n; i++)
    if (pre[i]==0) dfstag(i,-1,n);
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
    graph[v].push_back(u);
    //printf("%d\n",graph[u].size());
  }
  
  /*printf("***\n");
  for(int i=1;i<=n;i++) {
    for(int j=0;j<graph[i].size();j++)
      printf("%d ",graph[i][j]);
    printf("\n");  
  }
  printf("\n");  */
  
  dfs(n);
  
  printf("Cut vertex: ");
  for(int i=1;i<=n;i++) {
    if (iscut[i]) printf("%d ",i);
  }
  printf("\n");

  printf("Bridge: ");
  for(int i=1;i<=n;i++) 
    for(int j=1;j<=n;j++){
      if (isbridge[i][j]) printf("(%d,%d) ",i,j);
  }
  printf("\n");


  return 0;  
}
/*
in.txt
6 6
1 2
2 3
2 4
3 5
2 5
4 6
*/

