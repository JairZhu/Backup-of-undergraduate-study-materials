/* Ê÷ÐÎDPÊµÀý³ÌÐò
poj 1403 */
#include <stdio.h>

#define MAXN 1500

int head[MAXN], next[MAXN*2], edge[MAXN*2], visited[MAXN];
int n;
int ans[MAXN][2];

void dfs(int u)
{
	int v, i;
	ans[u][0] = 0;
	ans[u][1] = 1;
	for (i=head[u]; i!=-1; i=next[i])
	{
		v = edge[i];
		if (!visited[v])
		{
			visited[v] = 1;
			dfs(v);
			ans[u][0] += ans[v][1];
			if (ans[v][0] < ans[v][1]) ans[u][1] += ans[v][0]; else ans[u][1] += ans[v][1];
		}
	}
}

int main()
{
	int u, v, m, i, j, k;
//	freopen("T1463.in", "r", stdin);
	while (scanf("%d", &n) > 0)
	{
		for (i=0; i<n; i++) head[i] = -1;
		k = 0;
		for (i=0; i<n; i++)
		{
			scanf("%d:(%d)", &u, &m);
			for (j=0; j<m; j++)
			{
				scanf("%d", &v);
				edge[k] = v;
				next[k] = head[u];
				head[u] = k;
				edge[++k] = u;
				next[k] = head[v];
				head[v] = k;
				k ++;
			}
			visited[i] = 0;
		}
		visited[0] = 1;
		dfs(0);
		if (ans[0][0] < ans[0][1]) printf("%d\n", ans[0][0]); else printf("%d\n", ans[0][1]);
	}
	return 0;
}
