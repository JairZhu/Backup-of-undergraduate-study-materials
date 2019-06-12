#include <cstdio>
#include <algorithm>
using namespace std;
const int maxn = 101;
const int maxm = 10010;
int p[maxn]; //p[i]= -1
int r[maxm], u[maxm], v[maxm], w[maxm];
int n, m;
int find(int x) 
{
  return (p[x] == -1) ? x : p[x]=find(p[x]);
}

int cmp(int i, int j)
{ return w[i] < w[j];}

int kruskal()
{
  int ans = 0;
  for(int i=0;i<n;i++) p[i] = -1;
  for(int i=0;i<m;i++) r[i] = i;
  sort(r,r+m, cmp);
  for(int i=0;i<m;i++)
  {
    int e = r[i]; 
    int x = find(u[e]);
    int y = find(v[e]);
    if (x!=y) {ans += w[e]; p[x] = y;}
  }
  
  return ans;
}

int main()
{
  scanf("%d%d",&n,&m);
  for(int e=0;e<m;e++)
    scanf("%d%d%d",&u[e],&v[e],&w[e]);
  kruskal();
  return 0;
}
