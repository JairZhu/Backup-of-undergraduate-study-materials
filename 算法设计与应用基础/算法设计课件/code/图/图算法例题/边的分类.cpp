#include <cstdio>
#include <cstring>
using namespace std;
const int V = 1110;
int edge[V][V], parent[V], pre[V], post[V], tag;

int n, m, k, u, v;
void read()
{
  memset(edge,0,sizeof(edge));
  scanf("%d%d",&n,&m);
  for(int i=0;i<m;i++)
  {
    scanf("%d%d",&u,&v);
    edge[u][v] = 1;
  }
}

/*
DAG的深度有限搜索标记
INIT: edge[][]邻接矩阵；pre[], post[], tag全置0;
CALL: dfstag(i,n); pre/post: 开始/结束时间 
*/
void dfstag(int cur, int n)
{
  // vertex 1 ~ n
  pre[cur] = ++tag;
  for (int i=1; i<=n; ++i) if (edge[cur][i]==1) {
    if (0 == pre[i]) {
      parent[i] = cur;
      edge[cur][i]=-1;//printf("edge (%d,%d) is Tree Edge\n",cur,i);
      dfstag(i,n);
    } else {
      if (0 == post[i]) edge[cur][i]=-2;//printf("edge (%d,%d) is Back Edge\n",cur,i);
      else if (pre[i] > pre[cur]) edge[cur][i]=-3;//printf("edge (%d,%d) is Down Edge\n",cur,i);
      else edge[cur][i]=-4;//printf("edge (%d,%d) is Cross Edge\n",cur,i);
    }
  }
  post[cur] = ++tag;
}

int dfs(int n)
{
  memset(parent,-1,sizeof(pre));
  memset(pre,0,sizeof(pre));
  memset(post,0,sizeof(post));
  tag = 0;
  for(int i=1; i<=n; i++)
    if (parent[i]==-1) dfstag(i,n);
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
  scanf("%d%d",&n,&m);
  for(int i=0;i<m;i++)
  {
    scanf("%d%d",&u,&v);
    edge[u][v] = 1;
  }
  dfs(n);
  scanf("%d",&k);
  for(int i=0; i<k; i++)
  {
    scanf("%d%d",&u,&v);
    if (edge[u][v]==-1) printf("edge (%d,%d) is Tree Edge\n",u,v);
    else if (edge[u][v]==-2) printf("edge (%d,%d) is Back Edge\n",u,v);    
    else if (edge[u][v]==-3) printf("edge (%d,%d) is Down Edge\n",u,v);    
    else if (edge[u][v]==-4) printf("edge (%d,%d) is Cross Edge\n",u,v);    
  }
  return 0;
}
