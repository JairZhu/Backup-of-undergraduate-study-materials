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

#include <stdio.h>
#include <string.h>
#define maxn 500001

struct ball {
    int nxt, pre;
} balls[maxn];

int main() {
    int t, i, x, y, n, m, type;
    scanf("%d", &t);
    while (t--) {
        scanf("%d%d", &n, &m);
        for (i=0;i<=n;++i) {
            balls[i].nxt = i + 1;
            balls[i].pre = i - 1;
        }
        balls[0].pre = n;
        balls[n].nxt = 0;
        
        while (m--) {
            scanf("%d%d%d", &type, &x, &y);
            balls[balls[x].nxt].pre = balls[x].pre;
            balls[balls[x].pre].nxt = balls[x].nxt;
            if (type == 1) {
                balls[x].pre = balls[y].pre;
                balls[x].nxt = y;
            } else {
                balls[x].nxt = balls[y].nxt;
                balls[x].pre = y;
            }
            balls[balls[x].pre].nxt = x;
            balls[balls[x].nxt].pre = x;
        }
        
        x = balls[0].nxt;
        while (x != 0) {
            printf("%d ", x);
            x = balls[x].nxt;
        }
        puts("");
    }
    return 0;
}
