#include <iostream>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
#include <queue>
#include <algorithm>
#include <utility>
using namespace std;

const int inf = 1000000000;
const int N = 100;

int n, m;

int deg[N];
vector<int> vout[N];

int d[N];
int w[N];

bool run(int& depth, int& width)
{
    //check degree
    for (int v=0; v<n; v++)
        if (deg[v]>1) return 0;
    
    //init
    fill(d, d+n, inf);
    fill(w, w+n, 0);
    depth = 0;
    
    //bfs
    for (int s=0; s<n; s++)
    {
        if (deg[s]==0)
        {
            d[s] = 0;
            w[0]++;
            queue<int> q;
            q.push(s);
            while (!q.empty())
            {
                int u = q.front();
                for (int x=0; x<vout[u].size(); x++)
                {
                    int v = vout[u][x];
                    d[v] = d[u] + 1;
                    w[d[v]]++;
                    depth = max(depth, d[v]);
                    q.push(v);
                }
                q.pop();
            }
        }
    }
    
    //check loop
    for (int v=0; v<n; v++)
        if (d[v] >= inf) return 0;
    
    //find width
    width = *max_element(w, w+depth+1);
    
    return 1;
}

int main()
{        
    while (scanf("%d%d", &n, &m), n)
    {
        //init
        memset(deg, 0, n*sizeof(int));
        fill(vout, vout+n, vector<int>());
        
        //add edges
        while (m--)
        {
            int u, v;
            scanf("%d%d", &u, &v);
            u--;    v--;
            vout[u].push_back(v);
            deg[v]++;
        }
        
        //run
        int depth, width;
        if (run(depth, width))
        {
            printf("%d %d\n", depth, width);
        }
        else
        {
            printf("INVALID\n");
        }
    }

    return 0;
}
