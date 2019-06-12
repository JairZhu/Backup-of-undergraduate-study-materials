/*****
移动小球 ballsmoving.cpp
考查点：链表;测试数据应使得使用数组实现超时。
难度：1
题目描述：你有一些小球，从左到右依次编号为1,2,3,...,n. 你可以执行两种指令（1或者2）。其中，
1 X Y表示把小球X移动到小球Y的左边，
2 X Y表示把小球X移动到小球Y右边。
指令保证合法，即X不等于Y。
例如，初始状态1,2,3,4,5,6的小球执行1 1 4后，小球1被移动到小球4的左边，即2,3,1,4,5,6。如果再执行2 3 5，结点3将会移到5的右边，即2,1,4,5,3,6。
输入：
第一行为一个整数t（0<t<10），表示测试用例个数。每个测试用例的第一行为两个整数n（0<n<=500000）和m（0<m<100000），n表示小球的个数，m为指令条数，以下m行每行为一条指令。
输出：
为每个测试用例单独输出一行，从左到右输出最后序列，中间用空格分隔。
输入样例：
2
6 2
1 1 4
2 3 5
5 1
2 1 5
输出样例：
2 1 4 5 3 6
2 3 4 5 1
*/

#include <cstdio>
using namespace std;

const int N = 500010;
int n, m;
int next[N], prev[N];

int main()
{
	int T, i, j, k, c;
	
	scanf("%d", &T);
	while (T--)
	{
		scanf("%d %d", &n, &m);
		
		for (i = 0; i <= n; i++)
		{
			prev[i] = i-1;
			next[i] = i+1;
		}
		prev[0] = n;
		next[n] = 0;
		
		while (m--)
		{
			scanf("%d %d %d", &c, &i, &j);
			next[prev[i]] = next[i];
			prev[next[i]] = prev[i];
			if (c == 1)
			{
				k = j;
				j = prev[j];
			}
			else
			{
				k = next[j];
			}
			prev[k] = i;
			next[j] = i;
			prev[i] = j;
			next[i] = k;
		}
		
		for (i = next[0]; i; i = next[i])
			printf("%d ", i);
		puts("");
	}
	
	return 0;
}
