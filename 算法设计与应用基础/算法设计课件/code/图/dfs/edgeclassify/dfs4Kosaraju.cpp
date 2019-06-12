/*
Kosaruju algorithm for Strong Connection Component (SCC)
*/
#include <vector>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
const int V = 1010;
int parent[V], pre[V], post[V], sccno[V], tag;
vector<int> graph1[V], graph2[V];
vector<int> cv; //toposort list
int scc_cnt;
int n, m, k, u, v;

void print(int a[])
{
  for(int i=1; i<=n; i++)
    printf("%d ",a[i]);
  printf("\n");
}

/*
 vertex 1 ~ n
*/
void dfs1(int u)
{
  if (pre[u]) return; 
  pre[u] = ++tag;
  for (int i=0; i<graph1[u].size(); ++i) dfs1(graph1[u][i]);
  cv.push_back(u);
}

void dfs2(int u) {
  if (sccno[u]) return;
  sccno[u] = scc_cnt;
  for(int i=0;i<graph2[u].size();i++) dfs2(graph2[u][i]);
}

void find_scc(int n) 
{
  scc_cnt = -1;
  cv.clear();
  memset(sccno, 0, sizeof(sccno));
  memset(pre,0,sizeof(pre));
  tag = 0;
  
  for(int i=1;i<=n;i++) dfs1(i);
  for(int i=n;i>=1;i--) if (!sccno[cv[i]]) {
    scc_cnt++; 
    dfs2(cv[i]);
  }
}

void print_scc() {
  printf("SCC:\n");
  for(int k=1;k<=scc_cnt;k++) {
    printf("%d: ",k);
    for(int i=1;i<=n;i++) {
      if (sccno[i]==k) printf("%d ",i);
    }
    printf("\n");
  }
}

int main()
{
  fill(graph1,graph1+V,vector<int>());
  fill(graph2,graph2+V,vector<int>());

  scanf("%d%d",&n,&m);
  for(int i=0;i<m;i++)
  {
    scanf("%d%d",&u,&v);
    //printf("%d %d\n",u,v);
    graph1[u].push_back(v);
    graph2[v].push_back(u);
    //printf("%d\n",graph[u].size());
  }
  printf("\n");
  
  find_scc(n);
  print_scc();  
  print(sccno);
  
  return 0;
}
/*
in.txt
12 17
1 2
2 3
2 4
2 5
3 6
5 2
5 6
5 7
6 3
6 8
7 8
7 10
8 11
9 7
10 9
11 12
12 10
*/
