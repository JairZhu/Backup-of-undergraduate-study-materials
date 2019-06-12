/*
×´Ì¬Ñ¹ËõDPÊµÀý³ÌÐò 
sicily 1123
*/ 
#include <stdio.h>
#include <string.h>

#define MAXN 12

int graph[MAXN][MAXN], ans[MAXN][1<<MAXN], next[MAXN][1<<MAXN];
int pow[MAXN+1];

int main()
{
	int n, res, tmp, start, mark, cn, i, j, k;
	for (i=0; i<=MAXN; i++) pow[i] = 1<<i;
	cn = 0;
	while (scanf("%d", &n) > 0)
	{
		if (cn) printf("\n");
		cn ++;
		memset(ans, 0, sizeof(ans));
		for (i=0; i<n; i++) for (j=0; j<n; j++) scanf("%d", &graph[i][j]);
		res = 0;
		for (i=0; i<pow[MAXN]; i++)
			for (j=0; j<n; j++)
				if (i & pow[j])
				{
					tmp = i - pow[j];
					if (tmp == 0) next[j][i] = j;
					{
						for (k=0; k<n; k++)
							if ((tmp & pow[k]) && graph[j][k] > 0 && graph[j][k] + ans[k][tmp] > ans[j][i])
							{
								ans[j][i] = graph[j][k] + ans[k][tmp];
								next[j][i] = k;
							}
					}
					if (ans[j][i] > res)
					{
						res = ans[j][i];
						start = j;
						mark = i;
					}
				}
		printf("The longest path has length %d\n", res);
		if (res > 0)
		{
			printf("Such a path is");
			while (mark > 0)
			{
				printf(" %d", start + 1);
				tmp = next[start][mark];
				mark -= pow[start];
				start = tmp;
			}
			printf("\n");
		}
	}
	return 0;
}
