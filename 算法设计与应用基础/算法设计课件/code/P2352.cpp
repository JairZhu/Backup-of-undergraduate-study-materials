#include <stdio.h>
#include <string.h>

int count[16000];
int stree[70000];

void addCount(int index, int begin, int end, int left, int right)
{
	int mid;
	if (begin <= left && end >= right) stree[index] ++;
	else
	{
		mid = (left + right) / 2;
		if (end <= mid) addCount(index * 2, begin, end, left, mid);
		else if (begin >= mid + 1) addCount(index * 2 + 1, begin, end, mid + 1, right);
		else
		{
			addCount(index * 2, begin, mid, left, mid);
			addCount(index * 2 + 1, mid + 1, end, mid + 1, right);
		}
	}
}

int getCount(int index, int x, int left, int right)
{
	int mid;
	if (left == right) return stree[index];
	mid = (left + right) / 2;
	if (x <= mid) return stree[index] + getCount(index * 2, x, left, mid);
	else return stree[index] + getCount(index * 2 + 1, x, mid + 1, right);
}

int main()
{
//	freopen("T2352.in", "r", stdin);
	int n, x, y, i;
	scanf("%d", &n);
	for (i=0; i<n; i++)
	{
		scanf("%d %d", &x, &y);
		count[getCount(1, x, 1, 32000)] ++;
		addCount(1, x, 32000, 1, 32000);
	}
	for (i=0; i<n; i++) printf("%d\n", count[i]);
//	fclose(stdin);
	return 0;
}