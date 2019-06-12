/* sicily 1153 
马的周游*/
#include <stdio.h>
#include <string.h>
#define maxn 8
#define maxm 8
int dx[8] = {2, 1, -1, -2, -2, -1, 1, 2};
int dy[8] = {1, 2, 2, 1, -1, -2, -2, -1};
int mrk[maxn][maxm], cnt[maxn][maxm];
int ans[maxn * maxm], n;

int inrange(int x, int y, int s) {
    int nx = x + dx[s];
    int ny = y + dy[s];
    return nx >=0 && nx < maxn && ny >=0 && ny < maxm;
}

int dfs(int dep, int x, int y) {
    ans[dep] = x * maxm + y + 1;
    if (dep >= maxn * maxm - 1) {
        return true;
    }
    mrk[x][y] = true;
    int i, j;
    int nxt[8], m = 0;
    for (i=0;i<8;++i) {
        if (inrange(x, y, i)) {
            --cnt[x+dx[i]][y+dy[i]];
            if (!mrk[x+dx[i]][y+dy[i]]) {
                nxt[m++] = i;
            }
        }
    }
    //sort candidates
    for (i=0;i<m;++i) {
        for (j=i+1;j<m;++j) {
            int a = cnt[x+dx[nxt[i]]][y+dy[nxt[i]]];
            int b = cnt[x+dx[nxt[j]]][y+dy[nxt[j]]];
            if (a > b) {
                int t = nxt[i];
                nxt[i] = nxt[j];
                nxt[j] = t;
            }
        }
    }
    
    for (i=0;i<m;++i) {
        j = nxt[i];
        if (dfs(dep+1, x + dx[j], y + dy[j])) return true;
    }
    
    
    for (i=0;i<8;++i) {
        if (inrange(x, y, i)) ++cnt[x+dx[i]][y+dy[i]];
    }
    mrk[x][y] = false;
    return false;
}


int main() {
    int i, j, k;

    while (scanf("%d", &n), n!=-1) {
        --n;
        memset(cnt, 0, sizeof(cnt));
        for (i=0;i<maxn;++i) {
            for (j=0;j<maxm;++j) {
                for (k=0;k<8;++k) {
                    cnt[i][j] += inrange(i, j, k);
                }
            }
        }
        memset(mrk, 0, sizeof(mrk));
        i = n / maxm;
        j = n % maxm;
        dfs(0, i, j);
        printf("%d", ans[0]);
        for (i=1;i<maxn * maxm;++i) {
            printf(" %d", ans[i]);
        }
        puts("");
    }
    return 0;
}
                                 
