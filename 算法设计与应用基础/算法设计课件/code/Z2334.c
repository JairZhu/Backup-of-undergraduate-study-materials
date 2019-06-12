#include <stdio.h>

#define MAXN 100030

typedef struct NODE
{
	int value, dist;
	struct NODE *left, *right;
}NODE;

typedef NODE* PNODE;

NODE space[MAXN];
int pnt[MAXN];
PNODE group[MAXN];
PNODE nil;

int find(int x)
{
	if (pnt[x] == x) return x;
	else return pnt[x] = find(pnt[x]);
}

PNODE merge(PNODE x, PNODE y)
{
	PNODE tmp;
	if (x == nil) return y;
	if (y == nil) return x;
	if (x->value < y->value)
	{
		tmp = x;
		x = y;
		y = tmp;
	}
	tmp = merge(x->right, y);
	if (x->left->dist < tmp->dist)
	{
		x->right = x->left;
		x->left = tmp;
	}
	else x->right = tmp;
	x->dist = x->right->dist + 1;
	return x;
}

int main()
{
	int n, m, rootx, rooty, x, y, i;
	PNODE tmp;
//	freopen("T2334.in", "r", stdin);
	while (scanf("%d", &n) > 0)
	{
		for (i=1; i<=n; i++) pnt[i] = i;
		nil = &space[0];
		nil->dist = -1;
		nil->left = nil;
		nil->right = nil;
		for (i=1; i<=n; i++)
		{
			scanf("%d", &space[i].value);
			space[i].dist = 0;
			space[i].left = space[i].right = nil;
			group[i] = &space[i];
		}
		scanf("%d", &m);
		while (m --)
		{
			scanf("%d %d", &x, &y);
			rootx = find(x);
			rooty = find(y);
			if (rootx != rooty) 
			{
				tmp = merge(group[rootx]->left, group[rootx]->right);
				group[rootx]->value /= 2;
				group[rootx]->left = nil;
				group[rootx]->right = nil;
				group[rootx] = merge(tmp, group[rootx]);
				tmp = merge(group[rooty]->left, group[rooty]->right);
				group[rooty]->value /= 2;
				group[rooty]->left = nil;
				group[rooty]->right = nil;
				group[rooty] = merge(tmp, group[rooty]);
				group[rooty] = merge(group[rootx], group[rooty]);
				pnt[rootx] = rooty;
				printf("%d\n", group[rooty]->value);
			}
			else printf("-1\n");
		}
	}
	return 0;
}