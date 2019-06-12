#include <iostream>
#include <cstdio>
#include <cstring>
using namespace std;
const int V = 1110;
int edge[V][V], parent[V], pre[V], post[V], tag;
bool isDAG;
int n, m, u, v;
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
  for (int i=1; i<=n; ++i) if (edge[cur][i]) {
    if (0 == pre[i]) {
      parent[i] = cur;
      //printf("edge (%d,%d) is Tree Edge\n",cur,i);
      dfstag(i,n);
    } else {
      if (0 == post[i]) isDAG=false;//printf("edge (%d,%d) is Back Edge\n",cur,i);
      else if (pre[i] > pre[cur]) ;//printf("edge (%d,%d) is Down Edge\n",cur,i);
      else ;//printf("edge (%d,%d) is Cross Edge\n",cur,i);
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

int main()
{
  read();
  isDAG=true;
  dfs(n);
  cout <<isDAG << endl;
  return 0;
}
