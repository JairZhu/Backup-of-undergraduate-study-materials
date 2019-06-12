#include <cstdio>
#include <cstring>
#include <queue>
using namespace std;
const int MAXN = 110;
int maze[MAXN][MAXN];
struct point {
    int x, y;
    point(int a=0, int b=0) : x(a), y(b) {}
};
int dx[4] = {1, 0, -1, 0};
int dy[4] = {0, 1, 0, -1};
int main() 
{
    int i, j, t, sx, sy, tx, ty, head, tail, n, m;
    scanf("%d", &t);
    while (t--) 
    {
        queue<point> cq;
        scanf("%d%d", &n, &m);
        for (i=0;i<n;++i) {
            for (j=0;j<m;++j) scanf("%d", &maze[i][j]);
        }
        scanf("%d%d%d%d", &sx, &sy, &tx, &ty);
        --sx; --sy; --tx; --ty;
        maze[sx][sy] = -1;
        cq.push(point(sx,sy));
        while (!cq.empty()) 
        {
            point cur = cq.front();
            cq.pop();
            for (i=0;i<4;++i) {
                point tar = cur;
                tar.x += dx[i];
                tar.y += dy[i];
                if (tar.x < 0 || tar.x >= n || tar.y < 0 || tar.y >= m) continue;
                if (maze[tar.x][tar.y] <= 0) continue;
                maze[tar.x][tar.y] = -1;
                cq.push(tar);
            }
        }
        if (maze[tx][ty] >= 0) puts("0"); else puts("1");
    }
    return 0;
}
